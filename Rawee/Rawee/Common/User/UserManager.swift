//
//  UserManager.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 07/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

struct SignInQuery {
    let login: String
    let password: String
}

struct SignUpQuery {
    let login: String
    let password: String
    let name: String?
}

protocol UserManagerType {
    var isLogged: Bool { get }
    var member: Member? { get set }
    func addMemberListener(listener: @escaping ((Member?) -> Void))
    func signIn(params: SignInQuery, success: @escaping ((Member) -> Void), failure: @escaping ((Error) -> Void))
    func signUp(params: SignUpQuery, success: @escaping ((Member) -> Void), failure: @escaping ((Error) -> Void))
    func signOut(success: (() -> Void), failure: ((Error) -> Void))
}

class UserManager: UserManagerType {

    static let current: UserManager = UserManager()

    var isLogged: Bool {
        return member != nil
    }

    private var memberListeners: [((Member?) -> Void)] = []
    
    var member: Member? {
        didSet {
            memberListeners.forEach { completion in
                completion(member)
            }
        }
    }

    func addMemberListener(listener: @escaping ((Member?) -> Void)) {
        memberListeners.append(listener)
    }

    func signIn(params: SignInQuery, success: @escaping ((Member) -> Void), failure: @escaping ((Error) -> Void)) {
        let member = Member(id: 0)
        self.member = member
        success(member)
    }

    func signUp(params: SignUpQuery, success: @escaping ((Member) -> Void), failure: @escaping ((Error) -> Void)) {
        let member = Member(id: 0)
        self.member = member
        success(member)
    }

    func signOut(success: (() -> Void), failure: ((Error) -> Void)) {
        member = nil
        success()
    }
}
