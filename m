Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5651FB1DD27
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 20:34:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC765C36B15;
	Thu,  7 Aug 2025 18:34:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3874AC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 18:34:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CE6075C10F8;
 Thu,  7 Aug 2025 18:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1F9C4CEF6;
 Thu,  7 Aug 2025 18:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754591644;
 bh=loZ2Dv1nU1wHg8IXgsAmVe1JV3DP7oTgPbO/b4U/h1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CpmPWgtNr6JME9JZZzgXleZTqAeizkiuPh+hBP0wMVFh6Kx1clun8/mB0+srli9cF
 iVEjDKD3FUZFp6vN3dnM2+mddVmgrvuFAjDEmaUspyPnYhXh4rsCf3PC3wQCnaUzIT
 bIp8aTpekWizMp5S7ubJshcrZRFcJeLo22Wy2LPSKHDmHW5F5egGSfpEPsiTMCxaE4
 b9l2E9D30swgyyX0QYaqu7NV+yRUiVTRs872rZa134SbSDplPhbz8iy0sVy+ublcZP
 qIYECWImVuKooyKXWddzPlJBIhKyH5ZD0JOc9VFME5xtGphWq++8c5tdmetEbwGHwj
 VxJTRm4IumZxA==
Date: Thu, 7 Aug 2025 19:33:59 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250807183359.GO61519@horms.kernel.org>
References: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: rk: put the PHY clock on
	remove
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

On Thu, Aug 07, 2025 at 09:48:30AM +0100, Russell King (Oracle) wrote:
> The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
> doesn't take part in the devm release. Therefore, when a device is
> unbound, this clock needs to be explicitly put. Fix this.
> 
> Fixes: fecd4d7eef8b ("net: stmmac: dwmac-rk: Add integrated PHY support")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Spotted this resource leak while making other changes to dwmac-rk.
> Would be great if the dwmac-rk maintainers can test it.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 79b92130a03f..4a315c87c4d0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1770,6 +1770,9 @@ static void rk_gmac_remove(struct platform_device *pdev)
>  	stmmac_dvr_remove(&pdev->dev);
>  
>  	rk_gmac_powerdown(bsp_priv);
> +
> +	if (plat->phy_node && bsp_priv->integrated_phy)
> +		clk_put(bsp_priv->clk_phy);

Hi Russell,

Something seems a little off here.
I don't see plat in this context in net.

>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> -- 
> 2.30.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
