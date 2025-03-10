def validate_puzzle_level(level: int) -> bool:
    """
    Validates if the puzzle level is within acceptable range (1-3).
    
    Args:
        level: The puzzle level to validate
        
    Returns:
        bool: True if level is valid, False otherwise
    """
    return 1 <= level <= 3

def convert_symbols_to_numbers(symbols: str) -> str:
    """
    Converts special symbols to their corresponding numbers for puzzle level 2.
    
    Args:
        symbols: String containing symbols to convert
        
    Returns:
        str: String with symbols converted to numbers
    """
    symbol_map = {
        '!': '1', '@': '2', '#': '3', '$': '4', '%': '5',
        '^': '6', '&': '7', '*': '8', '(': '9', ')': '0'
    }
    result = symbols
    for symbol, number in symbol_map.items():
        result = result.replace(symbol, number)
    return result

def puzzle3_transform(n: int) -> int:
    """
    Implements the special transformation algorithm for puzzle level 3.
    
    Args:
        n: Number to transform
        
    Returns:
        int: Transformed number
    """
    coefficient = 2048
    digit = 11
    result = ''
    
    while n > 0:
        if n >= coefficient:
            result = result + str(digit)
            n = n - coefficient
        coefficient = coefficient // 2
        digit = digit - 1
    
    return int(result) if result else 0

def convert_input_to_numbers(input_list: list, puzzle_level: int) -> list:
    """
    Converts input strings to numbers based on puzzle level rules.
    
    Args:
        input_list: List of input strings
        puzzle_level: Current puzzle level
        
    Returns:
        list: List of converted numbers
        
    Raises:
        ValueError: If conversion fails
    """
    numbers = []
    for item in input_list:
        try:
            if puzzle_level == 2:
                item = convert_symbols_to_numbers(item)
            num = int(item)
            if puzzle_level == 3:
                num = puzzle3_transform(num)
            numbers.append(num)
        except ValueError:
            raise ValueError(f"Invalid input: {item} cannot be converted to number")
    return numbers

def calculate_positions(numbers: list) -> list:
    """
    Calculates the final positions (1-25) based on relative number values.
    
    Args:
        numbers: List of numbers to process
        
    Returns:
        list: List of positions from 1-25
    """
    result = [''] * len(numbers)
    working_numbers = numbers.copy()
    
    for position in range(1, 26):
        min_val = min(working_numbers)
        min_index = working_numbers.index(min_val)
        result[min_index] = position
        working_numbers[min_index] = 10 ** 15
        
    return result

def format_output(positions: list) -> None:
    """
    Formats and prints the output as a 5x5 grid.
    
    Args:
        positions: List of positions to display
    """
    for i in range(0, 25, 5):
        print(positions[i:i+5])

def main():
    """
    Main function that handles the puzzle solving process.
    """
    try:
        # Get puzzle level
        puzzle_level = int(input())
        if not validate_puzzle_level(puzzle_level):
            raise ValueError("Invalid puzzle level. Must be between 1 and 3.")
            
        # Get input numbers/symbols
        input_list = input().split()
        if len(input_list) != 25:
            raise ValueError("Input must contain exactly 25 numbers/symbols.")
            
        # Process input based on puzzle level
        numbers = convert_input_to_numbers(input_list, puzzle_level)
        
        # Calculate positions
        positions = calculate_positions(numbers)
        
        # Display result
        format_output(positions)
        
    except ValueError as e:
        print(f"Error: {str(e)}")
    except Exception as e:
        print(f"Unexpected error: {str(e)}")

if __name__ == "__main__":
    main()
