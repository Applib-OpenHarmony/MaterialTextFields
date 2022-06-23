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

import Filled from "../Filled/Filled"
import Outlined from "../Outlined/Outlined"
import { TextFieldType, TextFieldOptions } from "./types"

@Entry
@Component
export default struct TextField {
  @State textFieldType:TextFieldType=TextFieldType.Filled  //default type of textfield
  textFieldParameters:TextFieldOptions;     //textfield parameters

  aboutToAppear() {
  }

  /**
   * returns the height of textfield depending on the type of textfield
   */
  private getHeight():number {
    if(this.textFieldType==TextFieldType.Outlined){
      return 72
    }
    else {
      return 64
    }
  }

  build(){
    Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.Center,alignItems:ItemAlign.Center}) {
      //filled textfield
      if(this.textFieldType==TextFieldType.Filled) {
        Filled({textFieldParameters:this.textFieldParameters});
      }

      //filled textfield
      else if(this.textFieldType==TextFieldType.Outlined) {
        Outlined({textFieldParameters:this.textFieldParameters});
      }
    }
    .width(280)                                   //width of textfield(default 280)
    .height(this.getHeight())                     //height of textfield
    .margin(this.textFieldParameters.margin)      //margin
    .padding(this.textFieldParameters.padding)    //padding
    .border(this.textFieldParameters.border)      //border
  }
}
