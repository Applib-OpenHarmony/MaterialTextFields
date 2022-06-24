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
struct Filled_sample {
  textFieldOptions: MaterialTextFieldOptions = new MaterialTextFieldOptions;

  aboutToAppear(): void {
    this.textFieldOptions = {
      ...this.textFieldOptions,
      label: 'User',
      helperText: "Shouldn't be a mail-id",
      trailingIcon: $r("app.media.clear"),
      leadingIcon: $r('app.media.account'),
      characterCounter: true,
      maxCharacters: 10,
      textInputOptions: { placeholderText: "eg: Harold",
        placeholderFont: { size: 20, style: FontStyle.Normal, weight: FontWeight.Normal },
        caretColor: Color.Red,
      },
      trailingIconClick: (event) => {
        console.log('trail icon click\n' + JSON.stringify(event.target));
      },
      leadingIconClick: (event) => {
        console.log('lead icon click\n' + JSON.stringify(event.target))
      },
      editChanged: (isEditing) => {
        console.log("Edit Change" + isEditing)
      },
      validate: () => {
        return { valid: true, errorMessage: "error" }
      }
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
      MaterialTextField({ textFieldParameters: this.textFieldOptions, textFieldType: MaterialTextFieldType.Filled });
      TextInput({ placeholder: 'he', text: 'ger' }).width('200vp').height('100vp')

    }.width('100%')
  }
}