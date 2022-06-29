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
struct Sample {
  filledLabelParas: MaterialTextFieldOptions = new MaterialTextFieldOptions;
  filledNonLabelParas: MaterialTextFieldOptions = new MaterialTextFieldOptions;
  outlinedLabelParas: MaterialTextFieldOptions = new MaterialTextFieldOptions;
  outlinedNonLabelParas: MaterialTextFieldOptions = new MaterialTextFieldOptions;

  aboutToAppear(): void {
    this.filledLabelParas = {
      ...this.filledLabelParas,
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
        console.log("Edit Change; Fill + Label:" + isEditing);
      },
      validate: () => {
        return { valid: true, errorMessage: "error" }
      }
    }
    this.filledNonLabelParas = {
      ...this.filledNonLabelParas,
      helperText: "Required*",
      leadingIcon: $r('app.media.account'),
      maxCharacters: 10,
      textInputOptions: { input:'Input(default)'
      },
      leadingIconClick: (event) => {
        console.log('lead icon click\n' + JSON.stringify(event.target))
      },
      editChanged: (isEditing) => {
        console.log("Edit Change; Fill + Non-label:" + isEditing)
      }
    }
    this.outlinedLabelParas = {
      ...this.outlinedLabelParas,
      label: 'User',
      helperText: "Helper Text",
      trailingIcon: $r("app.media.clear"),
      characterCounter: true,
      textInputOptions: { placeholderText: "eg: Harold",
        placeholderFont: { size: 20, style: FontStyle.Italic, weight: FontWeight.Normal }
      },
      trailingIconClick: (event) => {
        console.log('trail icon click\n' + JSON.stringify(event.target));
      },
      editChanged: (isEditing) => {
        console.log("Edit Change; Out + Label:" + isEditing)
      },
      validate: (value) => {
        if (value.charAt(4) == 'd') return { valid: true, errorMessage: '' };
        else return { valid: false, errorMessage: 'd should be at 5th position' }
      }
    }
    this.outlinedNonLabelParas = {
      ...this.outlinedNonLabelParas,
      textInputOptions: { placeholderText: "eg: Harold",
        placeholderFont: { size: 20, style: FontStyle.Normal, weight: FontWeight.Normal },
        caretColor: Color.Green,
      },
      editChanged: (isEditing) => {
        console.log("Edit Change; Out + Non-label:" + isEditing)
      }
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('Filled and Labeled').fontSize('15fp').padding('5fp')
      MaterialTextField({ textFieldParameters: this.filledLabelParas, textFieldType: MaterialTextFieldType.Filled });
      Text('Filled and Non-labeled').fontSize('15fp').margin({top:'40vp'})
      MaterialTextField({ textFieldParameters: this.filledNonLabelParas, textFieldType: MaterialTextFieldType.Filled });
      Text('Outlined and Labeled').fontSize('15fp').margin({top:'40vp'})
      MaterialTextField({ textFieldParameters: this.outlinedLabelParas, textFieldType: MaterialTextFieldType.Outlined });
      Text('Outlined and Non-labeled').fontSize('15fp').margin({top:'40vp'})
      MaterialTextField({ textFieldParameters: this.outlinedNonLabelParas, textFieldType: MaterialTextFieldType.Outlined });

    }.width('100%')
  }
}