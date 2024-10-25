import SwiftUI

struct AddBeneficiaryView: View {
    
    @State private var ibanInput: String = ""
    @State private var isShowingDetailView = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40) {
                
                Text("Scannez, importez ou saisissez l'IBAN")
                    .lineLimit(0)
                    .foregroundStyle(.white)
                    .font(.subheadline)
                
//                VStack {

                
                CustomTextField(
                    placeholder: "FR76 XXXX",
                    text: $ibanInput,
                    isValid: $ibanInput.wrappedValue.isValidFrenchIBAN,
                    errorMessage: "IBAN invalide. Veuillez vérifier et réessayer."
                )
                
                Spacer()
                
                RoundedButton(
                    title: "Scanner",
                    image: Image(systemName: "camera.fill"),
                    action: {
                        isShowingDetailView = true
                    },
                    backgroundColor: .clear,
                    borderColor: Color("BorderColor"),
                    textColor: Color("BorderColor")
                )
                .sheet(isPresented: $isShowingDetailView) {
                    IbanScannerView(
                        isScannerPresented: $isShowingDetailView,
                        iban: $ibanInput
                    )
                }
            }
            .padding()
            .background(.black)
            .navigationTitle("Scanner votre IBAN")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddBeneficiaryView()
}
