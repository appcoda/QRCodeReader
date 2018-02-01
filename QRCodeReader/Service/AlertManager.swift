//
//  AlertManager.swift
//  QRCodeReader
//
//  Created by Darkhonbek Mamataliev on 26/1/18.
//  Copyright © 2018 Darkhonbek. All rights reserved.
//

import Foundation
import CDAlertView

public enum AlertType {
    case notFound, accepted, declined
}

public class AlertManager {

    public static func showAlert(of type: AlertType) -> CDAlertView{
        switch type {
        case .accepted:
            return showAcceptedAlert()
        case .declined:
            return showDeclinedAlert()
        case .notFound:
            return showNotFoundAlert()
        }
    }

    public static func showAcceptedAlert() -> CDAlertView{
        let alertView = CDAlertView(title: "Good!", message: "User has not checked in yet", type: CDAlertViewType.success)
        let action = CDAlertViewAction(title: "OK")
        alertView.add(action: action)

        return alertView
    }

    public static func showDeclinedAlert() -> CDAlertView{
        let alertView = CDAlertView(title: "Bad!", message: "User already checked in", type: CDAlertViewType.error)
        let action = CDAlertViewAction(title: "OK")
        alertView.add(action: action)

        return alertView
    }

    public static func showNotFoundAlert() -> CDAlertView{
        let alertView = CDAlertView(title: "Error", message: "ID not registered", type: CDAlertViewType.warning)
        let action = CDAlertViewAction(title: "OK")
        alertView.add(action: action)

        return alertView
    }
}
