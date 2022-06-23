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
struct Filled_sample {
  textFieldOptions: TextFieldOptions = new TextFieldOptions;

  aboutToAppear(): void {
    this.textFieldOptions = {
      ...this.textFieldOptions,
      label: 'User',
//      labelWidth: 35,
      helperText: "Shouldn't be a mail-id",
      trailingIcon: $r("app.media.clear"),
      leadingIcon: $r('app.media.account'),
      characterCounter: true,
      maxCharacters: 10,
      textInputOptions:{placeholderText:"eg: Harold",
        placeholderFont:{size:20,style:FontStyle.Normal,weight:FontWeight.Normal},
        placeholderColor:Color.Red,
        caretColor:Color.Red,
         },
      trailingIconClick: (event) => {
        AlertDialog.show({ message: 'trail icon click\n' + JSON.stringify(event.target) })
      },
      leadingIconClick: (event) => {
        AlertDialog.show({ message: 'lead icon click\n' + JSON.stringify(event.target) })
      },
//      onChanged: () => {
//      },
//      editChanged: (isEditing) => {
//
//        AlertDialog.show({ message: "" + isEditing, title: 'Edit Change' })
//      },
//      validate: () => {
//        return { valid: true, errorMessage: "error" }
//      },
//      submit: () => {
//      }
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center }) {
      TextField({ textFieldParameters: this.textFieldOptions,textFieldType:TextFieldType.Filled });
      TextInput({placeholder:'he',text:'ger'}).width(200).height(100)

    }
  }
}