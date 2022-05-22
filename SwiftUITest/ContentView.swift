//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Andrew on 2022/05/22.
//

import SwiftUI


struct ContentModel {
    var values = [
        "주불" : "주소 불러의 줄임말",
        "스불재" : "스스로 불러온 재앙의 줄임말",
        "혼틈" : "혼란을 틈탄다는 뜻",
        "만반잘부" : "만나서 반가워 잘 부탁해의 줄임말",
        "멍청비용" : "멍청하게 낭비하는 돈을 뜻함",
        "내또출" : "내일 또 출근",
        "삼귀다" : "사귀다의 사를 삼으로 바꾼 말로  사귀기전의 썸을 타는 단계를 뜻하는 말",
        "나심비" : "가심비의 가를 나로 바꿔 나(본인)의 심리를 만족시킨다는 뜻",
        "오저치고" : "오늘 저녁 치킨 고?의 줄임말",
        "비담" : "비주얼 담당의 줄임말",
        "쉽살재빙" : "쉽게 살면 재미없어 빙고의 줄임말",
        "어퍼웨어" : "화상회의나 개인방송시 상의만 신경쓰는 현상 ( 영어와 재택근무 및 개인방송 등이 맞물린 신조어 )",
        "꾸안꾸" : "꾸미지 않은듯 꾸민듯 하다를 뜻함",
        "좋댓구알" : "좋아요 댓글 구독 알림설정의 줄임말",
        "복세편살" : "복잡한 세상 편하게 살자의 줄임말",
        "억텐" : "억지 텐션의 줄임말",
        "일코노미" : "이코노미의 변형어로 일(1)인 가구의 소비트랜드를 뜻하는 말",
        "슬세권" : "역세권의 변형어로 역을 슬리퍼의 슬로 바꿔 슬리퍼를 신고 돌아다닐수 있는 곳을 뜻함",
        "스세권" : "슬세권처럼 역세권의 변형어로 역을 스타벅스의 스로 바꿘 스타벅스 세권의 합성어",
        "맥세권" : "스세권과 마찬가지로 맥도날드와 세권의 합성어",
        "갑통알" : "갑자기 통장을 보니 알바를 해야할 정도로 돈이 없음을 뜻함",
        "스라밸" : "일과 삶의 균형을 뜻하는 워라밸의 변형된 말로 스터디(Study)+라이프(Life)+밸런스(Balance)합성어",
        "고스팅" : "Gost(유령) 와 ing의 합성어 ( 유령처럼 잠수타서 안보이는 사람을 뜻함 )",
        "제당슈만" : "제가 당신을 슈퍼스타로 만들어드리겠습니다의 줄임말",
        "군싹" : "군침이 싹도네(싹돈다) 라는 뜻",
        "편리미엄" : "편리함이 프리미엄이다라는 뜻으로 가격보다는 편리한게 중요하다는 말",
        "추미스" : "추리 미스터리 스릴러의 줄임말",
        "H워얼V" : "사랑해( 글자를 뒤집어 거꾸로 360도 돌려서 보면 사랑해가 된다.)",
        "팬아저" : "팬이 아니지만 저장 한다는 뜻",
        "먹노매" : "먹이를 노리는 매의눈의 줄임말",
        "롬곡" : "눈물 ( 글자를 360도 돌려서 보면 눈물 이 된다 )",
        "좋못사" : "좋아하다 못해 사랑한다의 줄임말",
        "핑프" : "핑거 프린세스( 궁금한게 생기면 손가락으로 인터넷 검색을 하는 사람들을 지칭 )",
        "알잘딱깐센" : "알아서 잘 딱 깔끔하고 센스있게의 줄임말",
        "자만추" : "자연스러운 만남 추구의 줄임말",
        "스좀비" : "스마트폰과 좀비의 합성어로 스마트폰만 보며 앞도 제대로 안보고 좀비처럼 걷는 사람들을 뜻함",
        "팬슈머" : "좋아하는 사람을 뜻하는 영어 팬과 소비자를 뜻하는 영어 컨슈머의 합성어로 제품의 기획부터 출시 후 소비까지 함께하는 소비자를 뜻하는, 말",
        "에어노마드족" : "미세먼지나 오염이 없는 깨끗한 공기를 찾아 가는 사람들을 뜻함",
        "인방" : "인터넷 방송의 줄임말",
        "임구" : "이미 구독의 줄임말",
        "싫테" : "싫어요 테러의 줄임말",
        "반신" : "반말 모드 신청의 줄임말",
        "설참" : "설명 참고(참조)의 줄임말",
        "반박" : "반말 모드 박탈의 줄임말",
        "닉차" : "닉네임 차별의 줄임말",
        "전공" : "전체 공개의 줄임말",
        "구취" : "구독 취소의 줄임말",
        "불소" : "불타는 소통의 줄임말",
        "톡디" : "톡 아이디의 줄임말",
        "실매" : "실시간 매니저의 줄임말"
    ]

    
    func getDescription(about word: String) -> String {
        values[word] ?? ""
    }
    
    func getSearchResults(from text: String) -> [String] {
        values.keys.filter { $0.contains(text) }
    }
}


class ContentViewModel: ObservableObject {
    
    let model: ContentModel!
     var searchText = "" {
        didSet{
            description = model.getDescription(about: searchText)
            searchResults = model.getSearchResults(from: searchText)
        }
    }
    
    init(model: ContentModel = ContentModel()){
        self.model = model
    }
    
    
    @Published var description = ""
    @Published var searchResults:[String] = []
}

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(viewModel.searchResults, id: \.self) { name in
                        NavigationLink(destination: Text(name)) {
                            Text(name)
                        }
                    }
                }
                .searchable(text: $viewModel.searchText) {
                    if viewModel.searchResults.isEmpty && (searchText.isEmpty == false) {
                        Text("Theres no \(searchText)")
                    }
                }
                .navigationTitle("Contacts")
                
                VStack {
                    Text(viewModel.description).frame(width: nil, height: 300, alignment: .leading)
//                    EmptyView
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


