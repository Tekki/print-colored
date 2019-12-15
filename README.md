# NAME

Print::Colored - print, say, prompt with predefined colors

# SYNOPSIS

    use Print::Colored;
    use Print::Colored ':all';

    # color
    use Print::Colored ':color';

    $colored_text = color_error $text;    # bright red
    $colored_text = color_info $text;     # bright blue
    $colored_text = color_input $text;    # bright cyan
    $colored_text = color_ok $text;       # bright green
    $colored_text = color_warn $text;     # bright magenta

    # print
    use Print::Colored ':print';

    print_error $text;
    print_info $text;
    print_input $text;
    print_ok $text;
    print_warn $text;

    # prompt
    use Print::Colored ':prompt';

    $input = prompt_error $text, @params;
    $input = prompt_info $text, @params;
    $input = prompt_input $text, @params;
    $input = prompt_ok $text, @params;
    $input = prompt_warn $text, @params;

    # say
    use Print::Colored ':say';

    say_error $text;
    say_info $text;
    say_input $text;
    say_ok $text;
    say_warn $text;

# DESCRIPTION

[Print::Colored](https://metacpan.org/pod/Print%3A%3AColored) provides functions to print, say, prompt with predefined colors.

- `error` bright red
- `info` bright blue
- `input` bright cyan
- `ok` bright green
- `warn` bright magenta

We should use colors all the time we write sripts that run in the terminal.
Read [Use terminal colors to distinguish information](https://www.perl.com/article/use-terminal-colors-to-distinguish-information/)
by [brian d foy](https://metacpan.org/author/BDFOY) to get some more ideas about it.

But experience shows that the more commands and constants we have to use the less colors our
scripts have. This was the reason to build this rather simple module.

## Limitations

Because the colors are predefined, there isn't much to configure. If you don't like them (and quite
sure you don't) and until we come up with a better solution, you can use ["coloralias" in Term::ANSIColor](https://metacpan.org/pod/Term%3A%3AANSIColor#coloralias)
to modify them.

    use Term::ANSIColor 'coloralias';

    coloralias('error', 'yellow');          # default: bright_red
    coloralias('info',  'white');           # default: bright_blue
    coloralias('input', 'bright_white');    # default: bright_cyan
    coloralias('ok',    'black');           # default: bright_green
    coloralias('warn',  'red');             # default: bright_blue

All the commands except ["color\_"](#color_) write directly to `STDOUT`.

    print_ok $filehandle 'Everything okay.';    # ✗ no
    say_ok $filehandle 'Everything okay.';      # ✗ no

You can't ["print\_"](#print_) and ["say\_"](#say_) to filehandles.

    print $filehandle color_ok 'Everything okay.';    # ✓
    say $filehandle color_ok 'Everything okay.';      # ✓

Instead you have to use one of the ["color\_"](#color_) functions.

# color\_

    use Print::Colored ':color';

Imports the functions ["color\_error"](#color_error), ["color\_info"](#color_info), ["color\_input"](#color_input), ["color\_ok"](#color_ok), and ["color\_warn"](#color_warn).

## color\_error

    $colored_text = color_error 'There was an error';

Returns a text colored as `error`.

## color\_info

    $colored_text = color_info 'This is an info';

Returns a text colored as `info`.

## color\_input

    $colored_text = color_input 'Waiting for an input...';

Returns a text colored as `input`.

## color\_ok

    $colored_text = color_ok 'Everything okay';

Returns a text colored as `ok`.

## color\_warn

    $colored_text = color_warn 'Last warning';

Returns a text colored as `warn`.

# print\_

    use Print::Colored ':print';

Imports the functions ["print\_error"](#print_error), ["print\_info"](#print_info), ["print\_input"](#print_input), ["print\_ok"](#print_ok), and ["print\_warn"](#print_warn).

## print\_error

    print_error 'There was an error';

Prints a text colored as `error`.

## print\_info

    print_info 'This is an info';

Prints a text colored as `info`.

## print\_input

    print_input 'Waiting for an input...';

Prints a text colored as `input`.

## print\_ok

    print_ok 'Everything okay';

Prints a text colored as `ok`.

## print\_warn

    print_warn 'Last warning';

Prints a text colored as `warn`.

# prompt\_

    use Print::Colored ':prompt';

Imports the functions ["prompt\_error"](#prompt_error), ["prompt\_info"](#prompt_info), ["prompt\_input"](#prompt_input), ["prompt\_ok"](#prompt_ok), and ["prompt\_warn"](#prompt_warn).
Internally they call ["prompt" in IO::Prompter](https://metacpan.org/pod/IO%3A%3APrompter#prompt).

## prompt\_error

    $input = prompt_error 'Enter your data: ';

Prompts colored as `error` and returns the input.

## prompt\_info

    $input = prompt_info 'Enter your data: ';

Prompts colored as `info` and returns the input.

## prompt\_input

    $input = prompt_input 'Enter your data: ';

Prompts colored as `input` and returns the input.

## prompt\_ok

    $input = prompt_ok 'Enter your data: ';

Prompts colored as `ok` and returns the input.

## prompt\_warn

    $input = prompt_warn 'Enter your data: ';

Prompts colored as `warn` and returns the input.

# say\_

    use Print::Colored ':say';

Imports the functions ["say\_error"](#say_error), ["say\_info"](#say_info), ["say\_input"](#say_input), ["say\_ok"](#say_ok), and ["say\_warn"](#say_warn).

## say\_error

    say_error 'There was an error';

Prints a text with appended newline colored as `error`.

## say\_info

    say_info 'This is an info';

Prints a text with appended newline colored as `info`.

## say\_input

    say_input 'Waiting for an input...';

Prints a text with appended newline colored as `input`.

## say\_ok

    say_ok 'Everything okay';

Prints a text with appended newline colored as `ok`.

## say\_warn

    say_warn 'Last warning';

Prints a text with appended newline colored as `warn`.

# AUTHOR & COPYRIGHT

© 2019 by Tekki (Rolf Stöckli).

This program is free software, you can redistribute it and/or modify it under the terms of the Artistic License version 2.0.

# SEE ALSO

[IO::Prompter](https://metacpan.org/pod/IO%3A%3APrompter), [Term::ANSIColor](https://metacpan.org/pod/Term%3A%3AANSIColor).
