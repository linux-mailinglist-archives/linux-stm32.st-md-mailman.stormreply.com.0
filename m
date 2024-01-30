Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE5E842045
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 10:58:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23B11C6B476;
	Tue, 30 Jan 2024 09:58:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E912C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 09:58:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1D651C000F;
 Tue, 30 Jan 2024 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706608730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EiSQPHlZvuMGh0EjQQ581BSXae/FdZolbIAXca57poU=;
 b=NaYDMDNij0V/pTIkkBOPp9SLHn7uDFROO8ky6uETO5MB2EwwAbehy+a6sA18wvGiuG7d56
 CiF4IoJBq2/RnpaAMFibw2GB9OUgYzF4J0KLp5jF9NmU9LEvoaFtl/vpfNaT2EeqarbNdB
 UNzLq+SjLxotlw2FoyxXYv7ElxC5tSlfEVQ1JW6/4GXtDeeUvS5sq4MmdZSUulyIG4Y2he
 cdhSXqL4do3DMAi5xF2t11JSMx8iW/EOVtNPnYDtWs/d9ze7mKYlBwWeZMJfdrQJKPKaX2
 odkK/WErvb4sAOdYBdzS8C2asLbEX/Zc6WH3AxTJFx5pYY86vb+VMIQGHe5I3A==
Date: Tue, 30 Jan 2024 10:58:47 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20240130105847.08a2d958@device-28.home>
In-Reply-To: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/7] Fix missing PHY-to-MAC RX
	clock
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

Hello Romain,

On Tue, 30 Jan 2024 10:28:35 +0100
Romain Gantois <romain.gantois@bootlin.com> wrote:

> Hello everyone,
> 
> This is version two of my series that addresses the issue with some MAC/PHY
> combinations. Version one was sent on net, not net-next.
> 
> Notable changes in v2:
>   - Introduced a pcs op for initializing hardware required for MAC
>     initialization, instead of using phylink_validate() for this purpose.
>   - Refactored stmmac to use a generic PCS reference in mac_device_info
>     instead of a model-specific field.

As this impacts the dwmac-socfpga lynx integration, I'd like to give it
a try, I'll be able to give some feedback on that part probably
tomorrow.

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
