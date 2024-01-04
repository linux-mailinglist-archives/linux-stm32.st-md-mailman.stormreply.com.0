Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B2D823D18
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 09:00:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79EBBC6B476;
	Thu,  4 Jan 2024 08:00:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 477ADC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 08:00:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 419CBFF809;
 Thu,  4 Jan 2024 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704355251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WE9QlQ4KlC5mveEewBeLNMj9oTityHpI66OG1EcBCwM=;
 b=CbgyAwwYD8uWKnBEgnl/OqXn2LUAQHeNN/lWlX/vr/r6ucck2EZSDFljAqvkAwXTeRKdIw
 f3S4uGvc23ZEKWpqLpAdLtS704Q4SvPW+4emTG94vUG9jeaRYdxYsTdy3Qyt4r9njWkHqD
 241KrAuXnu9FzclO8hTw8m/mNyp1SrcXJ+Ml+ICZgUtXMbQb41Ty7d8AU269yFLHgwYqC4
 DvDfTNAltJL5Zw6ilI7BkqBGKpvoUXsENg0ZLMT+qDKwHw8QMGs2/G8VdrzSPrF7VSc3OZ
 llNrbvUWGkQ2mwgWJbmBqX5ewlV5/MDChwqCnkBAj1oyeiFPzWsEWuX/oLVfwA==
Date: Thu, 4 Jan 2024 09:01:11 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
In-Reply-To: <20240103132810.1aae03e8@kernel.org>
Message-ID: <a34046ef-b543-3f82-1562-5e7542f8529e@bootlin.com>
References: <20240103142827.168321-1-romain.gantois@bootlin.com>
 <20240103132810.1aae03e8@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463808768-824936069-1704355274=:2791"
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Marek Vasut <marex@denx.de>, Andrew Lunn <andrew@lunn.ch>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net 0/5] Fix missing PHY-to-MAC RX clock
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463808768-824936069-1704355274=:2791
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hello Jakub,

On Wed, 3 Jan 2024, Jakub Kicinski wrote:

> On Wed,  3 Jan 2024 15:28:20 +0100 Romain Gantois wrote:
> > There is an issue with some stmmac/PHY combinations that has been reported
> > some time ago in a couple of different series:
> > 
> > Clark Wang's report: https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@nxp.com/
> > Clément Léger's report: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-clement.leger@bootlin.com/
> 
> If those stmmac/PHY combinations never worked upstream please tag 
> as [PATCH net-next], we should consider this work to be a be a new
> feature / HW support. If they used to work - we'll need some Fixes
> tags.

These never worked properly upstream so I'll send it to net-next.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
---1463808768-824936069-1704355274=:2791
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

---1463808768-824936069-1704355274=:2791--
