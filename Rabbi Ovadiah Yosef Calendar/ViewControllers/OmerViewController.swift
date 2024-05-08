//
//  OmerViewController.swift
//  Rabbi Ovadiah Yosef Calendar
//
//  Created by Elyahu Jacobi on 5/6/24.
//

import UIKit
import KosherSwift

class OmerViewController: UIViewController {
    
    let omerList = ["הַיּוֹם יוֹם אֶחָד לָעֹמֶר:",
                    "הַיּוֹם שְׁנֵי יָמִים לָעֹמֶר:",
                    "הַיּוֹם שְׁלֹשָׁה יָמִים לָעֹמֶר:",
                    "הַיּוֹם אַרְבָּעָה יָמִים לָעֹמֶר:",
                    "הַיּוֹם חֲמִשָּׁה יָמִים לָעֹמֶר:",
                    "הַיּוֹם שִׁשָּׁה יָמִים לָעֹמֶר:",
                    "הַיּוֹם שִׁבְעָה יָמִים לָעֹמֶר, שֶׁהֵם שָׁבוּעַ אֶחָד:",
                    "הַיּוֹם שְׁמוֹנָה יָמִים לָעֹמֶר, שֶׁהֵם שָׁבוּעַ אֶחָד וְיוֹם אֶחָד:",
                    "הַיּוֹם תִּשְׁעָה יָמִים לָעֹמֶר, שֶׁהֵם שָׁבוּעַ אֶחָד וּשְׁנֵי יָמִים:",
                    "הַיּוֹם עֲשָׂרָה יָמִים לָעֹמֶר, שֶׁהֵם שָׁבוּעַ אֶחָד וּשְׁלֹשָׁה יָמִים:",
                    "הַיּוֹם אַחַד עָשָׂר יוֹם לָעֹמֶר, שֶׁהֵם שָׁבוּעַ אֶחָד וְאַרְבָּעָה יָמִים:",
                    "הַיּוֹם שְׁנֵים עָשָׂר יוֹם לָעֹמֶר, שֶׁהֵם שָׁבוּעַ אֶחָד וַחֲמִשָּׁה יָמִים:",
                    "הַיּוֹם שְׁלֹשָׁה עָשָׂר יוֹם לָעֹמֶר, שֶׁהֵם שָׁבוּעַ אֶחָד וְשִׁשָּׁה יָמִים:",
                    "הַיּוֹם אַרְבָּעָה עָשָׂר יוֹם לָעֹמֶר, שֶׁהֵם שְׁנֵי שָׁבוּעוֹת:",
                    "הַיּוֹם חֲמִשָּׁה עָשָׂר יוֹם לָעֹמֶר, שֶׁהֵם שְׁנֵי שָׁבוּעוֹת ויוֹם אֶחָד:",
                    "הַיּוֹם שִׁשָּׁה עָשָׂר יוֹם לָעֹמֶר, שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וּשְׁנֵי יָמִים:",
                    "הַיּוֹם שִׁבְעָה עָשָׂר יוֹם לָעֹמֶר, שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים:",
                    "הַיּוֹם שְׁמוֹנָה עָשָׂר יוֹם לָעֹמֶר, שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וְאַרְבָּעָה יָמִים:",
                    "הַיּוֹם תִּשְׁעָה עָשָׂר יוֹם לָעֹמֶר, שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וַחֲמִשָּׁה יָמִים:",
                    "הַיּוֹם עֶשְׂרִים יוֹם לָעֹמֶר, שֶׁהֵם שְׁנֵי שָׁבוּעוֹת וְשִׁשָּׁה יָמִים:",
                    "הַיּוֹם אֶחָד וְעֶשְׂרִים יוֹם לָעֹמֶר, שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת:",
                    "הַיּוֹם שְׁנַיִם וְעֶשְׂרִים יוֹם לָעֹמֶר, שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וְיוֹם אֶחָד:",
                    "הַיּוֹם שְׁלֹשָׁה וְעֶשְׂרִים יוֹם לָעֹמֶר, שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים:",
                    "הַיּוֹם אַרְבָּעָה וְעֶשְׂרִים יוֹם לָעֹמֶר, שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים:",
                    "הַיּוֹם חֲמִשָּׁה וְעֶשְׂרִים יוֹם לָעֹמֶר, שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים:",
                    "הַיּוֹם שִׁשָּׁה וְעֶשְׂרִים יוֹם לָעֹמֶר, שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וַחֲמִשָּׁה יָמִים:",
                    "הַיּוֹם שִׁבְעָה וְעֶשְׂרִים יוֹם לָעֹמֶר, שֶׁהֵם שְׁלֹשָׁה שָׁבוּעוֹת וְשִׁשָּׁה יָמִים:",
                    "הַיּוֹם שְׁמוֹנָה וְעֶשְׂרִים יוֹם לָעֹמֶר, שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת:",
                    "הַיּוֹם תִּשְׁעָה וְעֶשְׂרִים יוֹם לָעֹמֶר, שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וְיוֹם אֶחָד:",
                    "הַיּוֹם שְׁלֹשִׁים יוֹם לָעֹמֶר, שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וּשְׁנֵי יָמִים:",
                    "הַיּוֹם אֶחָד וּשְׁלֹשִׁים יוֹם לָעֹמֶר, שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים:",
                    "הַיּוֹם שְׁנַיִם וּשְׁלֹשִׁים יוֹם לָעֹמֶר, שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים:",
                    "הַיּוֹם שְׁלֹשָׁה וּשְׁלֹשִׁים יוֹם לָעֹמֶר, שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וַחֲמִשָּׁה יָמִים:",
                    "הַיּוֹם אַרְבָּעָה וּשְׁלֹשִׁים יוֹם לָעֹמֶר, שֶׁהֵם אַרְבָּעָה שָׁבוּעוֹת וְשִׁשָּׁה יָמִים:",
                    "הַיּוֹם חֲמִשָּׁה וּשְׁלֹשִׁים יוֹם לָעֹמֶר, שֶׁהֵם חֲמִשָּׁה שָׁבוּעוֹת:",
                    "הַיּוֹם שִׁשָּׁה וּשְׁלֹשִׁים יוֹם לָעֹמֶר, שֶׁהֵם חֲמִשָּׁה שָׁבוּעוֹת וְיוֹם אֶחָד:",
                    "הַיּוֹם שִׁבְעָה וּשְׁלֹשִׁים יוֹם לָעֹמֶר, שֶׁהֵם חֲמִשָּׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים:",
                    "הַיּוֹם שְׁמוֹנָה וּשְׁלֹשִׁים יוֹם לָעֹמֶר, שֶׁהֵם חֲמִשָּׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים:",
                    "הַיּוֹם תִּשְׁעָה וּשְׁלֹשִׁים יוֹם לָעֹמֶר, שֶׁהֵם חֲמִשָּׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים:",
                    "הַיּוֹם אַרְבָּעִים יוֹם לָעֹמֶר, שֶׁהֵם חֲמִשָּׁה שָׁבוּעוֹת וַחֲמִשָּׁה יָמִים:",
                    "הַיּוֹם אֶחָד וְאַרְבָּעִים יוֹם לָעֹמֶר, שֶׁהֵם חֲמִשָּׁה שָׁבוּעוֹת וְשִׁשָּׁה יָמִים:",
                    "הַיּוֹם שְׁנַיִם וְאַרְבָּעִים יוֹם לָעֹמֶר, שֶׁהֵם שִׁשָּׁה שָׁבוּעוֹת:",
                    "הַיּוֹם שְׁלֹשָׁה וְאַרְבָּעִים יוֹם לָעֹמֶר, שֶׁהֵם שִׁשָּׁה שָׁבוּעוֹת וְיוֹם אֶחָד:",
                    "הַיּוֹם אַרְבָּעָה וְאַרְבָּעִים יוֹם לָעֹמֶר, שֶׁהֵם שִׁשָּׁה שָׁבוּעוֹת וּשְׁנֵי יָמִים:",
                    "הַיּוֹם חֲמִשָּׁה וְאַרְבָּעִים יוֹם לָעֹמֶר, שֶׁהֵם שִׁשָּׁה שָׁבוּעוֹת וּשְׁלֹשָׁה יָמִים:",
                    "הַיּוֹם שִׁשָּׁה וְאַרְבָּעִים יוֹם לָעֹמֶר, שֶׁהֵם שִׁשָּׁה שָׁבוּעוֹת וְאַרְבָּעָה יָמִים:",
                    "הַיּוֹם שִׁבְעָה וְאַרְבָּעִים יוֹם לָעֹמֶר, שֶׁהֵם שִׁשָּׁה שָׁבוּעוֹת וַחֲמִשָּׁה יָמִים:",
                    "הַיּוֹם שְׁמוֹנָה וְאַרְבָּעִים יוֹם לָעֹמֶר, שֶׁהֵם שִׁשָּׁה שָׁבוּעוֹת וְשִׁשָּׁה יָמִים:",
                    "הַיּוֹם תִּשְׁעָה וְאַרְבָּעִים יוֹם לָעֹמֶר, שֶׁהֵם שִׁבְעָה שָׁבוּעוֹת:"]

    @IBAction func quit(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 0
                
        stackview.translatesAutoresizingMaskIntoConstraints = false
                
        scrollview.addSubview(stackview)
        
        let beracha = "בָּרוּךְ אַתָּה יְהֹוָה, אֱלֹהֵינוּ מֶלֶךְ הָעוֹלָם, אֲשֶׁר קִדְּשָׁנוּ בְּמִצְוֹתָיו וְצִוָּנוּ עַל סְפִירַת הָעֹמֶר:";

        let firstString = beracha.appending("\n\n")
            .appending(omerList[JewishCalendar().getDayOfOmer()])
            .appending("\n\n")
            .appending("הָרַחֲמָן הוּא יַחֲזִיר עֲבוֹדַת בֵּית הַמִּקְדָּשׁ לִמְקוֹמָהּ בִּמְהֵרָה בְיָמֵֽינוּ אָמֵן:")
        
        let initialLabel = UILabel()
        initialLabel.numberOfLines = 0
        initialLabel.textAlignment = .right
        initialLabel.text = firstString
        initialLabel.font = .boldSystemFont(ofSize: 18)

        stackview.addArrangedSubview(initialLabel)
        
        let menorahImageView = UIImageView(image: UIImage(named: "menorah"))
        menorahImageView.contentMode = .scaleAspectFit // Adjust the content mode as needed
        stackview.addArrangedSubview(menorahImageView)
        
        let finalLabel = UILabel()
        finalLabel.numberOfLines = 0
        finalLabel.textAlignment = .right
        finalLabel.text = "לַמְנַצֵּ֥חַ בִּנְגִינֹ֗ת מִזְמ֥וֹר שִֽׁיר׃ אֱֽלֹהִ֗ים יְחׇנֵּ֥נוּ וִיבָרְכֵ֑נוּ יָ֤אֵֽר פָּנָ֖יו אִתָּ֣נוּ סֶֽלָה׃ לָדַ֣עַת בָּאָ֣רֶץ דַּרְכֶּ֑ךָ בְּכׇל־גּ֝וֹיִ֗ם יְשׁוּעָתֶֽךָ׃ יוֹד֖וּךָ עַמִּ֥ים ׀ אֱלֹהִ֑ים י֝וֹד֗וּךָ עַמִּ֥ים כֻּלָּֽם׃ יִ֥שְׂמְח֥וּ וִירַנְּנ֗וּ לְאֻ֫מִּ֥ים כִּֽי־תִשְׁפֹּ֣ט עַמִּ֣ים מִישֹׁ֑ר וּלְאֻמִּ֓ים ׀ בָּאָ֖רֶץ תַּנְחֵ֣ם סֶֽלָה׃ יוֹד֖וּךָ עַמִּ֥ים ׀ אֱלֹהִ֑ים י֝וֹד֗וּךָ עַמִּ֥ים כֻּלָּֽם׃ אֶ֭רֶץ נָתְנָ֣ה יְבוּלָ֑הּ יְ֝בָרְכֵ֗נוּ אֱלֹהִ֥ים אֱלֹהֵֽינוּ׃ יְבָרְכֵ֥נוּ אֱלֹהִ֑ים וְיִֽירְא֥וּ א֝וֹת֗וֹ כׇּל־אַפְסֵי־אָֽרֶץ׃  \n\n" +
        "אָֽנָּֽא בְּכֹֽחַ. גְּדוּלַת יְמִינֶֽךָ. תַּתִּיר צְרוּרָה:  (אב\"ג ית\"ץ) \n\n" +
        "קַבֵּל רִנַּת. עַמֶּֽךָ שַׂגְּבֵֽנוּ. טַהֲרֵֽנוּ נוֹרָא: (קר\"ע שט\"ן) \n\n" +
        "נָא גִבּוֹר. דּֽוֹרְשֵֽׁי יִחוּדֶֽךָ. כְּבָבַת שָׁמְרֵם: (נג\"ד יכ\"ש) \n\n" +
        "בָּֽרְכֵֽם טַהֲרֵם. רַחֲמֵי צִדְקָתֶֽךָ. תָּמִיד גָּמְלֵם: (בט\"ר צת\"ג) \n\n" +
        "חֲסִין קָדוֹשׁ. בְּרֹב טֽוּבְךָֽ. נַהֵל עֲדָתֶֽךָ: (חק\"ב טנ\"ע) \n\n" +
        "יָחִיד גֵּאֶה. לְעַמְּךָ פְנֵה. זֽוֹכְרֵֽי קְדֻשָּׁתֶֽךָ: (יג\"ל פז\"ק) \n\n" +
        "שַׁוְעָתֵֽנוּ קַבֵּל. וּשְׁמַע צַעֲקָתֵֽנוּ. יוֹדֵֽעַ תַּעֲלוּמוֹת: (שק\"ו צי\"ת) \n\n" +
        "ואומר בלחש: בָּרוּךְ שֵׁם כְּבוֹד מַלְכוּתוֹ לְעוֹלָם וָעֶד:"
        finalLabel.font = .boldSystemFont(ofSize: 18)
        
        stackview.addArrangedSubview(finalLabel)
        
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: scrollview.contentLayoutGuide.topAnchor),
            stackview.leadingAnchor.constraint(equalTo: scrollview.contentLayoutGuide.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: scrollview.contentLayoutGuide.trailingAnchor),
            stackview.bottomAnchor.constraint(equalTo: scrollview.contentLayoutGuide.bottomAnchor),
            
            stackview.widthAnchor.constraint(equalTo: scrollview.frameLayoutGuide.widthAnchor),
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
