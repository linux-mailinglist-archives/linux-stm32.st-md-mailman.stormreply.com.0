Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BD3726085
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 15:07:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D11B6C6A5E7;
	Wed,  7 Jun 2023 13:07:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8AEAC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 13:07:39 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686143259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4KeBVX9fh5BWILoxWykoaXgMPfgR3e6KlRWLXnIjh8=;
 b=IFlntwt9MiUqyl4gGig/vm8dRCZC9qibzaOkFWfioFD80JRYgMO4LmWNjxgQr50TutwLfL
 05B0xsTMGMwWVjpZwuPpuxLAhlsUTUbqZcsWhTbx+Uyyqp38lAo/JTMwg/lo1qSo7JjoEq
 G/RmfirGiBqZE4bbsfw5J2R8aC3PzSraNp7N3wcWT4uy9DHcTyYMvf68IZ5rBX7ohTInTv
 UtIG93n4Pgd+bH2Dr73zbIQWO8tNPaRKTa0Op7fePe9XPgDMhJRfV4AiPgxOs8j1JR8dHA
 AdkROzL0P3ToQ5P822B9nOrlM3vmH7IseBuir7V4Qzsqm3CnoYtTCS3jjLWGKA==
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1E1920012;
 Wed,  7 Jun 2023 13:07:32 +0000 (UTC)
Date: Wed, 7 Jun 2023 16:54:09 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20230607165409.7fddd49a@pc-7.home>
In-Reply-To: <ZIB306nKrhiru0hJ@shell.armlinux.org.uk>
References: <20230607135941.407054-1-maxime.chevallier@bootlin.com>
 <20230607135941.407054-6-maxime.chevallier@bootlin.com>
 <ZIB306nKrhiru0hJ@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Eric Dumazet <edumazet@google.com>, thomas.petazzoni@bootlin.com,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, alexis.lothore@bootlin.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, davem@davemloft.net,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 5/5] net: dwmac_socfpga:
 initialize local data for mdio regmap configuration
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

On Wed, 7 Jun 2023 13:28:03 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Jun 07, 2023 at 03:59:41PM +0200, Maxime Chevallier wrote:
> > @@ -447,19 +446,22 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
> >  		struct mdio_regmap_config mrc;
> >  		struct regmap *pcs_regmap;
> >  		struct mii_bus *pcs_bus;
> >    
> ...
> > +		memset(&mrc, 0, sizeof(mrc));  
> ...
> >  		mrc.parent = &pdev->dev;
> >  		mrc.valid_addr = 0x0;
> > +		mrc.autoscan = false;  
> 
> Isn't this covered by the memset() ?

I have the same answer as for the above. It's redundant, but I don't
think there's any harm having it set explicitely ?

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
