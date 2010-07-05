class VixtoryTagLib {
    static namespace = 'vixtory'

    /* Used just like g:select, but creates multiselect and value-attribute can be list
     * Attributes:
     *  - from: list of selecteble objects
     *  - name: name and id for select-element
     *  - optionKey: attribute to be used as key
     *  - optionValue: attribute to be used as visible value
     *  - values: single value or List of values that appear selected
     */
    def selectMultiple = {attrs ->
        def from = attrs["from"]
        def name = attrs["name"]
        def optionKey = attrs["optionKey"]
        def optionValue = attrs["optionValue"]

        /* The value can either be simple value (thus having type String) or List of
         * any values. Therefore list of Strings is generated from original list.
         */
        def value = (attrs["value"] instanceof String)?[attrs["value"]]:attrs["value"]
        value = value*.toString()
              
        out << '<select ' + ((name)?('name="'+name+'" id="' + name + '" '):'') + 'multiple="multiple" />' 

        from.each {
            def v = (optionValue)?it.getProperty(optionValue):it.toString()
            def k = (optionKey)?it.getProperty(optionKey):it.toString()
            def selected = (value)?value.contains(k.toString()):false
            out << '<option value="' + k + '"' + ((selected)?'selected="selected"':'') + '>' + v + '</option>'
        }
        
        out << '</select>'
    }
}
