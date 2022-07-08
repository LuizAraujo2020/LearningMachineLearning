//
//  TextPreviewView.swift
//  ScanAndRecognizeText
//
//  Created by Gabriel Theodoropoulos.
//

import SwiftUI

struct TextPreviewView: View {
    var text: String
    @State var names = [TextItem]()
    @State var selectedFilter = TypesOfTaggers.none
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            
            VStack {
                HStack {
                    Button {
                        if selectedFilter == .personalName {
                            selectedFilter = .none
                        } else {
                            selectedFilter = .personalName
                        }
                        
                    } label: {
                        ButtonView(title: Constants.texts.buttonNamesTextPreviewView, sfSymbol: "person.crop.circle.badge.questionmark", isSelected: selectedFilter == .personalName, width: width / 5)
                    }
                    
                    Button {
                        if selectedFilter == .organizationName {
                            selectedFilter = .none
                        } else {
                            selectedFilter = .organizationName
                        }
                        
                        
                    } label: {
                        ButtonView(title: Constants.texts.buttonOrganizationsTextPreviewView, sfSymbol: "briefcase.circle", isSelected: selectedFilter == .organizationName, width: width / 5)
                    }
                    
                    Button {
                        if selectedFilter == .placeName {
                            selectedFilter = .none
                        } else {
                            selectedFilter = .placeName
                        }
                        
                    } label: {
                        ButtonView(title: Constants.texts.buttonPlacesTextPreviewView, sfSymbol: "location.circle", isSelected: selectedFilter == .placeName, width: width / 5)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: Constants.sizes.cornerRadius)
                        .foregroundColor(.white)
                    
                    ScrollView {
                        if selectedFilter == .none {
                            Text(text)
                                .font(.body)
                                .foregroundColor(.gray)
                                .padding()
                            
                        } else {
                            LazyVStack(alignment: .leading, spacing: Constants.sizes.listTextSpacing, content: {
                                ForEach(LinguisticTagger.getNames(text: text, typesOfTaggers: selectedFilter), id: \.id) { item in
                                    Text(item.text)
                                        .padding([.leading, .top])
                                }
                            })
                        }
                    }
                }
            }
            .padding()
        }
        .background(Constants.colors.paper)
    }
}

struct TextPreviewView_Previews: PreviewProvider {
    static var previews: some View {
//        TextPreviewView(text: """
//With the release of SwiftUI, you can now develop the app's UI with a declarative Swift syntax in Xcode. What that means to you is that the UI code is easier and more natural to write. Compared with the existing UI frameworks like UIKit, you can create the same UI with way less code.
//
//The preview function has always been a weak point of Xcode. While you can preview simple layouts in Interface Builder, you usually can't preview the complete UI until the app is loaded onto the simulators. With SwiftUI, you get immediate feedback of the UI you are coding. For example, you add a new record to a table, Xcode renders the UI change on the fly in a preview canvas. If you want to preview how your UI looks in dark mode, you just need to change an option. This instant preview feature simply makes UI development a breeze and iteration much faster.
//
//Not only does it allow you to preview the UI, the new canvas also lets you design the user interface visually using drag and drop. What's great is that Xcode automatically generates the SwiftUI code as you add the UI component visually. The code and the UI are always in sync. This is a feature Apple developers anticipated for a long time.
//"""
//                        , names: [TextItem()])
//    }
        
            TextPreviewView(text: """
Planning for Metro began with the Mass Transportation Survey in 1955 which attempted to forecast both freeway and mass transit systems sufficient to meet the needs of 1980.[1] In 1959, the study's final report included two rapid transit lines which anticipated subways in downtown Washington.[2] Because the plan called for extensive freeway construction within the District of Columbia, alarmed residents lobbied for federal legislation creating a moratorium on freeway construction through July 1, 1962.[3] The National Capital Transportation Agency's 1962 Transportation in the National Capital Region report anticipated much of the present Blue Line route in Virginia with the route following the railroad right-of-way inside Arlington and Alexandria to Springfield.[4] It did not include a route in Prince George's County.[4] The route continued in rapid transit plans until the formation of WMATA.

With the formation of WMATA in October 1966, planning of the system shifted from federal hands to a regional body with representatives of the District, Maryland and Virginia. Congressional route approval was no longer a key consideration.[5] Instead, routes had to serve each local suburban jurisdiction to assure that they would approve bond referenda to finance the system.[6]

The Virginia portion of the Blue Line took much of its present form along the Richmond, Fredericksburg and Potomac Railroad right-of-way to Colchester, as construction along existing right-of-way is the least expensive way to build into the suburbs.[7] A surface-level section of the Blue Line that parallels Virginia State Route 110 where passing Arlington National Cemetery and traveling between The Pentagon and Rosslyn replaced a section of the closed Rosslyn Connecting Railroad, a subsidiary of the Pennsylvania Railroad.[8][9][better source needed] The railroad's predecessor, the Washington Southern Railway, constructed the section in 1896 within the grade of the old disused Alexandria Canal.[9][10]

In March 1968, the WMATA board approved its 98-mile (158 km) Adopted Regional System (ARS) which included the Blue Line from Huntington to Addison Road, with a possible extension to Largo.[11] The ARS contained a Blue Line/Orange Line station at Oklahoma Avenue between Stadium/Armory and the Anacostia River Bridge. Local residents objected to a proposed 1,000-car commuter parking lot at that station and the traffic that it would generate in the neighborhood. In reaction to their lobbying, the DC government insisted that the station be removed and that the tunnel for the line be extended through the neighborhood.[12] This then made the line the only one to have a station canceled due to neighborhood opposition.[13] To be constructed as an above ground station in the parking lot north of RFK Stadium near Oklahoma Avenue, the station was canceled saving Metro $12 million and the alignment of the line was shifted slightly to the east to address neighbor concerns.[13] To better accommodate tourists, a Smithsonian station exit was added on the Mall and the federal government requested in 1972 that the Arlington Cemetery Station be added to the Blue Line. The federal government paid the cost of both design changes.[14]


Addison Road station
Service on the Blue Line began on July 1, 1977, on 18 stations between National Airport in Arlington and Stadium-Armory in Washington – the first link of the Metro to Virginia.[15][16] The line was extended by three stations to Addison Road on November 22, 1980.[17] Service south of National Airport began on June 15, 1991 when Van Dorn Street opened.[18] The original plan for the line was completed when this link was extended to Franconia–Springfield on June 29, 1997.[19] Two new stations in Maryland – Morgan Boulevard and Largo Town Center – opened on December 18, 2004.[20]

From its opening on November 20, 1978, until December 11, 1979, the Orange Line was co-aligned with the Blue Line from National Airport to Stadium-Armory, with the Orange Line continuing east from Stadium-Armory to New Carrollton.[21] Beginning December 1, 1979, the Orange Line diverged westward from Rosslyn to Ballston.[22] The Blue and Orange Lines remain co-aligned from Rosslyn to Stadium-Armory and the Silver Line is co-signed along the same route as well.[23]


Farragut West Station
The Blue Line was originally planned to follow a slightly different route. The plan would have sent Blue Line trains to Huntington, with Yellow Line trains serving Franconia–Springfield. This was changed due to a shortage of rail cars at the time of the completion of the line to Huntington. Because fewer rail cars were required to operate Yellow Line service than would be required to run Blue Line service out to Huntington – due to the Yellow Line's shorter route – the line designations were switched.[24] From 1999 to 2008, the Blue Line operated to Huntington on July 4, as part of Metro's special Independence Day service pattern.[25]

The ARS had the Blue Line end at Addison Road. However, sports fans continually argued for a three-mile (4.8 km) extension to the Capital Centre sports arena in Largo, Maryland. On February 27, 1997, the WMATA board approved construction of the extension.[16] By the time the extension opened in 2004, professional basketball and hockey had relocated to a new arena atop the Gallery Place Station and the Capital Centre was replaced with a shopping mall. However, the extension still drew considerable sport spectator traffic because it is within walking distance of the FedExField football stadium.[26] The extension cost $456 million.[27]

In 1998, Congress changed the name of the Washington National Airport to the Ronald Reagan Washington National Airport with the law specifying that no money be spent to implement the name change. As a result, WMATA did not change the name of the National Airport Station (which never included the full name of the airport). In response to repeated inquiries from Republican congressmen that the station be renamed, WMATA stated that stations are renamed only at the request of the local jurisdiction. Because both Arlington County and the District of Columbia were controlled by Democrats, the name change was blocked. Not until 2001 did Congress make changing the station's name a condition of further federal funding.[28][29][30][31]

In May 2018, Metro announced an extensive renovation of platforms at twenty stations across the system. To accommodate these platform reconstructions, Blue and Yellow Lines south of Ronald Reagan Washington National Airport would be closed from May to September 2019, in what would be the longest line closure in Metro's history. All trains terminated at Ronald Reagan Airport as a result.[32][33][34][35]

From March 26, 2020 until June 28, 2020, trains were bypassing Van Dorn Street, Arlington Cemetery, Federal Triangle, Smithsonian, Federal Center SW, and Morgan Boulevard stations due to the 2020 coronavirus pandemic.[36][37] All stations (except Arlington Cemetery) reopened beginning on June 28, 2020.[38] Arlington Cemetery station was later reopened on August 23, 2020.[39]

Beginning on November 27, 2020 until March 14, 2021, Blue Line trains began serving Huntington and Eisenhower Avenue stations during most weekends due to Metro modernizing the signal system at Alexandria Rail Yard causing both Franconia–Springfield and Van Dorn Street stations to be closed. Additionally, trains operated to Huntington between December 20, 2020 and January 3, 2021 due to a full closure at Alexandria Rail Yard. Metro choose to do a full shutdown instead of single tracking because completing the same work with weekend single tracking could more than double the time for completion, while providing severely limited rail service with waits up to 36 minutes between trains.[40] However work was completed three weeks earlier.

On December 14, 2020, WMATA announced that Blue Line service will be suspended between February 13 to May 23, 2021 in order to rebuild the platforms at both Arlington Cemetery and Addison Road. Additional Yellow Line trains will operate between Franconia–Springfield and Mount Vernon Square while Silver Line trains will serve in part of the Blue Line.[41]

Route

Franconia–Springfield Station
The southwestern terminal of the Blue Line is the Franconia–Springfield Station located at the intersection of Frontier Drive and the Franconia-Springfield Parkway (Virginia Route 289). The line travels above ground along the CSX Railroad right of way where it joins the Yellow Line just south of King Street in Old Town Alexandria. The joint line continues north along the CSX Railroad until it curves to the east on an elevated bridge adjacent to the National Airport terminal. The Blue Line then enters a subway tunnel under 15th Street South in Crystal City and bends north under Hayes Street and then The Pentagon parking lots. The Blue Line separates from the Yellow Line in this tunnel and emerges on surface tracks that parallel Virginia State Route 110 before entering a tunnel south of Rosslyn, where it merges with the Orange Line and Silver Line. The tunnel travels under North Lynn Street and then the Potomac River where it bends to the east and travels under I Street NW. The tunnel bends south under 12th Street NW and crosses under the Red Line in the Metro Center station. The tunnel then turns east under D Street SW, where it passes under the Yellow and Green Lines in the L'Enfant Plaza station. The tunnel continues east under Pennsylvania Avenue SE, G Street SE and Potomac Avenue SE. The Blue Line then bends north under 19th Street SE and transitions to an elevated line in the RFK Stadium parking lot near Oklahoma Avenue NE. The Blue Line crosses the Anacostia River on a bridge adjacent to Benning Road NE. At this point the line splits from the Orange Line and enters a tunnel under Benning Road and East Capitol Street. The Blue Line and Silver Line become a surface or elevated route with short tunnels parallel to Central Avenue from Addison Road – Seat Pleasant to its Eastern terminal at Largo Town Center, where it ends adjacent to the parking lots of "The Blvd" shopping center.[42]

In terms of WMATA's internal route designations, the Blue Line service travels along the entirety of the J Route (from the terminus at Franconia-Springfield to the C & J junction just south of King Street), part of the C Route (from the C & J junction just south of King Street to Metro Center), part of the D Route (from Metro Center to the D & G Junction just east of Stadium-Armory) and the entire G Route (from the D & G junction past Stadium-Armory to the terminus at Largo Town Center).[43] The Blue Line needs 23 six-car trains (138 rail cars) to run at peak capacity.[44]


"""
                            , names: [TextItem()])
        }
}

