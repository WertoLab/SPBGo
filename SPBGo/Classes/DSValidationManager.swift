//
//  DSValidationManager.swift
//  SPBGo
//
//  Created by Валерия Отрощенко on 2022-11-07.
//

func isValidUsername(_ name: String, forbiddenChars: String = "@#$%&*,.-_()^<>!±1234567890йцукенгшщзхъёфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪЁФЫВАПРОЛДЖЭЯЧСМИТЬБЮ", lengthRange: Range<Int> = 3..<15) -> Bool {
    guard  lengthRange ~= name.count , name.first!.isLetter else { return false }
    return name.allSatisfy{ !forbiddenChars.contains($0) }
}

