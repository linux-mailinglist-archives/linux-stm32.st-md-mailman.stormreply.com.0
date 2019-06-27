Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 854F258602
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 17:37:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4356FC5979A;
	Thu, 27 Jun 2019 15:37:54 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2350C5956F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8AZ7Mo8jXW8J3pJblbsiJvKp6+Q5kxaDs1nceQXCsp4=; b=CYeuElsGDRyZbKI2nhNBEFv4am
 FW8VT76M/pH5efn2vf9F4coi+08gCrUARhpFiuWdBvfE8UbCZZbOjax4/4i/J5tH/rjZLEtKvtTKA
 HLFnYV6SRbMv3hCVFB6DCyrbsA3xpVJRJr6l5WDsTcz7+e38/vY/NYmIDgdFGeRXNVbo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hgWSz-00014z-8c; Thu, 27 Jun 2019 17:37:41 +0200
Date: Thu, 27 Jun 2019 17:37:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190627153741.GL27733@lunn.ch>
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
 <bbda9a50acace27f2fa79af71723e7d3b0111bc4.1561649505.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bbda9a50acace27f2fa79af71723e7d3b0111bc4.1561649505.git-series.maxime.ripard@bootlin.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 01/13] dt-bindings: net: Add YAML
 schemas for the generic Ethernet options
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

On Thu, Jun 27, 2019 at 05:31:43PM +0200, Maxime Ripard wrote:
> The Ethernet controllers have a good number of generic options that can be
> needed in a device tree. Add a YAML schemas for those.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
