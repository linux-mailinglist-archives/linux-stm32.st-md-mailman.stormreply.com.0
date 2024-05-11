Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDCC8C3318
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2024 20:11:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65A04C6907A;
	Sat, 11 May 2024 18:11:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C2AFC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2024 18:11:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7DD91CE0A0D;
 Sat, 11 May 2024 18:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD5DC2BBFC;
 Sat, 11 May 2024 18:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715451089;
 bh=+t8uRZp6FGvXN+V4ScRGLv+eJyrrubY4gibWN6mdiHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2jdkaZbC/mdPAuuX1eCHbhGEu4F1appnZLT1q4rOQrw8hs/5sppQXOV2zRweyBYM
 JTRs/m6M7JXBsqp66uNQmSheaAZglqcUtJ3KTp+CYxoJdYVdL8mkPlW0T9h3sdNZd/
 NMAoMhuFa/s8NWyrGFlr48VOgPI0J7tCsvDWvHG2Z4+mJITYr+8ino8G7uaoGs94dq
 4IQKjoJsADnxbivm5h7bvNIelFTpLU0gvAMQXaZVDsCvKI+jM49sYKr3VuamE5KHNX
 TdHySYjtKa8IrqdiexAKN418X1uM8P+d4U6H6DtqFXH+Skitspy7NC7OV4gLXyj7w0
 zsmqfQV10pQgQ==
Date: Sat, 11 May 2024 19:11:19 +0100
From: Simon Horman <horms@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20240511181119.GU2347895@kernel.org>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
 <20240510-rzn1-gmac1-v6-4-b63942be334c@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510-rzn1-gmac1-v6-4-b63942be334c@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v6 4/7] net: stmmac: introduce
 pcs_init/pcs_exit stmmac operations
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

On Fri, May 10, 2024 at 09:38:11AM +0200, Romain Gantois wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Introduce a mechanism whereby platforms can create their PCS instances
> prior to the network device being published to userspace, but after
> some of the core stmmac initialisation has been completed. This means
> that the data structures that platforms need will be available.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 8 +++++++-
>  include/linux/stmmac.h                            | 2 ++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 778d79cdb2e6d..f562c563aab55 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -505,7 +505,10 @@ int stmmac_pcs_setup(struct net_device *ndev)
>  	priv = netdev_priv(ndev);
>  	mode = priv->plat->phy_interface;
>  
> -	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> +	if (priv->plat->pcs_init) {
> +		ret = priv->plat->pcs_init(priv);
> +	} else if (priv->plat->mdio_bus_data &&
> +		   priv->plat->mdio_bus_data->has_xpcs) {
>  		/* Try to probe the XPCS by scanning all addresses */
>  		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
>  			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);

I am unsure if this can occur, but if priv->plat->pcs_init returns 0 then
xpcs will be used while uninitialised towards the end of this function.

Flagged by Smatch.

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
