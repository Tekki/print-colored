package Tekki::IO::Colored;
use Mojo::Base 'Exporter';

use IO::Prompter;
use Term::ANSIColor;

use constant {
  ERROR => ['bold', 'red'],
  INFO  => ['bold', 'yellow'],
  INPUT => ['bold', 'cyan'],
  OK    => ['bold', 'green'],
  WARN  => ['bold', 'magenta'],
};

our @EXPORT = qw|
  color_error color_info color_input color_ok color_warn
  print_error print_info print_input print_ok print_warn
  prompt_error prompt_info prompt_input prompt_ok prompt_warn
  say_error say_info say_input say_ok say_warn|;

# Functions

sub color_error {
  return colored(ERROR, @_);
}

sub color_info {
  return colored(INFO, @_);
}

sub color_input {
  return colored(INPUT, @_);
}

sub color_ok {
  return colored(OK, @_);
}

sub color_warn {
  return colored(WARN, @_);
}

sub print_error {
  print colored(ERROR, @_);
}

sub print_info {
  print colored(INFO, @_);
}

sub print_input {
  print colored(INPUT, @_);
}

sub print_ok {
  print colored(OK, @_);
}

sub print_warn {
  print colored(WARN, @_);
}

sub prompt_error {
  return prompt shift, -v, -style => ERROR, @_;
}

sub prompt_info {
  return prompt shift, -v, -style => INFO, @_;
}

sub prompt_input {
  return prompt shift, -v, -style => INPUT, @_;
}

sub prompt_ok {
  return prompt shift, -v, -style => OK, @_;
}

sub prompt_warn {
  return prompt shift, -v, -style => WARN, @_;
}

sub say_error {
  say colored(ERROR, @_);
}

sub say_info {
  say colored(INFO, @_);
}

sub say_input {
  say colored(INPUT, @_);
}

sub say_ok {
  say colored(OK, @_);
}

sub say_warn {
  say colored(WARN, @_);
}

1;
