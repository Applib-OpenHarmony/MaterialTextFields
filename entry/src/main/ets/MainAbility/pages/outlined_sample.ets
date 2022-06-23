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


import { TextField, TextFieldType, TextFieldOptions } from "@ohos/TextField"

@Entry
@Component
struct Outlined_sample
{
  textFieldOptions: TextFieldOptions = new TextFieldOptions()
    .setLabel('Username',60)
    .setIcons($r('app.media.account'))
    .onTrailingIconClick((event)=>{console.log("Trailing icon click:"+JSON.stringify(event))})
    .onLeadingIconClick((event)=>{console.log("Leading icon click:"+event)})
    .setCharacterCounter(true,10)
//    .isValid((value)=>{
//      if(value.charAt(5)=='d'){
//        return {valid:true,errorMessage:''}
//      }
//      else return {valid:false,errorMessage:'d should be at 5th index'}
//    })
    .setHelperText('Required*')
    .setTextInputOptions({placeholderText:'mail or phone',caretColor:Color.Blue,input:'Hello! there',fontFamily:'cursive'})
  aboutToAppear()
  {

  }


  build() {
    Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center})
    {
      TextField({textFieldParameters:this.textFieldOptions,textFieldType:TextFieldType.Outlined})
      TextInput({placeholder:'he',text:'ger'}).width(200).height(100).fontFamily('cursive')
    }
    .width(300)
    .height(300)
    .backgroundColor(Color.White)
  }
}