//
//  SearchRepositoriesResponse.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/05.
//

import Foundation

struct SearchRepositoriesResponse: Codable {
    var totalCount: Int?
    var incompleteResults: Bool?
    var items: [Item]?

    enum CodingKeys: String, CodingKey {
        case totalCount
        case incompleteResults
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    var id: Int?
    var nodeId: String?
    var name: String?
    var fullName: String?
    var itemPrivate: Bool?
    var owner: Owner?
    var htmlUrl: String?
    var itemDescription: String?
    var fork: Bool?
    var url: String?
    var forksUrl: String?
    var keysUrl: String?
    var collaboratorsUrl: String?
    var teamsUrl: String?
    var hooksUrl: String?
    var issueEventsUrl: String?
    var eventsUrl: String?
    var assigneesUrl: String?
    var branchesUrl: String?
    var tagsUrl: String?
    var blobsUrl: String?
    var gitTagsUrl: String?
    var gitRefsUrl: String?
    var treesUrl: String?
    var statusesUrl: String?
    var languagesUrl: String?
    var stargazersUrl: String?
    var contributorsUrl: String?
    var subscribersUrl: String?
    var subscriptionUrl: String?
    var commitsUrl: String?
    var gitCommitsUrl: String?
    var commentsUrl: String?
    var issueCommentUrl: String?
    var contentsUrl: String?
    var compareUrl: String?
    var mergesUrl: String?
    var archiveUrl: String?
    var downloadsUrl: String?
    var issuesUrl: String?
    var pullsUrl: String?
    var milestonesUrl: String?
    var notificationsUrl: String?
    var labelsUrl: String?
    var releasesUrl: String?
    var deploymentsUrl: String?
    var createdAt: String?
    var updatedAt: String?
    var pushedAt: String?
    var gitUrl: String?
    var sshUrl: String?
    var cloneUrl: String?
    var svnUrl: String?
    var homepage: String?
    var size: Int?
    var stargazersCount: Int?
    var watchersCount: Int?
    var language: String?
    var hasIssues: Bool?
    var hasProjects: Bool?
    var hasDownloads: Bool?
    var hasWiki: Bool?
    var hasPages: Bool?
    var forksCount: Int?
    var mirrorUrl: String?
    var archived: Bool?
    var disabled: Bool?
    var openIssuesCount: Int?
    var license: License?
    var forks: Int?
    var openIssues: Int?
    var watchers: Int?
    var defaultBranch: String?
    var score: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeId
        case name
        case fullName
        case itemPrivate
        case owner
        case htmlUrl
        case itemDescription
        case fork
        case url
        case forksUrl
        case keysUrl
        case collaboratorsUrl
        case teamsUrl
        case hooksUrl
        case issueEventsUrl
        case eventsUrl
        case assigneesUrl
        case branchesUrl
        case tagsUrl
        case blobsUrl
        case gitTagsUrl
        case gitRefsUrl
        case treesUrl
        case statusesUrl
        case languagesUrl
        case stargazersUrl
        case contributorsUrl
        case subscribersUrl
        case subscriptionUrl
        case commitsUrl
        case gitCommitsUrl
        case commentsUrl
        case issueCommentUrl
        case contentsUrl
        case compareUrl
        case mergesUrl
        case archiveUrl
        case downloadsUrl
        case issuesUrl
        case pullsUrl
        case milestonesUrl
        case notificationsUrl
        case labelsUrl
        case releasesUrl
        case deploymentsUrl
        case createdAt
        case updatedAt
        case pushedAt
        case gitUrl
        case sshUrl
        case cloneUrl
        case svnUrl
        case homepage
        case size
        case stargazersCount
        case watchersCount
        case language
        case hasIssues
        case hasProjects
        case hasDownloads
        case hasWiki
        case hasPages
        case forksCount
        case mirrorUrl
        case archived
        case disabled
        case openIssuesCount
        case license
        case forks
        case openIssues
        case watchers
        case defaultBranch
        case score
    }
}

// MARK: - License
struct License: Codable {
    var key: String?
    var name: String?
    var spdxId: String?
    var url: String?
    var nodeId: String?

    enum CodingKeys: String, CodingKey {
        case key
        case name
        case spdxId
        case url
        case nodeId
    }
}

// MARK: - Owner
struct Owner: Codable {
    var login: String?
    var id: Int?
    var nodeId: String?
    var avatarUrl: String?
    var gravatarId: String?
    var url: String?
    var htmlUrl: String?
    var followersUrl: String?
    var followingUrl: String?
    var gistsUrl: String?
    var starredUrl: String?
    var subscriptionsUrl: String?
    var organizationsUrl: String?
    var reposUrl: String?
    var eventsUrl: String?
    var receivedEventsUrl: String?
    var type: String?
    var siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeId
        case avatarUrl
        case gravatarId
        case url
        case htmlUrl
        case followersUrl
        case followingUrl
        case gistsUrl
        case starredUrl
        case subscriptionsUrl
        case organizationsUrl
        case reposUrl
        case eventsUrl
        case receivedEventsUrl
        case type
        case siteAdmin
    }
}
