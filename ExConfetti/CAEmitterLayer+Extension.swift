//
//  CAEmitterLayer+Extension.swift
//  ExConfetti
//
//  Created by 김종권 on 2024/05/15.
//

import UIKit

struct Config {
    enum PresetType {
        case firework
        case snow
        
        var value: Config {
            switch self {
            case .firework:
                    .init(
                        id: "firework",
                        image: UIImage(named: "firework")!,
                        color: UIColor(
                            white: 1,
                            alpha: 0.8
                        ),
                        duration: 2.5,
                        birthRate: 50,
                        lifeTime: 10.5,
                        velocity: 500,
                        velocityRange: 50,
                        emissionRange: 0.25,
                        emissionLongitude: 0,
                        scale: 0.01,
                        scaleRange: 0.2,
                        spinVelocity: 1,
                        spinRange: 0.5,
                        accelerationOfGravity: 200,
                        spinOrientationRange: .pi,
                        spinOrientationLongitude: .pi,
                        spinOrientationLatitude: 0
                    )
            case .snow:
                    .init(
                        id: "snowfall",
                        image: UIImage(named: "firework")!,
                        color: UIColor(
                            white: 1,
                            alpha: 0.8
                        ),
                        duration: 10,
                        birthRate: 10,
                        lifeTime: 60,
                        velocity: 50,
                        velocityRange: 20,
                        emissionRange: .pi,
                        emissionLongitude: 0,
                        scale: 0.1,
                        scaleRange: 0.05,
                        spinVelocity: 0,
                        spinRange: 0,
                        accelerationOfGravity: 200,
                        spinOrientationRange: 0,
                        spinOrientationLongitude: 0,
                        spinOrientationLatitude: 0
                    )
            }
        }
    }
    
    /// 셀의 고유 식별자
    let id: String
    /// 셀에 표시되는 이미지
    let image: UIImage
    /// 셀의 색상
    let color: UIColor?
    /// 셀의 지속 시간: emitter의 활성화된 시간을 결정
    let duration: TimeInterval
    /// 초당 생성량: 초당 생성되는 emitter의 수 비율을 결정
    let birthRate: Float
    /// 셀의 수명: emitter 각 하나가 살아있는 시간(초)
    let lifeTime: Float
    /// emitter의 속도: 이게 클수록 높이 튀어오름
    let velocity: CGFloat
    /// 속도 범위: emitter의 초기 속도에 대한 무작위성을 결정
    let velocityRange: CGFloat
    /// emitter 방출 각도 범위: emitter가 방출되는 각도의 범위를 결정
    let emissionRange: CGFloat
    /// emitter 방출 각도: emitter가 방출되는 방향을 결정
    let emissionLongitude: CGFloat
    /// 크기 비율: emitter의 크기를 결정
    let scale: CGFloat
    /// 크기 범위: emitter의 크기에 대한 무작위성을 결정
    let scaleRange: CGFloat
    /// 회전 속도: emitter의 회전 속도를 결정
    let spinVelocity: CGFloat
    /// 회전 범위: emitter의 회전 속도에 대한 무작위성을 결정
    let spinRange: CGFloat
    /// 중력 가속도: 중력 가속도를 설정 (양수 값은 아래로 향하는 중력을 표현)
    let accelerationOfGravity: CGFloat
    /// 회전 방향 범위: emitter의 회전 방향의 범위를 결정
    let spinOrientationRange: CGFloat
    /// 회전 방향 경도: emitter의 회전 방향의 경도를 결정
    let spinOrientationLongitude: CGFloat
    /// 회전 방향 위도: emitter의 회전 방향의 위도를 결정
    let spinOrientationLatitude: CGFloat
}

extension CAEmitterCell {
    static func item(with config: Config) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.name = config.id
        cell.contents = config.image.cgImage
        cell.color = config.color?.cgColor
        cell.beginTime = CACurrentMediaTime()
        cell.duration = config.duration
        cell.birthRate = config.birthRate
        cell.lifetime = config.lifeTime
        cell.velocity = config.velocity
        cell.velocityRange = config.velocityRange
        cell.emissionRange = .pi * config.emissionRange
        cell.emissionLongitude = config.emissionLongitude
        cell.scale = config.scale
        cell.scaleRange = config.scaleRange
        cell.scaleSpeed = 0
        cell.spin = config.spinVelocity
        cell.spinRange = config.spinRange
        cell.yAcceleration = config.accelerationOfGravity
        cell.setValue("plane", forKey: "particleType")
        cell.setValue(config.spinOrientationRange, forKey: "orientationRange")
        cell.setValue(config.spinOrientationLongitude, forKey: "orientationLongitude")
        cell.setValue(config.spinOrientationLatitude, forKey: "orientationLatitude")
        return cell
    }
}
