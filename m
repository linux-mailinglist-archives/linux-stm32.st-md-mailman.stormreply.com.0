Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADEF564E92
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jul 2022 09:23:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0E38C640EC;
	Mon,  4 Jul 2022 07:23:17 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D977C04005
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 13:13:24 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BA2B41F8D0;
 Thu, 30 Jun 2022 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1656594803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=az2PcmLsfEyzYuYIxAQ6rsUqJQi4Vdffo4HR1jW5Or8=;
 b=JJ4uujP9SF4zLf7LbDiy17w8clfiG1Cx9LdLEwmO+1NEjL/aSXH4bYagqTBYcCP2i0bXqg
 VARxnuhaJw9fuX79/pSuqsQl4pPQ4lkuKJF16KQbZdG679q06WczXdAt6X67thgnmKbAIL
 BnfD+sB0u7dKwDSYpYmQTjCWAt9eG4g=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 822C52C141;
 Thu, 30 Jun 2022 13:13:23 +0000 (UTC)
Date: Thu, 30 Jun 2022 15:13:20 +0200
From: Petr Mladek <pmladek@suse.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <Yr2hcGLDNT0k91aS@alley>
References: <20220617143758.137307-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220617143758.137307-1-antonio.borneo@foss.st.com>
X-Mailman-Approved-At: Mon, 04 Jul 2022 07:23:17 +0000
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 John Ogness <john.ogness@linutronix.de>, Kieran Bingham <kbingham@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] scripts/gdb: fix 'lx-dmesg' on 32 bits
	arch
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri 2022-06-17 16:37:58, Antonio Borneo wrote:
> The type atomic_long_t can have size 4 or 8 bytes, depending on
> CONFIG_64BIT; it's only content, the field 'counter', is either an
> int or a s64 value.
> 
> Current code incorrectly uses the fixed size utils.read_u64() to
> read the field 'counter' inside atomic_long_t.
> 
> On 32 bits architectures reading the last element 'tail_id' of the
> struct prb_desc_ring:
> 	struct prb_desc_ring {
> 		...
> 		atomic_long_t tail_id;
> 	};
> causes the utils.read_u64() to access outside the boundary of the
> struct and the gdb command 'lx-dmesg' exits with error:
> 	Python Exception <class 'IndexError'>: index out of range
> 	Error occurred in Python: index out of range
> 
> Use the existing utils.read_ulong() to read 'counter' inside the
> atomic_long_t.

I was about to accept this. But then I wondered if we could somehow
detect the really used atomic_long_t counter type size.

I have updated your patch. It works for me on x86_64.
Could you please check it on 32-bit system?

Here is the patch:

From bb5b6a7ad6f4339a1102585c691cb725182c0acf Mon Sep 17 00:00:00 2001
From: Antonio Borneo <antonio.borneo@foss.st.com>
Date: Fri, 17 Jun 2022 16:37:58 +0200
Subject: [PATCH] scripts/gdb: fix 'lx-dmesg' on 32 bits arch

The type atomic_long_t can have size 4 or 8 bytes, depending on
CONFIG_64BIT; it's only content, the field 'counter', is either an
int or a s64 value.

Current code incorrectly uses the fixed size utils.read_u64() to
read the field 'counter' inside atomic_long_t.

On 32 bits architectures reading the last element 'tail_id' of the
struct prb_desc_ring:
	struct prb_desc_ring {
		...
		atomic_long_t tail_id;
	};
causes the utils.read_u64() to access outside the boundary of the
struct and the gdb command 'lx-dmesg' exits with error:
	Python Exception <class 'IndexError'>: index out of range
	Error occurred in Python: index out of range

Query the really used atomic_long_t counter type size.

Fixes: e60768311af8 ("scripts/gdb: update for lockless printk ringbuffer")
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
[pmladek@suse.com: Query the really used atomic_long_t counter type size]
Link: https://lore.kernel.org/r/20220617143758.137307-1-antonio.borneo@foss.st.com
---
 scripts/gdb/linux/dmesg.py |  9 +++------
 scripts/gdb/linux/utils.py | 14 ++++++++++++--
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/scripts/gdb/linux/dmesg.py b/scripts/gdb/linux/dmesg.py
index d5983cf3db7d..c771831eb077 100644
--- a/scripts/gdb/linux/dmesg.py
+++ b/scripts/gdb/linux/dmesg.py
@@ -22,7 +22,6 @@ prb_desc_type = utils.CachedType("struct prb_desc")
 prb_desc_ring_type = utils.CachedType("struct prb_desc_ring")
 prb_data_ring_type = utils.CachedType("struct prb_data_ring")
 printk_ringbuffer_type = utils.CachedType("struct printk_ringbuffer")
-atomic_long_type = utils.CachedType("atomic_long_t")
 
 class LxDmesg(gdb.Command):
     """Print Linux kernel log buffer."""
@@ -68,8 +67,6 @@ class LxDmesg(gdb.Command):
         off = prb_data_ring_type.get_type()['data'].bitpos // 8
         text_data_addr = utils.read_ulong(text_data_ring, off)
 
-        counter_off = atomic_long_type.get_type()['counter'].bitpos // 8
-
         sv_off = prb_desc_type.get_type()['state_var'].bitpos // 8
 
         off = prb_desc_type.get_type()['text_blk_lpos'].bitpos // 8
@@ -89,9 +86,9 @@ class LxDmesg(gdb.Command):
 
         # read in tail and head descriptor ids
         off = prb_desc_ring_type.get_type()['tail_id'].bitpos // 8
-        tail_id = utils.read_u64(desc_ring, off + counter_off)
+        tail_id = utils.read_atomic_long(desc_ring, off)
         off = prb_desc_ring_type.get_type()['head_id'].bitpos // 8
-        head_id = utils.read_u64(desc_ring, off + counter_off)
+        head_id = utils.read_atomic_long(desc_ring, off)
 
         did = tail_id
         while True:
@@ -102,7 +99,7 @@ class LxDmesg(gdb.Command):
             desc = utils.read_memoryview(inf, desc_addr + desc_off, desc_sz).tobytes()
 
             # skip non-committed record
-            state = 3 & (utils.read_u64(desc, sv_off + counter_off) >> desc_flags_shift)
+            state = 3 & (utils.read_atomic_long(desc, sv_off) >> desc_flags_shift)
             if state != desc_committed and state != desc_finalized:
                 if did == head_id:
                     break
diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
index ff7c1799d588..1553f68716cc 100644
--- a/scripts/gdb/linux/utils.py
+++ b/scripts/gdb/linux/utils.py
@@ -35,13 +35,12 @@ class CachedType:
 
 
 long_type = CachedType("long")
-
+atomic_long_type = CachedType("atomic_long_t")
 
 def get_long_type():
     global long_type
     return long_type.get_type()
 
-
 def offset_of(typeobj, field):
     element = gdb.Value(0).cast(typeobj)
     return int(str(element[field].address).split()[0], 16)
@@ -129,6 +128,17 @@ def read_ulong(buffer, offset):
     else:
         return read_u32(buffer, offset)
 
+atomic_long_counter_offset = atomic_long_type.get_type()['counter'].bitpos
+atomic_long_counter_sizeof = atomic_long_type.get_type()['counter'].type.sizeof
+
+def read_atomic_long(buffer, offset):
+    global atomic_long_counter_offset
+    global atomic_long_counter_sizeof
+
+    if atomic_long_counter_sizeof == 8:
+        return read_u64(buffer, offset + atomic_long_counter_offset)
+    else:
+        return read_u32(buffer, offset + atomic_long_counter_offset)
 
 target_arch = None
 
-- 
2.35.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
