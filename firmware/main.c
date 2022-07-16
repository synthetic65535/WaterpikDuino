#include <avr/io.h>
#include <avr/eeprom.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr/pgmspace.h>
#include <avr/wdt.h>
#include <stdio.h>

#define INPUT_COUNTER_MAX 0xff
#define IS_MODE_BUTTON_PRESSED ((PIND & (1 << PIND2)) == 0)
#define IS_POWER_BUTTON_PRESSED ((PIND & (1 << PIND3)) == 0)

// ----------------------------------------------------------------

typedef enum WORKING_MODE
{
    WORKING_MODE_FLOSS = 1,
    WORKING_MODE_MASSAGE = 2,
} WORKING_MODE_t;

// ----------------------------------------------------------------

volatile WORKING_MODE_t working_mode=WORKING_MODE_FLOSS;
volatile uint16_t operation_timer=0;
volatile uint8_t pump_powered=0;
volatile uint8_t leds_timer=0;
volatile uint8_t timer0_counter=0;
uint8_t power_button_counter=0;
uint8_t mode_button_counter=0;
uint8_t power_button_state=0;
uint8_t mode_button_state=0;

// ----------------------------------------------------------------

// Initialize pins
static void gpio_init()
{
    DDRD = 0x00;
    DDRD |= (1 << PIND6); // Pump

    DDRB = 0x00;
    DDRB |= (1 << PINB1); // Floss LED
    DDRB |= (1 << PINB2); // Massage LED

    // Pull-Up resistors
    PORTB = 0;
    PORTC = 0;
    PORTD = 0;
    PORTD |= (1 << PIND2); // Mode Button
    PORTD |= (1 << PIND3); // Power Button
}

// ----------------------------------------------------------------

// Initialization of Watchdog Timer
static inline void wdt_init()
{
    wdt_reset();
    WDTCSR |= (1 << WDCE) | (1 << WDE);
    WDTCSR = (0 << WDE) | (0 << WDP3) | (1 << WDP2) |  (1 << WDP1) | (0 << WDP0); // 1 second
}

// ----------------------------------------------------------------

// Initialization of timer for counting seconds
static void timer0_init(void)
{
    TCCR0A = (0 << COM0A1) | (0 << COM0A0) | (0 << COM0B1) | (0 << COM0B0) | (0 << WGM01) | (0 << WGM00);
    TCCR0B = (0 << FOC0A) | (0 << FOC0B) | (0 << WGM02) | (0 << CS02) | (1 << CS01) | (1 << CS00); // DIV 64
    TCNT0 = 0;
    OCR0A = 249; // DIV 250
    OCR0B = 0;
    TIMSK0 = (0 << OCIE0B) | (1 << OCIE0A) | (0 << TOIE0);
    //TIFR0 = (0 << OCF0B) | (0 << OCF0A) | (0 << TOV0);
}

// ----------------------------------------------------------------

void power_button_pressed(void)
{
    pump_powered = !pump_powered;
    operation_timer = 0;
    leds_timer = 10*4; // 10 seconds
}

// ----------------------------------------------------------------

void mode_button_pressed(void)
{
    if (working_mode == WORKING_MODE_FLOSS) {
        working_mode = WORKING_MODE_MASSAGE;
    } else {
        working_mode = WORKING_MODE_FLOSS;
    }
    operation_timer = 0;
    leds_timer = 10*4; // 10 seconds
}

// ----------------------------------------------------------------

void process_buttons(void)
{
    // Mode button
    if (IS_MODE_BUTTON_PRESSED)
    {
        if (mode_button_counter < INPUT_COUNTER_MAX)
        {
            mode_button_counter++;
            if (mode_button_counter >= INPUT_COUNTER_MAX)
            {
                if (mode_button_state == 0)
                {
                    // Mode button pressed
                    mode_button_pressed();
                    mode_button_state = 1;
                }
            }
        }
    } else {
        if (mode_button_counter > 0)
        {
            mode_button_counter--;
            if (mode_button_counter == 0)
            {
                if (mode_button_state != 0)
                {
                    // Mode button released
                    mode_button_state = 0;
                }
            }
        }
    }
    // Power button
    if (IS_POWER_BUTTON_PRESSED)
    {
        if (power_button_counter < INPUT_COUNTER_MAX)
        {
            power_button_counter++;
            if (power_button_counter >= INPUT_COUNTER_MAX)
            {
                if (power_button_state == 0)
                {
                    // Power button pressed
                    power_button_pressed();
                    power_button_state = 1;
                }
            }
        }
    } else {
        if (power_button_counter > 0)
        {
            power_button_counter--;
            if (power_button_counter == 0)
            {
                if (power_button_state != 0)
                {
                    // Power button released
                    power_button_state = 0;
                }
            }
        }
    }
}

// ----------------------------------------------------------------

void update_leds(void)
{
    if (leds_timer > 0) {
        if (working_mode == WORKING_MODE_FLOSS) {
            PORTB |= (1 << PINB1); // Floss LED on
            PORTB &= ~(1 << PINB2); // Massage LED off
        } else {
            PORTB &= ~(1 << PINB1); // Floss LED off
            PORTB |= (1 << PINB2); // Massage LED on
        }
    } else {
        PORTB &= ~(1 << PINB1); // Floss LED off
        PORTB &= ~(1 << PINB2); // Massage LED off
    }
}

// ----------------------------------------------------------------

// Time counter
ISR (TIMER0_COMPA_vect)
{
    // 16000000 / 64 / 250 = 1000 times per second
    if (++timer0_counter >= 250)
    {
        timer0_counter = 0;
        // 16000000 / 64 / 250 / 250 = 4 times per second
        if (pump_powered) {
            operation_timer++;
            if (operation_timer == 30*4) { // 30 seconds timer
                PORTD &= ~(1 << PIND6); // Pump off
            } else
            if (operation_timer == 60*4) { // 60 seconds timer
                PORTD &= ~(1 << PIND6); // Pump off
            } else
            if (operation_timer >= 300*4) { // 5 minutes timer
                pump_powered = 0;
            } else
            if (working_mode == WORKING_MODE_FLOSS) {
                PORTD |= (1 << PIND6); // Pump on
            } else
            if (working_mode == WORKING_MODE_MASSAGE) {
                PORTD = (PORTD & ~(1 << PIND6)) | (((~operation_timer) & 0x01) << PIND6); // Pump alternating
            }
        } else {
            PORTD &= ~(1 << PIND6); // Pump off
            if (leds_timer > 0) leds_timer--;
        }
    }
}

// ----------------------------------------------------------------

int main(void)
{
    wdt_init();
    timer0_init();
    gpio_init();
    sei(); // Enable interrupts

    while (1)
    {
        process_buttons();
        update_leds();
        wdt_reset();
    }
}

