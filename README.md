## Material_UI_TextFields
# Examples
# Features
# Parameters
textFieldOptions:[TextFieldOptions](README.md/#TextFieldOptions)
## TextFieldOptions
|Parameter|type|Remarks|
|-|-|-|
|textFieldType|[TextFieldType*](https://github.com/neeraj-patidar/CourseraTest/blob/main/README.md#textfieldtype)|type of textfield to use: 1)Filled; 2)Outlined|
|label|string|label of textfield|
|leadingIcon|Resource|leading icon to be used|
|trailing icon|Resource|trailing icon to be used|
|chracterCounter|boolean|characterCounter enabled when true|
|maxCharacters|number|max number of characters allowed|
|helperText|string|used as a hint for input text|
|textInputOptions|[TextInputOptions](https://github.com/neeraj-patidar/CourseraTest/blob/main/README.md#textinputoptions)|text input options|
## TextFieldType
    1. Filled
    2. Outlined
## TextInputOptions
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
|fontStyle|[FontStyle](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-universal-attributes-text-style-0000001111681086#EN-US_TOPIC_0000001111681086__li6906111945316)||
|fontWeight|[FontWeight](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-universal-attributes-text-style-0000001111681086#EN-US_TOPIC_0000001111681086__li24391125115311)||
|fontFamily|string||
|enterKeyType|[EnterKeyType](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-basic-components-textinput-0000001233397495#EN-US_TOPIC_0000001233397495__li1231618102427)|enter key functionality|
|caretColor|Color|color of cursor when input is being edited|
|maxCharacters|number|maximum number of allowed characters|
