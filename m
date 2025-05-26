Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD63AC3B17
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 10:05:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 082C3C36B0C;
	Mon, 26 May 2025 08:05:34 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8C02C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 08:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bbADdHqSyemEAUvSgp0Vxsp615wRz96ttPoTQeE5LAo=; b=ahmp7gVKJThDo8tM/ki0syfuDO
 JQtPY1b6f/MhHhhkDOr6epdnAs23WIReEi4cS/jX2seK6jRV8D64egdPDbzu0ATYjmqV3uvgtyRuM
 L28cPXQKHj4swBTuaFPS4vj1udkP0rrgNjalXHH8NVUfvoMPGGM4HxxAGptJvPlWeZJjCRu+CyH86
 EGQDPvyoL7F1xXhi7G5cjdYnVCEex3JGS43fnm0UThcxWdZIqHy41Ry7ItnoTGLzrL621TA2cFa/4
 wtDHSNK4r/xGSPQRieqC6Kranr7QD6YD0UPQjI9sjJWWQazCRZJjGd21XRaeXvljqFD+emrVJbpwY
 0tGoJdlQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50816)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uJSpH-0006VC-1T;
 Mon, 26 May 2025 09:04:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uJSp6-0000Fz-1l;
 Mon, 26 May 2025 09:04:40 +0100
Date: Mon, 26 May 2025 09:04:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250526002924.2567843-2-james.hilliard1@gmail.com>
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

On Sun, May 25, 2025 at 06:29:22PM -0600, James Hilliard wrote:
> +	if (!nvmem_cell_read_u16(dev, "ac300", &val)) {
> +		const char *phy_name = (val & AC300_KEY) ? "ac300" : "ac200";
> +		int index = of_property_match_string(dev->of_node, "phy-names", phy_name);
> +		if (index < 0) {
> +			dev_err(dev, "PHY name not found in device tree\n");
> +			return -EINVAL;
> +		}
> +
> +		plat_dat->phy_node = of_parse_phandle(dev->of_node, "phys", index);
> +		if (!plat_dat->phy_node) {
> +			dev_err(dev, "Failed to get PHY node from phys property\n");
> +			return -EINVAL;
> +		}
> +	}

1. You are re-using the drivers/phy binding for ethernet PHYs driven by
   phylib here.
2. You need to update
   Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
   in a separate patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
