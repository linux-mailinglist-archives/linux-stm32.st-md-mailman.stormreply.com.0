Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A58BAC411E
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 16:14:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21B15C36B0E;
	Mon, 26 May 2025 14:14:47 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2828BC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 14:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=gTUQIv6xtVQdEIhWmKs1GCL0HyslUp2+oj7lqnt+NHQ=; b=Ci1RKDb6871pfBSzyscgJXu0GQ
 rqWL6a6oZXu1JWVoZrzBArnlLSOMg0jGzEsX9C+54h22e0E79PbXd5vCv/kb/scMxfqVR+0Sy5rkj
 FTHPaIn1AIf27eudzyyjNlNPfgrVDJ8XFac94nsGGF8cxeHADlC+aoh5itlnIaFaCM44=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uJYad-00E0Oq-Sg; Mon, 26 May 2025 16:14:07 +0200
Date: Mon, 26 May 2025 16:14:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <4a2c60a2-03a7-43b8-9f40-ea2b0a3c4154@lunn.ch>
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com>
 <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
Cc: Huacai Chen <chenhuacai@kernel.org>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Yanteng Si <si.yanteng@linux.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 Yinggang Gu <guyinggang@loongson.cn>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow
 runtime AC200/AC300 phy selection
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

On Mon, May 26, 2025 at 09:04:40AM +0100, Russell King (Oracle) wrote:
> On Sun, May 25, 2025 at 06:29:22PM -0600, James Hilliard wrote:
> > +	if (!nvmem_cell_read_u16(dev, "ac300", &val)) {
> > +		const char *phy_name = (val & AC300_KEY) ? "ac300" : "ac200";
> > +		int index = of_property_match_string(dev->of_node, "phy-names", phy_name);
> > +		if (index < 0) {
> > +			dev_err(dev, "PHY name not found in device tree\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		plat_dat->phy_node = of_parse_phandle(dev->of_node, "phys", index);
> > +		if (!plat_dat->phy_node) {
> > +			dev_err(dev, "Failed to get PHY node from phys property\n");
> > +			return -EINVAL;
> > +		}
> > +	}
> 
> 1. You are re-using the drivers/phy binding for ethernet PHYs driven by
>    phylib here.
> 2. You need to update
>    Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
>    in a separate patch.

A real user, i.e. a patch to a .dts file, would also be good.

  Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
