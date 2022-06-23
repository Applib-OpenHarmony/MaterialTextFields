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
export default struct Filled {
  private entry: boolean= true;
  private input: string= '';
  private focused: boolean= false;
  @State textFieldParameters: any= {};

  //label parameters
  @State private labelHeight: number = 0
  @State private labelColor: Color = Color.Black
  //leading Icon
  private leadingIconSize: number = 0;
  private leadingIconMargin: number = 0;
  //placeholder default text
  @State private placeholder: string = '';
  //trailingIcon
  private trailingIconSize: number = 0;
  private trailingIconMargin: number = 0;
  //activation indicator
  @State private activationIndicatorWidth: number = 1;
  @State private activationIndicatorColor: Color = Color.Black;
  //helper text
  @State private helperTextColor: Color= Color.Black;
  private helperText: string = '';
  //character Counter
  private numberOfCharacters: number = 0;

  /**
   * initializes some parameters like input, helper text, leading and trailing icon sizes, #character
   */
  aboutToAppear(): void
  {
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
        this.labelHeight = 15;
      }
    }
    this.numberOfCharacters = this.input.length;
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
   *non-labeled parameters are changed according to the status of textfield.
   * focused, de-focused, disabled
   * @param error
   */
  changeParametersNonLabeled(error?: {
    valid: boolean,
    errorMessage: string
  }): void {
    animateTo(
      {
        curve: Curve.ExtremeDeceleration,
        playMode: PlayMode.Normal,
        tempo: 5,
        iterations: 1,
        delay: 100,
        duration: 1000
      },
      () => {
        if (this.focused) {
          this.activationIndicatorWidth = 2;
          this.activationIndicatorColor = 0x0005FF;
        }
        else {
          this.activationIndicatorWidth = 1;
          this.activationIndicatorColor = Color.Black;
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
    )
  }

  /**
   * labeled parameters are changed according to the status of textfield. focused.de-focused,disabled,input length
   * @param error
   */
  changeParametersLabeled(error?: {
    valid: boolean,
    errorMessage: string
  }): void {
    animateTo(
      {
        curve: Curve.ExtremeDeceleration,
        playMode: PlayMode.Normal,
        tempo: 5,
        iterations: 1,
        delay: 100,
        duration: 1000
      },
      () => {
        if (this.focused) {
          this.activationIndicatorWidth = 2;
          this.activationIndicatorColor = 0x0005FF;
          this.labelColor = 0x0005FF
          this.placeholder = this.textFieldParameters.textInputOptions.placeholderText
          this.labelHeight = 15;
        }
        else {
          if (this.input.length == 0) {
            this.placeholder = this.textFieldParameters.label
            this.labelHeight = 0;
          }
          else {
            this.placeholder = this.textFieldParameters.textInputOptions.placeholderText;
            this.labelHeight = 15;
          }
          this.activationIndicatorWidth = 1;
          this.activationIndicatorColor = Color.Black;
          this.labelColor = Color.Black
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
    )
  }

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      /**
       *filled textfield background
       */
      Stack() {
        Path()
          .width(280)
          .height(64)
          .commands('M0 15 C0 15 2 2 15 0 L825 0 C825 0 835 5 840 15 L840 144 0 144 Z')
          .fill(Color.White)
          .align(Alignment.TopStart)
        Column({ space: 0 }) {
          Row({ space: 0 }) {
            if (this.textFieldParameters.label) {
              //labeled design
              //labeled leading icon
              Image(this.textFieldParameters.leadingIcon)
                .width(this.leadingIconSize)
                .height(this.leadingIconSize)
                .margin({ left: this.leadingIconMargin, bottom: 12 - this.activationIndicatorWidth, top: 12 })
                .onClick(
                  (event) => {
                    this.textFieldParameters.leadingIconClick(event)
                  });

              //input area and label
              Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.End, alignItems: ItemAlign.Start }) {
                Text(this.textFieldParameters.label)
                  .width('100%')
                  .height(this.labelHeight)
                  .fontColor(this.labelColor)
                  .fontSize(12)
                  .margin({ left: 16 })
                  .padding({ bottom: 1 })
                  .backgroundColor(Color.White)
                TextInput({ placeholder: this.placeholder, text: this.input })
                  .width('100%')
                  .height(20)
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
                  .onChange(
                    (value) => {
                      this.input = value;
                      this.numberOfCharacters = value.length;
                      this.textFieldParameters.onChanged(value);
                    })
                  .onClick(
                    () => {
                      this.focused = true;
                      var error = this.textFieldParameters.validate(this.input);
                      try {
                        this.changeParametersLabeled(error);
                      }
                      catch (ex) {
                        console.log("validate() should return object of type: {valid:boolean,errorMessage:string}");
                      }
                    })
                  .onEditChange(
                    (isEditing) => {
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
                  .onSubmit(
                    (enterKey) => {
                      this.textFieldParameters.submit(enterKey)
                    })
              }
              .width(280 - this.trailingIconSize - this.leadingIconSize - this.leadingIconMargin - this.trailingIconMargin)
              .height(36)
              .margin({ top: 4, bottom: 8 - this.activationIndicatorWidth })

              //labeled trailing icon
              Image(this.textFieldParameters.trailingIcon)
                .width(this.trailingIconSize)
                .height(this.trailingIconSize)
                .margin({ right: this.trailingIconMargin, top: 12, bottom: 12 - this.activationIndicatorWidth })
                .onClick(
                  (event) => {
                    this.textFieldParameters.trailingIconClick(event)
                  })
            }
            else {
              //non-labeled design
              //non-labeled leading icon
              Image(this.textFieldParameters.leadingIcon)
                .width(this.leadingIconSize)
                .height(this.leadingIconSize)
                .margin({ left: this.leadingIconMargin, bottom: 12 - this.activationIndicatorWidth, top: 12 })
                .onClick((event) => {
                  this.textFieldParameters.leadingIconClick(event)
                });

              //input area
              TextInput({ placeholder: this.placeholder, text: this.input })
                .height(32)
                .margin({ left: -4, bottom: 8 - this.activationIndicatorWidth, top: 8 })
                .width(280 - this.trailingIconSize - this.leadingIconSize - this.leadingIconMargin - this.trailingIconMargin)
                .maxLength(this.textFieldParameters.maxCharacters)
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

              //non-labeled trailing icon
              Image(this.textFieldParameters.trailingIcon)
                .width(this.trailingIconSize)
                .height(this.trailingIconSize)
                .margin({ right: this.trailingIconMargin, bottom: 12 - this.activationIndicatorWidth, top: 12 })
                .onClick((event) => {
                  this.textFieldParameters.trailingIconClick(event)
                });
            }
          }
          .height(48 - this.activationIndicatorWidth)
          .backgroundColor(Color.White)

          //activation indicator
          Rect().height(this.activationIndicatorWidth).width(280).fill(this.activationIndicatorColor)

          //helper text with character counter
          if (this.textFieldParameters.characterCounter) {
            if (this.textFieldParameters.characterCounter) {
              Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
                Text(this.helperText).height(16).fontSize(12).margin({ left: 16 }).fontColor(this.helperTextColor)
                Text(this.numberOfCharacters + '').height(16).fontSize(12).margin({ right: 16 })
              }
              .width(280)
              .height(16)
            }
          }
          //helper text without character counter
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
    .width(280)
    .height(64)
    .backgroundColor(Color.White)
  }
}
