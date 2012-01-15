# FormattedLength


## Description
Gem allows auto-formatting to/from string to time span (integer value of seconds). 
It does so by adding an *acts_as_formatted_length* method to ActiveRecord base classes. 

## Installation
Simply add this row to your Gemfile

```ruby
gem 'formatted_length'
```

## Usage
Once *acts_as_formatted_length* is added to class definition, a _formatted_length_ property becomes available, 
which is a string representation of the number of seconds by default saved in the class :length field.

If you want to use a different field, for instance - :foobar, use:

```ruby
#sample class definition
class YourClass
#implementation etc...
acts_as_formatted_length :foobar
end

#now usage
example = YourClass.create(length: 70)
puts example.formatted_length # prints out 01:10
```

If you require a setter, pass :setter => true. 
The created setter accpets strings in following manner: 
* If is integer (no ':' in string), the value is treated as length in seconds. 
* Else, value is deformatted into correct amount of seconds (i.e. "1:01:06" becomes 3666)

```ruby
#sample class definition
class YourClass
#implementation etc...
acts_as_formatted_length :foobar, setter: true
end

#now usage
example = YourClass.create(length: 70)
example.formatted_length # = 01:10
example.formatted_length = "1:01:06"
puts example.foobar  # prints out 3666
```

## Example
|Integer value|String Representation|
|:----:|:-----------:|
|0|00:00|
|10|00:10|
|70|01:10|
|3666|1:01:06|

## License
Project uses MIT-LICENSE. 

## Contribution
Feel free, by all means! 

1. Fork
2. Fix
3. Rebase
4. Push
5. File pull request

Cheers,

Meron Bareket
