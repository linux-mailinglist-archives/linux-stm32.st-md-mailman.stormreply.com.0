Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF9C63C27
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Nov 2025 12:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62437C62D20;
	Mon, 17 Nov 2025 11:18:39 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C4EAC628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 11:18:37 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d94xR54l8z9tPN;
 Mon, 17 Nov 2025 12:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763378315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/yUxH07BZ7z6RY7qPh9V7bK+ouYzlYaoiAPzW2PwTA=;
 b=qP8SReAN+DvwGXLfoMM3KkUe58s99DnzSDTAf1XxGfRjnYhfBORD1wZDUFwm37CoPG+IVJ
 O08FKzwSJLvbAl0N4Q6FzdxDEq1ZmrcMdLshQgzorqd8wC9rN3tEwSxmFb63fhJv5AgP7C
 jJIPdLAy0KQvz2srB1P1+KVdFKLEVA7tMYGKSVcrYb/lRPFmQfnvatOujR7q1fgYR9rWoN
 Z79MzL8sEK57SET0sx5yYtTf64twTb1UE11oLnNU6fgrZ/LTyE65tN4gTczxLU3DFKlUrP
 BpBpjvxWVERm0uPoD13NFIYTTZ9qZt4pfdr1K3VOYzTb8vbZtxVTu9zU4+dV7g==
Message-ID: <b4ba27e5-a1cc-4477-a254-a318e586ef2a@mailbox.org>
Date: Mon, 17 Nov 2025 12:18:31 +0100
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
To: Andrew Lunn <andrew@lunn.ch>
References: <20241001024731.140069-1-marex@denx.de>
 <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
 <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
Content-Language: en-US
In-Reply-To: <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
X-MBO-RS-ID: c634c576c82130d98b2
X-MBO-RS-META: z4y1gngkuhdep4ypa3wmytu8h5dof3xm
Cc: netdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Daniel Golle <daniel@makrotopia.org>, kernel@dh-electronics.com,
 Pavel Machek <pavel@ucw.cz>, Christian Marangi <ansuelsmth@gmail.com>,
 linux-leds@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] leds: trigger: netdev: Check offload
 ability on interface up
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10/3/24 2:47 AM, Marek Vasut wrote:

Hello again,

>>> On STM32MP13xx with RTL8211F, it is enough to have the following udev 
>>> rule
>>> in place, boot the machine with cable plugged in, and the LEDs won't 
>>> work
>>> without this patch once the interface is brought up, even if they 
>>> should:
>>> "
>>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", 
>>> ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", 
>>> ATTR{link_1000}="1", ATTR{device_name}="end0"
>>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", 
>>> ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name} 
>>> ="end0"
>>> "
>>
>> Nice use of udev. I had not thought about using it for this.

I might have been a bit too hasty with this. The following is only a 
quick preliminary FYI, I am still investigating the details.

I observe on 6.18-rc6 (ST STM32MP13xx , so STM32 DWMAC ethernet, and 
RTL8211F PHY), that if I use the these udev rules (SoC has two MACs, 
there are two rules for each MAC, and 2 rules for each of two LEDs on 
each MAC PHY , therefore four rules in total ; the rules for both MACs 
are identical):

"
ACTION=="add|change", SUBSYSTEM=="leds", 
KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", 
ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", 
ATTR{device_name}="ethsom0"
ACTION=="add|change", SUBSYSTEM=="leds", 
KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", 
ATTR{tx}="1", ATTR{device_name}="ethsom0"

ACTION=="add|change", SUBSYSTEM=="leds", 
KERNEL=="stmmac-1:01:green:lan", ATTR{trigger}="netdev", 
ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", 
ATTR{device_name}="ethsom1"
ACTION=="add|change", SUBSYSTEM=="leds", 
KERNEL=="stmmac-1:01:yellow:lan", ATTR{trigger}="netdev", ATTR{rx}="1", 
ATTR{tx}="1", ATTR{device_name}="ethsom1"
"

I get this backtrace. Notice the "sysfs: cannot create duplicate 
filename ..." part , I suspect there is some subtle race condition ?

"
sysfs: cannot create duplicate filename 
'/devices/platform/soc/5c007000.bus/5800e000.ethernet/mdio_bus/stmmac-1/stmmac-1:01/leds/stmmac-1:01:green:lan/link_10'
CPU: 0 UID: 0 PID: 153 Comm: (udev-worker) Not tainted 6.18.0-rc6 #1 
PREEMPT
Hardware name: STM32 (Device Tree Support)
Call trace:
  unwind_backtrace from show_stack+0x18/0x1c
  show_stack from dump_stack_lvl+0x54/0x68
  dump_stack_lvl from sysfs_warn_dup+0x58/0x6c
  sysfs_warn_dup from sysfs_add_file_mode_ns+0xf0/0x130
  sysfs_add_file_mode_ns from internal_create_group+0x344/0x480
  internal_create_group from internal_create_groups+0x48/0x6c
  internal_create_groups from led_trigger_set+0x1e4/0x278
  led_trigger_set from led_trigger_write+0xe0/0x118
  led_trigger_write from sysfs_kf_bin_write+0x98/0xa0
  sysfs_kf_bin_write from kernfs_fop_write_iter+0x14c/0x198
  kernfs_fop_write_iter from vfs_write+0x170/0x1d4
  vfs_write from ksys_write+0x7c/0xd0
  ksys_write from ret_fast_syscall+0x0/0x54
Exception stack(0xedbf1fa8 to 0xedbf1ff0)
1fa0:                   00000006 bec4476c 00000015 bec4476c 00000006 
00000001
1fc0: 00000006 bec4476c 000e7698 00000004 00000006 fffffff7 00000000 
000d1710
1fe0: 00000004 bec44578 b6c34397 b6bb15e6
leds stmmac-1:01:green:lan: Failed to add trigger attributes
"

If I find out more, I will get back to this thread.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
