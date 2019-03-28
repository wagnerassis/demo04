extension String {
    mutating func convertToTimeText(position: Int) -> String {
        self.insert(":", at: self.index(self.startIndex, offsetBy: position))
        return self
    }
}
