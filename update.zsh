#!/bin/zsh

# Function to update Cursor settings
update_cursor_settings() {
    local source_file="$HOME/Library/Application Support/Cursor/User/settings.json"
    local target_file="cursor-settings.json"

    # Check if source file exists
    if [[ ! -f "$source_file" ]]; then
        echo "Error: Cursor settings file not found at $source_file"
        return 1
    fi

    # Copy the settings file
    cp "$source_file" "$target_file"
    
    if [[ $? -eq 0 ]]; then
        echo "Successfully updated Cursor settings in dotfiles"
    else
        echo "Error: Failed to copy Cursor settings"
        return 1
    fi
}

# Function to update Warp settings
update_warp_settings() {
    local source_dir="$HOME/.warp"
    local target_dir="warp"

    # Check if source directory exists
    if [[ ! -d "$source_dir" ]]; then
        echo "Error: Warp directory not found at $source_dir"
        return 1
    fi

    # Create target directory if it doesn't exist
    mkdir -p "$target_dir"

    # Copy all files from source to target
    cp -R "$source_dir"/* "$target_dir/"
    
    if [[ $? -eq 0 ]]; then
        echo "Successfully updated Warp settings in dotfiles"
    else
        echo "Error: Failed to copy Warp settings"
        return 1
    fi
}

# Function to update p10k settings
update_p10k() {
    local source_file="$HOME/.p10k.zsh"
    local target_file=".p10k.zsh"

    # Check if source file exists
    if [[ ! -f "$source_file" ]]; then
        echo "Error: p10k.zsh file not found at $source_file"
        return 1
    fi

    # Copy the settings file
    cp "$source_file" "$target_file"
    
    if [[ $? -eq 0 ]]; then
        echo "Successfully updated p10k.zsh in dotfiles"
    else
        echo "Error: Failed to copy p10k.zsh"
        return 1
    fi
}

# Function to update Brewfile
update_brew() {
    local target_file="Brewfile"

    # Generate new Brewfile using brew bundle dump
    brew bundle dump --file "$target_file" --force
    
    if [[ $? -eq 0 ]]; then
        echo "Successfully generated new Brewfile in dotfiles"
    else
        echo "Error: Failed to generate Brewfile"
        return 1
    fi
}

# Function to show usage
show_usage() {
    echo "Usage: $0 <command>"
    echo "Available commands:"
    echo "  cursor    - Update Cursor settings"
    echo "  warp      - Update Warp settings"
    echo "  p10k      - Update p10k settings"
    echo "  brew      - Generate new Brewfile from current brew packages"
    # echo "  help      - Show this help message"
}

# Main script logic
case "$1" in
    "cursor")
        update_cursor_settings
        ;;
    "warp")
        update_warp_settings
        ;;
    "p10k")
        update_p10k
        ;;
    "brew")
        update_brew
        ;;
    "help"|"")
        show_usage
        ;;
    *)
        echo "Unknown command: $1"
        show_usage
        exit 1
        ;;
esac 