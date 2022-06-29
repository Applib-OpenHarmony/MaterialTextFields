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

//enum types of textfield
export enum MaterialTextFieldType {
  Filled,
  Outlined
}

//textfield attributes
export class MaterialTextFieldOptions {
  label?: string;
  labelWidth?: number = 40;
  leadingIcon?: Resource;
  trailingIcon?: Resource;
  characterCounter?: boolean;
  maxCharacters?: number= 100000;
  helperText?: string;
  leadingIconClick?: Function = (clickEvent?: ClickEvent): void => {
  };
  trailingIconClick?: Function = (clickEvent?: ClickEvent): void => {
  };
  margin?: Length | Padding;
  padding?: Length | Padding;
  border?: BorderOptions;
  validate: Function = (value?: string): {
    valid: boolean,
    errorMessage: string
  } => {
    return { valid: true, errorMessage: '' };
  };
  onChanged: Function = (value?: string): void => {
  };
  editChanged: Function = (isEditing?: boolean): void => {
  };
  submit: Function = (enterKey?: EnterKeyType): void => {
  };
  textInputOptions?: {
    id?: string;
    input?: string;
    placeholderText?: string;
    inputType?: InputType;
    placeholderFont?: Font;
    placeholderColor?: Color;
    fontColor?: Color;
    fontSize?: number|string;
    fontStyle?: FontStyle;
    fontWeight?: FontWeight;
    fontFamily?: ResourceStr;
    enterKeyType?: EnterKeyType;
    caretColor?: Color;
  } = {};

  /**
   * sets label
   * @param label
   * @param labelWidth
   */
  setLabel?(label: string, labelWidth: number = 40): MaterialTextFieldOptions {
    this.label = label;
    this.labelWidth = labelWidth
    return this;
  }

  /**
   * sets icons
   * @param leadingIcon
   * @param trailingIcon
   */
  setIcons?(leadingIcon?: Resource, trailingIcon?: Resource): MaterialTextFieldOptions {
    if (leadingIcon) {
      this.leadingIcon = leadingIcon;
    }
    if (trailingIcon) {
      this.trailingIcon = trailingIcon;
    }
    return this;
  }

  /**
   * sets helpertext
   * @param text
   */
  setHelperText?(text: string): MaterialTextFieldOptions {
    this.helperText = text;
    return this;
  }

  /**
   * enable character counter with max character limit if needed
   * @param enable
   * @param maxCharacters
   */
  setCharacterCounter?(enable: boolean=false, maxCharacters: number=100000): MaterialTextFieldOptions {
    this.maxCharacters = maxCharacters;
    this.characterCounter = enable;
    return this;
  }

  /**
   * sets text input attributes
   * @param params: {
    id
   */
  setTextInputOptions?(params: {
    id?: string;
    input?: string;
    placeholderText?: string;
    inputType?: InputType;
    placeholderFont?: Font;
    placeholderColor?: Color;
    fontColor?: Color;
    fontSize?: number;
    fontStyle?: FontStyle;
    fontWeight?: FontWeight;
    fontFamily?: ResourceStr;
    enterKeyType?: EnterKeyType;
    caretColor?: Color;
  }): MaterialTextFieldOptions {
    this.textInputOptions = params;
    return this;
  }

  /**
   * callback triggered when there is a click on leading icon
   * @param callBack
   */
  onLeadingIconClick?(callBack: Function): MaterialTextFieldOptions {
    this.leadingIconClick = callBack;
    return this;
  }

  /**
   * callback triggered when there is a click on leading icon
   * @param callBack
   */
  onTrailingIconClick?(callBack: Function): MaterialTextFieldOptions {
    this.trailingIconClick = callBack;
    return this;
  }

  /**
   * sets margin of textfield material component
   * @param value
   */
  setMargin?(value: Length | Padding): MaterialTextFieldOptions {
    this.margin = value;
    return this;
  }

  /**
   * sets padding of textfield material component
   * @param value
   */
  setPadding?(value: Length | Padding): MaterialTextFieldOptions {
    this.padding = value;
    return this;
  }

  /**
   * sets border of textfield material component
   * @param value
   */
  setBorder?(value: BorderOptions): MaterialTextFieldOptions {
    this.border = value;
    return this;
  }

  /**
   * validating function to check validity of input text
   * @param callBack
   */
  isValid?(callBack: Function): MaterialTextFieldOptions {
    this.validate = callBack;
    return this;
  }

  /**
   * triggered when input changes
   * @param callBack
   */
  onChange?(callBack: Function): MaterialTextFieldOptions {
    this.onChanged = callBack;
    return this
  }

  /**
   * triggered when user stops editing
   * @param callBack
   */
  onEditChange?(callBack: Function): MaterialTextFieldOptions {
    this.editChanged = callBack;
    return this
  }

  /**
   * triggered when user submits the input
   * @param callBack
   */
  onSubmit?(callBack: Function): MaterialTextFieldOptions {
    this.submit = callBack;
    return this
  }
}