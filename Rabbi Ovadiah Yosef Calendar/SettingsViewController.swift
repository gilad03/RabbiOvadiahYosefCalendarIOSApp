//
//  SettingsViewController.swift
//  Rabbi Ovadiah Yosef Calendar
//
//  Created by Elyahu on 4/26/23.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    let defaults = UserDefaults.standard

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func toggle(_ sender: SwitchWithParam) {
        defaults.set(sender.isOn, forKey: sender.param)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12 //increment this every time...
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicSettingsCell", for: indexPath)
        cell.accessoryView = nil

        var content = cell.defaultContentConfiguration()
        switch indexPath.row {
        case 0:
            content.text = "Zmanim Notifications"
            content.secondaryText = "Receive daily zmanim notifications"
            let switchView = SwitchWithParam(frame: .zero)
            switchView.isOn = defaults.bool(forKey: "zmanim_notifications")
            switchView.param = "zmanim_notifications"
            switchView.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        case 1:
            content.text = "Zmanim Notifications Settings"
            content.secondaryText = "Change the zmanim notifications settings"
            if !defaults.bool(forKey: "zmanim_notifications") {
                content.textProperties.color = .gray
                content.secondaryTextProperties.color = .gray
                cell.selectionStyle = .none
            }
        case 2:
            content.text = "Zmanim Settings"
            content.secondaryText = "Change the zmanim settings"
        case 3:
            content.text = "Show seconds?"
            content.secondaryText = "Choose whether or not to display the seconds of the zmanim"
            let switchView = SwitchWithParam(frame: .zero)
            switchView.isOn = defaults.bool(forKey: "showSeconds")
            switchView.param = "showSeconds"
            switchView.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        case 4:
            content.text = "Show Rabbeinu Tam everyday?"
            content.secondaryText = "Choose whether or not to display the zman for rabbeinu tam everyday"
            let switchView = SwitchWithParam(frame: .zero)
            switchView.isOn = defaults.bool(forKey: "alwaysShowRT")
            switchView.param = "alwaysShowRT"
            switchView.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        case 5:
            content.text = "Round up Rabbeinu Tam?"
            content.secondaryText = "Choose whether or not to round up the zman for rabbeinu tam to the nearest minute"
            let switchView = SwitchWithParam(frame: .zero)
            switchView.isOn = defaults.bool(forKey: "roundUpRT")
            switchView.param = "roundUpRT"
            switchView.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        case 6:
            content.text = "Notify day of omer as well?"
            content.secondaryText = "Choose whether or not the app will notify you of the day of the omer during the day"
            let switchView = SwitchWithParam(frame: .zero)
            switchView.isOn = defaults.bool(forKey: "showDayOfOmer")
            switchView.param = "showDayOfOmer"
            switchView.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        case 7:
            content.text = "Show zman dialogs?"
            content.secondaryText = "Choose whether or not to display the information for each zman when pressed"
            let switchView = SwitchWithParam(frame: .zero)
            switchView.isOn = defaults.bool(forKey: "showZmanDialogs")
            switchView.param = "showZmanDialogs"
            switchView.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        case 8:
            content.text = "Show when Shabbat/Chag ends the day before?"
            content.secondaryText = "Choose whether or not to add the zman for when shabbat ends on a friday or before chag"
            let switchView = SwitchWithParam(frame: .zero)
            switchView.isOn = defaults.bool(forKey: "showWhenShabbatChagEnds")
            switchView.param = "showWhenShabbatChagEnds"
            switchView.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        case 9:
            content.text = "Show Regular Minutes"
            content.secondaryText = "Show regular minutes the day before shabbat/chag ends"
            if !defaults.bool(forKey: "showWhenShabbatChagEnds") {
                content.textProperties.color = .gray
                content.secondaryTextProperties.color = .gray
                cell.selectionStyle = .none
            } else {
                let switchView = SwitchWithParam(frame: .zero)
                switchView.isOn = defaults.bool(forKey: "showRegularWhenShabbatChagEnds")
                switchView.param = "showRegularWhenShabbatChagEnds"
                switchView.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
                cell.accessoryView = switchView
            }
        case 10:
            content.text = "Show Rabbeinu Tam"
            content.secondaryText = "Show Rabbeinu Tam the day before shabbat/chag ends"
            if !defaults.bool(forKey: "showWhenShabbatChagEnds") {
                content.textProperties.color = .gray
                content.secondaryTextProperties.color = .gray
                cell.selectionStyle = .none
            } else {
                let switchView = SwitchWithParam(frame: .zero)
                switchView.isOn = defaults.bool(forKey: "showRTWhenShabbatChagEnds")
                switchView.param = "showRTWhenShabbatChagEnds"
                switchView.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
                cell.accessoryView = switchView
            }
        case 11:
            content.text = "Set elevation to last known location?"
            content.secondaryText = "Choose whether or not to set the elevation to the last known location when the app is opened offline"
            let switchView = SwitchWithParam(frame: .zero)
            switchView.isOn = defaults.bool(forKey: "setElevationToLastKnownLocation")
            switchView.param = "setElevationToLastKnownLocation"
            switchView.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        default:
            break
        }

        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.row == 1 && defaults.bool(forKey: "zmanim_notifications") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyboard.instantiateViewController(withIdentifier: "ZmanimNotificationsSettingsViewController") as! ZmanimNotificationsSettingsViewController
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true)
        }
        if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyboard.instantiateViewController(withIdentifier: "ZmanimSettingsViewController") as! ZmanimSettingsViewController
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true)
        }
    }

}

class SwitchWithParam: UISwitch {
    var param: String = ""
}

