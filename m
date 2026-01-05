Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9249CF37F9
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 13:23:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E5F7C56612;
	Mon,  5 Jan 2026 12:23:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BB44C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 12:23:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8E0A74E41F76;
 Mon,  5 Jan 2026 12:23:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 577A160726;
 Mon,  5 Jan 2026 12:23:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A20D6103C84B1; Mon,  5 Jan 2026 13:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767615833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=FxpdO0xpWYZr7zB9MVuZ7HLTobH136C3wl/FyW9od7w=;
 b=FIz/icMez1d+ePM8dPLynyFAZ0VZUgZUVwQmgrS5dlyfwgWOzS5LVCQpryCHkxR0zI11IM
 yOG/CSoXOXKkF13aNNmD35yHbAVkVzgpZAXPp8tGpUnG/49mZ1FYUPgzWVpkqbuKnTHYL9
 V4GaBgOT2jjloT6fuRpCF33j8pot7Uz8+EuOiwbo5tE/U5Fxpsa4aCvUdOdYflSqrwi5U4
 7booT3XccwZhIOmukcC05CxR7nlIFVhZ2a+VLMp+dd5xmvmEibXEHJ4N6BuKygHAwpwHbI
 O1ll3n3AKmmK/ipDokyyxgBlU8Nw81oM6nLE5zIt3iTIJxHQqgEt/3mdDocuIg==
Message-ID: <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
Date: Mon, 5 Jan 2026 13:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com
References: <20260105100245.19317-1-eichest@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260105100245.19317-1-eichest@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: robh@kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND net-next v2] net: stmmac: dwmac:
 Add a fixup for the Micrel KSZ9131 PHY
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

Hi Stefan,

On 05/01/2026 11:02, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add a fixup to the stmmac driver to keep the preamble before the SFD
> (Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
> used on an NXP i.MX8MP SoC.
> 
> This allows to workaround errata ERR050694 of the NXP i.MX8MP that
> states:
> ENET_QOS: MAC incorrectly discards the received packets when Preamble
> Byte does not precede SFD or SMD.
> 
> The bit which disables this feature is not documented in the datasheet
> from Micrel, but has been found by NXP and Micrel following this
> discussion:
> https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032
> 
> It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
> 10MBit. Without bit 2 being set in the remote loopback register, no
> packets are received. With the bit set, reception works fine.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

I've also faced this issue, however I'm wondering wether this is the
correct approach to fix this. It seems that all Micrel / Microchip PHYs
have this behaviour of discaring the preamble at 10Mbps.

Some of these phys have accessible control registers to re-enable it,
however this register/bit changes depending on the PHY model. For
example, on KSZ8041, this is register 0x14 bit 6.

We may end-up with many many more fixups for this, basically for every
micrel/microchip PHY.

Wouldn't it be safer to just always enable preamble at 10M for these
PHYs, regardless of the MAC that's connected to it ? Is there any risk
always having the preamble there ?

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
