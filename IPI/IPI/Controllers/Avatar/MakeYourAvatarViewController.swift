//
//  MakeYourAvatarViewController.swift
//  IPI
//
//  Created by Felipe Zamudio on 07/05/19.
//  Copyright © 2019 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

class MakeYourAvatarViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_next: UIButton!

    @IBOutlet weak var btn_head_1: UIButton!
    @IBOutlet weak var btn_head_2: UIButton!
    @IBOutlet weak var btn_head_3: UIButton!
    @IBOutlet weak var btn_eyes_1: UIButton!
    @IBOutlet weak var btn_eyes_2: UIButton!
    @IBOutlet weak var btn_eyes_3: UIButton!
    @IBOutlet weak var btn_nose_1: UIButton!
    @IBOutlet weak var btn_nose_2: UIButton!
    @IBOutlet weak var btn_nose_3: UIButton!
    @IBOutlet weak var btn_hair_1: UIButton!
    @IBOutlet weak var btn_hair_2: UIButton!
    @IBOutlet weak var btn_hair_3: UIButton!
    @IBOutlet weak var btn_accessories_1: UIButton!
    @IBOutlet weak var btn_accessories_2: UIButton!
    @IBOutlet weak var btn_accessories_3: UIButton!

    @IBOutlet weak var cnt_avatar: UIView!
    @IBOutlet weak var cnt_avatarPieces: UIView!
    @IBOutlet weak var cnt_buttons: UIView!

    @IBOutlet weak var img_avatarHead: UIImageView!
    @IBOutlet weak var img_avatarEyes: UIImageView!
    @IBOutlet weak var img_avatarNose: UIImageView!
    @IBOutlet weak var img_avatarHair: UIImageView!
    @IBOutlet weak var img_avatarAcc: UIImageView!

    @IBOutlet weak var img_head_1: UIImageView!
    @IBOutlet weak var img_head_2: UIImageView!
    @IBOutlet weak var img_head_3: UIImageView!
    @IBOutlet weak var img_eyes_1: UIImageView!
    @IBOutlet weak var img_eyes_2: UIImageView!
    @IBOutlet weak var img_eyes_3: UIImageView!
    @IBOutlet weak var img_nose_1: UIImageView!
    @IBOutlet weak var img_nose_2: UIImageView!
    @IBOutlet weak var img_nose_3: UIImageView!
    @IBOutlet weak var img_hair_1: UIImageView!
    @IBOutlet weak var img_hair_2: UIImageView!
    @IBOutlet weak var img_hair_3: UIImageView!
    @IBOutlet weak var img_accessories_1: UIImageView!
    @IBOutlet weak var img_accessories_2: UIImageView!
    @IBOutlet weak var img_accessories_3: UIImageView!

    // MARK: - Properties
    var headPiecesList: Array<AvatarPiece>!
    var eyesPiecesList: Array<AvatarPiece>!
    var nosePiecesList: Array<AvatarPiece>!
    var hairPiecesList: Array<AvatarPiece>!
    var accessoriesPiecesList: Array<AvatarPiece>!

    var radioGroupHead: Array<UIButton>!
    var radioGroupEyes: Array<UIButton>!
    var radioGroupNose: Array<UIButton>!
    var radioGroupHair: Array<UIButton>!
    var radioGroupAcc: Array<UIButton>!

    var piecesGrid: [Array<AvatarPiece>] = []

    var myAvatar = AplicationRuntime.sharedManager.getAvatarPieces()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        getPiecesList()
        addStyles()
        fillRadioGroups()
        fillGrid()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private Functions
    private func addStyles() {

        // Set Aspect fit to all grid Buttons and add the same tag to radioButton as image
        // row (fila), pos (posicion en la fila)
        var row = 0, posBtn = 0, posImg = 0
        for view in cnt_avatarPieces.subviews {
            posBtn = 0; posImg = 0

            for subView in view.subviews {

                if let button = subView as? UIButton {
                    button.imageView?.contentMode = .scaleAspectFit
                    button.tag = (row * 10) + posBtn
                    posBtn += 1
                }

                if let img = subView as? UIImageView {
                    img.tag = (row * 10) + posImg
                    posImg += 1
                }
            }
            row += 1
        }

        btn_next.imageView?.contentMode = .scaleAspectFit
    }

    /// Carga las listas de cada parte del avatar, obteniendo las piezas del runtime
    private func getPiecesList() {
        headPiecesList = AplicationRuntime.sharedManager.getPiecesList(forPart: .Head)
        eyesPiecesList = AplicationRuntime.sharedManager.getPiecesList(forPart: .Eyes)
        nosePiecesList = AplicationRuntime.sharedManager.getPiecesList(forPart: .Nose)
        hairPiecesList = AplicationRuntime.sharedManager.getPiecesList(forPart: .Hair)
        accessoriesPiecesList = AplicationRuntime.sharedManager.getPiecesList(forPart: .Accessory)

        piecesGrid = [headPiecesList, eyesPiecesList, nosePiecesList, hairPiecesList, accessoriesPiecesList]
    }

    /// Se llenan los arreglos con los botones para crear los radioGroups
    private func fillRadioGroups() {
        radioGroupHead = [btn_head_1, btn_head_2, btn_head_3]
        radioGroupEyes = [btn_eyes_1, btn_eyes_2, btn_eyes_3]
        radioGroupNose = [btn_nose_1, btn_nose_2, btn_nose_3]
        radioGroupHair = [btn_hair_1, btn_hair_2, btn_hair_3]
        radioGroupAcc = [btn_accessories_1, btn_accessories_2, btn_accessories_3]
    }

    /// llena la grilla de partes
    private func fillGrid() {

        guard piecesGrid.count > 0 else { return }

        var col = 0, row = 0
        for view in cnt_avatarPieces.subviews {
            col = 0
            for subView in view.subviews {
                if let img = subView as? UIImageView {
                    downloadImage(imgView: img, urlImage: piecesGrid[row][col].icon)
                    col += 1
                }
            }
            row += 1
        }
    }

    private func updateStateButtons(radioGroup: [UIButton], buttonId tag: Int) {
        for button in radioGroup {
            button.isSelected = button.tag == tag ? true : false
        }
    }

    // MARK: - Actions buttons
    @IBAction func updateSelected(_ sender: UIButton) {
        let listPart: Int = Int( sender.tag / 10)
        let posInList: Int =  sender.tag % 10

        switch listPart {

        case HEAD_GRID:
            downloadImage(imgView: img_avatarHead, urlImage: piecesGrid[listPart][posInList].icon)
            updateStateButtons(radioGroup: radioGroupHead, buttonId: sender.tag)
            myAvatar?.headID = piecesGrid[listPart][posInList].id
            break

        case EYES_GRID:
            downloadImage(imgView: img_avatarEyes, urlImage: piecesGrid[listPart][posInList].icon)
            updateStateButtons(radioGroup: radioGroupEyes, buttonId: sender.tag)
            myAvatar?.eyesID = piecesGrid[listPart][posInList].id
            break

        case NOSE_GRID:
            downloadImage(imgView: img_avatarNose, urlImage: piecesGrid[listPart][posInList].icon)
            updateStateButtons(radioGroup: radioGroupNose, buttonId: sender.tag)
            myAvatar?.noseID = piecesGrid[listPart][posInList].id
            break

        case HAIR_GRID:
            downloadImage(imgView: img_avatarHair, urlImage: piecesGrid[listPart][posInList].icon)
            updateStateButtons(radioGroup: radioGroupHair, buttonId: sender.tag)
            myAvatar?.hairID = piecesGrid[listPart][posInList].id
            break

        case ACCESSORIES_GRID:
            downloadImage(imgView: img_avatarAcc, urlImage: piecesGrid[listPart][posInList].icon)
            updateStateButtons(radioGroup: radioGroupAcc, buttonId: sender.tag)
            myAvatar?.accID = piecesGrid[listPart][posInList].id
            break

        default:
            break
        }
    }

    @IBAction func actionBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func actionButtons(_ sender: UIButton) {

        // Verifica que se hayan seleccionado todas las partes del avatar
        guard myAvatar?.headID != nil, myAvatar?.hairID != nil, myAvatar?.eyesID != nil,
            myAvatar?.noseID != nil, myAvatar?.accID != nil else {
                self.showErrorMessage(withMessage: ErrorMessages.missingAvatarSelection)
                return
        }

        // Verifica que se hallan podido descargar las imagenes del servidor
        guard img_avatarHead.image != nil , img_avatarEyes.image != nil , img_avatarNose.image != nil , img_avatarHair.image != nil , img_avatarAcc.image != nil  else {
                self.showErrorMessage(withMessage: NetworkErrorMessage.notConexionError)
                return
        }

        // Crea una imagen combinado todas las partes y la guarda en el dispositivo y en el runtime
        let avatar = UIImage.combine(images: img_avatarHead.image!, img_avatarEyes.image!, img_avatarNose.image!, img_avatarHair.image!, img_avatarAcc.image!)

        AplicationRuntime.sharedManager.setAvatarImage(img: avatar)
        AplicationRuntime.sharedManager.setAvatarPieces(avatarPieces: myAvatar!)

        StorageFunctions.saveAvatarImage(image: avatar)
        StorageFunctions.saveAvatarInLocal(avatarPieces: myAvatar!)

        // Crea el arreglo para guardar el avatar en el servidor
        var avatarPiece: Array<RequestAvatar> = [];
        avatarPiece.append(RequestAvatar(pieceID: (myAvatar?.headID)!))
        avatarPiece.append(RequestAvatar(pieceID: (myAvatar?.eyesID)!))
        avatarPiece.append(RequestAvatar(pieceID: (myAvatar?.noseID)!))
        avatarPiece.append(RequestAvatar(pieceID: (myAvatar?.hairID)!))
        avatarPiece.append(RequestAvatar(pieceID: (myAvatar?.accID)!))

        sendRequest(formModel: avatarPiece)
//        performSegue(withIdentifier: segueID.showAvatar, sender: self)
    }

    /// Envia al servidor los datos de la actividad completada
    func sendRequest(formModel: Array<RequestAvatar>) {

        let loader = LoadingOverlay(text: LoaderStrings.recording)
        let json = Mapper().toJSONString(formModel, prettyPrint: true)
        let token = NetworkConfig.token + AplicationRuntime.sharedManager.getUserToken()
        let apiURL = NetworkPOST.AVATAR_LIST
        let method: NetworkRestMethods = .methodPOST

        var headers:[[String:String]] = []
        headers.append([NetworkConfig.headerName: NetworkConfig.headerAuthorization,
                        NetworkConfig.headerValue: token])

        loader.showOverlay(view: self.view)
        self.view.isUserInteractionEnabled = false

        Network.buildRequest(urlApi: apiURL, json: json, extraHeaders: headers, method: method, completion: { (response) in

            loader.hideOverlayView()
            self.view.isUserInteractionEnabled = true

            switch response {

            case .succeeded(let succeed, let message):
                if !succeed {
                    printDebugMessage(tag: message)
                    self.showErrorMessage(withMessage: message)
                }
                break

            case .error(let error):
                print(error.debugDescription)
                break

            case .succeededObject(_):

                self.performSegue(withIdentifier: segueID.showAvatar, sender: self)
                break

            default:
                break
            }
        })
    }
}
