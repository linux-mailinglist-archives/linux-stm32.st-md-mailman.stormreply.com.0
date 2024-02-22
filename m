Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D785F2F6
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 09:31:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F1B5C6B47A;
	Thu, 22 Feb 2024 08:31:06 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4B00C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 08:31:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD0E72000B;
 Thu, 22 Feb 2024 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708590665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5PMuuuclVIaSoKYSTG9l7tX59EQaHIKNZ7KCMWv4BXM=;
 b=EkUA7yLcRa5a2pXFrOZZ9T6y/dDaNwUWqLGjiLkJA4zlS/MdaAIZThQYB55si4SIhYDEtS
 cA1GG21UwP7j0GHYyFc2i1+5McyPboIwsq55o2etuZ19AUBz6Xmxd90sR6PBV3TIojpni5
 bHgTBvf3hHHCoxp1/Q6t35HBamGHR/Yzo+poHmzca4fY2Tq3XMwQvfNeboCKab/P5Cq4hq
 2Ge2QXxYItSZUT+upCO+oe/ZPmS2cg6PLC6x83aHa0WZllgORRSzEdHWJTswe9jGLZVG9l
 828VIfeCEXtJVNeiSfyoJVIPa4pprTxBszWRHeabGcifMxfQGg/2bS9QmYV4JQ==
Date: Thu, 22 Feb 2024 09:31:33 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Simon Horman <horms@kernel.org>
In-Reply-To: <20240221190740.GG722610@kernel.org>
Message-ID: <46da0819-13f6-c44c-eee0-fb87468ffe51@bootlin.com>
References: <20240221-rxc_bugfix-v4-0-4883ee1cc7b1@bootlin.com>
 <20240221-rxc_bugfix-v4-2-4883ee1cc7b1@bootlin.com>
 <20240221190740.GG722610@kernel.org>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/7] net: phylink: add
 rxc_always_on flag to phylink_pcs
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

Hello Simon,

On Wed, 21 Feb 2024, Simon Horman wrote:

> > + * driver authors should consider whether their target device is to be used in
> > + * conjunction with a MAC device whose driver calls phylink_pcs_pre_init(). MAC
> > + * driver authors should document their requirements for the PCS
> > + * pre-initialization.
> > + *
> > + */
> > +int pcs_config(struct phylink_pcs *pcs);
Yes it should, thank you for pointing that out.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
