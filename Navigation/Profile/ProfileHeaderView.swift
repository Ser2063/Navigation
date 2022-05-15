//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 12.05.2022.
//  инструкция https://www.youtube.com/watch?v=ustjkizOA44

import UIKit

class ProfileHeaderView: UIView {

    // объявляем пременные для объектов профиля
    var myUserAvatar: UIImageView!
    var myNameLabel: UILabel!
    var myStatusLabel: UILabel!
    var myStatusButton: UIButton!
    var myStatusTextField: UITextField!

    // объявляем технические переменные
    private var myStatusText: String = "Waiting for something..."  // базовый текст для текстового поля
    private var myStatusButtonTop: NSLayoutConstraint?
    private var myStatusButtonTopMoved: NSLayoutConstraint?

    //инициализируем подкласса
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()

    }

    //инициализатор родительского класса
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initViews() {

        //myUserAvatar настраиваю UI объект с картинкой
        myUserAvatar = UIImageView() //инициализация переменной
        myUserAvatar.image = UIImage(named: "IMG_5935.jpeg") // передали картинку в переменную
        myUserAvatar.translatesAutoresizingMaskIntoConstraints = false // отключаем  автоизменение размера маски
        myUserAvatar.layer.cornerRadius = 80 //скругляем углы слоя
        myUserAvatar.layer.borderWidth = 3   //устанавливаем толщину обводки слоя
        myUserAvatar.layer.borderColor = UIColor.white.cgColor //красим обводку в белый цвет
        myUserAvatar.layer.masksToBounds = true // обрезаем картинку вписываем ее в слой


        // устанавливавливаю констрейнты
        let myUserAvatarTop = myUserAvatar.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16)
        let myUserAvatarLeading = myUserAvatar.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        let myUserAvatarWidth = myUserAvatar.widthAnchor.constraint(equalToConstant: 160)
        let myUserAvatarHeight = myUserAvatar.heightAnchor.constraint(equalToConstant: 160)


        self.addSubview(myUserAvatar) // выводим представление на супервью

        //myNameLabel
        myNameLabel = UILabel() //инициализация переменной
        myNameLabel.translatesAutoresizingMaskIntoConstraints = false // отключаем автоизменение размера маски
        myNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold) //настраиваем шрифт
        myNameLabel.text = "My profile" //колотим базовый текст в поле
        myNameLabel.textAlignment = .left  //выравнивание текста


        // устанавливавливаю констрейнты
        let myNameLabelTop = myNameLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 27)
        let myNameLabelLeading = myNameLabel.leadingAnchor.constraint(equalTo: myUserAvatar.trailingAnchor,constant: 16)
        let myNameLabelTrailing = myNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)


        self.addSubview(myNameLabel) // выводим представление на супервью

        //myStatusButton
        myStatusButton = UIButton() //инициализация переменной
        myStatusButton.translatesAutoresizingMaskIntoConstraints = false // отключаем автоизменение размера маски
        myStatusButton.setTitle("Show status", for: .normal) //колотим текст в кнопке
        myStatusButton.setTitleColor(.white, for: .normal) // устанавливаем белый цвет букв
        myStatusButton.backgroundColor = .blue // заливаем кнопку фоном
        myStatusButton.layer.cornerRadius = 4 // скругляем края кнопки
        myStatusButton.layer.shadowOffset.width = 4 // ширина тени у кнопки
        myStatusButton.layer.shadowOffset.height = 4 // высота тени у кнопки
        myStatusButton.layer.shadowRadius = 4 // размер тени у кнопки
        myStatusButton.layer.shadowColor = UIColor.black.cgColor // цвет тени у кнопки
        myStatusButton.layer.shadowOpacity = 0.7 // прозрачность тени у кнопки
        myStatusButton.addTarget(self, action: #selector(myStatusTextChanged), for: .touchUpInside) // задаем действие при нажатии кнопки


        // устанавливавливаю констрейнты
        let  myStatusButtonHeight = myStatusButton.heightAnchor.constraint(equalToConstant: 50)
        self.myStatusButtonTop = myStatusButton.topAnchor.constraint(equalTo: myUserAvatar.bottomAnchor, constant: 16)
        let myStatusButtonLeading = myStatusButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        let myStatusButtonTrailing = myStatusButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)


        self.addSubview(myStatusButton) // выводим представление на супервью

        //myStatusLabel
        myStatusLabel = UILabel() //инициализация переменной
        myStatusLabel.translatesAutoresizingMaskIntoConstraints = false // отключаем автоизменение размера маски
        myStatusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular) // настройка шрифта
        myStatusLabel.textColor = .gray // цвет шрифта
        myStatusLabel.text = myStatusText //передаем базовый тест для отображения


        // устанавливавливаю констрейнты
        let myStatusLabelBottom = myStatusLabel.bottomAnchor.constraint(equalTo:  myUserAvatar.bottomAnchor, constant: -16)
        let myStatusLabelLeading = myStatusLabel.leadingAnchor.constraint(equalTo: myUserAvatar.trailingAnchor, constant: 16)
        let myStatusLabelTrailing = myStatusLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)


        self.addSubview(myStatusLabel) // выводим представление на супервью

        //myStatusTextField
        myStatusTextField = UITextField() //инициализация переменной
        myStatusTextField.translatesAutoresizingMaskIntoConstraints = false // отключаем автоизменение размера маски
        myStatusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular) //настраиваем шрифт
        myStatusTextField.textColor = .black //цвет шрифта
        myStatusTextField.backgroundColor = .white // настраиваем заливку фона
        myStatusTextField.layer.cornerRadius = 12 // скругляем края
        myStatusTextField.layer.masksToBounds = true //обрезаем объект по маске слоя
        myStatusTextField.layer.borderWidth = 1 // устанавливаем толщину обводки объекта
        myStatusTextField.layer.borderColor = UIColor.black.cgColor // устанавливаем цвет обводки объекта
        myStatusTextField.alpha = 0


        // устанавливавливаю констрейнты
        let myStatusTextFieldWidth = myStatusTextField.widthAnchor.constraint(equalToConstant: 200)
        let myStatusTextFieldHeight = myStatusTextField.heightAnchor.constraint(equalToConstant: 40)
        let myStatusTextFieldTop = myStatusTextField.topAnchor.constraint(equalTo: myUserAvatar.bottomAnchor, constant: 20)
        let myStatusTextFieldLeading = myStatusTextField.leadingAnchor.constraint(equalTo: myUserAvatar.trailingAnchor, constant: 16)
        let myStatusTextFieldTrailing = myStatusTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)

        self.addSubview(myStatusTextField) // выводим представление на супервью


        // активируем констрейнты и настраиваем переходы между ui объектами

        NSLayoutConstraint.activate([
            myUserAvatarWidth,
            myUserAvatarHeight,
            myUserAvatarTop,
            myUserAvatarLeading,

            myNameLabelTop,
            myNameLabelLeading,
            myNameLabelTrailing,

            myStatusButtonHeight,
            myStatusButtonTop,
            myStatusButtonLeading,
            myStatusButtonTrailing,

            myStatusLabelBottom,
            myStatusLabelLeading,
            myStatusLabelTrailing,

            myStatusTextFieldWidth,
            myStatusTextFieldHeight,
            myStatusTextFieldTop,
            myStatusTextFieldLeading,
            myStatusTextFieldTrailing
        ].compactMap({$0}))

    }

    // логика при нажатии кнопки
    @objc func myStatusTextChanged() {
        if self.myStatusTextField.alpha == 0 {
            self.myStatusButtonTopMoved = self.myStatusButton.topAnchor.constraint(equalTo: self.myUserAvatar.bottomAnchor, constant: 65)
            NSLayoutConstraint.deactivate([self.myStatusButtonTop].compactMap({$0}))
            NSLayoutConstraint.activate([self.myStatusButtonTopMoved].compactMap({$0}))
            self.myStatusTextField.alpha = 1
        } else {
            self.myStatusButtonTop = self.myStatusButton.topAnchor.constraint(equalTo: self.myUserAvatar.bottomAnchor, constant: 16)
            NSLayoutConstraint.deactivate([self.myStatusButtonTopMoved].compactMap({$0}))
            NSLayoutConstraint.activate([self.myStatusButtonTop].compactMap({$0}))
            self.myStatusTextField.alpha = 0
            self.myStatusLabel.text = self.myStatusTextField.text
            if self.myStatusLabel.text == "" {
                self.myStatusLabel.text = self.myStatusText
            }
        }
    }


}
