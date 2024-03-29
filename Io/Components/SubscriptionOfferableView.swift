//
//  SubscriptionOfferableView.swift
//  Io
//
//  Created by Carson Gross on 3/29/24.
//

import SwiftUI
import MusicKit

struct SubscriptionOfferableView<Content: View>: View {
    let itemID: MusicItemID?
    let messageIdentifier: MusicSubscriptionOffer.MessageIdentifier
    let content: Content
    
    @State private var musicSubscription: MusicSubscription?
    @State private var isShowingSubscriptionOffer = false
    @State private var subscriptionOfferOptions: MusicSubscriptionOffer.Options = .default
    
    init(
        itemID: MusicItemID? = nil,
        messageIdentifier: MusicSubscriptionOffer.MessageIdentifier = .join,
        @ViewBuilder content: () -> Content
    ) {
        self.itemID = itemID
        self.messageIdentifier = messageIdentifier
        self.content = content()
    }
    
    private var shouldOfferSubscription: Bool {
        let canBecomeSubscriber = musicSubscription?.canBecomeSubscriber ?? false
        return canBecomeSubscriber
    }
    
    var body: some View {
        Group {
            if shouldOfferSubscription {
                content
                    .overlay {
                        Color.clear
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .onTapGesture {
                                handleSubscriptionOfferButtonSelected()
                            }
                    }
            } else {
                content
            }
        }
        .task {
            for await subscription in MusicSubscription.subscriptionUpdates {
                musicSubscription = subscription
            }
        }
        .musicSubscriptionOffer(isPresented: $isShowingSubscriptionOffer, options: subscriptionOfferOptions)
    }
    
    private var subscriptionOfferButton: some View {
        Button(action: handleSubscriptionOfferButtonSelected) {
            HStack {
                Image(systemName: "applelogo")
                Text("Join")
            }
            .frame(maxWidth: 200)
        }
        .buttonStyle(.borderedProminent)
    }
    
    /// Computes the presentation state for a subscription offer.
    private func handleSubscriptionOfferButtonSelected() {
        subscriptionOfferOptions.messageIdentifier = messageIdentifier
        subscriptionOfferOptions.itemID = itemID
        isShowingSubscriptionOffer = true
    }
}

#Preview {
    SubscriptionOfferableView { }
}
