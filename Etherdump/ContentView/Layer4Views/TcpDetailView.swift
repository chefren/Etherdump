//
//  TcpDetailView.swift
//  Etherdump
//
//  Created by Darrell Root on 2/7/20.
//  Copyright © 2020 net.networkmom. All rights reserved.
//

import SwiftUI
import PackageEtherCapture

struct TcpDetailView: View {
    var tcp: Tcp
    var body: some View {
        VStack {
            HStack {
                Text("TCP").font(.headline)
                Spacer()
                Text("\(tcp.sourcePort) > \(tcp.destinationPort)")
                Text("Flags: \(tcp.flags)")
                Text("Payload: \(tcp.payload.count) bytes")
                Spacer()
            }
            HStack {
                Text("Seq: \(tcp.sequenceNumber)")
                Text("Ack: \(tcp.acknowledgementNumber)")
                Text("Window: \(tcp.window)")
                Text("Urgent: \(tcp.urgentPointer)")
                Text("Offset: \(tcp.dataOffset)")
            }
            PayloadView(payload: tcp.payload)
        }.padding().cornerRadius(8).border(tcp.rst ? Color.red.opacity(0.7) : Color.green.opacity(0.7), width: 2).padding()
    }
}

/*struct TcpDetailView_Previews: PreviewProvider {
 static var previews: some View {
 TcpDetailView()
 }
 }*/
