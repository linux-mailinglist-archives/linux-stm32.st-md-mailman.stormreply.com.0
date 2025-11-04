Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC84EC304B1
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 10:37:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FC31C62ED5;
	Tue,  4 Nov 2025 09:37:12 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50467C030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 09:37:11 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E01321A0135;
 Tue,  4 Nov 2025 10:37:10 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D26211A004C;
 Tue,  4 Nov 2025 10:37:10 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 38F12202E8;
 Tue,  4 Nov 2025 10:37:10 +0100 (CET)
Date: Tue, 4 Nov 2025 10:37:10 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aQnJRgJqFY99kDUj@lsv051416.swis.nl-cdc01.nxp.com>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Andrew Lunn <andrew@lunn.ch>, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 02/11] net: stmmac: s32: move
 PHY_INTF_SEL_x definitions out of the way
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

On Mon, Nov 03, 2025 at 11:50:00AM +0000, Russell King (Oracle) wrote:
> S32's PHY_INTF_SEL_x definitions conflict with those for the dwmac
> cores as they use a different bitmapping. Add a S32 prefix so that
> they are unique.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index ee095ac13203..2b7ad64bfdf7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -24,10 +24,10 @@
>  #define GMAC_INTF_RATE_125M	125000000	/* 125MHz */
>  
>  /* SoC PHY interface control register */
> -#define PHY_INTF_SEL_MII	0x00
> -#define PHY_INTF_SEL_SGMII	0x01
> -#define PHY_INTF_SEL_RGMII	0x02
> -#define PHY_INTF_SEL_RMII	0x08
> +#define S32_PHY_INTF_SEL_MII	0x00
> +#define S32_PHY_INTF_SEL_SGMII	0x01
> +#define S32_PHY_INTF_SEL_RGMII	0x02
> +#define S32_PHY_INTF_SEL_RMII	0x08
>  
>  struct s32_priv_data {
>  	void __iomem *ioaddr;
> @@ -40,7 +40,7 @@ struct s32_priv_data {
>  
>  static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
>  {
> -	writel(PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> +	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
>  
>  	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
>  
> -- 
> 2.47.3
> 

Reviewed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Thanks.
/Jan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
