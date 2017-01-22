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

midi_message_parser_t *_messageParser = NULL;
id<SDLoggerDelegate> _loggerDelegate = nil;

- (id)init {
    self = [super init];
    
    if (self) {
        _messageParser = new_midi_message_parser();
    }
    
    return self;
}

- (void)dealloc {
    free_midi_message_parser(_messageParser);
}

- (NSMutableArray *)parsePacketList: (MIDIPacketList *)packetList {
    
    [self log: @"Converting a MIDI packet list with %d messages", packetList->numPackets];
    
    NSMutableArray *wrappedMidiMessages = [[NSMutableArray alloc] init];
    
    MIDIPacket *packet = &packetList->packet[0];
    for (int i = 0; i < packetList->numPackets; i++) {
        
        midi_message_queue_t *messageQueue = parse_midi_messages(_messageParser, packet->data, packet->length);
        
        if (messageQueue) {
            
            for (int i = 0; i < messageQueue->length; i++) {
                midi_message_t *message = messageQueue->messages[0];
                
                NSData *wrappedMessage = [[NSData alloc] initWithBytes: message->bytes length: message->bytes_length];
                
                [wrappedMidiMessages addObject: wrappedMessage];
            }
            
            free_midi_message_queue(messageQueue);
        }
        packet = MIDIPacketNext(packet);
    }
    
    return wrappedMidiMessages;
}

- (void)addLoggerDelegate:(id<SDLoggerDelegate>)delegate {
    _loggerDelegate = delegate;
}

- (void) log: (NSString *)formatString, ... {
    
    if (!_loggerDelegate) {
        return;
    }
    
    va_list args;
    va_start(args, formatString);
    NSString *message = [[NSString alloc] initWithFormat:formatString arguments:args];
    va_end(args);
    [_loggerDelegate log: message];
}

@end
