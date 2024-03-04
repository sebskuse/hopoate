//
//  MockContainer.swift
//  Hopoate
//
//  Created by David Hardiman on 23/09/2019.
//  Copyright © 2018 Darjeeling Apps. All rights reserved.
//

import Foundation
import Hopoate

/// The container to use for dependencies in tests.
public var TestMockContainer: DependencyContainer = .shared

/// Encapsulates registration of a given mock against a protocol
/// in the DI container. Registration / removal follows the
/// object lifecycle - initialisation will register the mock, and
/// as soon as the object is destroyed the mock is removed.
/// Usage:
/// let mock: MockContainer<Router, MockRouter> = MockContainer(MockRouter())
public class MockContainer<Type, Mock> {
    private let registration: ServiceRegistration<Type>

    public let mock: Mock

    public init(_ mock: Type) {
        // swiftlint:disable:next force_cast If your Mock doesn't conform to Type you're going to have a bad time
        self.mock = mock as! Mock
        registration = TestMockContainer.register(service: Type.self) {
            mock
        }
    }

    deinit {
        TestMockContainer.remove(registration)
    }
}
