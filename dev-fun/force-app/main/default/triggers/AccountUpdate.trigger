//Post chatter message on a specific group with account information when specific criteria on an Account is met.
trigger AccountUpdate on Account(after update) {  
    if(trigger.isAfter) {
        createChatterPostAstroAccount.afterInsert(Trigger.new);
    }
}