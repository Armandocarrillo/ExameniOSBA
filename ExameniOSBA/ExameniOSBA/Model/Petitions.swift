//
//  Petitions.swift
//  ExameniOS
//
//  Created by Armando Carrillo on 22/12/20.
//

import Foundation

// MARK: - Welcome
struct Welcome: Decodable {
    let colors: [String]
    let questions: [Question]
}

// MARK: - Question
struct Question: Decodable {
    let total: Int
    let text: String
    let chartData: [ChartDatum]
}

// MARK: - ChartDatum
struct ChartDatum: Decodable {
    let text: String
    let percetnage: Int
}
