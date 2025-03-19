Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 877FDA69CA7
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 00:22:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A5DDC7803C;
	Wed, 19 Mar 2025 23:22:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CBAEC78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 23:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=5tW/qXnvYgM00U8Ba3VQcPQjfpnDlU9t847cUdAiY8I=; b=qCsS93QNEKnq1solw/D+LZAi+f
 G32S6DpBxTTYEroBH3pDG6Os2stVchMaRoa/g9Irhbqkk4cQDjyqRUmPyafRR1LT38Mf1xxC8+uvx
 PYxkbEC8dwRIIszZ+vW35mQWANSFGRLqQfDI+NddQKRajnZibp8ANjmzYK1faMKYULv8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tv2jz-006QKR-El; Thu, 20 Mar 2025 00:22:27 +0100
Date: Thu, 20 Mar 2025 00:22:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <f6a6e6e6-c00d-4920-a3a3-8699e9a88b6e@lunn.ch>
References: <20250319214415.3086027-1-jonas@kwiboo.se>
 <20250319214415.3086027-4-jonas@kwiboo.se>
 <d7b3ec5c-2d74-4409-9894-8f2cb3e055f6@lunn.ch>
 <e766eb6d-618a-43a0-b1e1-954c2c3fbf0e@kwiboo.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e766eb6d-618a-43a0-b1e1-954c2c3fbf0e@kwiboo.se>
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
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/5] net: stmmac: dwmac-rk:
 Move integrated_phy_powerup/down functions
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

> > Do you know what these MACPHY_ID are? I hope it is not what you get
> > when you read PHY registers 2 and 3?
> 
> I think it may be:
> 
>   GRF_MACPHY_CON2
>   15:0   macphy_id / PHY ID Number, macphy_cfg_phy_id[15:0]
> 
>   GRF_MACPHY_CON3
>   15:12  macphy_cfg_rev_nr / Manufacturer's Revision Number
>   11:6   macphy_model_nr / Manufacturer's Model Number
>   5:0    macphy_id / PHY ID Number, macphy_cfg_phy_id[21:16]
> 
> and
> 
>   MACPHY_PHY_IDENTIFIER1 - Address: 02
>   15:0   PHY ID number / default:cfg_phy_id[15:0]
> 
>   MACPHY_PHY_IDENTIFIER2 - Address: 03
>   15:10  PHY ID number / default:cfg_phy_id[21:16]
>   9:4    Model number / default:cfg_model_nr[5:0]
>   3:0    Revision number / default:cfg_rev_nr[3:0]
> 
> So likely what you get when you read PHY registers 2 and 3.

Ah:

drivers/net/phy/rockchip.c

#define INTERNAL_EPHY_ID                        0x1234d400

However, it is not clear where the d4 come from.

The problem here is the upper part should be an OUI from the vendor.
I doubt rockchip actually own this OUI. They do actually have the MAC
OUI: 10:DC:B6:90:00:00/28. I don't know if you can use a MAC OUI with
a PHY ID?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
