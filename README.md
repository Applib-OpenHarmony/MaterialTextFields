## Material_UI_TextFields
### Features
      1. Labeled and Non-Labeled TextFields
      2. Assistive elements like Helper Text and Character Counter
      3. Leading and Trailing Icons to help user to understand the type of input expected
      4. Error Message assistance to check and verify the type of input required

### Dependencies
### Import and install
### APIs
### Parameters
   
      textFieldOptions:[TextFieldOptions](README.md#TextFieldOptions)
   
#### TextFieldOptions

   |Parameter|type|Remarks|
   |-|-|-|
   |textFieldType|[TextFieldType*](README.md#textfieldtype)|type of textfield to use: 1)Filled; 2)Outlined|
   |label|string|label of textfield|
   |leadingIcon|Resource|leading icon to be used|
   |trailing icon|Resource|trailing icon to be used|
   |characterCounter|boolean|characterCounter enabled when true|
   |maxCharacters|number|max number of characters allowed|
   |helperText|string|used as a hint for input text|
   |textInputOptions|[TextInputOptions](README.md#textinputoptions)|text input options|
   
> Note: Parameters marked with '*' are mandatory.
   
#### TextFieldType
    1. Filled
    2. Outlined
    
#### TextInputOptions
   |Options|type|Remarks|
   |-|-|-|
   |id|string|id of textfield|
   |input|string|input|
   |placeholderText|string|placeholder of input field
   |inputType|[InputType](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-basic-components-textinput-0000001233397495#EN-US_TOPIC_0000001233397495__li1018842194211)|select one of InputType
   |placeholderFont|{ size?: Length, weight?:[FontWeight](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-universal-attributes-text-style-0000001111681086#EN-US_TOPIC_0000001111681086__li24391125115311), family?: string, style?: [FontStyle](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-universal-attributes-text-style-0000001111681086#EN-US_TOPIC_0000001111681086__li6906111945316)}|Font of placeholder|
   |placeholderColor|Color|-|
   |fontColor|Color|color of input text|
   |fontSize|number|-|
   |fontStyle|[FontStyle](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-universal-attributes-text-style-0000001111681086#EN-US_TOPIC_0000001111681086__li6906111945316)|-|
   |fontWeight|[FontWeight](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-universal-attributes-text-style-0000001111681086#EN-US_TOPIC_0000001111681086__li24391125115311)|-|
   |fontFamily|string|-|
   |enterKeyType|[EnterKeyType](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-basic-components-textinput-0000001233397495#EN-US_TOPIC_0000001233397495__li1231618102427)|enter key functionality|
   |caretColor|Color|color of cursor when input is being edited|
   |maxCharacters|number|maximum number of allowed characters|
   |invert|number|inverts the input image|
   
#### Events
   |Event|Description|
   |-|-|
   |onLeadingIconClick(callBack:(event:[ClickEvent](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-universal-events-click-0000001111581270#EN-US_TOPIC_0000001111581270__li155675712535))=>void)|triggered when leading icon is being clicked|
   |onTrailingIconClick(callBack:(event:[ClickEvent](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-universal-events-click-0000001111581270#EN-US_TOPIC_0000001111581270__li155675712535))=>void)|triggered when trailing icon is being clicked|
   |onChange(callBack:(event:value?:string=>void|triggered when textfield input changes|
   |onSubmit(callBack:(enterKey?:[EnterKeyType](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-basic-components-textinput-0000001233397495#EN-US_TOPIC_0000001233397495__li1231618102427))=>void|triggered when input of textfield is submitted|
   |onEditChange(callBack:(isEditing:boolean)=>void)|triggered when user stops editing|
   |isValid(callback:(value?:string)=>{})|triggered when user stops editing, sold return an object of type: { valid:boolean,errorMessage:string}|
### Usage
### License
