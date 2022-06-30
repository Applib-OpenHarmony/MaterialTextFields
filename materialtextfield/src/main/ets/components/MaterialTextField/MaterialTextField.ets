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

import Filled from "../Filled/Filled"
import Outlined from "../Outlined/Outlined"
import { MaterialTextFieldOptions, MaterialTextFieldType } from "./types"

@Entry
@Component
export default struct MaterialTextField {
  @State textFieldType: MaterialTextFieldType= MaterialTextFieldType.Filled //default type of textfield
  textFieldParameters: MaterialTextFieldOptions; //textfield parameters

  /**
   *
   */
  aboutToAppear() {
    this.convertFontSizeToFp();
  }

  /**
   * converts the text font size and placeholder font size to fp;
   */
  convertFontSizeToFp(){
    if( this.textFieldParameters.textInputOptions.fontSize ){
      this.textFieldParameters.textInputOptions.fontSize = this.textFieldParameters.textInputOptions.fontSize.toString() + 'fp';
    }
    if( this.textFieldParameters.textInputOptions.placeholderFont ) {
      this.textFieldParameters.textInputOptions.placeholderFont.size = this.textFieldParameters.textInputOptions.placeholderFont.size.toString() + 'fp';
    }
  }
  /**
   * returns the height of textfield depending on the type of textfield
   */
  private getHeight(): string {
    if (this.textFieldType == MaterialTextFieldType.Outlined) {
      return '90vp';
    }
    else {
      return '64vp';
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      //filled textfield
      if (this.textFieldType == MaterialTextFieldType.Filled) {
        Filled({ textFieldParameters: this.textFieldParameters });
      }

      //filled textfield
      else if (this.textFieldType == MaterialTextFieldType.Outlined) {
        Outlined({ textFieldParameters: this.textFieldParameters });
      }
    }
    .width('280vp')
    .height(this.getHeight())
    .margin(this.textFieldParameters.margin)
    .padding(this.textFieldParameters.padding)
    .border(this.textFieldParameters.border)
  }
}
