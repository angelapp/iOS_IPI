//
//  CourseTableViewCell.swift
//  IPI
//
//  Created by Felipe Zamudio on 17/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//
import UIKit

class CourseTableViewCell: UITableViewCell, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet weak var btn_Aud1: UIButton!
    @IBOutlet weak var btn_Aud2: UIButton!
    @IBOutlet weak var btn_Aud3: UIButton!
    @IBOutlet weak var btn_Aud4: UIButton!

    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_next: UIButton!

    @IBOutlet weak var btn_help1: UIButton!
    @IBOutlet weak var btn_help2: UIButton!
    @IBOutlet weak var btn_help3: UIButton!
    @IBOutlet weak var btn_help4: UIButton!
    @IBOutlet weak var btn_help5: UIButton!
    @IBOutlet weak var btn_help6: UIButton!

    @IBOutlet weak var btn_opt1: UIButton!
    @IBOutlet weak var btn_opt2: UIButton!
    @IBOutlet weak var btn_opt3: UIButton!
    @IBOutlet weak var btn_opt4: UIButton!
    @IBOutlet weak var btn_opt5: UIButton!

    @IBOutlet weak var btn_playMV: UIButton!
    @IBOutlet weak var btn_downloadMV: UIButton!

    @IBOutlet weak var content_slide: UIView!
	@IBOutlet weak var pageControl: UIPageControl!

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
    @IBOutlet weak var lbl_Aud3: UILabel!
    @IBOutlet weak var lbl_Aud4: UILabel!

    @IBOutlet weak var lbl_item1: UILabel!
    @IBOutlet weak var lbl_item2: UILabel!
    @IBOutlet weak var lbl_item3: UILabel!
    @IBOutlet weak var lbl_item4: UILabel!
    @IBOutlet weak var lbl_item5: UILabel!
    @IBOutlet weak var lbl_item6: UILabel!
    @IBOutlet weak var lbl_item7: UILabel!
    @IBOutlet weak var lbl_item8: UILabel!
    @IBOutlet weak var lbl_item9: UILabel!
    @IBOutlet weak var lbl_item10: UILabel!
    @IBOutlet weak var lbl_item11: UILabel!

    @IBOutlet weak var lbl_option1: UILabel!
    @IBOutlet weak var lbl_option2: UILabel!
    @IBOutlet weak var lbl_option3: UILabel!
    @IBOutlet weak var lbl_option4: UILabel!
    @IBOutlet weak var lbl_option5: UILabel!

    @IBOutlet weak var lbl_question: UILabel!
    @IBOutlet weak var lbl_review: UILabel!
    @IBOutlet weak var lbl_subtitle: UILabel!

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

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var tbl_examples: UITableView!

    /* Name of textField cell for Crossword
    //(M1CW)Module 1 Crossword
    //(C_RC) Cell_RowCol ... (C0209 = Cell in Row 02, Col 09)
    @IBOutlet weak var M1CW_C_0209: UITextField!
    @IBOutlet weak var M1CW_C_0307: UITextField!
    @IBOutlet weak var M1CW_C_0308: UITextField!
    @IBOutlet weak var M1CW_C_0309: UITextField!
    @IBOutlet weak var M1CW_C_0310: UITextField!
    @IBOutlet weak var M1CW_C_0311: UITextField!
    @IBOutlet weak var M1CW_C_0312: UITextField!
    @IBOutlet weak var M1CW_C_0402: UITextField!
    @IBOutlet weak var M1CW_C_0409: UITextField!
    @IBOutlet weak var M1CW_C_0502: UITextField!
    @IBOutlet weak var M1CW_C_0503: UITextField!
    @IBOutlet weak var M1CW_C_0504: UITextField!
    @IBOutlet weak var M1CW_C_0505: UITextField!
    @IBOutlet weak var M1CW_C_0506: UITextField!
    @IBOutlet weak var M1CW_C_0507: UITextField!
    @IBOutlet weak var M1CW_C_0508: UITextField!
    @IBOutlet weak var M1CW_C_0509: UITextField!
    @IBOutlet weak var M1CW_C_0510: UITextField!
    @IBOutlet weak var M1CW_C_0602: UITextField!
    @IBOutlet weak var M1CW_C_0609: UITextField!
    @IBOutlet weak var M1CW_C_0702: UITextField!
    @IBOutlet weak var M1CW_C_0709: UITextField!
    @IBOutlet weak var M1CW_C_0802: UITextField!
    @IBOutlet weak var M1CW_C_0809: UITextField!
    @IBOutlet weak var M1CW_C_0902: UITextField!
    @IBOutlet weak var M1CW_C_0909: UITextField!
    @IBOutlet weak var M1CW_C_1006: UITextField!
    @IBOutlet weak var M1CW_C_1007: UITextField!
    @IBOutlet weak var M1CW_C_1008: UITextField!
    @IBOutlet weak var M1CW_C_1009: UITextField!
    @IBOutlet weak var M1CW_C_1010: UITextField!
    @IBOutlet weak var M1CW_C_1011: UITextField!
    @IBOutlet weak var M1CW_C_1012: UITextField!
    @IBOutlet weak var M1CW_C_1109: UITextField!
    @IBOutlet weak var M1CW_C_1206: UITextField!
    @IBOutlet weak var M1CW_C_1207: UITextField!
    @IBOutlet weak var M1CW_C_1208: UITextField!
    @IBOutlet weak var M1CW_C_1209: UITextField!
    @IBOutlet weak var M1CW_C_1210: UITextField!
    @IBOutlet weak var M1CW_C_1211: UITextField! */

    // MARK: - Properties
    let MAX_LENGTH_CELL = 1
	// Slides for Module 2 Page 15
	let SLIDE_0 = 0
	let SLIDE_1 = 1
	let SLIDE_2 = 2
	// Tag for identify the options 
    let TAG_OPTION_CORRECT: Int = 1
    let TAG_OPTION_WRONG:   Int = 0
    let TAG_OPTION_01 = 0
    let TAG_OPTION_02 = 1
    let TAG_OPTION_03 = 2
    let TAG_OPTION_04 = 3
    let TAG_OPTION_05 = 4
    
    private let courseID: Int = 1

    var crossword_word1: Array<UITextField> = []
    var crossword_word2: Array<UITextField> = []
    var crossword_word3: Array<UITextField> = []
    var crossword_word4: Array<UITextField> = []
    var crossword_word5: Array<UITextField> = []
    var crossword_word6: Array<UITextField> = []
    var radioGroup: Array<UIButton> = []

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
        tbl_examples.tag = TABLE_SAMPLES
        
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

        radioGroup = [btn_opt1, btn_opt2, btn_opt3]
		setButtonTitle(button: btn_next, title: Buttons.next)

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
	
        lbl_text1.text = IPI_COURSE.PAGE_13.text1
        lbl_text2.text = IPI_COURSE.PAGE_13.text2
		
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
        img_corner1.image = UIImage(named: IPI_IMAGES.corner_YELLOW)
		img_insignia.image = UIImage(named: IPI_IMAGES.icon_1)
			
		setButtonTitle(button: btn_next, title: Buttons.end_course)
		setButtonTitle(button: btn_back, title: Buttons.come_back)
    }
	/** END MODULE 1 **/
	
	/** STAR MODULE 2 **/
    func fill_CELL_14() {
        lbl_title.text = IPI_COURSE.PAGE_14.title
        lbl_text1.text = IPI_COURSE.PAGE_14.text1
        
        setButtonTitle(button: btn_next, title: Buttons.carry_on)
    }

    func fill_CELL_15() {
        lbl_text1.text = IPI_COURSE.PAGE_15.text1
        lbl_text2.text = IPI_COURSE.PAGE_15.text2
		
		//Implementar pageviewController y función para retornar los textos
		// swift id {
			
			// case SLIDE_0:
			// text3 = IPI_COURSE.PAGE_15.slide0_text3
			// text4 = IPI_COURSE.PAGE_15.slide0_text4
			// break
		
			// case SLIDE_1:
			// text3 = IPI_COURSE.PAGE_15.slide1_text3
			// text4 = IPI_COURSE.PAGE_15.slide1_text4
			// break
			
			// default:
			// text3 = IPI_COURSE.PAGE_15.slide2_text3
			// text4 = IPI_COURSE.PAGE_15.slide2_text4
			// break
		// }
		
		setButtonTitle(button: btn_next, title: Buttons.next)
    }

    func fill_CELL_16() {
        lbl_text1.text = IPI_COURSE.PAGE_16.text1
        lbl_text2.text = IPI_COURSE.PAGE_16.text2
		
		setButtonTitle(button: btn_next, title: Buttons.next)
    }
/*
    // MARK: MODULE 3
    func fill_CELL_17() {
        mainDelegate?.setImageBackground(withName: nullString)
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_17.title
        lbl_subtitle.text = IPI_COURSE.PAGE_17.SUBTITLE
        lbl_text1.text = IPI_COURSE.PAGE_17.text1
        lbl_text2.text = IPI_COURSE.PAGE_17.text2
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_CELL_18() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_11.rawValue

        audioButtons = [btn_Aud1]

        lbl_title.text = IPI_COURSE.PAGE_18.title
        lbl_subtitle.text = IPI_COURSE.PAGE_18.SUBTITLE
        lbl_text1.text = IPI_COURSE.PAGE_18.text1
        lbl_item1.text = IPI_COURSE.PAGE_18.ITEM_1
        lbl_item2.text = IPI_COURSE.PAGE_18.ITEM_2
        lbl_item3.text = IPI_COURSE.PAGE_18.ITEM_3
        lbl_Aud1.text = IPI_COURSE.PAGE_18.AUDIO_1
    }

    func fill_CELL_19() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_19.title
        img_route.image = UIImage(named: RoutesImages.route_VBG_19)
    }

    func fill_CELL_20() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_12.rawValue

        audioButtons = [btn_Aud1]

        lbl_title.text = IPI_COURSE.PAGE_20.title
        lbl_subtitle.text = IPI_COURSE.PAGE_20.SUBTITLE
        lbl_text1.text = IPI_COURSE.PAGE_20.text1
        lbl_Aud1.text = IPI_COURSE.PAGE_20.AUDIO_1

        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_CELL_21() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_21.title
        img_route.image = UIImage(named: RoutesImages.route_VBG_21)
    }

    func fill_CELL_22() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_13.rawValue

        audioButtons = [btn_Aud1]

        lbl_title.text = IPI_COURSE.PAGE_22.title
        lbl_subtitle.text = IPI_COURSE.PAGE_22.SUBTITLE
        lbl_text1.text = IPI_COURSE.PAGE_22.text1
        lbl_Aud1.text = IPI_COURSE.PAGE_22.AUDIO_1

        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_CELL_23() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_23.title
        img_route.image = UIImage(named: RoutesImages.route_VBG_23)
    }

    func fill_CELL_24() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_14.rawValue

        audioButtons = [btn_Aud1]

        lbl_title.text = IPI_COURSE.PAGE_24.title
        lbl_subtitle.text = IPI_COURSE.PAGE_24.SUBTITLE
        lbl_text1.text = IPI_COURSE.PAGE_24.text1
        lbl_Aud1.text = IPI_COURSE.PAGE_24.AUDIO_1

        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_CELL_25() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_25.title
        img_route.image = UIImage(named: RoutesImages.route_VBG_25)
    }

    func fill_CELL_26() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_26.title
        img_route.image = UIImage(named: RoutesImages.route_VBG_26)
    }

    func fill_CELL_27() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_27.title
        img_route.image = UIImage(named: RoutesImages.route_VBG_27)
    }

    func fill_CELL_28() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_14.rawValue

        audioButtons = [btn_Aud1]

        lbl_title.text = IPI_COURSE.PAGE_28.title
        lbl_subtitle.text = IPI_COURSE.PAGE_28.SUBTITLE
        lbl_text1.text = IPI_COURSE.PAGE_28.text1
        lbl_Aud1.text = IPI_COURSE.PAGE_28.AUDIO_1

        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_CELL_29() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_29.title
        img_route.image = UIImage(named: RoutesImages.route_VBG_29)
    }

    func fill_CELL_30() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_30.title
        lbl_text1.text = IPI_COURSE.PAGE_30.text1

        saveActivity(activity: ActivitiesAbreviature.MOD_3_R.rawValue, forModule: TopicsIDs.mod_03.rawValue)
    }

    func fill_CELL_31() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_31.title
        lbl_text1.text = IPI_COURSE.PAGE_31.text1

        lbl_question.text = IPI_COURSE.PAGE_31.QUESTION
        lbl_option1.text = IPI_COURSE.PAGE_31.OPT1
        lbl_option2.text = IPI_COURSE.PAGE_31.OPT2
        lbl_option3.text = IPI_COURSE.PAGE_31.OPT3

        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false

        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = WRONG_OPTION

        answersButtons = [btn_opt1, btn_opt2, btn_opt3]

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

    func fill_CELL_32() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_32.title

        lbl_question.text = IPI_COURSE.PAGE_32.QUESTION
        lbl_option1.text = IPI_COURSE.PAGE_32.OPT1
        lbl_option2.text = IPI_COURSE.PAGE_32.OPT2
        lbl_option3.text = IPI_COURSE.PAGE_32.OPT3
        lbl_option4.text = IPI_COURSE.PAGE_32.OPT4

        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false

        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = CORRECT_OPTION

        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)

        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_CELL_33() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_33.title

        lbl_question.text = IPI_COURSE.PAGE_33.QUESTION
        lbl_option1.text = IPI_COURSE.PAGE_33.OPT1
        lbl_option2.text = IPI_COURSE.PAGE_33.OPT2
        lbl_option3.text = IPI_COURSE.PAGE_33.OPT3

        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false

        btn_opt1.tag = WRONG_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = CORRECT_OPTION

        answersButtons = [btn_opt1, btn_opt2, btn_opt3]

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

    func fill_CELL_34() {
        mainDelegate?.setImageBackground(withName: nullString)
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_34.title

        lbl_question.text = IPI_COURSE.PAGE_34.QUESTION
        lbl_option1.text = IPI_COURSE.PAGE_34.OPT1
        lbl_option2.text = IPI_COURSE.PAGE_34.OPT2
        lbl_option3.text = IPI_COURSE.PAGE_34.OPT3
        lbl_option4.text = IPI_COURSE.PAGE_34.OPT4

        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false

        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = CORRECT_OPTION

        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)

        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_CELL_35() {
        content_tilte?.topline()
        lbl_review.text = Strings.review_content
        lbl_title.text = IPI_COURSE.PAGE_35.title
        lbl_text1.text = IPI_COURSE.PAGE_35.text1
        lbl_text2.text = String(format: IPI_COURSE.PAGE_35.text2, getInsignia(forModule: .MOD_03))

        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
        img_insignia.image = UIImage(named: BackgroundInsignia.insignia_03)
        mainDelegate?.setImageBackground(withName: BackgroundInsignia.bg_03)
    }

    // MARK: Modulo 4
    func fill_CELL_36() {
        mainDelegate?.setImageBackground(withName: nullString)
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_36.title
        lbl_subtitle.text = IPI_COURSE.PAGE_36.SUBTITLE
        lbl_text1.text = IPI_COURSE.PAGE_36.text1
    }

    func fill_CELL_37() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_37.title
        lbl_subtitle.text = IPI_COURSE.PAGE_37.SUBTITLE
        lbl_text1.text = IPI_COURSE.PAGE_37.text1

        img_route.image = UIImage(named: RoutesImages.route_VBG_37)
    }

    func fill_CELL_38() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_16.rawValue

        audioButtons = [btn_Aud1]

        lbl_title.text = IPI_COURSE.PAGE_38.title
        lbl_subtitle.text = IPI_COURSE.PAGE_38.SUBTITLE
        lbl_text1.text = IPI_COURSE.PAGE_38.text1
        lbl_Aud1.text = IPI_COURSE.PAGE_38.AUDIO_1

        img_route.image = UIImage(named: RoutesImages.route_VBG_38)
    }

    func fill_CELL_39() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud2.isSelected = false
        btn_Aud3.isSelected = false

        btn_Aud1.tag = VBG_AUDIO_ID.AUD_17.rawValue
        btn_Aud2.tag = VBG_AUDIO_ID.AUD_18.rawValue
        btn_Aud3.tag = VBG_AUDIO_ID.AUD_19.rawValue

        audioButtons = [btn_Aud1, btn_Aud2, btn_Aud3]

        lbl_title.text = IPI_COURSE.PAGE_39.title
        lbl_subtitle.text = IPI_COURSE.PAGE_39.SUBTITLE
        lbl_text1.text = IPI_COURSE.PAGE_39.text1

        lbl_Aud1.text = IPI_COURSE.PAGE_39.AUDIO_1
        lbl_Aud2.text = IPI_COURSE.PAGE_39.AUDIO_2
        lbl_Aud3.text = IPI_COURSE.PAGE_39.AUDIO_3
    }

    func fill_CELL_40() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_20.rawValue

        audioButtons = [btn_Aud1]

        lbl_title.text = IPI_COURSE.PAGE_40.title
        lbl_text1.text = IPI_COURSE.PAGE_40.text1
        lbl_Aud1.text = IPI_COURSE.PAGE_40.AUDIO_1
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_CELL_41() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_41.title
        lbl_text1.text = IPI_COURSE.PAGE_41.text1
        lbl_text2.text = IPI_COURSE.PAGE_41.text2
        lbl_text3.text = IPI_COURSE.PAGE_41.text3
        lbl_item1.text = IPI_COURSE.PAGE_41.ITEM_1
        lbl_item2.text = IPI_COURSE.PAGE_41.ITEM_2
        lbl_item3.text = IPI_COURSE.PAGE_41.ITEM_3
        lbl_item4.text = IPI_COURSE.PAGE_41.ITEM_4
        lbl_item5.text = IPI_COURSE.PAGE_41.ITEM_5
        lbl_item6.text = IPI_COURSE.PAGE_41.ITEM_6
    }

    func fill_CELL_42() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_42.title
        lbl_text1.text = IPI_COURSE.PAGE_42.text1
        lbl_text2.text = IPI_COURSE.PAGE_42.text2
        lbl_item1.text = IPI_COURSE.PAGE_42.ITEM_1
        lbl_item2.text = IPI_COURSE.PAGE_42.ITEM_2
    }

    func fill_CELL_43() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_43.title
        lbl_text1.attributedText = addBoldWord(forText: IPI_COURSE.PAGE_43.text1, toWord: IPI_COURSE.PAGE_43.T1_inBOLD, fontSize: lbl_text1.font.pointSize)
        lbl_text2.attributedText = addBoldWord(forText: IPI_COURSE.PAGE_43.text2, toWord: IPI_COURSE.PAGE_43.T2_inBOLD, fontSize: lbl_text2.font.pointSize)
        lbl_item1.attributedText = addBoldWord(forText: IPI_COURSE.PAGE_43.ITEM_1, toWord: IPI_COURSE.PAGE_43.ITEM_1_inBOLD, fontSize: lbl_item1.font.pointSize)
        lbl_item2.attributedText = addBoldWord(forText: IPI_COURSE.PAGE_43.ITEM_2, toWord: IPI_COURSE.PAGE_43.ITEM_2_inBOLD, fontSize: lbl_item2.font.pointSize)
    }

    func fill_CELL_44() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_21.rawValue

        audioButtons = [btn_Aud1]

        lbl_title.text = IPI_COURSE.PAGE_44.title
        lbl_subtitle.text = IPI_COURSE.PAGE_44.SUBTITLE
        lbl_text1.text = IPI_COURSE.PAGE_44.text1
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_CELL_45() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_45.title
        lbl_text1.text = IPI_COURSE.PAGE_45.text1

        saveActivity(activity: ActivitiesAbreviature.MOD_4_R.rawValue, forModule: TopicsIDs.mod_04.rawValue)
    }

    func fill_CELL_46() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_46.title
    }

    func fill_CELL_47() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_47.title
        lbl_text1.text = IPI_COURSE.PAGE_47.text1

        lbl_question.text = IPI_COURSE.PAGE_47.QUESTION
        lbl_option1.text = IPI_COURSE.PAGE_47.OPT1
        lbl_option2.text = IPI_COURSE.PAGE_47.OPT2
        lbl_option3.text = IPI_COURSE.PAGE_47.OPT3
        lbl_option4.text = IPI_COURSE.PAGE_47.OPT4

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false

        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = WRONG_OPTION
        btn_opt4.tag = WRONG_OPTION

        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]

        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)

        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_CELL_48() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_48.title

        lbl_question.text = IPI_COURSE.PAGE_48.QUESTION
        lbl_option1.text = IPI_COURSE.PAGE_48.OPT1
        lbl_option2.text = IPI_COURSE.PAGE_48.OPT2
        lbl_option3.text = IPI_COURSE.PAGE_48.OPT3
        lbl_option4.text = IPI_COURSE.PAGE_48.OPT4

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false

        // set tag for identify correct option
        btn_opt1.tag = WRONG_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = WRONG_OPTION
        btn_opt4.tag = CORRECT_OPTION

        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]

        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)

        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_CELL_49() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_49.title
        lbl_question.text = IPI_COURSE.PAGE_49.QUESTION
        textField1.text = nullString
    }

    func fill_CELL_50() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_50.title

        lbl_question.text = IPI_COURSE.PAGE_50.QUESTION
        lbl_option1.text = IPI_COURSE.PAGE_50.OPT1
        lbl_option2.text = IPI_COURSE.PAGE_50.OPT2
        lbl_option3.text = IPI_COURSE.PAGE_50.OPT3
        lbl_option4.text = IPI_COURSE.PAGE_50.OPT4

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false

        // set tag for identify correct option
        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = CORRECT_OPTION

        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]

        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)

        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_CELL_51() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_51.title

        lbl_question.text = IPI_COURSE.PAGE_51.QUESTION
        lbl_option1.text = IPI_COURSE.PAGE_51.OPT1
        lbl_option2.text = IPI_COURSE.PAGE_51.OPT2
        lbl_option3.text = IPI_COURSE.PAGE_51.OPT3

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false

        // set tag for identify correct option
        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = WRONG_OPTION

        answersButtons = [btn_opt1, btn_opt2, btn_opt3]

        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG

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

    func fill_CELL_52() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_52.title

        lbl_question.text = IPI_COURSE.PAGE_52.QUESTION
        lbl_option1.text = IPI_COURSE.PAGE_52.OPT1
        lbl_option2.text = IPI_COURSE.PAGE_52.OPT2
        lbl_option3.text = IPI_COURSE.PAGE_52.OPT3

        // set tag for identify correct option
        btn_opt1.tag = WRONG_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = CORRECT_OPTION

        answersButtons = [btn_opt1, btn_opt2, btn_opt3]

        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG

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

    func fill_CELL_53() {
        content_tilte?.topline()
        lbl_title.text = IPI_COURSE.PAGE_53.title

        lbl_question.text = IPI_COURSE.PAGE_53.QUESTION
        lbl_option1.text = IPI_COURSE.PAGE_53.OPT1
        lbl_option2.text = IPI_COURSE.PAGE_53.OPT2
        lbl_option3.text = IPI_COURSE.PAGE_53.OPT3
        lbl_option4.text = IPI_COURSE.PAGE_53.OPT4

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false

        // set tag for identify correct option
        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = WRONG_OPTION

        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]

        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)

        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_CELL_54() {
        mainDelegate?.setImageBackground(withName: nullString)
        content_tilte?.topline()

        lbl_title.text = IPI_COURSE.PAGE_54.title
        lbl_question.text = IPI_COURSE.PAGE_54.QUESTION
        lbl_option1.text = IPI_COURSE.PAGE_54.OPT1
        lbl_option2.text = IPI_COURSE.PAGE_54.OPT2
        lbl_option3.text = IPI_COURSE.PAGE_54.OPT3
        lbl_option4.text = IPI_COURSE.PAGE_54.OPT4

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false

        // set tag for identify correct option
        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = WRONG_OPTION

        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]

        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG

        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)

        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)

        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)

        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_CELL_55() {
        content_tilte?.topline()
        lbl_review.text = Strings.review_content
        lbl_title.text = IPI_COURSE.PAGE_55.title
        lbl_text1.text = IPI_COURSE.PAGE_55.text1
        lbl_text2.text = String(format: IPI_COURSE.PAGE_55.text2, getInsignia(forModule: .MOD_04))

        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
        img_insignia.image = UIImage(named: BackgroundInsignia.insignia_04)
        mainDelegate?.setImageBackground(withName: BackgroundInsignia.bg_04)
    }

    // MARK: - Save Activities completed
    private func saveActivity(activity name: String, forModule id: Int) {

        //Obtiene la fecha actual
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = DateTimeFormat.formatInMillis

        // save Activity complete
        let actCompleted:ActityCompleted = ActityCompleted()
        actCompleted.courseID = CourseIDs.VBG.rawValue
        actCompleted.topicID = id
        actCompleted.activity = name
        actCompleted.dateCompleted = formatter.string(from: date)

        // se envia post a servidor Si la respuesta es VERDADERA
        guard let requestModel = saveProgress(forActivity: actCompleted) else {
            return
        }

        courseDelegate?.sendRequest(formModel: requestModel)
    } */

    // MARK: - Acciones de navegación
    @IBAction func previousPage(_ sender: UIButton) {
        courseDelegate?.previusPage()
    }

    @IBAction func nextPage(_ sender: UIButton?) {
        courseDelegate?.nextPage()
    }

//    @IBAction func endCourse(_ sender: UIButton) {
//        mainDelegate?.setImageBackground(withName: nullString)
//        mainDelegate?.addToContainer(viewControllerID: .myCourses)
//    }

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
        if sender.isSelected {
            for button in radioGroup {
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
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        // Cambia el foco a la siguente celda, cuando hay un caracter
//        if textField.text!.count == MAX_LENGTH_CELL {
//            if let nextField = getNextTextField(forTextField: textField.tag) {
//                nextField.becomeFirstResponder()
//            }
//            else {
//                textField.resignFirstResponder()
//            }
//        }
//
//        return true
//    }

    // Limpia la cailla cuando se empieza a editar
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = nil
    }

    /**
     Determina cual es la celda siguiente a la que se debe cambiar el foco
     de acuerdo a la celda actual, si no existe celda siguinete, retorna NIL

     - Parameter forTexfield: Id del textField actual
     *//*
    private func getNextTextField(forTextField tag: Int) -> UITextField! {

        // Cambia los ID de las celdas que comparten "LETRAS" de acuerdo a su predecesos
        M1CW_C_0309.tag = M1CW_C_0308.tag == tag ? 23 : 2
        M1CW_C_0502.tag = M1CW_C_0402.tag == tag ? 32 : 41
        M1CW_C_0509.tag = M1CW_C_0508.tag == tag ? 48 : 4
        M1CW_C_1009.tag = M1CW_C_1008.tag == tag ? 54 : 9
        M1CW_C_1209.tag = M1CW_C_1208.tag == tag ? 64 : 11

        // Listado de los TextField del crugigrama
        let cw_cells = [M1CW_C_0209, M1CW_C_0307, M1CW_C_0308, M1CW_C_0309,
                        M1CW_C_0310, M1CW_C_0311, M1CW_C_0312, M1CW_C_0402,
                        M1CW_C_0409, M1CW_C_0502, M1CW_C_0503, M1CW_C_0504,
                        M1CW_C_0505, M1CW_C_0506, M1CW_C_0507, M1CW_C_0508,
                        M1CW_C_0509, M1CW_C_0510, M1CW_C_0602, M1CW_C_0609,
                        M1CW_C_0702, M1CW_C_0709, M1CW_C_0802, M1CW_C_0809,
                        M1CW_C_0902, M1CW_C_0909, M1CW_C_1006, M1CW_C_1007,
                        M1CW_C_1008, M1CW_C_1009, M1CW_C_1010, M1CW_C_1011,
                        M1CW_C_1012, M1CW_C_1109, M1CW_C_1206, M1CW_C_1207,
                        M1CW_C_1208, M1CW_C_1209, M1CW_C_1210, M1CW_C_1211]

        // Busca en las lista de textFields la celda siguiente y la retorna
        for cell in cw_cells {
            if cell?.tag == (tag + 1) {
                return cell
            }
        }

        // retorna nulo si no se encuentra la celda siguinete
        return nil
    }*/
    
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

    /*
     // MARK: - Ayudas
    @IBAction func showHelp(_ sender: UIButton) {

        switch sender {

        case btn_help1:
            courseDelegate?.showPopupHelp(title: (btn_help1.titleLabel?.text)!, text: IPI_COURSE.PAGE_11.HELP_1)
            break

        case btn_help2:
            courseDelegate?.showPopupHelp(title: (btn_help2.titleLabel?.text)!, text: IPI_COURSE.PAGE_11.HELP_2)
            break

        case btn_help3:
            courseDelegate?.showPopupHelp(title: (btn_help3.titleLabel?.text)!, text: IPI_COURSE.PAGE_11.HELP_3)
            break

        case btn_help4:
            courseDelegate?.showPopupHelp(title: (btn_help4.titleLabel?.text)!, text: IPI_COURSE.PAGE_11.HELP_4)
            break

        case btn_help5:
            courseDelegate?.showPopupHelp(title: (btn_help5.titleLabel?.text)!, text: IPI_COURSE.PAGE_11.HELP_5)
            break

        default:
            courseDelegate?.showPopupHelp(title: (btn_help6.titleLabel?.text)!, text: IPI_COURSE.PAGE_11.HELP_6)
            break
        }
    }*/

    // MARK: - Video Manager
    @IBAction func videoActionManage (_ sender: UIButton) {
		courseDelegate?.playMV(urlStr: String(format: Formats.youtubeEmbedFormat, VideosID.PROTECTION_VIDEO))
    }

    // MARK: - Validaciones
    /// Verifica que el boton de opcion este seleccionado, si esta marcado como respuesta correcta, o deseleccionado en caso contrario
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
            courseDelegate?.showMessagePopup(message: IPI_COURSE.SUCCED_ANSWER, inbold: nil, type: .success)
        }
        else {
            courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_11.ERROR, inbold: nil, type: .failed)
        }
    }

    @IBAction func checking_page_12 (_ sender: UIButton) {

		if checkingQuestionary() {
            //saveActivity(activity: activity, forModule: TopicsIDs.mod_02.rawValue)
            //nextPage(nil)
        }
        else {
            courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_12.ERROR, inbold: nil, type: .failed)
        }
    }
/*
    @IBAction func checking_page_15(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_1_Q1.rawValue, forModule: TopicsIDs.mod_02.rawValue)
            nextPage(nil)
        }
        else {
            courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_15.ERROR, inbold: IPI_COURSE.PAGE_15.ERROR_INBOLD, type: .failed)
        }
    }

    @IBAction func checking_page_31(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_3_Q1.rawValue, forModule: TopicsIDs.mod_03.rawValue)
            courseDelegate?.showMessagePopup(message: IPI_COURSE.correct_answer, inbold: nil, type: .success)
        }
        else {
            courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_31.ERROR, inbold: nil, type: .failed)
        }
    }

    @IBAction func checking_page_32(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_3_Q2.rawValue, forModule: TopicsIDs.mod_03.rawValue)
            courseDelegate?.showMessagePopup(message: IPI_COURSE.correct_answer, inbold: nil, type: .success)
        }
        else {
            courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_32.ERROR, inbold: nil, type: .failed)
        }
    }

    @IBAction func checking_page_33(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_3_Q3.rawValue, forModule: TopicsIDs.mod_03.rawValue)
            courseDelegate?.showMessagePopup(message: IPI_COURSE.correct_answer, inbold: nil, type: .success)
        }
        else {
            courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_33.ERROR, inbold: nil, type: .failed)
        }
    }

    @IBAction func checking_page_34(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_3_Q4.rawValue, forModule: TopicsIDs.mod_03.rawValue)
            courseDelegate?.showMessagePopup(message: IPI_COURSE.correct_answer, inbold: nil, type: .success)
        }
        else {
            courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_34.ERROR, inbold: nil, type: .failed)
        }
    }
    @IBAction func checking_page_47(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_4_Q1.rawValue, forModule: TopicsIDs.mod_04.rawValue)
            nextPage(nil)
        }
        else {
            courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_47.ERROR, inbold: nil, type: .failed)
        }
    }

    @IBAction func checking_page_48(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_48.ERROR, inbold: nil, type: .failed)
    }

    @IBAction func checking_page_49(_ sender: UIButton) {
        textField1.text?.trimmingCharacters(in: .whitespaces) == EmergencyStrings.line_155 ? nextPage(nil) : courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_49.ERROR, inbold: nil, type: .failed)
    }

    @IBAction func checking_page_50(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_50.ERROR, inbold: nil, type: .failed)
    }

    @IBAction func checking_page_51(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_51.ERROR, inbold: nil, type: .failed)
    }

    @IBAction func checking_page_52(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_52.ERROR, inbold: nil, type: .failed)
    }

    @IBAction func checking_page_53(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_53.ERROR, inbold: nil, type: .failed)
    }

    @IBAction func checking_page_54(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : courseDelegate?.showMessagePopup(message: IPI_COURSE.PAGE_54.ERROR, inbold: nil, type: .failed)
    }*/
}


extension CourseTableViewCell {
    func setTableViewDataSourceDelegate <D: UITableViewDelegate & UITableViewDataSource> (_ dataSourceDelegate: D, forRow row: Int) {
        tbl_examples.delegate = dataSourceDelegate
        tbl_examples.dataSource = dataSourceDelegate

        tbl_examples.reloadData()
    }
}
