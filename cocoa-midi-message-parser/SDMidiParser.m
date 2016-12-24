//
//  SDMidiParser.m
//  cocoa-midi-message-parser
//
//  Created by Hill, Nathan on 12/24/16.
//  Copyright © 2016 Hill, Nathan. All rights reserved.
//

#import "SDMidiParser.h"
#import "midi.h"

@implementation SDMidiParser

+ (NSMutableArray *)convertPacketListToData: (MIDIPacketList *)packetList {
    
    
    NSLog(@"Converting a MIDI packet list with %d messages", packetList->numPackets);
    
    NSMutableArray *packets = [[NSMutableArray alloc] init];
    
    MIDIPacket *packetStruct = &packetList->packet[0];
    for (int i = 0; i < packetList->numPackets; i++) {
        
        
        NSData *packet = [[NSData alloc] initWithBytes: packetStruct->data length: packetStruct->length];
        
        
        [packets addObject: packet];
        
        packetStruct = MIDIPacketNext(packetStruct);
    }
    
    return packets;
}


@end