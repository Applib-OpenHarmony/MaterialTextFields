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

import { MaterialTextField, MaterialTextFieldOptions, MaterialTextFieldType } from "@ohos/MaterialTextField"

@Entry
@Component
struct Outlined_sample {
  textFieldOptions: MaterialTextFieldOptions = new MaterialTextFieldOptions()
    .setLabel('Username', 60)
    .setIcons($r('app.media.account'), $r('app.media.clear'))
    .onTrailingIconClick((event) => {
      console.log("Trailing icon click:" + JSON.stringify(event))
    })
    .onLeadingIconClick((event) => {
      console.log("Leading icon click:" + event)
    })
    .isValid((value) => {
      if (value.charAt(4) == 'd') {
        return { valid: true, errorMessage: '' }
      }
      else return { valid: false, errorMessage: 'd should be at 5th position' }
    })
    .setHelperText('Required*')
    .setTextInputOptions({
      placeholderText: 'mail or phone',
      // input: 'Harold',
      caretColor: Color.Blue,
      fontFamily: 'cursive'
    })

  aboutToAppear() {

  }

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
      MaterialTextField({ textFieldParameters: this.textFieldOptions, textFieldType: MaterialTextFieldType.Outlined })
      TextInput({ placeholder: 'he', text: 'ger' }).width('200vp').height('100vp').fontFamily('cursive')
    }
    .width('100%')
    .height('300vp')
    .backgroundColor(Color.White)
  }
}