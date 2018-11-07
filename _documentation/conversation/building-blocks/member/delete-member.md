---
title: Delete a Member
---

# Delete a Member

In this building block you will see how to delete a Member.

## Example

Ensure the following variables are set to your required values using any convenient method:

Key | Description
-- | --
`CONVERSATION_ID` | The unique ID of the Conversation.
`MEMBER_ID` | The unique ID of the member.

```building_blocks
source: '_examples/conversation/member/delete-member'
application:
  use_existing: |
    You will need to use an existing Application that contains a Conversation and at least one Member in order to be able to delete a Member. See the Create Conversation building block for information on how to create an Application and some sample Conversations.
```

## Try it out

When you run the code you will delete the specified Member.
