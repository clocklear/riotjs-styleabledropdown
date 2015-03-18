<styleable-dropdown>

  <!-- Styling -->
  <style>
    .old {
      display: none;
    }
  </style>

  <!-- Markup -->
  <div class="dropdown {open: open}">
    <span class="old">
      <select name="{opts['data-name']}">
        <option if={ opts['data-includeblank'] == 'true' }></option>
        <option each={ item in opts['data-options'] } value={ parent.getValue(item) } selected={ parent.getValue(item) == parent.getValue(parent.selectedItem) }>{ parent.getDisplay(item) }</option>
      </select>
    </span>
    <span class="selected" onclick={ openDropdown }>{ getDisplay(selectedItem) }</span>
    <span class="carat" onclick={ openDropdown }></span>
    <div style="height: {ddHeight}">
      <ul>
        <li each={ item in opts['data-options'] } onclick="{ parent.selectItem }" onmouseover="{ parent.focus }" class="{ active: item == parent.selectedItem, focus: item == parent.focusedItem }">{ parent.getDisplay(item) }</li>
      </ul>
    </div>
  </div>

  <!-- Script -->
  <script>
    var dd = this;
    var maxheight = opts['data-maxheight'] ? opts['data-maxheight'] : '120px';
    var select;

    var body = document.getElementsByTagName('body')[0];

    dd.on('mount', function () {
      select = dd.root.getElementsByTagName('select')[0];
      if (body) body.addEventListener('click', dd.closeDropdown);
    });

    dd.on('unmount', function () {
      if (body) body.removeEventListener('click', dd.closeDropdown);
    })

    dd.ddHeight = '0px';
    dd.open = false;
    dd.selectedItem = opts['data-selected'];
    dd.focusedItem;

    if (!dd.selectedItem && opts['data-options'].length > 0) {
      dd.selectedItem = opts['data-options'][0];
    }

    dd.openDropdown = function () {
      dd.update({
        open: true,
        ddHeight: maxheight
      });
    };

    dd.closeDropdown = function (e) {
      if (e && e.target && dd.root.contains(e.target)) {
        // Abort if the clicked element is a child of this component
        return;
      }
      dd.update({
        open: false,
        ddHeight: '0px'
      });
    }

    dd.selectItem = function (e) {
      dd.update({
        selectedItem: e.item.item,
        open: false,
        ddHeight: '0px'
      });
      if (opts['data-onselect']) opts['data-onselect'](e.item.item);
    }

    dd.getValue = function (item) {
      if (!item) return;
      return item[opts['data-value']];
    }

    dd.getDisplay = function (item) {
      if (!item) return;
      return item[opts['data-display']];
    }

    dd.focus = function (e) {
      dd.update({
        focusedItem: e.item.item
      });
    }
  </script>
</styleable-dropdown>