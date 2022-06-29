/*
 * Copyright (C) 2022 Application Library Engineering Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
export default struct Outlined {
  private entry: boolean= true;
  private input: string= '';
  private focused: boolean = false;
  @State textFieldParameters: any = {};

  //label parameters
  @State private labelWidth: number= 0;
  @State private labelHeight: string= '0vp';
  @State private labelColor: Color = Color.Black;
  //leadingIcon
  private leadingIconSize: string = '0vp';
  //placeholder default text
  @State private placeholder: string = "";
  //trailingIcon
  private trailingIconSize: string = '0vp';
  //activation indicator
  @State private activationIndicatorColor: Color = Color.Black
  @State private activationIndicatorWidth: number = 1;
  //character counter
  @State private numberOfCharacters: number = 0;
  //helperText
  @State private helperTextColor: Color= Color.Black
  @State private helperText: string = '';

  /**
   * initializes some parameters like input, helper text, leading and trailing icon sizes,
   * #character. Executed just before the build function gets executed
   * if labeled then label should be at placeholder in de-focused textfield
   */
  aboutToAppear(): void {
    if (this.textFieldParameters.label) {
      this.placeholder = this.textFieldParameters.label;
    }
    else {
      this.placeholder = this.textFieldParameters.textInputOptions.placeholderText
    }
    if (this.textFieldParameters.leadingIcon) {
      this.leadingIconSize = '24vp';
    }
    if (this.textFieldParameters.trailingIcon) {
      this.trailingIconSize = '24vp';
    }
    if (this.textFieldParameters.textInputOptions.input) {
      this.input = this.textFieldParameters.textInputOptions.input;
      if (this.input.length != 0) {
        this.labelHeight = '10vp';
        this.labelWidth = this.textFieldParameters.labelWidth;
      }
    }
    this.numberOfCharacters = this.input.length
    if (this.numberOfCharacters > this.textFieldParameters.maxCharacters) {
      this.numberOfCharacters = this.textFieldParameters.maxCharacters
    }
    if (this.textFieldParameters.helperText) {
      this.helperText = this.textFieldParameters.helperText
    }
    else {
      this.helperText = ''
    }
  }

  /**
   * change design parameters for non labeled textfield
   * @param error
   */
  changeParametersNonLabeled(error?: {
    valid: boolean,
    errorMessage: string
  }): void {
    if (this.focused) {
      this.activationIndicatorColor = 0x0005FF;
      this.activationIndicatorWidth = 2;
    }
    else {
      this.activationIndicatorColor = Color.Black;
      this.activationIndicatorWidth = 1;
    }
    if (!this.entry) {
      if (!error.valid) {
        this.helperTextColor = Color.Red;
        this.helperText = error.errorMessage;
      }
      else {
        this.helperTextColor = Color.Black;
        this.helperText = this.textFieldParameters.helperText;
      }
    }
    this.entry = false;
  }

  /**
   * change parameters for labeled textfield
   * @param error
   */
  changeParametersLabeled(error?: {
    valid: boolean,
    errorMessage: string
  }): void {
    if (this.focused) {
      this.labelHeight = '10vp';
      this.labelWidth = this.textFieldParameters.labelWidth;
      this.placeholder = this.textFieldParameters.textInputOptions.placeholderText
      this.activationIndicatorColor = 0x0005FF;
      this.activationIndicatorWidth = 2;
      this.labelColor = 0x0005FF;
    }
    else {
      this.activationIndicatorColor = Color.Black;
      this.activationIndicatorWidth = 1;
      this.labelColor = Color.Black;
      if (this.input.length == 0) {
        this.labelHeight = '0vp';
        this.labelWidth = 0;
        this.placeholder = this.textFieldParameters.label
      }
      else {
        this.labelHeight = '10vp';
        this.labelWidth = this.textFieldParameters.labelWidth;
      }
    }
    if (!this.entry) {
      if (!error.valid) {
        this.helperTextColor = Color.Red;
        this.labelColor = Color.Red;
        this.helperText = error.errorMessage;
      }
      else {
        this.helperTextColor = Color.Black;
        this.helperText = this.textFieldParameters.helperText;
      }
    }
    this.entry = false;
  }

  /**
   * returns height of input box in string form
   */
  private getLabeledInputHeight(): string {
    if (this.labelHeight = '10vp') {
      return '30vp'
    }
    else return '40vp'
  }

  /**
   * returns the width of input box depending on
   * presence/absence of leading/trailing icon
   */
  private getInputWidth(): string {
    if (this.trailingIconSize == '24vp') {
      if (this.leadingIconSize == '24vp') {
        return '204vp'
      }
      else {
        return '228vp'
      }
    }
    else {
      if (this.leadingIconSize == '24vp') {
        return '228vp'
      }
      else {
        return '252vp'
      }
    }
  }

  build() {
    Column({ space: 1 }) {
      Stack() {
        /**
         * label text, inputbox, leading icon and trailing icon stacked on rectangular background with rounded corners
         */
        Rect()
          .width('280vp')
          .height('48vp')
          .radius('5vp')
          .fill(Color.White)
          .stroke(this.activationIndicatorColor)
          .strokeWidth(this.activationIndicatorWidth)
          .margin({ top: '6vp' });

        //stacked design
        Row({ space: '0vp' }) {
          // leading icon
          Image(this.textFieldParameters.leadingIcon)
            .width(this.leadingIconSize)
            .height(this.leadingIconSize)
            .align(Alignment.Center)
            .onClick((event) => {
              this.textFieldParameters.leadingIconClick(event);
            });

          if (this.textFieldParameters.label) {
            //label and input box
            Column({ space: '0vp' }) {
              //label text
              Text(this.textFieldParameters.label)
                .width(this.labelWidth.toString() + 'vp')
                .height(this.labelHeight)
                .margin({ top: '-6vp', left: '-' + this.leadingIconSize })
                .alignSelf(ItemAlign.Start)
                .backgroundColor(Color.White)
                .fontSize('11fp')
                .fontColor(this.labelColor)
                .textAlign(TextAlign.Center)
                .borderRadius('10vp');

              //input box
              TextInput({ placeholder: this.placeholder, text: this.input })
                .width(this.getInputWidth())
                .height(this.getLabeledInputHeight())
                .placeholderColor(this.textFieldParameters.textInputOptions.placeholderColor)
                .placeholderFont(this.textFieldParameters.textInputOptions.placeholderFont)
                .fontColor(this.textFieldParameters.textInputOptions.fontColor)
                .fontSize(this.textFieldParameters.textInputOptions.fontSize)
                .fontWeight(this.textFieldParameters.textInputOptions.fontWeight)
                .fontFamily(this.textFieldParameters.textInputOptions.fontFamily)
                .fontStyle(this.textFieldParameters.textInputOptions.fontStyle)
                .maxLength(this.textFieldParameters.maxCharacters)
                .id(this.textFieldParameters.textInputOptions.id)
                .caretColor(this.textFieldParameters.textInputOptions.caretColor)
                .onChange((value) => {
                  this.input = value;
                  this.numberOfCharacters = value.length;
                  this.textFieldParameters.onChanged(value);
                })
                .onClick(() => {
                  this.focused = true;
                  var error = this.textFieldParameters.validate(this.input)
                  try {
                    this.changeParametersLabeled(error);
                  }
                  catch (ex) {
                    console.log("validate() should return object of type: {valid:boolean,errorMessage:string}");
                  }
                })
                .onEditChange((isEditing) => {
                  this.focused = false;
                  var error = this.textFieldParameters.validate(this.input);
                  try {
                    this.changeParametersLabeled(error);
                  }
                  catch (ex) {
                    console.log("validate() should return object of type: {valid:boolean,errorMessage:string}");
                  }
                  this.textFieldParameters.editChanged(isEditing)
                })
                .onSubmit((enterKey) => {
                  this.textFieldParameters.submit(enterKey)
                });
            }
          }

          else {
            //input box for non-labeled textfield
            TextInput({ placeholder: this.placeholder, text: this.input })
              .width(this.getInputWidth())
              .height('40vp')
              .margin({ top: '4vp', bottom: '4vp' })
              .fontColor(this.textFieldParameters.textInputOptions.fontColor)
              .fontSize(this.textFieldParameters.textInputOptions.fontSize)
              .fontWeight(this.textFieldParameters.textInputOptions.fontWeight)
              .fontFamily(this.textFieldParameters.textInputOptions.fontFamily)
              .fontStyle(this.textFieldParameters.textInputOptions.fontStyle)
              .placeholderColor(this.textFieldParameters.textInputOptions.placeholderColor)
              .placeholderFont(this.textFieldParameters.textInputOptions.placeholderFont)
              .maxLength(this.textFieldParameters.maxCharacters)
              .id(this.textFieldParameters.textInputOptions.id)
              .caretColor(this.textFieldParameters.textInputOptions.caretColor)
              .onChange((value) => {
                this.input = value;
                this.numberOfCharacters = value.length;
                this.textFieldParameters.onChanged(value);
              })
              .onClick(() => {
                this.focused = true;
                var error = this.textFieldParameters.validate(this.input);
                try {
                  this.changeParametersNonLabeled(error);
                }
                catch (ex) {
                  console.log("validate() should return object of type: {valid:boolean,errorMessage:string}");
                }
              })
              .onEditChange((isEditing) => {
                this.focused = false;
                var error = this.textFieldParameters.validate(this.input);
                try {
                  this.changeParametersNonLabeled(error);
                }
                catch (ex) {
                  console.log("validate() should return object of type: {valid:boolean,errorMessage:string}");
                }
                this.textFieldParameters.editChanged(isEditing);
              })
              .onSubmit((enterKey) => {
                this.textFieldParameters.submit(enterKey)
              });
          }

          //trailing icon
          Image(this.textFieldParameters.trailingIcon)
            .width(this.trailingIconSize)
            .height(this.trailingIconSize)
            .align(Alignment.Center)
            .onClick(
              (event) => {
                this.textFieldParameters.trailingIconClick(event);
              });
        }
        .width('252vp')
        .height('48vp')
        .margin({ left: '16vp', right: '12vp' })
      }
      .width('280vp')
      .height('56vp')

      //helper text with character counter
      if (this.textFieldParameters.characterCounter) {
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text(this.helperText).height('16vp').fontSize('12fp').margin({ left: '16vp' }).fontColor(this.helperTextColor)
          Text(this.numberOfCharacters + '').height('16vp').fontSize('12fp').margin({ right: '16vp' })
        }
        .width('280vp')
        .height('15vp')
      }

      // helper text without character counter
      else {
        Text(this.helperText)
          .width('280vp')
          .height('16vp')
          .fontSize('1fvp')
          .margin({ left: '16vp' })
          .fontColor(this.helperTextColor)
      }
    }
  }
}