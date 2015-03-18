# riotjs-styleabledropdown
A styleable dropdown for RiotJS 2.x based heavily on the [easydropdown jQuery plugin](https://github.com/patrickkunka/easydropdown).  The module is written in pure Riot -- no jQuery required.  It's not exactly a 1:1 port, but most of the ideas apply.  Refer to that documentation for styling guidelines.

## Usage

Include `styleable-dropdown.tag` in your RiotJS application however you see fit, then include the required options in the tag implementation.

## Example

Assuming root tag:

```javascript
this.states = [
	{
		abbrev: 'AL',
		stateName: 'Alabama'
	},
	{
		abbrev: 'AK',
		stateName: 'Alaska'
	},
	{
		abbrev: 'AZ',
		stateName: 'Arizona'
	},
	...
];

this.selectedState = this.states[1];
```

Implementation:

```html
<styleable-dropdown data-name="selectedState" data-value="abbrev" data-display="stateName" data-options="{states}" data-maxheight="250px" data-selected="{ selectedState }" data-onselect={ stateChange } ></styleable-dropdown>
```

## Options

### data-name
The name to give the hidden select

### data-options
The collection of items driving the dropdown/select

### data-value
The property of the item to use as the select value

### data-display
The property of the item to display

### data-maxheight
Optional. The size to give the dropdown window.  Defaults to `120px`.

### data-selected
Optional.  The item to preselect in the generated dropdown/select.  Must be an item in the `data-options` collection.

### data-onselect
Optional.  A callback that will be executed when an item is selected.  The selected item will be passed as the only parameter.


## Caveats
Likely doesn't work pre IE9.  Also doesn't apply 100% of the classes that [easydropdown](https://github.com/patrickkunka/easydropdown) does. 

Pull requests are welcome.

## Future

Once a formalized RiotJS component library has been established, this tag will likely make its way in there with the proper build and export process.  This is good enough for now.

## License

MIT