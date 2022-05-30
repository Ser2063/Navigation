//
//  Post.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 11.05.2022.
//
import Foundation
import UIKit

//Создание и передача объектов между контроллерами
// создадим структуру Post со свойством title: String
struct PostModel {

    let author: String
    let title: String
    let description: String
    let image: UIImage
    let likes: Int
    let views: Int


}


func dataForCells() -> [PostModel] {
    var modelCell = [PostModel]()
    modelCell.append(PostModel(author: "Алексей", title: "Человек из стали", description: "Now Clark Kent’s Man of Steel is about Truth, Justice and a Better Tomorrow. To better reflect the storylines that we are telling across DC and to honor Superman’s incredible legacy of over 80 years of building a better world, Superman’s motto is evolving,” announced DC chief creative officer and publisher Jim Lee at the company’s. “Superman has long been a symbol of hope who inspires people, and it is that optimism and hope that powers him forward with this new mission statement.", image: UIImage(named: "man_of_steel") ?? UIImage(imageLiteralResourceName: "IMG_5935"), likes: 10, views: 11))

    modelCell.append(PostModel(author: "Наталья", title: "Выберите вектор развития", description: "С нами вы можете получить новую профессию, освоить навыки для развития карьеры или перенастроить свой бизнес. Выбирайте подходящую из более 80 программ.", image: UIImage(named:"netology_media") ?? UIImage(), likes: 12, views: 18))

    modelCell.append(PostModel(author: "Денис", title: "Рассказ о Корги", description: "Вельш-корги-кардиган (англ. Welsh Corgi Cardigan) — порода, появившаяся на изолированной территории Кардиганшира. Согласно наиболее популярной версии, предки вельш-корги-кардиганов были завезены кельтами при освоении территории Британских островов в конце бронзового века. Первое упоминание породы в письменных источниках датируется X веком.Вельш-корги-пемброк (англ. Welsh Corgi Pembroke) — порода, выведенная в Пембрукшире, предположительно, из собак фламандского происхождения и ведущая свою историю с XIII века.", image: UIImage(named:"pembroke_welsh_corgi")!, likes: 15, views: 15))

    modelCell.append(PostModel(author: "Сергей", title: "Музыкальные продюссеры", description: "Like Huxley or fellow Aus affiliate George Fitzgerald, Dusky have built their reputation by scribbling in rather than ripping up the rulebook. Their tech-enchanced take on deep house and Chicago jack is reverential, but it’s also well-wrought and characterised by neat calls: see 2011 breakthrough ‘Lost In You’, or the classy ‘Flo Jam’. Their sound is an absolutely perfect match for Will Saul’s Aus Music imprint, and Dusky’s new Nobody Else EP – sandwiched in between releases from Midland and Bicep – fits in a treat.", image: UIImage(named:"dusky190313")!, likes: 4, views: 22))

    return modelCell
}
