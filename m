Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B94C99E9C05
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 17:44:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7096C78021;
	Mon,  9 Dec 2024 16:44:33 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7965C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=mZntX+8hMA0rPvn3vcWIzlKbets+ctrcbHV8oQBSKks=; b=nly65iiUoMyszAoKNFpqkvbeOd
 FdilF6M2bA1FCQjl/22Iw+HuvpSZ546qpUnFtcMKWsLO1ReTDBmvmxf4Mitq3wkBcFByO2cSP/LYR
 P0bMKAd1K3TB0OcqXSf8aA9YF1dWqjiGl/5AXkli5flaqVKQSt9ViT1mgmrq/FmkB50s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tKgrm-00Fh56-6l; Mon, 09 Dec 2024 17:44:14 +0100
Date: Mon, 9 Dec 2024 17:44:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <eaec5732-7a24-46ba-8d76-7896304264ac@lunn.ch>
References: <20241209103434.359522-1-o.rempel@pengutronix.de>
 <20241209103434.359522-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241209103434.359522-5-o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 4/4] arm: dts: stm32: Add Priva
 E-Measuringbox devicetree
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

> +	/* DP83TD510E PHYs have max MDC rate of 1.75MHz.

Really? That breaks IEEE 802.3, which requires 2.5MHz. Humm, says it
multiple times in the datasheet. Seems like a language lawyer was
involved in the data sheet.

  The DP83TD510E is an ultra-low power Ethernet
  physical layer transceiver compliant with the IEEE
  802.3cg 10Base-T1L specification

I would not be surprised to find that 802.3cg says nothing about MDC,
that is in the base 802.3 standard, which they don't say they are
compliant to.

>        * Since we can't reduce
> +	 * stmmac MDC clock without reducing system bus rate, we need to use
> +	 * gpio based MDIO bus.
> +	 */

At least there is a simple workaround, even if it is much slower than
what you really need.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
