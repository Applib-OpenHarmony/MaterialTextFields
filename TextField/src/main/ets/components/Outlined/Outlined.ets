/*
 * Copyright (C) 2021-2022 Application Library Engineering Group
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
  @State private labelHeight: number= 0;
  @State private labelColor: Color = Color.Black;
  //leadingIcon
  private leadingIconSize: number = 0;
  private leadingIconMargin: number = 0;
  //placeholder default text
  @State private placeholder: string = "";
  //trailingIcon
  private trailingIconSize: number = 0;
  private trailingIconMargin: number = 0;
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
      this.leadingIconMargin = 16
      this.leadingIconSize = 24;
    }
    if (this.textFieldParameters.trailingIcon) {
      this.trailingIconMargin = 12;
      this.trailingIconSize = 24;
    }
    if (this.textFieldParameters.textInputOptions.input) {
      this.input = this.textFieldParameters.textInputOptions.input;
      if (this.input.length != 0) {
        this.labelHeight = 10;
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
      this.labelHeight = 10;
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
        this.labelHeight = 0;
        this.labelWidth = 0;
        this.placeholder = this.textFieldParameters.label
      }
      else {
        this.labelHeight = 10;
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

  build() {
    Column({ space: 0 }) {
      Stack() {
        /**
         * label text, inputbox, leading icon and trailing icon stacked on rectangular background with rounded corners
         */
        Rect()
          .width(280)
          .height(48)
          .radius(5)
          .fill(Color.White)
          .stroke(this.activationIndicatorColor)
          .strokeWidth(this.activationIndicatorWidth)
          .margin({ top: 6 });

        //stacked design
        Row({ space: 0 }) {
          // leading icon
          Image(this.textFieldParameters.leadingIcon)
            .width(this.leadingIconSize)
            .height(this.leadingIconSize)
            .margin({ left: this.leadingIconMargin })
            .align(Alignment.Center)
            .onClick((event) => {
              this.textFieldParameters.leadingIconClick(event);
            });

          if (this.textFieldParameters.label) {
            //label and input box
            Column({ space: 0 }) {
              //label text
              Text(this.textFieldParameters.label)
                .width(this.labelWidth)
                .height(this.labelHeight)
                .margin({ top: -6, left: 16 - this.leadingIconMargin - this.leadingIconSize })
                .alignSelf(ItemAlign.Start)
                .backgroundColor(Color.White)
                .fontSize(11)
                .fontColor(this.labelColor)
                .textAlign(TextAlign.Center)
                .borderRadius(10);

              //input box
              TextInput({ placeholder: this.placeholder, text: this.input })
                .width(280 - this.trailingIconMargin - this.trailingIconSize - this.leadingIconMargin - this.leadingIconSize)
                .height(40 - this.labelHeight)
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

          else //input box for non-labeled textfield
          {
            //input box
            TextInput({ placeholder: this.placeholder, text: this.input })
              .width(280 - this.trailingIconMargin - this.trailingIconSize - this.leadingIconMargin - this.leadingIconSize)
              .height(40)
              .margin({ top: 4, bottom: 4 })
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
            .margin({ right: this.trailingIconMargin })
            .align(Alignment.Center)
            .onClick(
              (event) => {
                this.textFieldParameters.trailingIconClick(event);
              });
        }
        .width(280)
        .height(48)
      }
      .width(280)
      .height(56)
      .backgroundColor(Color.White)

      //helper text with character counter
      if (this.textFieldParameters.characterCounter) {
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text(this.helperText).height(16).fontSize(12).margin({ left: 16 }).fontColor(this.helperTextColor)
          Text(this.numberOfCharacters + '').height(16).fontSize(12).margin({ right: 16 })
        }
        .width(280)
        .height(16)
      }

      // helper text without character counter
      else {
        Text(this.helperText)
          .width(280)
          .height(16)
          .fontSize(12)
          .margin({ left: 16 })
          .fontColor(this.helperTextColor)
      }
    }
  }
}