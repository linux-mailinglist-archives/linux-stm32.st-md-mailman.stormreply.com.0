Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04015A59676
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 14:38:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B21DEC78F97;
	Mon, 10 Mar 2025 13:38:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48302C7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 13:38:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6784153B;
 Mon, 10 Mar 2025 06:38:36 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E9E63F673;
 Mon, 10 Mar 2025 06:38:22 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:38:19 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250310133819.7c2204a6@donnerap.manchester.arm.com>
In-Reply-To: <E1trbyA-005qYf-Hb@rmk-PC.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
 <E1trbyA-005qYf-Hb@rmk-PC.armlinux.org.uk>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 8/9] net: stmmac: sun8i: remove
 of_get_phy_mode()
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

On Mon, 10 Mar 2025 12:10:54 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

Hi,

> devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
> which is stored in plat_dat->phy_interface. Therefore, we don't need to
> get it in platform code.
> 
> sun8i was using of_get_phy_mode() to set plat_dat->mac_interface, which
> defaults to plat_dat->phy_interface when the mac-mode DT property is
> not present. As nothing in arch/*/boot/dts sets the mac-mode property,
> it is highly likely that these two will be identical, and thus there
> is no need for this glue driver to set plat_dat->mac_interface.

Well, the current sun8i code wouldn't help anyway, because the driver
would set mac_interface to the value of "phy-mode", not "mac-mode", which
is strictly speaking a bug.
But in any case this is indeed redundant, so:

> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 4b7b2582a120..85723a78793a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1155,11 +1155,10 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	struct stmmac_resources stmmac_res;
>  	struct sunxi_priv_data *gmac;
>  	struct device *dev = &pdev->dev;
> -	phy_interface_t interface;
> -	int ret;
>  	struct stmmac_priv *priv;
>  	struct net_device *ndev;
>  	struct regmap *regmap;
> +	int ret;
>  
>  	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
>  	if (ret)
> @@ -1219,10 +1218,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = of_get_phy_mode(dev->of_node, &interface);
> -	if (ret)
> -		return -EINVAL;
> -
>  	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
> @@ -1230,7 +1225,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	/* platform data specifying hardware features and callbacks.
>  	 * hardware features were copied from Allwinner drivers.
>  	 */
> -	plat_dat->mac_interface = interface;
>  	plat_dat->rx_coe = STMMAC_RX_COE_TYPE2;
>  	plat_dat->tx_coe = 1;
>  	plat_dat->flags |= STMMAC_FLAG_HAS_SUN8I;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
