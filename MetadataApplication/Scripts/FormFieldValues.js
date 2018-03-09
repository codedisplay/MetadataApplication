$.fn.formFieldValues = function (data) {
    var els = this.find(':input').get();

    if (arguments.length === 0) {
        // return all data
        data = {};

        $.each(els, function () {
            if (this.name && !this.disabled && (this.checked
                            || /select|textarea/i.test(this.nodeName)
                            || /text|hidden|number|password/i.test(this.type))) {
                if (data[this.name] == undefined) {
                    data[this.name] = [];
                }
                data[this.name] = $(this).val();//new code
                //data[this.name].push($(this).val());//earlier code
            }
        });
        return data;
    } else {
        $.each(els, function () {
            if (this.name && !(data[this.name] === undefined || data[this.name] === null)) {
                var names = data[this.name];
                var $this = $(this);
                if (Object.prototype.toString.call(names) !== '[object Array]') {
                    names = [names]; //backwards compat to old version of this code
                }
                if (this.type == 'checkbox' || this.type == 'radio') {
                    var val = $this.val();
                    var found = false;
                    for (var i = 0; i < names.length; i++) {
                        if (names[i].toString() == val) {
                            found = true;
                            break;
                        }
                    }
                    $this.prop("checked", found);
                } else {
                    $this.val(names[0]);
                }
            }
        });
        return this;
    }
};

