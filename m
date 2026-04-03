Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA52KvBaz2kXvgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Apr 2026 08:15:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3981F39159C
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Apr 2026 08:15:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92B54C87ED3;
	Fri,  3 Apr 2026 06:15:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF07CC55590
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2026 06:15:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B55394E428C7;
 Fri,  3 Apr 2026 06:15:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 68BD1603C1;
 Fri,  3 Apr 2026 06:15:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28CAE10450264; 
 Fri,  3 Apr 2026 08:14:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1775196906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=2sxqu5R5Wk043JMyFgXFiDt3SNRh3XWkGz4XQz5WOSM=;
 b=sxB8E5585jew5frnLVqXXVpr/xBG7/82juZnbfFT743AWuaB9hvQwWPL67A/pTTqUWhFGT
 aFzC6ODrmTlAux5ytSvQbl8lEQ6dyl8Z7FXLkogZt34gPDd46An9c/QwKn0P0M2QRf3tw/
 a/PrszfKdlYbBXzShSv++h8KhMjUYLsV4fIPdocY/6Uuhyc36XlyCiLm93UGDCx4bilv4D
 kJ3yzpQ+l7x4rpDgZXVQlDm8MEqv/PEA4yx8Pw/RXb5tvucga0JNctndBr33q1k4ly2aIn
 PmKY2a6exIKeM/D3+h9EQYAzTUtotND/2a/sdHgcuUWC9qsHkaS+VcpOMUDudA==
Message-ID: <8f780d3f-c4ef-4976-ad0b-60718c29e06a@bootlin.com>
Date: Fri, 3 Apr 2026 08:14:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Sam Edwards <cfsworks@gmail.com>
References: <20260401041929.12392-1-CFSworks@gmail.com>
 <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net v4 0/2] stmmac crash/stall fixes when
 under memory pressure
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:cfsworks@gmail.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:fancer.lancer@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:fancerlancer@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[armlinux.org.uk,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,gmail.com,st-md-mailman.stormreply.com,lunn.ch,google.com,st.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	NEURAL_HAM(-0.00)[-0.665];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 3981F39159C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell

On 02/04/2026 19:16, Russell King (Oracle) wrote:
> On Tue, Mar 31, 2026 at 09:19:27PM -0700, Sam Edwards wrote:
>> Hi netdev,
>>
>> This is v4 of my series containing a pair of bugfixes for the stmmac driver's
>> receive pipeline. These issues occur when stmmac_rx_refill() does not (fully)
>> succeed, which happens more frequently when free memory is low.
>>
>> The first patch closes Bugzilla bug #221010 [1], where stmmac_rx() can circle
>> around to a still-dirty descriptor (with a NULL buffer pointer), mistake it for
>> a filled descriptor (due to OWN=0), and attempt to dereference the buffer.
>>
>> In testing that patch, I discovered a second issue: starvation of available RX
>> buffers causes the NIC to stop sending interrupts; if the driver stops polling,
>> it will wait indefinitely for an interrupt that will never come. (Note: the
>> first patch makes this issue more prominent -- mostly because it lets the
>> system survive long enough to exhibit it -- but doesn't *cause* it.) The second
>> patch addresses that problem as well.
>>
>> Both patches are minimal, appropriate for stable, and designated to `net`. My
>> focus is on small, obviously-correct, easy-to-explain changes: I'll follow up
>> with another patch/series (something like [2]) for `net-next` that fixes the
>> ring in a more robust way.
>>
>> The tx and zc paths seem to have similar low-memory bugs, to be addressed in
>> separate series.
> 
> I've tested this on my Jetson Xavier platform. One of the issues I've
> had is that running iperf3 results in the receive side stalling because
> it runs out of descriptors. However, despite the receive ring
> eventually being re-filled and the hardware appropriately prodded, it
> steadfastly refuses to restart, despite the descriptors having been
> updated.
> 
> What I can see is there's 40 packets in the internal FIFOs via the
> PRXQ[13:0] field of the ETH_MTLRXQxDR register.
> 
> With your patches applied:
> 
> root@tegra-ubuntu:~# iperf3 -c 192.168.248.1 -R
> Connecting to host 192.168.248.1, port 5201
> Reverse mode, remote host 192.168.248.1 is sending
> [  5] local 192.168.248.174 port 43728 connected to 192.168.248.1 port 5201
> [ ID] Interval           Transfer     Bitrate
> [  5]   0.00-1.00   sec  30.3 MBytes   254 Mbits/sec
> [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec
> [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec
> [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec
> [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec
> [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec
> ...

Ah !!

I have been struggling with that problem this week too. I stumbled upon
it while trying to test your TSO series, and at firts I thought it was
because of the TSO patches, but turns out it's not, I reproduce it on
net-next.

The main problem for me is that it's not always reproducible, it may or
may not show up when I run iperf3 after a fresh restart.

This is on socfpga (dwmac1000), so it seems the problem exists across IP
versions.

I've been on and off trying to make progress on that during the week,
but without success so far...

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
