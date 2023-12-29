Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8F9820077
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Dec 2023 17:11:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C654C6B45E;
	Fri, 29 Dec 2023 16:11:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B69EC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Dec 2023 16:11:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF78A240002;
 Fri, 29 Dec 2023 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1703866288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zqi8dmMeOU3XDtyNyrJLxgovOsvnL1n+HnUCWjiryzI=;
 b=mzl0h77RyMj6S5QimPrixX8KNRjlHePNB2ZkUiW1I9hnJLejc/VQzGFm8nS326dqZfS/xl
 bKxX9mx4sqb41UzWjA7WEILOygNJBiY3aF+fLvRNRIRx6piDkxSq6D6QjpfZWfHUaUXoBn
 EGqUEC7N6KQLY+EEXZVaq4glUhZGUMhpeh2/L3dqd4kzSptktj4f0Xq+V/7sLwXJyw9yrw
 8LbIR34NmLppvtiNnUyC1RlZoVp65QhK2CNsUmkWp6d8A1MGIWlQyrzRCrJ3lpFeChxtTS
 uB/RNEHBgtTq2yrcgaWItC+6TVZK+2vqh7awbOTGv4iN1prJ8kR1js1/I9Mx5g==
Date: Fri, 29 Dec 2023 17:11:48 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Vladimir Oltean <olteanv@gmail.com>
In-Reply-To: <20231219122034.pg2djgrosa4irubh@skbuf>
Message-ID: <3b53aa8a-73e9-9260-f05b-05dac80a4276@bootlin.com>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
 <20231218162326.173127-2-romain.gantois@bootlin.com>
 <20231219122034.pg2djgrosa4irubh@skbuf>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Prevent DSA tags
 from breaking COE
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


On Tue, 19 Dec 2023, Vladimir Oltean wrote:
> DSA_TAG_PROTO_LAN9303, DSA_TAG_PROTO_SJA1105 and DSA_TAG_PROTO_SJA1110
> construct tags with ETH_P_8021Q as EtherType. Do you still think it
> would be correct to say that all DSA tags break COE on the stmmac, as
> this patch assumes?
> 
> The NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM convention is not about
> statically checking whether the interface using DSA, but about looking
> at each packet before deciding whether to use the offload engine or to
> call skb_checksum_help().
> 
> You can experiment with any tagging protocol on the stmmac driver, and
> thus with the controller's response to any kind of traffic, even if the
> port is not attached to a hardware switch. You need to enable the
Thanks for telling me about DSA_LOOP, I've tested several DSA tagging protocols 
with the RZN1 GMAC1 hardware using this method. Here's what I found in a 
nutshell:

For tagging protocols that change the EtherType field in the MAC header (e.g. 
DSA_TAG_PROTO_(DSA/EDSA/BRCM/MTK/RTL4C_A/SJA1105): On TX the tagged frames are 
almost always ignored by the checksum offload engine and IP header checker of 
the MAC device. I say "almost always" because there is an 
unlikely but nasty corner case where a DSA tag can be identical to an IP 
EtherType value. In these cases, the frame will likely fail IP header checks 
and be dropped by the MAC.

Ignoring these corner cases, the DSA frames will egress with a partial 
checksum and be dropped by the recipient. On RX, these frames will, once again, 
not be detected as IP frames by the MAC. So they will be transmitted to the CPU. 
However, the stmmac driver will assume (wrongly in this case) that
these frames' checksums have been verified by the MAC. So it will set 
CHECKSUM_UNECESSARY:

https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c#L5493
 
And so the IP/TCP checksums will not be checked at all, 
which is not ideal.

There are other DSA tagging protocols which cause different issues. For example 
DSA_TAG_PROTO_BRCM_PREPEND, which seems to offset the whole MAC header, and 
DSA_TAG_PROTO_LAN9303 which sets ETH_P_8021Q as its EtherType. I haven't dug too 
deeply on these issues yet, since I'd rather deal with the checksumming issue 
before getting distracted by VLAN offloading and other stuff.

Among the tagging protocols I tested, the only one that didn't cause any issues 
was DSA_TAG_PROTO_TRAILER, which only appends stuff to the frame.

TLDR: The simplest solution seems to be to modify the stmmac TX and RX paths to 
disable checksum offloading for frames that have a non-IP ethertype in 
their MAC header. This will fix the checksum situation for DSA tagging protocols 
that set non-IP and non-8021Q EtherTypes. Some edge cases like 
DSA_TAG_PROTO_BRCM_PREPEND and DSA_TAG_PROTO_LAN9303 will require a completely 
different solution if we want these MAC devices to handle them properly.
Please share any thoughts you might have on this suggestion.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
