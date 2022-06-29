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
export default struct Filled {
  private entry: boolean= true;
  private input: string= '';
  private focused: boolean= false;
  @State textFieldParameters: any= {};

  //label parameters
  @State private labelHeight: number | string = '0vp'
  @State private labelColor: Color = Color.Black
  //leading Icon
  private leadingIconSize: string = '0vp';
  //placeholder default text
  @State private placeholder: string = '';
  //trailingIcon
  private trailingIconSize: string = '0vp';
  //activation indicator
  @State private activationIndicatorWidth: string = '1vp';
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
      this.leadingIconSize = '24vp';
    }
    if (this.textFieldParameters.trailingIcon) {
      this.trailingIconSize = '24vp';
    }
    if (this.textFieldParameters.textInputOptions.input) {
      this.input = this.textFieldParameters.textInputOptions.input;
      if (this.input.length != 0) {
        this.labelHeight = '14vp';
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
          this.activationIndicatorWidth = '2vp';
          this.activationIndicatorColor = 0x0005FF;
        }
        else {
          this.activationIndicatorWidth = '1vp';
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
          this.activationIndicatorWidth = '2vp';
          this.activationIndicatorColor = 0x0005FF;
          this.labelColor = 0x0005FF
          this.placeholder = this.textFieldParameters.textInputOptions.placeholderText
          this.labelHeight = '15vp';
        }
        else {
          if (this.input.length == 0) {
            this.placeholder = this.textFieldParameters.label
            this.labelHeight = '0vp';
          }
          else {
            this.placeholder = this.textFieldParameters.textInputOptions.placeholderText;
            this.labelHeight = '15vp';
          }
          this.activationIndicatorWidth = '1vp';
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

  /**
   * returns text input row bottom margin
   * depending on the width of activation indicator
   */
  private margin(): string {
    if (this.activationIndicatorWidth == '1vp') {
      return '1vp'
    }
    else {
      return '2vp'
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      /**
       *filled textfield background
       */
      Stack() {
        Path()
          .width('280vp')
          .height('64vp')
          .commands('M0 15 C0 15 2 2 15 0 L825 0 C825 0 835 5 840 15 L840 144 0 144 Z')
          .fill(0xeeeeee)
          .align(Alignment.TopStart)
        Column({ space: '0vp' }) {
          Row({ space: '0vp' }) {
            if (this.textFieldParameters.label) {
              //labeled design
              //labeled leading icon
              Image(this.textFieldParameters.leadingIcon)
                .width(this.leadingIconSize)
                .height(this.leadingIconSize)
                .margin({ bottom: '10vp', top: '12vp' })
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
                  .fontSize('12fp')
                  .margin({ left: '16vp' })
                  .padding({ bottom: '1vp' })
                TextInput({ placeholder: this.placeholder, text: this.input })
                  .width('100%')
                  .height('20vp')
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
              .width(this.getInputWidth())
              .height('36vp')
              .padding({ bottom: '1vp' })
              .margin({ top: '4vp', bottom: '6vp' })

              //labeled trailing icon
              Image(this.textFieldParameters.trailingIcon)
                .width(this.trailingIconSize)
                .height(this.trailingIconSize)
                .margin({ top: '12vp', bottom: '10vp' })
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
                .margin({ bottom: '10vp', top: '12vp' })
                .onClick((event) => {
                  this.textFieldParameters.leadingIconClick(event)
                });

              //input area
              TextInput({ placeholder: this.placeholder, text: this.input })
                .height('32vp')
                .margin({ left: '-4vp', bottom: '6vp', top: '8vp' })
                .width(this.getInputWidth())
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
                .margin({ bottom: '10vp', top: '12vp' })
                .onClick((event) => {
                  this.textFieldParameters.trailingIconClick(event)
                });
            }
          }
          .height('46vp')
          .margin({ left: '16vp', right: '12vp', bottom: this.margin() })

          //activation indicator
          Rect().height(this.activationIndicatorWidth).width('280vp').fill(this.activationIndicatorColor)

          //helper text with character counter
          if (this.textFieldParameters.characterCounter) {
            Flex({
              direction: FlexDirection.Row,
              justifyContent: FlexAlign.SpaceBetween,
              alignItems: ItemAlign.Center
            }) {
              Text(this.helperText)
                .height('14vp')
                .fontSize('12fp')
                .margin({ left: '16vp' })
                .fontColor(this.helperTextColor)
              Text(this.numberOfCharacters + '')
                .height('14vp')
                .fontSize('12fp')
                .margin({ right: '16vp' })
                .fontColor(this.helperTextColor)
            }
            .width('280vp')
            .height('14vp').padding({ top: '1vp' })
          }
          //helper text without character counter
          else {
            Text(this.helperText)
              .width('280vp')
              .height('16vp')
              .fontSize('12fp')
              .margin({ left: '16vp' })
              .fontColor(this.helperTextColor)
          }
        }
      }
    }
    .width('280vp')
    .height('64vp')
  }
}
