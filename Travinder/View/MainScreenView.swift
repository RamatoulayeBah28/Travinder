//
//  ContentView.swift
//  TravelApp
//
//  Created by Ramatoulaye Bah on 22/04/2025.
//

import SwiftUI

struct MainScreenView: View {
    
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    @EnvironmentObject var appState: AppState


    // MARK: - CARD VIEWS
    
   @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(travinder: travinderData[index]))
        }
        return views
    }()
    
    // MARK: MOVE THE CARD
    
    private func moveCards() {
        cardViews.removeFirst()
        self.lastCardIndex += 1
        
        let destination = travinderData[lastCardIndex % travinderData.count]
        let newCardView = CardView(travinder: destination)
        
        cardViews.append(newCardView)
    }
    
    // MARK: - TOP CARD
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }
    
    // // MARK: DRAG STATES
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    var body: some View{
      
        VStack {
            // MARK: - HEADER
            HeaderView()
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            Spacer()
            
            // MARK: - CARDS
            ZStack {
                ForEach(cardViews) { cardview in
                    cardview
                        .zIndex(self.isTopCard(cardView: cardview) ? 1 : 0)
                        .overlay(overlay(for: cardview))

                        .offset(x: self.isTopCard(cardView: cardview) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardview) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardview) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardview) ? Double(self.dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { (value, state, transaction) in
                                switch value {
                            case .first(true):
                                    state = .pressing
                            case .second(true, let drag):
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                            }
                            })
                                .onEnded({ (value) in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    if drag.translation.width > self.dragAreaThreshold {
                                        if let topCard = self.cardViews.first?.travinder {
                                            appState.favorites.append(topCard)
                                        }
                                        self.moveCards()
                                    } else if drag.translation.width < -self.dragAreaThreshold {
                                        self.moveCards()
                                        
                                        
                                    }
                                })
                )
                }
            }
            .padding(.horizontal)
            
            Spacer()
            // MARK: - FOOTER
            
        }
    }
    @ViewBuilder
    private func overlay(for cardview: CardView) -> some View {
        ZStack {
            Image(systemName: "x.circle")
                .foregroundColor(Color.white)
                .font(.system(size: 128))
                .shadow(color: Color.black.opacity(0.2), radius: 12)
                .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardview) ? 1.0 : 0.0)
            
            Image(systemName: "heart.circle")
                .foregroundColor(Color.white)
                .font(.system(size: 128))
                .shadow(color: Color.black.opacity(0.2), radius: 12)
                .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardview) ? 1.0 : 0.0)
        }
    }

    
}


#Preview {
    MainScreenView()
}
