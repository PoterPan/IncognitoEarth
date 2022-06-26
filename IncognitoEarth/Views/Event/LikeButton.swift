import SwiftUI

struct LikeButton : View {
    @State var isPressed = false
    @State var scale : CGFloat = 1
    @State var opacity  = 0.0
    
    let btnAction: () -> Void

    var body: some View {
        Button(action:{
            btnAction()
            isPressed.toggle()
            withAnimation (.linear(duration: 0.2)) {
                scale = self.scale == 1 ? 1.3 : 1
                opacity = self.opacity == 0 ? 1 : 0
            }
        }){
            ZStack {
                Image(systemName: "heart.fill")
                    .font(.title3)
                    .opacity(isPressed ? 1 : 0)
                    .scaleEffect(isPressed ? 1.0 : 0.1)
                    .animation(.linear, value: isPressed)
                Image(systemName: "heart")
                    .font(.title3)
                    .foregroundColor(Color.mint)
            }.font(.system(size: 40))
        }
        .scaleEffect(scale)
        .foregroundColor(isPressed ? .red : .white)
        .frame(width: 60, height: 60)
        .background(Color.white)
        .clipShape(Circle())
        .shadow(radius: 1)
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(btnAction: {})
    }
}
