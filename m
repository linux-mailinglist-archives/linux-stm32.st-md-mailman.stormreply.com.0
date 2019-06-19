Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D28814BAD9
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 16:11:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FF4EC56630
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 14:11:33 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D32EC5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v0kj21FKTfc8hI0Hhv3Jpr9qgTaeqZ90JjRurjLbLxE=; b=aJW4ugajucQKu9Yyy9ttcxLUbB
 /OMtxcJOC9W9XEDDqR5MHfWCpOiBiRNCkdDCCcFQ8QwEcWC1OGDIZ3P/ln8CWphBQqcIU32s1MFqI
 85ao32RIPpUllKTmvCc8SsxJDxiRkXmohQ4E6ID7RzulnFWX2s6mBzFc2CNy8ESYZZ28=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hdbJ2-0001ul-Hn; Wed, 19 Jun 2019 16:11:20 +0200
Date: Wed, 19 Jun 2019 16:11:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190619141120.GD18352@lunn.ch>
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <50f869f466acb110c5924d7e8a67087fd97106fd.1560937626.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50f869f466acb110c5924d7e8a67087fd97106fd.1560937626.git-series.maxime.ripard@bootlin.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 14/16] ARM: dts: sunxi: Switch from
 phy-mode to phy-connection-type
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

On Wed, Jun 19, 2019 at 11:47:23AM +0200, Maxime Ripard wrote:
> The phy-mode device tree property has been deprecated in favor of
> phy-connection-type, let's replace it.

Hi Maxime

net/ethernet/stmicro/stmmac/dwmac-mediatek.c:		dev_err(plat->dev, "not find phy-mode\n");
net/ethernet/stmicro/stmmac/dwmac-anarion.c:		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n",
net/ethernet/stmicro/stmmac/dwmac-meson8b.c:		dev_err(dwmac->dev, "fail to set phy-mode %s\n",
net/ethernet/stmicro/stmmac/dwmac-meson8b.c:		dev_err(dwmac->dev, "fail to set phy-mode %s\n",
net/ethernet/stmicro/stmmac/dwmac-meson8b.c:		dev_err(dwmac->dev, "unsupported phy-mode %s\n",
net/ethernet/stmicro/stmmac/dwmac-meson8b.c:		dev_err(&pdev->dev, "missing phy-mode property\n");

As a follow up patch, you might want to change these error messages.

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
