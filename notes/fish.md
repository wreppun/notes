# Command expansion
Command expansion is a little different in fish.  If we wanted to pass the contents of a file, including new lines, into a command in bash we would write something like 
```
dosomething "${cat multiline-file.txt}"
```

This would read in the file, concatenate all the lines (while keeping the newline character) and wrap it with quotes to make sure it gets read as a single parameter.

Command expansion syntax in fish looks like:
```
dosomething (cat multiline-file.txt)
```

It does not work inside of quotes, and by default it breaks on newlines, so it ends up passing in multiple parameters (as many as there are lines) to the command.

The specific use-case I worked through was adding a private key to an AWS parameter store.  Pem files are multi-line and newlines are required to properly parse the key.

Fish command expansion needs to _not_ split on newlines to get this to work:
```
begin; set -l IFS ""; aws ssm put-parameter \
    --region us-west-2 \
    --name my.amazon.parameter.name \
    --type String
    --value (cat example.pem); end;
```
