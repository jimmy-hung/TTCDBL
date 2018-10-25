public class TTCDBL : NSObject{
    
    var blogURL = UserDefaults().string(forKey: "blogUrl") ?? ""
    var switchURL = UserDefaults().array(forKey: "switchUrl") ?? []
    
    // 將值存入userdefault
    public func makeAPair(a: String, b: Array<Any>)
    {
        UserDefaults().set(a, forKey: "blogUrl")
        UserDefaults().set(b, forKey: "switchUrl")
    }
    
    // 正規表達式 - parse
    public func extractStr(_ str:String, _ pattern:String) -> String
    {
        do{
            let regex = try NSRegularExpression(pattern: pattern , options: .caseInsensitive)
            
            let firstMatch = regex.firstMatch(in: str, options: .reportProgress, range: NSMakeRange(0, str.count))
            if firstMatch != nil {
                let resultRange = firstMatch?.range(at: 0)
                let result = (str as NSString).substring(with: resultRange!)
                //print(result)
                return result
            }
        }catch{
            print(error)
            return ""
        }
        return ""
    }
    
    // 用正規表達式解析 html
    public func parseFromWebInfo(yourURL: String, htmlData: String)
    {
        do
        {
            let url = yourURL
            var str = htmlData
                //try String(contentsOf: URL.init(string: url)!, encoding: .utf8)
            
            str = str.replacingOccurrences(of: "\n", with: "")
            str = str.replacingOccurrences(of: " ", with: "")
            
            let need = "✔✔(.*?)✔"
            let needInfo:String = extractStr(str, need)
            // 確認目標欄位的資料
            print("1. needInfo: \(needInfo)")
            
            let firstStr = needInfo.substring(to: needInfo.index(needInfo.startIndex, offsetBy: 2))
            let endStr =  needInfo[needInfo.index(before: needInfo.endIndex)]
            
            // 比對頭尾字符是否一致
            print("2. firstStr: \(firstStr)")
            print("3. endStr: \(endStr)")
            
            blogURL = url
            
            if firstStr == "✔✔" && endStr == "✔"
            {
                print("YES")
                
                let iNeed = needInfo.replacingOccurrences(of: "✔", with: "")
                let iWant = iNeed.replacingOccurrences(of: "@", with: "")
                
                switchURL = iWant.components(separatedBy: "+")
                
                makeAPair(a: blogURL, b: switchURL)
                
            }else
            {
                print("NO")
                
                makeAPair(a: blogURL, b: switchURL)
            }
        }
        catch
        {
            makeAPair(a: blogURL, b: switchURL)
            print(error)
        }
    }
}
