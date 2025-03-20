Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD76A69D42
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 01:28:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E4AAC7803A;
	Thu, 20 Mar 2025 00:28:05 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD930C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 00:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=QZ8+kxRgHxsg9Lq20FwRg26DNXtx0z83Ab3cGQEjgIQ=; b=I+zwFf7lk9fa4q2LzhSi0cKayA
 6thWCCbUK6nO0b9AVz/GbEbotAhUMSOaXR23IemJpeyeF4BIMaKNq2bl7ycE5P/lgrlpSD8zWC+jJ
 7dZQ4y80OOdRKTUc67fOO3pt+DI43qSdai/4uTj8Eli3g0AT7O+XpI8Cnix3ghC19Tsw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tv3lA-006Qcw-CG; Thu, 20 Mar 2025 01:27:44 +0100
Date: Thu, 20 Mar 2025 01:27:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <ab58c128-f598-4586-a912-0d6128934fcc@lunn.ch>
References: <20250319214415.3086027-1-jonas@kwiboo.se>
 <20250319214415.3086027-6-jonas@kwiboo.se>
 <d53a2119-2650-4a87-af94-1b9c2297cf72@lunn.ch>
 <eabc0fb8-10cc-465c-9434-b0804418dcb6@kwiboo.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eabc0fb8-10cc-465c-9434-b0804418dcb6@kwiboo.se>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Yao Zi <ziyao@disroot.org>
Subject: Re: [Linux-stm32] [PATCH net-next v3 5/5] net: stmmac: dwmac-rk:
 Add initial support for RK3528 integrated PHY
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

>   #define RK630_PHY_ID				0x00441400

O.K. different which is good.

>   /*
>    * Fixed address:
>    * Addr: 1 --- RK630@S40
>    *       2 --- RV1106@T22
>    */
>   #define PHY_ADDR_S40				1
>   #define PHY_ADDR_T22				2
> 
> [1] https://lore.kernel.org/all/20250310001254.1516138-2-jonas@kwiboo.se/
> [2] https://github.com/armbian/linux-rockchip/blob/rk-6.1-rkr5/drivers/net/phy/rk630phy.c

The vendor driver is going to need some cleanup before you post it....

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
