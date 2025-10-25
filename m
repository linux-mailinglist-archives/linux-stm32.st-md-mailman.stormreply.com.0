Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D8C09F67
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 21:50:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF878C57167;
	Sat, 25 Oct 2025 19:50:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C611BC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 19:50:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B527A1A15B7;
 Sat, 25 Oct 2025 19:50:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 755AE60704;
 Sat, 25 Oct 2025 19:50:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E817F102F24B4; 
 Sat, 25 Oct 2025 21:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761421849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=xS9DWYbPS5RAJNziak57osAtFOJp0n29KoRjK/Vqiag=;
 b=dIoYniUpURM/Ww/98Jgc69HzgHGZtZ44HlfJXzhx1To69jb+uLJOEFOdZ+2KT9UHK9wlQa
 FH297d2+YdBS5/lJLw0Ai+Tn3P1EziTuLp3UVi6RIR+a05xjKvFjfaqhevpHGIViMv9+wj
 /U+f1kvAEgPFWDwF79hq2D/MCEFt+4YJCnEVGqzB+FsS/NsFGmKOlHTqbdHwZSeZiO+NHb
 kUI3/HhCZt/2P1ZtQkXseoLCs4qRayzrN2u16Ij8mOYmRKtr+CjC7RlwCH8NDKnzHHXfl2
 KyZxahDikrJ0+gGECfT+SUg6ru5El+UW4HX2zVCHeTvN+RuWJGlCbkcf7zr+lA==
Message-ID: <fa194ce6-8fca-4974-8dc7-2eb22ec50bfb@bootlin.com>
Date: Sat, 25 Oct 2025 21:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>
References: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
 <E1vBrtk-0000000BMYm-3CV5@rmk-PC.armlinux.org.uk>
 <20251024190159.60f897e5@kernel.org> <aPyEKGCeXwnsn4OC@shell.armlinux.org.uk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <aPyEKGCeXwnsn4OC@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: add
	stmmac_mac_irq_modify()
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

On 25/10/2025 10:02, Russell King (Oracle) wrote:
> On Fri, Oct 24, 2025 at 07:01:59PM -0700, Jakub Kicinski wrote:
>> On Thu, 23 Oct 2025 10:46:20 +0100 Russell King (Oracle) wrote:
>>> Add a function to allow interrupts to be enabled and disabled in a
>>> core independent manner.
>>
>> Sorry for a general question but I'm curious why stick to the callback
>> format this driver insists on. Looks like we could get away with
>> parameterizing the code with the register offset via the priv structure.
> 
> Not quite - some cores, it's a mask (bits need to be set to be disabled).
> Other cores, it's an enable (bits need to be set to enable). So one
> can't get away with just "this is where the register is", it would need
> three pieces of information - register offset, type of regster (mask or
> enable) and then a core specific bitmask.
> 
>> Mostly curious. Personally, I'm always annoyed having to dig thru the
>> indirections in this driver.
> 
> Me too, especially when it's not obvious what is an indirection and
> what is not.

Same here...

> There's the fun that a lot of the PTP-related indirection
> actually has no difference. For example, at the bottom of
> stmmac_hwtstamp.c, the struct stmmac_hwtimestamp initialisers have
> almost all of the methods pointing at the same implementation
> with the exeption of .get_ptptime, .timestamp_interrupt and
> .hwtstamp_correct_latency.

Well I introduced that last year. GMAC1000 and GMAC4 have what
appears to be different versions of the timestamping IP, registers
are either at a different address, or same address with a different
layout bitwise, or with just different behaviours.

There used to be a single instance of the stmmac_hwtimestamp ops,
which didn't even account for the differences between these IP
versions. TBH I don't even know why we had a stmmac_hwtimestamp
struct with a single instance back then, but I figured that using
that was a good way to at least split the gmac1000/gmac4 diffs
back then.

We coud now very much get rid of the common ops and avoid the
indirections for the TS ops that are the same between all IP blocks :)

As I'm doing quite a bit of timestamping in stmmac right now, I may
find a bit of time here and there to do that at some point :)

Maxime

> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
