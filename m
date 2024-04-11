Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA988A08C4
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Apr 2024 08:48:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6B15C6C83D;
	Thu, 11 Apr 2024 06:48:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23C2FC6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Apr 2024 06:48:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AFD7FF803;
 Thu, 11 Apr 2024 06:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712818127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ht4yL7p2G9syjEPhGbbLFmsLSUE4MFaHnCtOBwa2f0U=;
 b=UI85FZoBJxkSr5IRNhTf81V9ubkj+rBrOmYUQdxIB2xHindV3eFcedgof+/ctlJxTgJOKo
 WWAG8oOTy3wWc4njjvvtTLHkCMKpX3hM+k+qbYOe+sSPR67i6fq59mJt9PhzNqIJIbQcek
 kyti06DfTIHAM100jdTvgfA9aLu9vH/ZrWmsQUOnZKUd6t0n7WeNkKXagnBBY+47Nj7cKh
 6K4zEMvfn7S/cnrx+cFY8zurNZ7nwHP1KLCay/Y4NLHj7TGO1vnK6x6J/51VDC7UruHRcW
 ShkAGAVDIpNFHpiPmN34kIMkB6KZwEGPe4fmQyo1KK7V/sv0JW3vOiVJnqBshg==
Date: Thu, 11 Apr 2024 08:49:22 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
In-Reply-To: <ZhbmVVXgu27ZZaNf@shell.armlinux.org.uk>
Message-ID: <5efb5cb1-92ad-0e94-9431-f525c837b98a@bootlin.com>
References: <20240409-rzn1-gmac1-v2-0-79ca45f2fc79@bootlin.com>
 <20240409-rzn1-gmac1-v2-3-79ca45f2fc79@bootlin.com>
 <20240409183404.7d3eb04f@kernel.org> <ZhbmVVXgu27ZZaNf@shell.armlinux.org.uk>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/5] net: stmmac:
 dwmac-socfpga: use pcs_init/pcs_exit
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

Hello Russell,

On Wed, 10 Apr 2024, Russell King (Oracle) wrote:

> patch as a theoretical solution to Romain. After build-testing it locally
> I did notice it. I would've thought that Romain would've build-tested
> before sending out his patch set and would've fixed it up... I didn't
> have time to properly fix up my patch (essentially would've ment

I build-tested the patches but didn't realize that CONFIG_DWMAC_SOCFPGA was not 
enabled in my configuration. So that's my bad, sorry.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
