# Calculator-UIKit
This is a calculator app that uses a thorough UIKit implementation of the table

The objects are UILabels that used passed around values from the table (nubers & operators) to show the current operations and / or result.

UI/UX-wise, the table is made using a vertical stack view that holds five horizontal stack views, which, in turn, hold the numbers and a few basic operators.

Every single Button out of the described stacks has a correlated defined function. For the actual calculations a formatiing function was used, which casts the Double variable from the parameter to a String that can be shown in the UILabel.text variable. 

The validInput() function returns a Boolean value and serves to stop the app from crashing if the input from the buttons doesn't make any sense to the operations.

If there are no invalidities, the equal sign will perform the operations and will pass them as a double, which will then get sent to the formatting function. 

A lot of hard-coding in this variant, but a good exercise for logics and implementation. 

