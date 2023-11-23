Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6257F66DD
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 20:04:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CCBEC6B479;
	Thu, 23 Nov 2023 19:04:36 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E889C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 19:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=/SDYqZIXsdOyj0vjbWI2ClkLE18Ka/bdOsdj54i7Dpw=; b=k73At0T74i/QGx6XSEriGiSqoX
 CilR8xNuoSc2MzKB3RIYMR10jhHrPgI7P72TWzf6UC+JcW1g798XIbibFF9pmGYzY4dEp7FAdsllE
 ruQfBOaBDtPtrqQRf7xn1+mCuZrwuHPbqPo5mxFkSBQ8poR9wzcOtGWJ97qwxsCDI6lg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1r6Ezp-0011Zk-3s; Thu, 23 Nov 2023 20:04:17 +0100
Date: Thu, 23 Nov 2023 20:04:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Message-ID: <f023fbf0-3669-4617-bb60-77fde3255dc0@lunn.ch>
References: <20231123-dwmac-rk_phy_wol-v1-0-bf4e718081b9@wolfvision.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231123-dwmac-rk_phy_wol-v1-0-bf4e718081b9@wolfvision.net>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC WIP 0/2] net: stmmac: dwmac-rk: add
 support for PHY wake on LAN
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

> Setting the USE_PHY_WOL flag configures the PHY as expected (its driver
> writes the MAC address and the interrupt configuration into the PHY
> registers) and an interrupt is generated with every magic packet,
> but only during normal operation i.e. there is no interrupt generation
> in suspend-to-RAM.

Do you have a logic analyser connected? Can you see if the PHY is
toggling its output pin? We then know if its a PHY problem, or a SoC
problem.

> A (probably naive) wakeup-source property in the dt node does not help.
> So now I am trying to find out why the PHY does not react in suspend and
> why its interrupt is ignored in freeze mode, but I might be overlooking
> some other important point to consider.

What is the clock setup? Sometimes the MAC gives a clock to the
PHY. Sometimes the PHY gives a lock to the MAC. If its MAC->PHY, and
this clock is getting turned off, that might cause a problem.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
