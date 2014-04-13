Queue-Test
==========

iOS Project demonstrating how to use background threads.

The project has two buttons which both call a similar method (which waits 3 seconds, then comes back with a random number). Try spinning the date picker, then while it's spinning press a button.

The Main Thread blocks the UI and pauses the spinner, while the background thread keeps the picker spinning.

You can read more about this project here: http://pinkstone.co.uk/how-to-execute-a-method-on-a-background-thread-in-ios/
