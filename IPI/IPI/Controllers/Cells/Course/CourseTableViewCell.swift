//
//  CourseTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 17/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//
import UIKit

class CourseTableViewCell: UITableViewCell, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var btn_Aud1: UIButton!
    @IBOutlet weak var btn_Aud2: UIButton!
    @IBOutlet weak var btn_Aud3: UIButton!

    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_next: UIButton!

    @IBOutlet weak var btn_opt1: UIButton!
    @IBOutlet weak var btn_opt2: UIButton!
    @IBOutlet weak var btn_opt3: UIButton!

    @IBOutlet weak var btn_playMV: UIButton!

    @IBOutlet weak var collection_slide: UICollectionView!
	@IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var img_avatar: UIImageView!
    @IBOutlet weak var img_auxiliar: UIImageView!
    @IBOutlet weak var img_corner1: UIImageView!
    @IBOutlet weak var img_corner2: UIImageView!
    @IBOutlet weak var img_corner3: UIImageView!
    @IBOutlet weak var img_icon1: UIImageView!
    @IBOutlet weak var img_icon2: UIImageView!
    @IBOutlet weak var img_icon3: UIImageView!
    @IBOutlet weak var img_insignia: UIImageView!

    @IBOutlet weak var lbl_Aud1: UILabel!
    @IBOutlet weak var lbl_Aud2: UILabel!

    @IBOutlet weak var lbl_option1: UILabel!
    @IBOutlet weak var lbl_option2: UILabel!
    @IBOutlet weak var lbl_option3: UILabel!

    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_text1: UILabel!
    @IBOutlet weak var lbl_text2: UILabel!
    @IBOutlet weak var lbl_text3: UILabel!
    @IBOutlet weak var lbl_text4: UILabel!
    @IBOutlet weak var lbl_text5: UILabel!
    @IBOutlet weak var lbl_text6: UILabel!
    @IBOutlet weak var lbl_text7: UILabel!
    @IBOutlet weak var lbl_text8: UILabel!
    @IBOutlet weak var lbl_text9: UILabel!

    @IBOutlet weak var tf_line1_00: UITextField!; @IBOutlet weak var view_line1_00: UIView!
    @IBOutlet weak var tf_line1_01: UITextField!; @IBOutlet weak var view_line1_01: UIView!
    @IBOutlet weak var tf_line1_02: UITextField!; @IBOutlet weak var view_line1_02: UIView!
    @IBOutlet weak var tf_line1_03: UITextField!; @IBOutlet weak var view_line1_03: UIView!
    @IBOutlet weak var tf_line1_04: UITextField!; @IBOutlet weak var view_line1_04: UIView!
    @IBOutlet weak var tf_line1_05: UITextField!; @IBOutlet weak var view_line1_05: UIView!
    @IBOutlet weak var tf_line1_06: UITextField!; @IBOutlet weak var view_line1_06: UIView!
    @IBOutlet weak var tf_line1_07: UITextField!; @IBOutlet weak var view_line1_07: UIView!
    @IBOutlet weak var tf_line1_08: UITextField!; @IBOutlet weak var view_line1_08: UIView!
    @IBOutlet weak var tf_line1_09: UITextField!; @IBOutlet weak var view_line1_09: UIView!
    @IBOutlet weak var tf_line1_10: UITextField!; @IBOutlet weak var view_line1_10: UIView!
    @IBOutlet weak var tf_line1_11: UITextField!; @IBOutlet weak var view_line1_11: UIView!
    @IBOutlet weak var tf_line1_12: UITextField!; @IBOutlet weak var view_line1_12: UIView!
    @IBOutlet weak var tf_line1_13: UITextField!; @IBOutlet weak var view_line1_13: UIView!
    @IBOutlet weak var tf_line2_00: UITextField!; @IBOutlet weak var view_line2_00: UIView!
    @IBOutlet weak var tf_line2_01: UITextField!; @IBOutlet weak var view_line2_01: UIView!
    @IBOutlet weak var tf_line2_02: UITextField!; @IBOutlet weak var view_line2_02: UIView!
    @IBOutlet weak var tf_line2_03: UITextField!; @IBOutlet weak var view_line2_03: UIView!
    @IBOutlet weak var tf_line2_04: UITextField!; @IBOutlet weak var view_line2_04: UIView!
    @IBOutlet weak var tf_line2_05: UITextField!; @IBOutlet weak var view_line2_05: UIView!
    @IBOutlet weak var tf_line2_06: UITextField!; @IBOutlet weak var view_line2_06: UIView!
    @IBOutlet weak var tf_line2_07: UITextField!; @IBOutlet weak var view_line2_07: UIView!
    @IBOutlet weak var tf_line2_08: UITextField!; @IBOutlet weak var view_line2_08: UIView!
    @IBOutlet weak var tf_line2_09: UITextField!; @IBOutlet weak var view_line2_09: UIView!

    @IBOutlet weak var tbl_examples: UITableView!
    @IBOutlet weak var tbl_constraint_height: NSLayoutConstraint!

    // MARK: - Properties
    let MAX_LENGTH_CELL = 1

	// Tag for identify the options
    let TAG_OPTION_CORRECT: Int = 1
    let TAG_OPTION_WRONG:   Int = 0

    // Tag for set ponderation to the answer
    let TAG_OPTION_YES: Int = 1
    let TAG_OPTION_NOT: Int = 0
    let TAG_ANSWER_01: Int = 1
    let TAG_ANSWER_02: Int = 2
    let TAG_ANSWER_03: Int = 3
    let TAG_ANSWER_04: Int = 4
    let TAG_ANSWER_05: Int = 5

    // Tag for questionary
    let TAG_OPTION_01 = 0
    let TAG_OPTION_02 = 1
    let TAG_OPTION_03 = 2

    private let courseID: Int = 1

    var view_list: Array<UIView> = []
    var radioGroup: Array<UIButton> = []
    var radioGroup2: Array<UIButton> = []
    var textFieldToFill: Array<UITextField> = []

    var itemList: Array<SliderData> = []
    var samplesList: Array<ExampleData> = []
    var expandedSections : NSMutableSet = []

    var fill_word_answer: String = nullString
    var error_message: String = nullString
    var questionaryValue: PNPIAnswers!

    weak var courseDelegate: CourseViewControllerDelegate?
    weak var mainDelegate: MainProtocol? = AplicationRuntime.sharedManager.mainDelegate

    // MARK: - cell
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Llenado de las celdas
	func fill_CELL_01() {
        lbl_title.text = IPI_COURSE.PAGE_01.title
        lbl_text1.text = IPI_COURSE.PAGE_01.text1
        lbl_text2.text = IPI_COURSE.PAGE_01.text2
        lbl_text3.text = IPI_COURSE.PAGE_01.text3
        setButtonTitle(button: btn_next, title: Buttons.carry_on)
    }

    /** START MODULE 1 **/
    // MARK: - MODULE 1
    func fill_CELL_02() {
        lbl_text1.text = IPI_COURSE.PAGE_02.text1
        lbl_text2.text = IPI_COURSE.PAGE_02.text2
        lbl_text3.text = IPI_COURSE.PAGE_02.text3
        lbl_text4.text = IPI_COURSE.PAGE_02.text4

        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
        img_corner1.image = UIImage(named: IPI_IMAGES.corner_YELLOW)
    }

    func fill_CELL_03() {
        lbl_text1.text = IPI_COURSE.PAGE_03.text1
        lbl_text2.text = IPI_COURSE.PAGE_03.text2

        img_corner1.image = UIImage(named: IPI_IMAGES.corner_BLUE)
    }

    func fill_CELL_04() {
        lbl_text1.text = IPI_COURSE.PAGE_04.text1
        lbl_text2.text = IPI_COURSE.PAGE_04.text2
        lbl_text3.text = IPI_COURSE.PAGE_04.text3

        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
        img_corner1.image = UIImage(named: IPI_IMAGES.corner_YELLOW)
        img_auxiliar.image = UIImage(named: IPI_IMAGES.admiration)
    }

    func fill_CELL_05() {
        // Set Audio config to audio buttons
        btn_Aud1.isSelected = false
        btn_Aud2.isSelected = false

        btn_Aud1.tag = AUDIO_ID.CURSO_PTN_01.rawValue
        btn_Aud2.tag = AUDIO_ID.CURSO_PTN_02.rawValue

        btn_Aud1.setImage(UIImage(named: IPI_IMAGES.speaker_orange) , for: UIControl.State.normal)
        btn_Aud2.setImage(UIImage(named: IPI_IMAGES.speaker_orange) , for: UIControl.State.normal)

        btn_Aud1.setImage(UIImage(named: IPI_IMAGES.speaker_orange_hover) , for: UIControl.State.selected)
        btn_Aud2.setImage(UIImage(named: IPI_IMAGES.speaker_orange_hover) , for: UIControl.State.selected)

        radioGroup = [btn_Aud1, btn_Aud2]

        // Fill texts
        lbl_text1.text = IPI_COURSE.PAGE_05.text1
        lbl_text2.text = IPI_COURSE.PAGE_05.text2
        lbl_text3.text = IPI_COURSE.PAGE_05.text3
        lbl_text4.text = IPI_COURSE.PAGE_05.text4

        lbl_Aud1.text = Labels.listenAudio
        lbl_Aud2.text = Labels.listenAudio
    }

    func fill_CELL_06() {
        lbl_text1.text = IPI_COURSE.PAGE_06.text1
        lbl_text2.text = IPI_COURSE.PAGE_06.text2
        lbl_text3.text = IPI_COURSE.PAGE_06.text3
        lbl_text4.text = IPI_COURSE.PAGE_06.text4
        lbl_text5.text = IPI_COURSE.PAGE_06.text5
        lbl_text6.text = IPI_COURSE.PAGE_06.text6
        lbl_text7.text = IPI_COURSE.PAGE_06.text7
        lbl_text8.text = IPI_COURSE.PAGE_06.text8
        lbl_text9.text = IPI_COURSE.PAGE_06.text9

        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
        img_corner1.image = UIImage(named: IPI_IMAGES.corner_BLUE)
        img_corner2.image = UIImage(named: IPI_IMAGES.corner_PINK)
        img_corner3.image = UIImage(named: IPI_IMAGES.corner_YELLOW)
        img_auxiliar.image = UIImage(named: IPI_IMAGES.admiration)
    }

    func fill_CELL_07() {
        lbl_text1.text = IPI_COURSE.PAGE_07.text1
        samplesList = ExampleData().getSampleData()

        tbl_examples.tag = TABLE_SAMPLES
        tbl_examples.dataSource = self
        tbl_examples.delegate = self

        // Save Activity progress
        let courseList = AplicationRuntime.sharedManager.getAppConfig()?.course_Array
        let course = courseList?[0].course_topics?[0]

        saveActivity(activity: (course?.topic_activity_list?[0].abreviature)!, forModule: (course?.id)!)
    }

    func fill_CELL_08() {
        lbl_text1.text = IPI_COURSE.PAGE_08.text1
        lbl_text2.text = IPI_COURSE.PAGE_08.text2

        img_auxiliar.image = UIImage(named: IPI_IMAGES.infografia_M1_07)
    }

    func fill_CELL_09() {
        lbl_text1.text = IPI_COURSE.PAGE_09.text1
        lbl_text2.text = IPI_COURSE.PAGE_09.text2
        lbl_text3.text = IPI_COURSE.PAGE_09.text3
        lbl_text4.text = IPI_COURSE.PAGE_09.text4
        lbl_text5.text = IPI_COURSE.PAGE_09.text5

        img_auxiliar.image = UIImage(named: IPI_IMAGES.admiration)
        img_icon1.image = UIImage(named: IPI_IMAGES.icon_1)
        img_icon2.image = UIImage(named: IPI_IMAGES.icon_2)
        img_icon3.image = UIImage(named: IPI_IMAGES.icon_3)
    }

    func fill_CELL_10() {
        lbl_text1.text = IPI_COURSE.PAGE_10.text1
        lbl_text2.text = IPI_COURSE.PAGE_10.text2

        setButtonTitle(button: btn_next, title: Buttons.go_activity)
    }

    func fill_CELL_11() {
        lbl_text1.text = IPI_COURSE.PAGE_11.text1
        lbl_text2.text = IPI_COURSE.PAGE_11.text2

        lbl_option1.text = IPI_COURSE.PAGE_11.option1
        lbl_option2.text = IPI_COURSE.PAGE_11.option2
        lbl_option3.text = IPI_COURSE.PAGE_11.option3

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false

        btn_opt1.tag = TAG_OPTION_CORRECT
        btn_opt2.tag = TAG_OPTION_WRONG
        btn_opt3.tag = TAG_OPTION_WRONG

        setButtonImages(button: btn_opt1, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)
        setButtonImages(button: btn_opt2, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)
        setButtonImages(button: btn_opt3, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)

        radioGroup = [btn_opt1, btn_opt2, btn_opt3]
        setButtonTitle(button: btn_next, title: Buttons.next)

        img_auxiliar.image = UIImage(named: IPI_IMAGES.sheet_top)

        // SET TAP ACTION TO LABEL OPTION
        lbl_option1.tag = TAG_OPTION_01
        lbl_option2.tag = TAG_OPTION_02
        lbl_option3.tag = TAG_OPTION_03

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
    }

    func fill_CELL_12() {
        lbl_text1.text = IPI_COURSE.PAGE_12.text1

        lbl_option1.text = IPI_COURSE.PAGE_12.option1
        lbl_option2.text = IPI_COURSE.PAGE_12.option2
        lbl_option3.text = IPI_COURSE.PAGE_12.option3

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false

        btn_opt1.tag = TAG_OPTION_WRONG
        btn_opt2.tag = TAG_OPTION_WRONG
        btn_opt3.tag = TAG_OPTION_CORRECT

        setButtonImages(button: btn_opt1, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)
        setButtonImages(button: btn_opt2, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)
        setButtonImages(button: btn_opt3, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)

        radioGroup = [btn_opt1, btn_opt2, btn_opt3]
		setButtonTitle(button: btn_next, title: Buttons.next)

        img_auxiliar.image = UIImage(named: IPI_IMAGES.sheet_top)

        // SET TAP ACTION TO LABEL OPTION
        lbl_option1.tag = TAG_OPTION_01
        lbl_option2.tag = TAG_OPTION_02
        lbl_option3.tag = TAG_OPTION_03

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
    }

    func fill_CELL_13() {

        //Set labels
        lbl_text1.text = IPI_COURSE.PAGE_13.text1
        lbl_text2.text = IPI_COURSE.PAGE_13.text2

        //Set Images
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
        img_corner1.image = UIImage(named: IPI_IMAGES.corner_YELLOW)
		img_insignia.image = UIImage(named: IPI_IMAGES.achievement_module_1)

        //Set buttons
		setButtonTitle(button: btn_next, title: Buttons.end_course)
		setButtonTitle(button: btn_back, title: Buttons.come_back)
    }
	/** END MODULE 1 **/

	/** STAR MODULE 2 **/
    // MARK: - MODULE 2
    func fill_CELL_14() {
        lbl_title.text = IPI_COURSE.PAGE_14.title
        lbl_text1.text = IPI_COURSE.PAGE_14.text1

        setButtonTitle(button: btn_next, title: Buttons.carry_on)
    }

    func fill_CELL_15() {
        lbl_text1.text = IPI_COURSE.PAGE_15.text1
        lbl_text2.text = IPI_COURSE.PAGE_15.text2

        img_auxiliar.image = UIImage(named: IPI_IMAGES.slider_logo)

        itemList = SliderData().getSliderData()

        collection_slide.delegate = self
        collection_slide.dataSource = self
    }

    func fill_CELL_16() {
        lbl_text1.text = IPI_COURSE.PAGE_16.text1
        lbl_text2.text = IPI_COURSE.PAGE_16.text2

        setButtonImages(button: btn_playMV, normal: IPI_IMAGES.btn_play, hover: IPI_IMAGES.btn_play_hover)

        // Save Activity progress
        let courseList = AplicationRuntime.sharedManager.getAppConfig()?.course_Array
        let course = courseList?[0].course_topics?[1]

        saveActivity(activity: (course?.topic_activity_list?[0].abreviature)!, forModule: (course?.id)!)
    }

    func fill_CELL_17() {
        lbl_text1.text = IPI_COURSE.PAGE_17.text1
        lbl_text2.text = IPI_COURSE.PAGE_17.text2
        lbl_text3.text = IPI_COURSE.PAGE_17.text3
        lbl_text4.text = IPI_COURSE.PAGE_17.text4
        lbl_text5.text = IPI_COURSE.PAGE_17.text5

        img_icon1.image = UIImage(named: IPI_IMAGES.icon_1)
        img_icon2.image = UIImage(named: IPI_IMAGES.icon_2)
        img_icon3.image = UIImage(named: IPI_IMAGES.icon_3)
    }

    func fill_CELL_18() {
        lbl_text1.text = IPI_COURSE.PAGE_18.text1
        lbl_text2.text = IPI_COURSE.PAGE_18.text2

        setButtonTitle(button: btn_next, title: Buttons.go_activity)

        // Save Activity progress
        let courseList = AplicationRuntime.sharedManager.getAppConfig()?.course_Array
        let course = courseList?[0].course_topics?[1]

        saveActivity(activity: (course?.topic_activity_list?[1].abreviature)!, forModule: (course?.id)!)
    }

    func fill_CELL_19() {
        //Load Lables
        lbl_text1.text = IPI_COURSE.PAGE_19.text1
        lbl_text2.text = IPI_COURSE.PAGE_19.text2

        //Load Answer
        fill_word_answer = IPI_COURSE.PAGE_19.ANSWER
        error_message = IPI_COURSE.PAGE_19.ERROR

        //Config TextField - View Backgrounds
        tf_line1_01.tag = 1; view_line1_01.tag = 1
        tf_line1_02.tag = 2; view_line1_02.tag = 2
        tf_line1_07.tag = 7; view_line1_07.tag = 7

        tf_line2_00.tag = 8; view_line2_00.tag = 8
        tf_line2_03.tag = 11; view_line2_03.tag = 11
        tf_line2_05.tag = 13; view_line2_05.tag = 13

        //Set clues
        tf_line1_00.text = "A"; tf_line1_00.isEnabled = false
        tf_line1_03.text = "L"; tf_line1_03.isEnabled = false
        tf_line1_04.text = "O"; tf_line1_04.isEnabled = false
        tf_line1_05.text = " "; tf_line1_05.isEnabled = false
        tf_line1_06.text = "D"; tf_line1_06.isEnabled = false
        tf_line2_01.text = "A"; tf_line2_01.isEnabled = false
        tf_line2_02.text = "L"; tf_line2_02.isEnabled = false
        tf_line2_04.text = "D"; tf_line2_04.isEnabled = false
        tf_line2_06.text = "D"; tf_line2_06.isEnabled = false

        //Set Delegate
        tf_line1_00.delegate = self; tf_line2_00.delegate = self
        tf_line1_01.delegate = self; tf_line2_01.delegate = self
        tf_line1_02.delegate = self; tf_line2_02.delegate = self
        tf_line1_03.delegate = self; tf_line2_03.delegate = self
        tf_line1_04.delegate = self; tf_line2_04.delegate = self
        tf_line1_05.delegate = self; tf_line2_05.delegate = self
        tf_line1_06.delegate = self; tf_line2_06.delegate = self
        tf_line1_07.delegate = self;

        //TextField Arrays
        textFieldToFill = [tf_line1_01, tf_line1_02, tf_line1_07, tf_line2_00, tf_line2_03, tf_line2_05]

        //view Arrays
        view_list = [view_line1_01, view_line1_02, view_line1_07, view_line2_00, view_line2_03, view_line2_05]
    }

    func fill_CELL_20() {
        //Load Lables
        lbl_text1.text = IPI_COURSE.PAGE_20.text1
        lbl_text2.text = IPI_COURSE.PAGE_20.text2

        //Load Answer
        fill_word_answer = IPI_COURSE.PAGE_20.ANSWER
        error_message = IPI_COURSE.PAGE_20.ERROR

        //Config TextField - View Backgrounds
        tf_line1_02.tag = 2; view_line1_02.tag = 2
        tf_line1_06.tag = 6; view_line1_06.tag = 6
        tf_line1_09.tag = 9; view_line1_07.tag = 9
        tf_line1_11.tag = 11; view_line1_07.tag = 11

        tf_line2_00.tag = 12; view_line2_00.tag = 12
        tf_line2_04.tag = 16; view_line2_04.tag = 16
        tf_line2_08.tag = 20; view_line2_08.tag = 20

        //Set clues
        tf_line1_00.text = "R"; tf_line1_00.isEnabled = false
        tf_line1_01.text = "E"; tf_line1_01.isEnabled = false
        tf_line1_03.text = "A"; tf_line1_03.isEnabled = false
        tf_line1_04.text = "T"; tf_line1_04.isEnabled = false
        tf_line1_05.text = "R"; tf_line1_05.isEnabled = false
        tf_line1_07.text = "A"; tf_line1_07.isEnabled = false
        tf_line1_08.text = "C"; tf_line1_08.isEnabled = false
        tf_line1_10.text = "O"; tf_line1_10.isEnabled = false

        tf_line2_01.text = "O"; tf_line2_01.isEnabled = false
        tf_line2_02.text = "L"; tf_line2_02.isEnabled = false
        tf_line2_03.text = "U"; tf_line2_03.isEnabled = false
        tf_line2_05.text = "T"; tf_line2_05.isEnabled = false
        tf_line2_06.text = "A"; tf_line2_06.isEnabled = false
        tf_line2_07.text = "R"; tf_line2_07.isEnabled = false
        tf_line2_09.text = "A"; tf_line2_09.isEnabled = false

        //Set Delegate
        tf_line1_02.delegate = self; tf_line2_00.delegate = self
        tf_line1_06.delegate = self; tf_line2_04.delegate = self
        tf_line1_09.delegate = self; tf_line2_08.delegate = self
        tf_line1_11.delegate = self

        //TextField Arrays
        textFieldToFill = [tf_line1_02, tf_line1_06, tf_line1_09, tf_line1_11, tf_line2_00, tf_line2_04, tf_line2_08]

        //view Arrays
        view_list = [view_line1_02, view_line1_06, view_line1_09, view_line1_11, view_line2_00, view_line2_04, view_line2_08]
    }

    func fill_CELL_21() {
        //Load Lables
        lbl_text1.text = IPI_COURSE.PAGE_21.text1
        lbl_text2.text = IPI_COURSE.PAGE_21.text2

        //Load Answer
        fill_word_answer = IPI_COURSE.PAGE_21.ANSWER
        error_message = IPI_COURSE.PAGE_21.ERROR

        //Config TextField - View Backgrounds
        tf_line1_01.tag = 1; view_line1_01.tag = 1
        tf_line1_02.tag = 2; view_line1_02.tag = 2
        tf_line1_05.tag = 5; view_line1_05.tag = 5
        tf_line1_06.tag = 6; view_line1_06.tag = 6

        tf_line2_01.tag = 10; view_line2_01.tag = 10
        tf_line2_02.tag = 11; view_line2_02.tag = 11
        tf_line2_04.tag = 13; view_line2_04.tag = 13
        tf_line2_06.tag = 15; view_line2_06.tag = 15

        //Set clues
        tf_line1_00.text = "F"; tf_line1_00.isEnabled = false
        tf_line1_03.text = "N"; tf_line1_03.isEnabled = false
        tf_line1_04.text = "T"; tf_line1_04.isEnabled = false
        tf_line1_07.text = "A"; tf_line1_07.isEnabled = false
        tf_line1_08.text = "S"; tf_line1_08.isEnabled = false

        tf_line2_00.text = "S"; tf_line2_00.isEnabled = false
        tf_line2_03.text = "I"; tf_line2_03.isEnabled = false
        tf_line2_05.text = "A"; tf_line2_05.isEnabled = false
        tf_line2_07.text = "I"; tf_line2_07.isEnabled = false
        tf_line2_08.text = "A"; tf_line2_08.isEnabled = false
        tf_line2_09.text = "S"; tf_line2_09.isEnabled = false

        //Set Delegate
        tf_line1_01.delegate = self; tf_line2_01.delegate = self
        tf_line1_02.delegate = self; tf_line2_02.delegate = self
        tf_line1_05.delegate = self; tf_line2_04.delegate = self
        tf_line1_06.delegate = self; tf_line2_06.delegate = self

        //TextField Arrays
        textFieldToFill = [tf_line1_01, tf_line1_02, tf_line1_05, tf_line1_06,
                           tf_line2_01, tf_line2_02, tf_line2_04, tf_line2_06]

        //view Arrays
        view_list = [view_line1_01, view_line1_02, view_line1_05, view_line1_06,
                     view_line2_01, view_line2_02, view_line2_04, view_line2_06]
    }

    func fill_CELL_22() {
        //Load Lables
        lbl_text1.text = IPI_COURSE.PAGE_22.text1
        lbl_text2.text = IPI_COURSE.PAGE_22.text2

        //Load Answer
        fill_word_answer = IPI_COURSE.PAGE_22.ANSWER
        error_message = IPI_COURSE.PAGE_22.ERROR

        //Config TextField - View Backgrounds
        tf_line1_02.tag = 2; view_line1_02.tag = 2
        tf_line1_05.tag = 5; view_line1_05.tag = 5
        tf_line1_06.tag = 6; view_line1_06.tag = 6
        tf_line1_07.tag = 7; view_line1_07.tag = 7
        tf_line1_09.tag = 9; view_line1_09.tag = 9
        tf_line1_12.tag = 12; view_line1_12.tag = 12
        tf_line1_13.tag = 13; view_line1_13.tag = 13

        tf_line2_01.tag = 15; view_line2_01.tag = 15
        tf_line2_03.tag = 17; view_line2_03.tag = 17
        tf_line2_05.tag = 19; view_line2_05.tag = 19
        tf_line2_07.tag = 21; view_line2_07.tag = 21
        tf_line2_08.tag = 22; view_line2_08.tag = 22

        //Set clues
        tf_line1_00.text = "R"; tf_line1_00.isEnabled = false
        tf_line1_01.text = "E"; tf_line1_01.isEnabled = false
        tf_line1_03.text = "S"; tf_line1_03.isEnabled = false
        tf_line1_04.text = "E"; tf_line1_04.isEnabled = false
        tf_line1_08.text = "M"; tf_line1_08.isEnabled = false
        tf_line1_10.text = "E"; tf_line1_10.isEnabled = false
        tf_line1_11.text = "N"; tf_line1_11.isEnabled = false

        tf_line2_00.text = "S"; tf_line2_00.isEnabled = false
        tf_line2_02.text = "L"; tf_line2_02.isEnabled = false
        tf_line2_04.text = "D"; tf_line2_04.isEnabled = false
        tf_line2_06.text = "R"; tf_line2_06.isEnabled = false

        //Set Delegate
        tf_line1_02.delegate = self; tf_line2_01.delegate = self
        tf_line1_05.delegate = self; tf_line2_03.delegate = self
        tf_line1_06.delegate = self; tf_line2_05.delegate = self
        tf_line1_07.delegate = self; tf_line2_07.delegate = self
        tf_line1_09.delegate = self; tf_line2_08.delegate = self
        tf_line1_12.delegate = self
        tf_line1_13.delegate = self

        //TextField Arrays
        textFieldToFill = [tf_line1_02, tf_line1_05, tf_line1_06, tf_line1_07, tf_line1_09, tf_line1_12, tf_line1_13,
                           tf_line2_01, tf_line2_03, tf_line2_05, tf_line1_07, tf_line2_08]

        //view Arrays
        view_list = [view_line1_02, view_line1_05, view_line1_06, view_line1_07, view_line1_09, view_line1_12, view_line1_13,
                     view_line2_01, view_line2_03, view_line2_05, view_line1_07, view_line2_08]
    }

    func fill_CELL_23() {
        //Load Lables
        lbl_text1.text = IPI_COURSE.PAGE_23.text1
        lbl_text2.text = IPI_COURSE.PAGE_23.text2

        //Load Answer
        fill_word_answer = IPI_COURSE.PAGE_23.ANSWER
        error_message = IPI_COURSE.PAGE_23.ERROR

        //Config TextField - View Backgrounds
        tf_line1_00.tag = 0; view_line1_00.tag = 0
        tf_line1_04.tag = 4; view_line1_04.tag = 4
        tf_line1_06.tag = 6; view_line1_06.tag = 6
        tf_line1_07.tag = 7; view_line1_07.tag = 7
        tf_line1_08.tag = 8; view_line1_08.tag = 8

        tf_line2_02.tag = 13; view_line2_02.tag = 13
        tf_line2_03.tag = 14; view_line2_03.tag = 14

        //Set clues
        tf_line1_01.text = "N"; tf_line1_01.isEnabled = false
        tf_line1_02.text = "T"; tf_line1_02.isEnabled = false
        tf_line1_03.text = "E"; tf_line1_03.isEnabled = false
        tf_line1_05.text = "R"; tf_line1_05.isEnabled = false
        tf_line1_09.text = "O"; tf_line1_09.isEnabled = false
        tf_line1_10.text = "N"; tf_line1_10.isEnabled = false

        tf_line2_00.text = "L"; tf_line2_00.isEnabled = false
        tf_line2_01.text = "O"; tf_line2_01.isEnabled = false
        tf_line2_04.text = "L"; tf_line2_04.isEnabled = false

        //Set Delegate
        tf_line1_00.delegate = self; tf_line2_02.delegate = self
        tf_line1_04.delegate = self; tf_line2_03.delegate = self
        tf_line1_06.delegate = self;
        tf_line1_07.delegate = self;
        tf_line1_08.delegate = self;

        //TextField Arrays
        textFieldToFill = [tf_line1_00, tf_line1_04, tf_line1_06, tf_line1_07, tf_line1_08,
                           tf_line2_02, tf_line2_03]

        //view Arrays
        view_list = [view_line1_00, view_line1_04, view_line1_06, view_line1_07, view_line1_08,
                     view_line2_02, view_line2_03]
    }

    func fill_CELL_24() {
        //Load Lables
        lbl_text1.text = IPI_COURSE.PAGE_24.text1
        lbl_text2.text = IPI_COURSE.PAGE_24.text2

        //Load Answer
        fill_word_answer = IPI_COURSE.PAGE_24.ANSWER
        error_message = IPI_COURSE.PAGE_24.ERROR

        //Config TextField - View Backgrounds
        tf_line1_00.tag = 0; view_line1_00.tag = 0
        tf_line1_04.tag = 4; view_line1_04.tag = 4
        tf_line1_06.tag = 6; view_line1_06.tag = 6
        tf_line1_08.tag = 8; view_line1_08.tag = 8

        tf_line2_00.tag = 9; view_line2_00.tag = 9
        tf_line2_02.tag = 11; view_line2_02.tag = 11
        tf_line2_06.tag = 15; view_line2_06.tag = 15

        //Set clues
        tf_line1_01.text = "O"; tf_line1_01.isEnabled = false
        tf_line1_02.text = "V"; tf_line1_02.isEnabled = false
        tf_line1_03.text = "I"; tf_line1_03.isEnabled = false
        tf_line1_05.text = "I"; tf_line1_05.isEnabled = false
        tf_line1_07.text = "A"; tf_line1_07.isEnabled = false

        tf_line2_01.text = "A"; tf_line2_01.isEnabled = false
        tf_line2_03.text = "O"; tf_line2_03.isEnabled = false
        tf_line2_04.text = "R"; tf_line2_04.isEnabled = false
        tf_line2_05.text = "A"; tf_line2_05.isEnabled = false

        //Set Delegate
        tf_line1_00.delegate = self; tf_line2_00.delegate = self
        tf_line1_04.delegate = self; tf_line2_02.delegate = self
        tf_line1_06.delegate = self; tf_line2_06.delegate = self
        tf_line1_08.delegate = self;

        //TextField Arrays
        textFieldToFill = [tf_line1_00, tf_line1_04, tf_line1_06, tf_line1_08,
                           tf_line2_00, tf_line2_02, tf_line2_06]

        //view Arrays
        view_list = [view_line1_00, view_line1_04, view_line1_06, view_line1_08,
                     view_line2_00, view_line2_02, view_line2_06]
    }

    func fill_CELL_25() {

        //Set labels
        lbl_text1.text = IPI_COURSE.PAGE_25.text1
        lbl_text2.text = IPI_COURSE.PAGE_25.text2

        //Set Images
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
        img_corner1.image = UIImage(named: IPI_IMAGES.corner_YELLOW)
        img_insignia.image = UIImage(named: IPI_IMAGES.achievement_module_2)

        //Set buttons
        setButtonTitle(button: btn_next, title: Buttons.end_course)
        setButtonTitle(button: btn_back, title: Buttons.come_back)

        // Save Activity progress
        let courseList = AplicationRuntime.sharedManager.getAppConfig()?.course_Array
        let course = courseList?[0].course_topics?[1]

        saveActivity(activity: (course?.topic_activity_list?[2].abreviature)!, forModule: (course?.id)!)
    }
    /** END MODULE 2 **/

    // MARK: MODULE 3
    func fill_CELL_26() {
        lbl_text1.text = IPI_COURSE.PAGE_26.text1
        lbl_text2.text = IPI_COURSE.PAGE_26.text2

        setButtonTitle(button: btn_next, title: Buttons.carry_on)
    }

    func fill_CELL_27() {
        //Get amount of questionary
        questionaryValue = AplicationRuntime.sharedManager.getAnswersValue()
        let progressValue = questionaryValue.getPNPIPorcentage()

        // Fill view
        lbl_text1.text = IPI_COURSE.PAGE_27.text1
        lbl_text2.text = IPI_COURSE.PAGE_27.text2

        lbl_option1.text = IPI_COURSE.OPTION_YES
        lbl_option2.text = IPI_COURSE.OPTION_NOT

        btn_next.tag = TAG_ANSWER_01
        btn_opt1.isSelected = false; btn_opt1.tag = TAG_OPTION_YES
        btn_opt2.isSelected = false; btn_opt2.tag = TAG_OPTION_NOT

        setButtonTitle(button: btn_next, title: Buttons.next)
        setButtonImages(button: btn_opt1, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)
        setButtonImages(button: btn_opt2, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)

        radioGroup = [btn_opt1, btn_opt2]

        img_auxiliar.image = UIImage(named: IPI_IMAGES.sheet_top)
        img_icon1.image = UIImage(named: IPI_IMAGES.icon_1)

        //Custome Progress bar
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = (progressBar.frame.height / 2)
        progressBar.transform = CGAffineTransform(scaleX: 1, y: 5)
        progressBar.setProgress(progressValue, animated: false)

        // SET TAP ACTION TO LABEL OPTION
        lbl_option1.tag = TAG_OPTION_YES
        lbl_option2.tag = TAG_OPTION_NOT

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
    }

    func fill_CELL_28() {
        //Get amount of questionary
        questionaryValue = AplicationRuntime.sharedManager.getAnswersValue()
        let progress = questionaryValue.getPNPIPorcentage()

        // Fill view
        lbl_text1.text = IPI_COURSE.PAGE_28.text1
        lbl_text2.text = IPI_COURSE.PAGE_28.text2
        lbl_text3.text = IPI_COURSE.PAGE_28.text3
        lbl_text4.text = IPI_COURSE.PAGE_28.text4
        lbl_text5.text = IPI_COURSE.PAGE_28.text5

        // Config Check
        lbl_option1.text = IPI_COURSE.OPTION_YES
        lbl_option2.text = IPI_COURSE.OPTION_NOT

        btn_next.tag = TAG_ANSWER_02
        btn_opt1.isSelected = false; btn_opt1.tag = TAG_OPTION_YES
        btn_opt2.isSelected = false; btn_opt2.tag = TAG_OPTION_NOT

        setButtonTitle(button: btn_next, title: Buttons.next)
        setButtonImages(button: btn_opt1, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)
        setButtonImages(button: btn_opt2, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)

        radioGroup = [btn_opt1, btn_opt2]

        img_auxiliar.image = UIImage(named: IPI_IMAGES.sheet_top)
        img_icon1.image = UIImage(named: IPI_IMAGES.icon_2)

        //Custome Progress bar
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = (progressBar.frame.height / 2)
        progressBar.transform = CGAffineTransform(scaleX: 1, y: 5)
        progressBar.setProgress(progress, animated: false)

        // SET TAP ACTION TO LABEL OPTION
        lbl_option1.tag = TAG_OPTION_YES
        lbl_option2.tag = TAG_OPTION_NOT

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        // Set Audio config to audio buttons
        btn_Aud1.isSelected = false
        btn_Aud2.isSelected = false
        btn_Aud3.isSelected = false

        btn_Aud1.tag = AUDIO_ID.CURSO_PTN_03.rawValue
        btn_Aud2.tag = AUDIO_ID.CURSO_PTN_04.rawValue
        btn_Aud3.tag = AUDIO_ID.CURSO_PTN_05.rawValue

        setButtonImages(button: btn_Aud1, normal: IPI_IMAGES.speaker_orange, hover: IPI_IMAGES.speaker_orange_hover)
        setButtonImages(button: btn_Aud2, normal: IPI_IMAGES.speaker_orange, hover: IPI_IMAGES.speaker_orange_hover)
        setButtonImages(button: btn_Aud3, normal: IPI_IMAGES.speaker_orange, hover: IPI_IMAGES.speaker_orange_hover)

        radioGroup2 = [btn_Aud1, btn_Aud2, btn_Aud3]
    }

    func fill_CELL_29() {
        // Save Activity progress
        let courseList = AplicationRuntime.sharedManager.getAppConfig()?.course_Array
        let course = courseList?[0].course_topics?[2]

        saveActivity(activity: (course?.topic_activity_list?[0].abreviature)!, forModule: (course?.id)!)

        //Get amount of questionary
        questionaryValue = AplicationRuntime.sharedManager.getAnswersValue()
        let progress = questionaryValue.getPNPIPorcentage()

        // Fill view
        lbl_text1.text = IPI_COURSE.PAGE_29.text1
        lbl_text2.text = IPI_COURSE.PAGE_29.text2

        // Config Check
        lbl_option1.text = IPI_COURSE.OPTION_YES
        lbl_option2.text = IPI_COURSE.OPTION_NOT

        btn_next.tag = TAG_ANSWER_03
        btn_opt1.isSelected = false; btn_opt1.tag = TAG_OPTION_YES
        btn_opt2.isSelected = false; btn_opt2.tag = TAG_OPTION_NOT

        setButtonTitle(button: btn_next, title: Buttons.next)
        setButtonImages(button: btn_opt1, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)
        setButtonImages(button: btn_opt2, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)

        radioGroup = [btn_opt1, btn_opt2]

        img_auxiliar.image = UIImage(named: IPI_IMAGES.sheet_top)
        img_icon1.image = UIImage(named: IPI_IMAGES.icon_3)

        //Custome Progress bar
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = (progressBar.frame.height / 2)
        progressBar.transform = CGAffineTransform(scaleX: 1, y: 5)
        progressBar.setProgress(progress, animated: false)

        // SET TAP ACTION TO LABEL OPTION
        lbl_option1.tag = TAG_OPTION_YES
        lbl_option2.tag = TAG_OPTION_NOT

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        // Set expandable table view
        samplesList = ExampleData().getInfoData()

        tbl_examples.tag = TABLE_SAMPLES
        tbl_examples.dataSource = self
        tbl_examples.delegate = self
    }

    func fill_CELL_30() {
        //Get amount of questionary
        questionaryValue = AplicationRuntime.sharedManager.getAnswersValue()
        let progress = questionaryValue.getPNPIPorcentage()

        // Fill view
        lbl_text1.text = IPI_COURSE.PAGE_30.text1
        lbl_text2.text = IPI_COURSE.PAGE_30.text2
        lbl_text3.text = IPI_COURSE.PAGE_30.text3
        lbl_text4.text = IPI_COURSE.PAGE_30.text4
        lbl_text5.text = IPI_COURSE.PAGE_30.text5

        // Config Check
        lbl_option1.text = IPI_COURSE.OPTION_YES
        lbl_option2.text = IPI_COURSE.OPTION_NOT

        btn_next.tag = TAG_ANSWER_04
        btn_opt1.isSelected = false; btn_opt1.tag = TAG_OPTION_YES
        btn_opt2.isSelected = false; btn_opt2.tag = TAG_OPTION_NOT

        setButtonTitle(button: btn_next, title: Buttons.next)
        setButtonImages(button: btn_opt1, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)
        setButtonImages(button: btn_opt2, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)

        radioGroup = [btn_opt1, btn_opt2]

        img_auxiliar.image = UIImage(named: IPI_IMAGES.sheet_top)
        img_icon1.image = UIImage(named: IPI_IMAGES.icon_4)
        img_icon2.image = UIImage(named: IPI_IMAGES.success_orange)
        img_icon3.image = UIImage(named: IPI_IMAGES.success_orange)

        //Custome Progress bar
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = (progressBar.frame.height / 2)
        progressBar.transform = CGAffineTransform(scaleX: 1, y: 5)
        progressBar.setProgress(progress, animated: false)

        // SET TAP ACTION TO LABEL OPTION
        lbl_option1.tag = TAG_OPTION_YES
        lbl_option2.tag = TAG_OPTION_NOT

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
    }

    func fill_CELL_31() {
        // Save Activity progress
        let courseList = AplicationRuntime.sharedManager.getAppConfig()?.course_Array
        let course = courseList?[0].course_topics?[2]

        saveActivity(activity: (course?.topic_activity_list?[1].abreviature)!, forModule: (course?.id)!)

        //Get amount of questionary
        questionaryValue = AplicationRuntime.sharedManager.getAnswersValue()
        let progress = questionaryValue.getPNPIPorcentage()

        // Fill view
        lbl_text1.text = IPI_COURSE.PAGE_31.text1
        lbl_text2.text = IPI_COURSE.PAGE_31.text2
        lbl_text3.text = IPI_COURSE.PAGE_31.text3
        lbl_text4.text = IPI_COURSE.PAGE_31.text4
        lbl_text5.text = IPI_COURSE.PAGE_31.text5

        // Config Check
        lbl_option1.text = IPI_COURSE.OPTION_YES
        lbl_option2.text = IPI_COURSE.OPTION_NOT

        btn_next.tag = TAG_ANSWER_05
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false

        setButtonTitle(button: btn_next, title: Buttons.next)
        setButtonImages(button: btn_opt1, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)
        setButtonImages(button: btn_opt2, normal: IPI_IMAGES.check, hover: IPI_IMAGES.check_hover)

        radioGroup = [btn_opt1, btn_opt2]

        img_auxiliar.image = UIImage(named: IPI_IMAGES.sheet_top)
        img_icon1.image = UIImage(named: IPI_IMAGES.icon_5)

        //Custome Progress bar
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = (progressBar.frame.height / 2)
        progressBar.transform = CGAffineTransform(scaleX: 1, y: 5)
        progressBar.setProgress(progress, animated: false)

        // SET TAP ACTION TO LABEL OPTION
        lbl_option1.tag = TAG_OPTION_YES; btn_opt1.tag = TAG_OPTION_YES
        lbl_option2.tag = TAG_OPTION_NOT; btn_opt2.tag = TAG_OPTION_NOT

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        // Set Audio config to audio buttons
        btn_Aud1.isSelected = false
        btn_Aud2.isSelected = false
        btn_Aud3.isSelected = false

        btn_Aud1.tag = AUDIO_ID.CURSO_PTN_06.rawValue
        btn_Aud2.tag = AUDIO_ID.CURSO_PTN_07.rawValue
        btn_Aud3.tag = AUDIO_ID.CURSO_PTN_08.rawValue

        setButtonImages(button: btn_Aud1, normal: IPI_IMAGES.speaker_orange, hover: IPI_IMAGES.speaker_orange_hover)
        setButtonImages(button: btn_Aud2, normal: IPI_IMAGES.speaker_orange, hover: IPI_IMAGES.speaker_orange_hover)
        setButtonImages(button: btn_Aud3, normal: IPI_IMAGES.speaker_orange, hover: IPI_IMAGES.speaker_orange_hover)

        radioGroup2 = [btn_Aud1, btn_Aud2, btn_Aud3]
    }

    func fill_CELL_32() {
        // Save Activity progress
        let courseList = AplicationRuntime.sharedManager.getAppConfig()?.course_Array
        let course = courseList?[0].course_topics?[2]

        saveActivity(activity: (course?.topic_activity_list?[2].abreviature)!, forModule: (course?.id)!)

        //Get amount of questionary
        questionaryValue = AplicationRuntime.sharedManager.getAnswersValue()
        let progress = questionaryValue.getPNPIPorcentage()

        // Fill view

        //Set labels
        lbl_text1.text = progress >= 0.8 ? IPI_COURSE.PAGE_32.text_1Y : IPI_COURSE.PAGE_32.text_1N
        lbl_text2.text = progress >= 0.8 ? IPI_COURSE.PAGE_32.text_2Y : IPI_COURSE.PAGE_32.text_2N
        lbl_text3.text = IPI_COURSE.PAGE_32.text3

        //Set Images
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
        img_corner1.image = UIImage(named: IPI_IMAGES.corner_YELLOW)
        img_auxiliar.image = UIImage(named: IPI_IMAGES.admiration)
    }

    func fill_CELL_33() {
        //Set labels
        lbl_text1.text = IPI_COURSE.PAGE_33.text1
        lbl_text2.text = IPI_COURSE.PAGE_33.text2

        //Set Images
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
        img_corner1.image = UIImage(named: IPI_IMAGES.corner_YELLOW)
        img_insignia.image = UIImage(named: IPI_IMAGES.achievement_module_3)

        //Set buttons
        setButtonTitle(button: btn_next, title: Buttons.end_course)
        setButtonTitle(button: btn_back, title: Buttons.come_back)
    }
    /** END MODULE 3 **/

    // MARK: - User Interface
    /// Update child and parent UI
    private func updateUI() {
        tbl_examples.reloadData()
        courseDelegate?.reloadTable()
    }

    // MARK: - Expandable tableview functions
    /// Determina la sección de la tabla que fue seleccionada para mostrar el contenido
    @objc func tapSection(sender: UITapGestureRecognizer) {
        
        let sectionTapped = sender.view!
        let section = sectionTapped.tag
        
        let shouldExpand = !expandedSections.contains(section)
        
        if (shouldExpand) {
            expandedSections.removeAllObjects()
            expandedSections.add(section)
        } else {
            expandedSections.removeAllObjects()
        }
        
        updateUI()
    }
    

    // MARK: - Table view Delegate and Datasource
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return samplesList.count
    }

    // Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandedSections.contains(section) ? 1 : 0
    }

    // MARK: Header properties
    // Propiedad para ajustar el tamaño del encabezado al contenido
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    // Tamaño estimado del encabezado
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 62
    }

    // Encabezado de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.header.rawValue) as? CourseHeaderTableViewCell

        cell?.headerTitle = samplesList[section].header
        cell?.fill_header(forTable: tableView.tag)
        
        cell?.btn_openClose.tag = section
        cell?.tag = section
        
        // Add Gesture for expand list
        let tapButton = UITapGestureRecognizer(target: self, action: #selector(self.tapSection))
        cell?.btn_openClose.addGestureRecognizer(tapButton)

        let tapHeader = UITapGestureRecognizer(target: self, action: #selector(self.tapSection))
        cell?.addGestureRecognizer(tapHeader)

        // Update Button state
        cell?.btn_openClose.isSelected = expandedSections.contains(section)

        return cell
    }

    // MARK: Footer properties
    // Se agrega la propiedad para ajustar el tamaño del pie de página al contenido
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    // Tamaño estimado del pie de página
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 58
    }

    // Draw Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.footer.rawValue) as! CourseFooterTableViewCell
        return cell
    }

    // Draw body
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.body.rawValue) as! CourseBodyTableViewCell

        cell.lbl_text.text = samplesList[indexPath.section].body[indexPath.row]

        return cell
    }

    // MARK: - Collection view DataSource and FlowLayout Dategate
    // Set number of section in the colection
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    //number of the items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }

    //fill collection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        self.pageControl.currentPage = indexPath.row

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID.courseSlider.rawValue, for: indexPath) as! CourseSliderCollectionViewCell

        cell.lbl_title.text = itemList[indexPath.row].title
        cell.lbl_message.text = itemList[indexPath.row].message

        return cell
    }

    // MARK: - Navigation actions
    @IBAction func previousPage(_ sender: UIButton) {
        courseDelegate?.previusPage()
    }

    @IBAction func nextPage(_ sender: UIButton?) {
        courseDelegate?.nextPage()
    }

    // MARK: - update buttons states
    @objc func tapLabel(sender: UITapGestureRecognizer) {

        let labelTapped = sender.view!
        let labelTag = labelTapped.tag
        let buttonToChange = radioGroup[labelTag]
        buttonToChange.isSelected = !buttonToChange.isSelected

        updateButtonsState(sender: buttonToChange)
    }

    // Update selected option in radioGroup
    @IBAction func updateRadioGroup(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        updateButtonsState(sender: sender)
    }

    // Cambia el estado del boton que este reproduciendo el audio y actualiza los demás
    private func updateButtonsState(sender: UIButton) {

        // Select between checkbox and audios when is required
        let radioButtons = sender.tag < AUDIO_ID.CURSO_PTN_03.rawValue ? radioGroup : radioGroup2

        if sender.isSelected {
            for button in radioButtons {
                if button != sender {
                    button.isSelected = false
                }
            }
        }
    }

    // MARK: - Audio Functions
    @IBAction func playAudio(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        courseDelegate?.audioManager(audioID: sender.tag, play: sender.isSelected)
        updateButtonsState(sender: sender)
    }

    // MARK: - TextField Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Cambia el foco a la siguente celda, cuando hay un caracter
        if textField.text!.count == MAX_LENGTH_CELL {
            if let nextField = getNextTextField(forTextField: textField.tag) {
                nextField.becomeFirstResponder()
            }
            else {
                if textField.returnKeyType == UIReturnKeyType.send {
                    if checkFillWord() {
                        courseDelegate?.showMessagePopup(message: IPI_COURSE.SUCCEED_ANSWER, inbold: nil, type: .success)
                    }
                }
                textField.resignFirstResponder()
            }
        }

        return true
    }

    // Método para realizar desde el botón 'Return' del keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == UIReturnKeyType.send {
            if checkFillWord() {
                courseDelegate?.showMessagePopup(message: IPI_COURSE.SUCCEED_ANSWER, inbold: nil, type: .success)
            }
            else {
//                courseDelegate?.showMessagePopup(message: error_message, inbold: nil, type: .failed)

            }
        }
        textField.resignFirstResponder()
        return false
    }

    // Limpia la cailla cuando se empieza a editar
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = nil
    }

    /**
     Determina cual es la celda siguiente a la que se debe cambiar el foco
     de acuerdo a la celda actual, si no existe celda siguinete, retorna NIL

     - Parameter forTexfield: Id del textField actual
     */
    private func getNextTextField(forTextField tag: Int) -> UITextField! {

        let nextTF: UITextField! = nil

//        if textFieldToFill.count > 0 {
//
//            for i in 0 ..< (textFieldToFill.count - 1){
//                printDebugMessage(tag: "TL[\(i)].tag \(textFieldToFill[i].tag) =? \(tag)")
//                if textFieldToFill[i].tag == tag {
//                    printDebugMessage(tag: "return \(textFieldToFill[i + 1].tag)")
//                    nextTF = textFieldToFill[i + 1]
//                    break
//                }
//            }
//        }

        return nextTF
    }

    // MARK: - Save Activities completed
    private func saveActivity(activity name: String, forModule id: Int) {

        //Obtiene la fecha actual
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = DateTimeFormat.formatInMillis

        // save Activity complete
        let actCompleted:ActityCompleted = ActityCompleted()
        actCompleted.courseID = courseID
        actCompleted.topicID = id
        actCompleted.activity = name
        actCompleted.dateCompleted = formatter.string(from: date)

        // se envia post a servidor Si la respuesta es VERDADERA
        guard let requestModel = saveProgress(forActivity: actCompleted) else {
            return
        }

        courseDelegate?.sendRequest(formModel: requestModel)
    }

    // MARK: - Video Manager
    @IBAction func videoActionManage (_ sender: UIButton) {
		courseDelegate?.playMV(urlStr: String(format: Formats.youtubeEmbedFormat, VideosID.PROTECTION_VIDEO))
    }

    // MARK: - Validaciones
    /// Verifica que el boton de opcion este seleccionado, si esta marcado como respuesta correcta, o deseleccionado en caso contrario
    private func checkFillWord () -> Bool {
        let answer_array = Array(fill_word_answer)
        var isAnswer = true
        var currentPosition = 0

        //Check characters
        for tf in textFieldToFill {
            if tf.text?.uppercased() != String(answer_array[tf.tag]).uppercased() {
                isAnswer = false
                view_list[currentPosition].backgroundColor = Colors().getColor(from: ConseColors.pink_light.rawValue)
            }
            currentPosition += 1
        }

        //Clean form
        for tf in textFieldToFill {
            tf.text = nullString
        }

        return isAnswer
    }

    private func checkingQuestionary() -> Bool {

        for option in radioGroup {
            if option.tag == TAG_OPTION_CORRECT {
                guard option.isSelected else { return false }
            }
            else {
                guard !option.isSelected else { return false }
            }
        }
        return true
    }

    @IBAction func checking_page_11 (_ sender: UIButton) {

		if checkingQuestionary() {
            //save activiy completed -- Answered question 1 correctly
            let courseList = AplicationRuntime.sharedManager.getAppConfig()?.course_Array
            let course = courseList?[0].course_topics?[0]

            saveActivity(activity: (course?.topic_activity_list?[1].abreviature)!, forModule: (course?.id)!)

            // Show success message
            courseDelegate?.showMessagePopup(message: IPI_COURSE.SUCCEED_ANSWER, inbold: nil, type: .success)
        }
        else {
            courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_11.ERROR, inbold: nil, type: .failed)
        }
    }

    @IBAction func checking_page_12 (_ sender: UIButton) {

		if checkingQuestionary() {
            //save activiy completed -- Answered question 2 correctly
            let courseList = AplicationRuntime.sharedManager.getAppConfig()?.course_Array
            let course = courseList?[0].course_topics?[0]

            saveActivity(activity: (course?.topic_activity_list?[2].abreviature)!, forModule: (course?.id)!)

            // Show success message
            courseDelegate?.showMessagePopup(message: IPI_COURSE.SUCCEED_ANSWER, inbold: nil, type: .success)
        }
        else {
			// Clean option radio Group			
			for op in radioGroup { op.isSelected = false }
			// Show fail messege
            courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_12.ERROR, inbold: nil, type: .failed)
        }
    }

    @IBAction func checking_questionary (_ sender: UIButton) {

        // verifica que se haya respondido
        var answerValue = 0
        var isAnswered = false

        for op in radioGroup {
            if op.isSelected {
                isAnswered = true
                answerValue = op.tag
            }
        }

        guard isAnswered else {
            mainDelegate?.showMessageInMain(withMessage: ErrorMessages.unselectOption)
            return
        }

        //Get answers
        questionaryValue = AplicationRuntime.sharedManager.getAnswersValue()

        switch btn_next.tag {

            case TAG_ANSWER_01:
                questionaryValue.answer_01 = answerValue
                break

            case TAG_ANSWER_02:
                questionaryValue.answer_02 = answerValue
                break

            case TAG_ANSWER_03:
                questionaryValue.answer_03 = answerValue
                break

            case TAG_ANSWER_04:
                questionaryValue.answer_04 = answerValue
                break

            default:
                questionaryValue.answer_05 = answerValue
                break
        }

        // Update value in runtime
        AplicationRuntime.sharedManager.setAnswersValue(answers: questionaryValue)

        nextPage(nil)
    }
}
