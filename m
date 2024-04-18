Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A08A9874
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 13:24:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8826FC6C858;
	Thu, 18 Apr 2024 11:24:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49E0FC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 11:24:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7D8AE0003;
 Thu, 18 Apr 2024 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713439460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jMOGVNbuITYt7dy+1dT/3leK/5M9H8PcreUPt+p35qI=;
 b=RjKcP8eCCvgTt8VGT8VoIlKf0Qq6wN1vbHBN65pxwLkuoNSCCRK9HMIckOEc7Pmk3kxTN0
 Y14XTy+U0naNbBritHYr/5MoYDZj9oZm7AB5GSvTo4z9DTD0SiPxe0GwgxNzIW9eV9RVM/
 LVS7FDjuhPyJyN2nvTk0SeXijjt7oVx4KDFMlSHrErHJ+5+n9mLvPfgmI05Jphqx8MXe/n
 3HOKNshqS/DM6R0bDDbngk/eKBeSl9EvMysy9TeEGAVbxEVcf3IGTUaBJ8VQeJY27rfz8K
 1oy9fzsN+qb+Glkaf/Na1dKUANBKFagdcw8XuoHhc0ZnI08f25vTEMLXOwy2+w==
Date: Thu, 18 Apr 2024 13:24:56 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
In-Reply-To: <CAMuHMdVWEMSR6vKSPdXRbf5_dqBWsM+Z2PV46DBmwHAoBNv_5w@mail.gmail.com>
Message-ID: <57f94b4a-75e2-32ad-506f-954c13498cd8@bootlin.com>
References: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
 <20240415-rzn1-gmac1-v3-5-ab12f2c4401d@bootlin.com>
 <CAMuHMdVWEMSR6vKSPdXRbf5_dqBWsM+Z2PV46DBmwHAoBNv_5w@mail.gmail.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 5/5] ARM: dts: r9a06g032:
	describe GMAC1
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

Hi Geert,

On Thu, 18 Apr 2024, Geert Uytterhoeven wrote:

> > +               gmac1: ethernet@44000000 {
> > +                       compatible = "renesas,r9a06g032-gmac", "renesas,rzn1-gmac", "snps,dwmac";
> > +                       reg = <0x44000000 0x2000>;
> > +                       interrupt-parent = <&gic>;
> 
> The surrounding "soc" node already specifies the interrupt parent,
> so there is no need to repeat that. I could fix that while applying
> to renesas-devel for v6.10, but it looks like there will be a v4 for
> the rest of the series anyway?

Indeed there will be a v4 so I'll fix it.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
