## Material_UI_TextField
### Features
      1. Labeled and Non-Labeled TextFields
      2. Assistive elements like Helper Text and Character Counter
      3. Leading and Trailing Icons to help user to understand the type of input expected
      4. Error Message assistance to check and verify the type of input required

### Dependencies
      Add following to the dependencies in package.json file of your project: "@ohos/TextField": "file:../TextField"
            
      "dependencies": {
            ...
            "@ohos/TextField": "file:../TextField"
      }
### Import and install 
### APIs
      TextField({textFieldType:TextFIeldType,textFieldParameters:TextFieldOptions})
### Parameters
textFieldType:[TextFieldType*](README.md#textfieldtype)

textFieldOptions:[TextFieldOptions](README.md#TextFieldOptions)
   
#### TextFieldOptions

   |Parameter|type|Remarks|
   |-|-|-|
   |label|string|label of textfield|
   |leadingIcon|Resource|leading icon to be used|
   |trailing icon|Resource|trailing icon to be used|
   |characterCounter|boolean|characterCounter enabled when true|
   |maxCharacters|number|max number of characters allowed|
   |helperText|string|used as a hint for input text|
   |textInputOptions|[TextInputOptions](README.md#textinputoptions)|text input options|
   |margin|Length or Padding|-|
   |padding|Length or Padding|-|
   |border|[BorderOptions](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-universal-attributes-border-0000001158261223)|-|
   
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
   
#### Atrributes
The following attributes are supported for TextFieldOptions:
|Attribute|Description|
|-|-|
|setTextFIeldType(type:TextFieldType)|sets textfield type|
|setLabel(label:string,labelWidth:number)|sets the label for textfield|
|setHelperText(text:string)|setsthe helper text|
|setCharacterCounter(enable:boolean,maxCharacters:number)|enables character counter and maximum allowed characters|
|setIcons(leadingIcon:Resource,trailingIcon:Resource)|sets leading and trailing icons|
|setTextInputOptions(textInputOptions:TextInputOptions)|sets the input text options|
|setMargin(margin:Length or Padding)|sets the margin for textfield|
|setPadding(padding:Length or Padding)|sets the padding for textfield|
|setBorder(options:BorderOptions)|sets the border parameters for textfield|
#### Events
   |Event|Description|
   |-|-|
   |onLeadingIconClick(callBack:(event:[ClickEvent](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-universal-events-click-0000001111581270#EN-US_TOPIC_0000001111581270__li155675712535))=>void)|triggered when leading icon is being clicked|
   |onTrailingIconClick(callBack:(event:[ClickEvent](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-universal-events-click-0000001111581270#EN-US_TOPIC_0000001111581270__li155675712535))=>void)|triggered when trailing icon is being clicked|
   |onChange(callBack:(event:value?:string=>void|triggered when textfield input changes|
   |onSubmit(callBack:(enterKey?:[EnterKeyType](https://developer.harmonyos.com/en/docs/documentation/doc-references/ts-basic-components-textinput-0000001233397495#EN-US_TOPIC_0000001233397495__li1231618102427))=>void|triggered when input of textfield is submitted|
   |onEditChange(callBack:(isEditing:boolean)=>void)|triggered when user stops editing|
   |isValid(callback:(value?:string)=>{})|triggered when user stops editing, should return an object of type: { valid:boolean,errorMessage:string}|

### Usage

      import { TextField, TextFieldType, TextFieldOptions, TextInputOptions } from "@ohos/TextField"

      @Entry
      @Component
      struct Filled_sample
      {
        textInputOptions: TextInputOptions =
          {
            placeholderText:'@gmail.com',
            enterKeyType:EnterKeyType.Search,
            input:"neerajpatidar@gmail.com",
            id:"mail-id1",
            inputType:InputType.Number,
            placeholderColor:Color.Brown,
            placeholderFont:{size:15,style:FontStyle.Normal,family:"Arial",weight:FontWeight.Normal},
            fontWeight:FontWeight.Bold,
            fontStyle:FontStyle.Normal,
            fontSize:15,
            fontFamily:"Sans-serif",
            fontColor:Color.Green,
            caretColor:Color.Red
          };

        textFieldOptions: TextFieldOptions = new TextFieldOptions;
        aboutToAppear():void{
          this.textFieldOptions = {...this.textFieldOptions,
            label:'User',
            labelWidth: 35,
            helperText: "Shouldn't be a mail-id",
            trailingIcon: $r("app.media.clear"),
            leadingIcon: $r('app.media.account'),
            characterCounter:true,
            maxCharacters:10,
            textInputOptions:this.textInputOptions,
            trailingIconClick:(event)=>{
              AlertDialog.show({message:'trail icon click\n' + JSON.stringify(event.target)})
            },
            leadingIconClick:(event)=>{
              AlertDialog.show({message:'lead icon click\n' + JSON.stringify(event.target)})
            },
            onChanged:()=>{},
            editChanged:(isEditing)=>{

              AlertDialog.show({message :""+isEditing,title:'Edit Change'})
            },
            validate:()=>{return {valid:true,errorMessage:"error"}},
            submit:()=>{}
          }
        }

      build()
        {
          Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.Center})
          {
            TextField(
              {
                textFieldParameters:this.textFieldOptions
              });
          }
        }
      }

      
### License
Licensed under the [Apache License, Version 2.0](./LICENSE)
