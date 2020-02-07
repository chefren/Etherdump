//
//  ContentView.swift
//  Etherdump
//
//  Created by Darrell Root on 1/30/20.
//  Copyright © 2020 net.networkmom. All rights reserved.
//

import SwiftUI
import PackageEtherCapture

struct ContentView: View {
    @State var frames: [Frame] = []
    @State var activeFrame: Frame? = nil
    @State var layer3Filter: FilterIpVersion = .any

    init(frames: [Frame] = []) {
        _frames = State<[Frame]>(initialValue: frames)
    }
    var body: some View {
        VStack(spacing: 0) {
            CaptureFilterView(frames: self.$frames)
            DisplayFilterView(layer3Filter: $layer3Filter)
            FrameSummaryView(frames: self.$frames,activeFrame:  self.$activeFrame, layer3Filter: self.$layer3Filter)
            if activeFrame != nil {
                Layer2DetailView(frame: self.$activeFrame)
            }
            if activeFrame != nil {
                Layer3DetailView(frame: self.$activeFrame)
            }
            if activeFrame != nil {
                Layer4DetailView(frame: self.$activeFrame)
            }

            Text(activeFrame?.hexdump ?? "")
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(frames: [Frame.sampleFrame])
    }
}
