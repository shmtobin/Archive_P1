#!/bin/bash

# ensure a decimal number is provided
# gives error if multiple arguments or not decimal
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <decimal_number>"
    exit 1
fi

# validates input is a number and less than 100000
# takes first argument as decimal
decimal=$1
# validates this input is a positive integer with RegEx
# then makes sure it's less than 100000
if ! [[ "$decimal" =~ ^[0-9]+$ ]] || [ "$decimal" -ge 100000 ]; then
    echo "Error: Input must be a decimal number less than 100000."
    exit 1
fi

# decimal to binary conversion
decimal_to_binary() {
# stores input as num variable
    local num=$1
# initializes string to store result
    local binary=""
# loops until num 0
    while [ "$num" -gt 0 ]; do
# finds the remainder when divided by 2
# prepends this binary digit to the binary
# string
        binary=$((num % 2))$binary
# divides by two to continue conversion 
        num=$((num / 2))
    done
# outputs binary string
    echo "$binary"
}

# decimal to hex conversion
decimal_to_hexadecimal() {
    local num=$1
    local hex=""
# maps out the 16 hex characters 0-9, A-F
    local hex_map=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "A" "B" "C" "D" "E" "F")
    while [ "$num" -gt 0 ]; do
# finds the remainder when divided by 16
        hex=${hex_map[$((num % 16))]}$hex
        num=$((num / 16))
    done
    echo "$hex"
}

# perform conversions
binary_result=$(decimal_to_binary "$decimal")
hexadecimal_result=$(decimal_to_hexadecimal "$decimal")

# output results to a file
output_file="conversion_result.txt"
echo "Decimal: $decimal" > "$output_file"
echo "Binary: $binary_result" >> "$output_file"
echo "Hexadecimal: $hexadecimal_result" >> "$output_file"

# inform the user
echo "Conversion results saved to $output_file."
