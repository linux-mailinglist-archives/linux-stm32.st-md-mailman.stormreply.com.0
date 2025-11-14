Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB19C5BFBA
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 09:29:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B410FC628DA;
	Fri, 14 Nov 2025 08:29:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 030D2C628D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 08:29:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BF9A11A1A97;
 Fri, 14 Nov 2025 08:29:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 898016060E;
 Fri, 14 Nov 2025 08:29:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44280102F2A6F; Fri, 14 Nov 2025 09:29:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763108966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=oh1RyQ/hqshJv7h0FVQIWfm6iSSfXUFDQaBC2BpyrLY=;
 b=Xy6P+Mw6G2wT0eFHTV033JAm0DBQfCqHl2xKim/dBNlR819Vbh1al1a2zHFAznFSICHH3i
 4Yn0qL+x3DzONoMCF/K+Zfjq4CXiPLViizxq0suDxHgSbsEIq+1y5gPqulO+I2hW9Ko9tI
 99JKCBCVXlleEU7ey/cEpZpHdM7KaYpjKloyuaRZFXSjttJJMJq3Nc+J0HALC321e2B0Dp
 jopdsstPtKRkhz6Z40CB7vqysuF6yk9PsTvNUWFBs7Vxe5gdmh53nUJE6ICmMZkofJUK/M
 ttQbu9oqvMPGSJV0rhGGaumTHcQmIDDMwganumgkm0tDFTzLvf8re8yrgUeY+w==
Message-ID: <0937e9a9-f79f-42e6-ab28-7fec0623ffa4@bootlin.com>
Date: Fri, 14 Nov 2025 09:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aRYZaKTIvfYoV3wE@shell.armlinux.org.uk>
 <E1vJbPG-0000000EBqb-2cF2@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vJbPG-0000000EBqb-2cF2@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: rk: use
 PHY_INTF_SEL_x in functions
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



On 13/11/2025 18:46, Russell King (Oracle) wrote:
> Rather than defining one xxx_GMAC_PHY_INTF_SEL_xxx() for each mode,
> define xxx_GMAC_PHY_INTF_SEL() which takes the phy_intf_sel value.
> Pass the appropriate value into these new macros in the set_to_xxx()
> methods.
> 
> No change to produced code on aarch64.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 91 +++++++++----------
>  1 file changed, 43 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 49076ee00877..6e75da577af5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -234,14 +234,14 @@ static void rk_gmac_integrated_fephy_powerdown(struct rk_priv_data *priv,
>  #define PX30_GRF_GMAC_CON1		0x0904
>  
>  /* PX30_GRF_GMAC_CON1 */
> -#define PX30_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
> +#define PX30_GMAC_PHY_INTF_SEL(val)	GRF_FIELD(6, 4, val)
>  #define PX30_GMAC_SPEED_10M		GRF_CLR_BIT(2)
>  #define PX30_GMAC_SPEED_100M		GRF_BIT(2)
>  
>  static void px30_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
>  	regmap_write(bsp_priv->grf, PX30_GRF_GMAC_CON1,
> -		     PX30_GMAC_PHY_INTF_SEL_RMII);
> +		     PX30_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII));
>  }
>  
>  static int px30_set_speed(struct rk_priv_data *bsp_priv,
> @@ -290,8 +290,7 @@ static const struct rk_gmac_ops px30_ops = {
>  #define RK3128_GMAC_CLK_TX_DL_CFG(val) GRF_FIELD(6, 0, val)
>  
>  /* RK3128_GRF_MAC_CON1 */
> -#define RK3128_GMAC_PHY_INTF_SEL_RGMII GRF_FIELD(8, 6, PHY_INTF_SEL_RGMII)
> -#define RK3128_GMAC_PHY_INTF_SEL_RMII  GRF_FIELD(8, 6, PHY_INTF_SEL_RMII)
> +#define RK3128_GMAC_PHY_INTF_SEL(val)  GRF_FIELD(8, 6, val)
>  #define RK3128_GMAC_FLOW_CTRL          GRF_BIT(9)
>  #define RK3128_GMAC_FLOW_CTRL_CLR      GRF_CLR_BIT(9)
>  #define RK3128_GMAC_SPEED_10M          GRF_CLR_BIT(10)
> @@ -308,7 +307,7 @@ static void rk3128_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  				int tx_delay, int rx_delay)
>  {
>  	regmap_write(bsp_priv->grf, RK3128_GRF_MAC_CON1,
> -		     RK3128_GMAC_PHY_INTF_SEL_RGMII |
> +		     RK3128_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RGMII) |
>  		     RK3128_GMAC_RMII_MODE_CLR);
>  	regmap_write(bsp_priv->grf, RK3128_GRF_MAC_CON0,
>  		     DELAY_ENABLE(RK3128, tx_delay, rx_delay) |
> @@ -319,7 +318,8 @@ static void rk3128_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  static void rk3128_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
>  	regmap_write(bsp_priv->grf, RK3128_GRF_MAC_CON1,
> -		     RK3128_GMAC_PHY_INTF_SEL_RMII | RK3128_GMAC_RMII_MODE);
> +		     RK3128_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII) |
> +		     RK3128_GMAC_RMII_MODE);
>  }
>  
>  static const struct rk_reg_speed_data rk3128_reg_speed_data = {
> @@ -353,8 +353,7 @@ static const struct rk_gmac_ops rk3128_ops = {
>  #define RK3228_GMAC_CLK_TX_DL_CFG(val)	GRF_FIELD(6, 0, val)
>  
>  /* RK3228_GRF_MAC_CON1 */
> -#define RK3228_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RGMII)
> -#define RK3228_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
> +#define RK3228_GMAC_PHY_INTF_SEL(val)	GRF_FIELD(6, 4, val)
>  #define RK3228_GMAC_FLOW_CTRL		GRF_BIT(3)
>  #define RK3228_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
>  #define RK3228_GMAC_SPEED_10M		GRF_CLR_BIT(2)
> @@ -378,7 +377,7 @@ static void rk3228_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  				int tx_delay, int rx_delay)
>  {
>  	regmap_write(bsp_priv->grf, RK3228_GRF_MAC_CON1,
> -		     RK3228_GMAC_PHY_INTF_SEL_RGMII |
> +		     RK3228_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RGMII) |
>  		     RK3228_GMAC_RMII_MODE_CLR |
>  		     DELAY_ENABLE(RK3228, tx_delay, rx_delay));
>  
> @@ -390,7 +389,7 @@ static void rk3228_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  static void rk3228_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
>  	regmap_write(bsp_priv->grf, RK3228_GRF_MAC_CON1,
> -		     RK3228_GMAC_PHY_INTF_SEL_RMII |
> +		     RK3228_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII) |
>  		     RK3228_GMAC_RMII_MODE);
>  
>  	/* set MAC to RMII mode */
> @@ -432,8 +431,7 @@ static const struct rk_gmac_ops rk3228_ops = {
>  #define RK3288_GRF_SOC_CON3	0x0250
>  
>  /*RK3288_GRF_SOC_CON1*/
> -#define RK3288_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(8, 6, PHY_INTF_SEL_RGMII)
> -#define RK3288_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(8, 6, PHY_INTF_SEL_RMII)
> +#define RK3288_GMAC_PHY_INTF_SEL(val)	GRF_FIELD(8, 6, val)
>  #define RK3288_GMAC_FLOW_CTRL		GRF_BIT(9)
>  #define RK3288_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(9)
>  #define RK3288_GMAC_SPEED_10M		GRF_CLR_BIT(10)
> @@ -458,7 +456,7 @@ static void rk3288_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  				int tx_delay, int rx_delay)
>  {
>  	regmap_write(bsp_priv->grf, RK3288_GRF_SOC_CON1,
> -		     RK3288_GMAC_PHY_INTF_SEL_RGMII |
> +		     RK3288_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RGMII) |
>  		     RK3288_GMAC_RMII_MODE_CLR);
>  	regmap_write(bsp_priv->grf, RK3288_GRF_SOC_CON3,
>  		     DELAY_ENABLE(RK3288, tx_delay, rx_delay) |
> @@ -469,7 +467,8 @@ static void rk3288_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  static void rk3288_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
>  	regmap_write(bsp_priv->grf, RK3288_GRF_SOC_CON1,
> -		     RK3288_GMAC_PHY_INTF_SEL_RMII | RK3288_GMAC_RMII_MODE);
> +		     RK3288_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII) |
> +		     RK3288_GMAC_RMII_MODE);
>  }
>  
>  static const struct rk_reg_speed_data rk3288_reg_speed_data = {
> @@ -496,7 +495,7 @@ static const struct rk_gmac_ops rk3288_ops = {
>  #define RK3308_GRF_MAC_CON0		0x04a0
>  
>  /* RK3308_GRF_MAC_CON0 */
> -#define RK3308_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(4, 2, PHY_INTF_SEL_RMII)
> +#define RK3308_GMAC_PHY_INTF_SEL(val)	GRF_FIELD(4, 2, val)
>  #define RK3308_GMAC_FLOW_CTRL		GRF_BIT(3)
>  #define RK3308_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
>  #define RK3308_GMAC_SPEED_10M		GRF_CLR_BIT(0)
> @@ -505,7 +504,7 @@ static const struct rk_gmac_ops rk3288_ops = {
>  static void rk3308_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
>  	regmap_write(bsp_priv->grf, RK3308_GRF_MAC_CON0,
> -		     RK3308_GMAC_PHY_INTF_SEL_RMII);
> +		     RK3308_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII));
>  }
>  
>  static const struct rk_reg_speed_data rk3308_reg_speed_data = {
> @@ -535,8 +534,7 @@ static const struct rk_gmac_ops rk3308_ops = {
>  #define RK3328_GMAC_CLK_TX_DL_CFG(val)	GRF_FIELD(6, 0, val)
>  
>  /* RK3328_GRF_MAC_CON1 */
> -#define RK3328_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RGMII)
> -#define RK3328_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
> +#define RK3328_GMAC_PHY_INTF_SEL(val)	GRF_FIELD(6, 4, val)
>  #define RK3328_GMAC_FLOW_CTRL		GRF_BIT(3)
>  #define RK3328_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
>  #define RK3328_GMAC_SPEED_10M		GRF_CLR_BIT(2)
> @@ -558,7 +556,7 @@ static void rk3328_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  				int tx_delay, int rx_delay)
>  {
>  	regmap_write(bsp_priv->grf, RK3328_GRF_MAC_CON1,
> -		     RK3328_GMAC_PHY_INTF_SEL_RGMII |
> +		     RK3328_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RGMII) |
>  		     RK3328_GMAC_RMII_MODE_CLR |
>  		     RK3328_GMAC_RXCLK_DLY_ENABLE |
>  		     RK3328_GMAC_TXCLK_DLY_ENABLE);
> @@ -576,7 +574,7 @@ static void rk3328_set_to_rmii(struct rk_priv_data *bsp_priv)
>  		  RK3328_GRF_MAC_CON1;
>  
>  	regmap_write(bsp_priv->grf, reg,
> -		     RK3328_GMAC_PHY_INTF_SEL_RMII |
> +		     RK3328_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII) |
>  		     RK3328_GMAC_RMII_MODE);
>  }
>  
> @@ -622,8 +620,7 @@ static const struct rk_gmac_ops rk3328_ops = {
>  #define RK3366_GRF_SOC_CON7	0x041c
>  
>  /* RK3366_GRF_SOC_CON6 */
> -#define RK3366_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RGMII)
> -#define RK3366_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RMII)
> +#define RK3366_GMAC_PHY_INTF_SEL(val)	GRF_FIELD(11, 9, val)
>  #define RK3366_GMAC_FLOW_CTRL		GRF_BIT(8)
>  #define RK3366_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
>  #define RK3366_GMAC_SPEED_10M		GRF_CLR_BIT(7)
> @@ -648,7 +645,7 @@ static void rk3366_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  				int tx_delay, int rx_delay)
>  {
>  	regmap_write(bsp_priv->grf, RK3366_GRF_SOC_CON6,
> -		     RK3366_GMAC_PHY_INTF_SEL_RGMII |
> +		     RK3366_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RGMII) |
>  		     RK3366_GMAC_RMII_MODE_CLR);
>  	regmap_write(bsp_priv->grf, RK3366_GRF_SOC_CON7,
>  		     DELAY_ENABLE(RK3366, tx_delay, rx_delay) |
> @@ -659,7 +656,8 @@ static void rk3366_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  static void rk3366_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
>  	regmap_write(bsp_priv->grf, RK3366_GRF_SOC_CON6,
> -		     RK3366_GMAC_PHY_INTF_SEL_RMII | RK3366_GMAC_RMII_MODE);
> +		     RK3366_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII) |
> +		     RK3366_GMAC_RMII_MODE);
>  }
>  
>  static const struct rk_reg_speed_data rk3366_reg_speed_data = {
> @@ -687,8 +685,7 @@ static const struct rk_gmac_ops rk3366_ops = {
>  #define RK3368_GRF_SOC_CON16	0x0440
>  
>  /* RK3368_GRF_SOC_CON15 */
> -#define RK3368_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RGMII)
> -#define RK3368_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RMII)
> +#define RK3368_GMAC_PHY_INTF_SEL(val)	GRF_FIELD(11, 9, val)
>  #define RK3368_GMAC_FLOW_CTRL		GRF_BIT(8)
>  #define RK3368_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
>  #define RK3368_GMAC_SPEED_10M		GRF_CLR_BIT(7)
> @@ -713,7 +710,7 @@ static void rk3368_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  				int tx_delay, int rx_delay)
>  {
>  	regmap_write(bsp_priv->grf, RK3368_GRF_SOC_CON15,
> -		     RK3368_GMAC_PHY_INTF_SEL_RGMII |
> +		     RK3368_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RGMII) |
>  		     RK3368_GMAC_RMII_MODE_CLR);
>  	regmap_write(bsp_priv->grf, RK3368_GRF_SOC_CON16,
>  		     DELAY_ENABLE(RK3368, tx_delay, rx_delay) |
> @@ -724,7 +721,8 @@ static void rk3368_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  static void rk3368_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
>  	regmap_write(bsp_priv->grf, RK3368_GRF_SOC_CON15,
> -		     RK3368_GMAC_PHY_INTF_SEL_RMII | RK3368_GMAC_RMII_MODE);
> +		     RK3368_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII) |
> +		     RK3368_GMAC_RMII_MODE);
>  }
>  
>  static const struct rk_reg_speed_data rk3368_reg_speed_data = {
> @@ -752,8 +750,7 @@ static const struct rk_gmac_ops rk3368_ops = {
>  #define RK3399_GRF_SOC_CON6	0xc218
>  
>  /* RK3399_GRF_SOC_CON5 */
> -#define RK3399_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RGMII)
> -#define RK3399_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RMII)
> +#define RK3399_GMAC_PHY_INTF_SEL(val)	GRF_FIELD(11, 9, val)
>  #define RK3399_GMAC_FLOW_CTRL		GRF_BIT(8)
>  #define RK3399_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
>  #define RK3399_GMAC_SPEED_10M		GRF_CLR_BIT(7)
> @@ -778,7 +775,7 @@ static void rk3399_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  				int tx_delay, int rx_delay)
>  {
>  	regmap_write(bsp_priv->grf, RK3399_GRF_SOC_CON5,
> -		     RK3399_GMAC_PHY_INTF_SEL_RGMII |
> +		     RK3399_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RGMII) |
>  		     RK3399_GMAC_RMII_MODE_CLR);
>  	regmap_write(bsp_priv->grf, RK3399_GRF_SOC_CON6,
>  		     DELAY_ENABLE(RK3399, tx_delay, rx_delay) |
> @@ -789,7 +786,8 @@ static void rk3399_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  static void rk3399_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
>  	regmap_write(bsp_priv->grf, RK3399_GRF_SOC_CON5,
> -		     RK3399_GMAC_PHY_INTF_SEL_RMII | RK3399_GMAC_RMII_MODE);
> +		     RK3399_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII) |
> +		     RK3399_GMAC_RMII_MODE);
>  }
>  
>  static const struct rk_reg_speed_data rk3399_reg_speed_data = {
> @@ -1015,8 +1013,7 @@ static const struct rk_gmac_ops rk3528_ops = {
>  #define RK3568_GRF_GMAC1_CON1		0x038c
>  
>  /* RK3568_GRF_GMAC0_CON1 && RK3568_GRF_GMAC1_CON1 */
> -#define RK3568_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RGMII)
> -#define RK3568_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
> +#define RK3568_GMAC_PHY_INTF_SEL(val)	GRF_FIELD(6, 4, val)
>  #define RK3568_GMAC_FLOW_CTRL			GRF_BIT(3)
>  #define RK3568_GMAC_FLOW_CTRL_CLR		GRF_CLR_BIT(3)
>  #define RK3568_GMAC_RXCLK_DLY_ENABLE		GRF_BIT(1)
> @@ -1043,7 +1040,7 @@ static void rk3568_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  		     RK3568_GMAC_CLK_TX_DL_CFG(tx_delay));
>  
>  	regmap_write(bsp_priv->grf, con1,
> -		     RK3568_GMAC_PHY_INTF_SEL_RGMII |
> +		     RK3568_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RGMII) |
>  		     RK3568_GMAC_RXCLK_DLY_ENABLE |
>  		     RK3568_GMAC_TXCLK_DLY_ENABLE);
>  }
> @@ -1054,7 +1051,8 @@ static void rk3568_set_to_rmii(struct rk_priv_data *bsp_priv)
>  
>  	con1 = (bsp_priv->id == 1) ? RK3568_GRF_GMAC1_CON1 :
>  				     RK3568_GRF_GMAC0_CON1;
> -	regmap_write(bsp_priv->grf, con1, RK3568_GMAC_PHY_INTF_SEL_RMII);
> +	regmap_write(bsp_priv->grf, con1,
> +		     RK3568_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII));
>  }
>  
>  static const struct rk_gmac_ops rk3568_ops = {
> @@ -1208,10 +1206,8 @@ static const struct rk_gmac_ops rk3576_ops = {
>  #define RK3588_GRF_GMAC_CON0			0X0008
>  #define RK3588_GRF_CLK_CON1			0X0070
>  
> -#define RK3588_GMAC_PHY_INTF_SEL_RGMII(id)	\
> -	(GRF_FIELD(5, 3, PHY_INTF_SEL_RGMII) << ((id) * 6))
> -#define RK3588_GMAC_PHY_INTF_SEL_RMII(id)	\
> -	(GRF_FIELD(5, 3, PHY_INTF_SEL_RMII) << ((id) * 6))
> +#define RK3588_GMAC_PHY_INTF_SEL(id, val)	\
> +	(GRF_FIELD(5, 3, val) << ((id) * 6))
>  
>  #define RK3588_GMAC_CLK_RMII_MODE(id)		GRF_BIT(5 * (id))
>  #define RK3588_GMAC_CLK_RGMII_MODE(id)		GRF_CLR_BIT(5 * (id))
> @@ -1241,7 +1237,7 @@ static void rk3588_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  					 RK3588_GRF_GMAC_CON8;
>  
>  	regmap_write(bsp_priv->php_grf, RK3588_GRF_GMAC_CON0,
> -		     RK3588_GMAC_PHY_INTF_SEL_RGMII(id));
> +		     RK3588_GMAC_PHY_INTF_SEL(id, PHY_INTF_SEL_RGMII));
>  
>  	regmap_write(bsp_priv->php_grf, RK3588_GRF_CLK_CON1,
>  		     RK3588_GMAC_CLK_RGMII_MODE(id));
> @@ -1258,7 +1254,7 @@ static void rk3588_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  static void rk3588_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
>  	regmap_write(bsp_priv->php_grf, RK3588_GRF_GMAC_CON0,
> -		     RK3588_GMAC_PHY_INTF_SEL_RMII(bsp_priv->id));
> +		     RK3588_GMAC_PHY_INTF_SEL(bsp_priv->id, PHY_INTF_SEL_RMII));
>  
>  	regmap_write(bsp_priv->php_grf, RK3588_GRF_CLK_CON1,
>  		     RK3588_GMAC_CLK_RMII_MODE(bsp_priv->id));
> @@ -1328,7 +1324,7 @@ static const struct rk_gmac_ops rk3588_ops = {
>  #define RV1108_GRF_GMAC_CON0		0X0900
>  
>  /* RV1108_GRF_GMAC_CON0 */
> -#define RV1108_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
> +#define RV1108_GMAC_PHY_INTF_SEL(val)	GRF_FIELD(6, 4, val)
>  #define RV1108_GMAC_FLOW_CTRL		GRF_BIT(3)
>  #define RV1108_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
>  #define RV1108_GMAC_SPEED_10M		GRF_CLR_BIT(2)
> @@ -1339,7 +1335,7 @@ static const struct rk_gmac_ops rk3588_ops = {
>  static void rv1108_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
>  	regmap_write(bsp_priv->grf, RV1108_GRF_GMAC_CON0,
> -		     RV1108_GMAC_PHY_INTF_SEL_RMII);
> +		     RV1108_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII));
>  }
>  
>  static const struct rk_reg_speed_data rv1108_reg_speed_data = {
> @@ -1364,8 +1360,7 @@ static const struct rk_gmac_ops rv1108_ops = {
>  #define RV1126_GRF_GMAC_CON2		0X0078
>  
>  /* RV1126_GRF_GMAC_CON0 */
> -#define RV1126_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RGMII)
> -#define RV1126_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
> +#define RV1126_GMAC_PHY_INTF_SEL(val)	GRF_FIELD(6, 4, val)
>  #define RV1126_GMAC_FLOW_CTRL			GRF_BIT(7)
>  #define RV1126_GMAC_FLOW_CTRL_CLR		GRF_CLR_BIT(7)
>  #define RV1126_GMAC_M0_RXCLK_DLY_ENABLE		GRF_BIT(1)
> @@ -1388,7 +1383,7 @@ static void rv1126_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  				int tx_delay, int rx_delay)
>  {
>  	regmap_write(bsp_priv->grf, RV1126_GRF_GMAC_CON0,
> -		     RV1126_GMAC_PHY_INTF_SEL_RGMII |
> +		     RV1126_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RGMII) |
>  		     RV1126_GMAC_M0_RXCLK_DLY_ENABLE |
>  		     RV1126_GMAC_M0_TXCLK_DLY_ENABLE |
>  		     RV1126_GMAC_M1_RXCLK_DLY_ENABLE |
> @@ -1406,7 +1401,7 @@ static void rv1126_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  static void rv1126_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
>  	regmap_write(bsp_priv->grf, RV1126_GRF_GMAC_CON0,
> -		     RV1126_GMAC_PHY_INTF_SEL_RMII);
> +		     RV1126_GMAC_PHY_INTF_SEL(PHY_INTF_SEL_RMII));
>  }
>  
>  static const struct rk_gmac_ops rv1126_ops = {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
