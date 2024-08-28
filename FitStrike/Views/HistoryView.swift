import SwiftUI

struct HistoryView: View {
	let today = Date()
	let yesterday = Date().addingTimeInterval(-86400)
	
	let exercisesToday = ["Squat", "Step Up", "Burpee", "Sun Salute"]
	let exercisesYesterday = ["Squat", "Step Up", "Burpee"]
	
	
	var body: some View {
		VStack {
			Text("History")
				.font(.title)
				.padding()
			
			Form {
				// TODO: Turn into a view itself
				Section(
					header: Text(today.formatted(as: "MMM d")).font(.headline)
				){
					ForEach(exercisesToday, id: \.self) { exercise in 
						Text(exercise)
					}
				}
				Section(
					header: Text(yesterday.formatted(as: "MMM d")).font(.headline)
				){
					ForEach(exercisesYesterday, id: \.self) { exercise in 
						Text(exercise)
					}
				}
			}
		}
	}
}

#Preview {
	HistoryView()
}
