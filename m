Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 271AC6E461A
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 13:13:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A94D3C6B453;
	Mon, 17 Apr 2023 11:13:04 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28DCBC6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 11:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1681729983; x=1713265983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W5TQ3wd/xW5hpZCXv0bBA8AsymSy3tuwpq12Dh6k4+w=;
 b=Rl2/Pgdmw8K1A/benxKgwJdcwBHSrkdk4uJ5Jz16uXVyeqX/O3GZm00O
 OLgRa8Nbo6WGb3TnXTvifFDG6OxLhe6MwgLsZGoovnbgOJND0uxXW9yZQ
 NfSEexjl23l/RdKNeg2MB4njUnpPp4cLNEA3x0yPWc0jQKMyxL4Rkiezu
 C18ip5anto4/9COgw2aJ5ce4t2mLQw7KA893X+spGsjR3apfkxastmODo
 qgjtXgnst51MldEpn6P+J8Ki/sSkyoPlA3QFyQyMTeSps/5pxFz01ifLd
 pQtWDU0ceBP8HVsOpoYSP1TWUQ+tqZR5S7ei7bnXFAjqjLxh0MQd8qOEQ w==;
X-IronPort-AV: E=Sophos;i="5.99,204,1677567600"; d="scan'208";a="210758879"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Apr 2023 04:12:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Apr 2023 04:12:58 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Apr 2023 04:12:58 -0700
Date: Mon, 17 Apr 2023 13:12:57 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Alain Volmat <avolmat@me.com>
Message-ID: <20230417111257.ilmlp5y3xp47edzv@soft-dev3-1>
References: <20230416195523.61075-1-avolmat@me.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230416195523.61075-1-avolmat@me.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: ethernet: stmmac: dwmac-sti: remove
 stih415/stih416/stid127
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

The 04/16/2023 21:55, Alain Volmat wrote:
> 
> Remove no more supported platforms (stih415/stih416 and stid127)

Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>

> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> ---
> Patch sent previously as part of serie: https://lore.kernel.org/all/20230209091659.1409-8-avolmat@me.com/
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 60 +------------------
>  1 file changed, 1 insertion(+), 59 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
> index be3b1ebc06ab..465ce66ef9c1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
> @@ -35,7 +35,7 @@
>  #define IS_PHY_IF_MODE_GBIT(iface)     (IS_PHY_IF_MODE_RGMII(iface) || \
>                                          iface == PHY_INTERFACE_MODE_GMII)
> 
> -/* STiH4xx register definitions (STiH415/STiH416/STiH407/STiH410 families)
> +/* STiH4xx register definitions (STiH407/STiH410 families)
>   *
>   * Below table summarizes the clock requirement and clock sources for
>   * supported phy interface modes with link speeds.
> @@ -75,27 +75,6 @@
>  #define STIH4XX_ETH_SEL_INTERNAL_NOTEXT_PHYCLK BIT(7)
>  #define STIH4XX_ETH_SEL_TXCLK_NOT_CLK125       BIT(6)
> 
> -/* STiD127 register definitions
> - *-----------------------
> - * src  |BIT(6)| BIT(7)|
> - *-----------------------
> - * MII   |  1  |   n/a |
> - *-----------------------
> - * RMII  |  n/a        |   1   |
> - * clkgen|     |       |
> - *-----------------------
> - * RMII  |  n/a        |   0   |
> - * phyclk|     |       |
> - *-----------------------
> - * RGMII |  1  |  n/a  |
> - * clkgen|     |       |
> - *-----------------------
> - */
> -
> -#define STID127_RETIME_SRC_MASK                        GENMASK(7, 6)
> -#define STID127_ETH_SEL_INTERNAL_NOTEXT_PHYCLK BIT(7)
> -#define STID127_ETH_SEL_INTERNAL_NOTEXT_TXCLK  BIT(6)
> -
>  #define ENMII_MASK     GENMASK(5, 5)
>  #define ENMII          BIT(5)
>  #define EN_MASK                GENMASK(1, 1)
> @@ -194,36 +173,6 @@ static void stih4xx_fix_retime_src(void *priv, u32 spd)
>                            stih4xx_tx_retime_val[src]);
>  }
> 
> -static void stid127_fix_retime_src(void *priv, u32 spd)
> -{
> -       struct sti_dwmac *dwmac = priv;
> -       u32 reg = dwmac->ctrl_reg;
> -       u32 freq = 0;
> -       u32 val = 0;
> -
> -       if (dwmac->interface == PHY_INTERFACE_MODE_MII) {
> -               val = STID127_ETH_SEL_INTERNAL_NOTEXT_TXCLK;
> -       } else if (dwmac->interface == PHY_INTERFACE_MODE_RMII) {
> -               if (!dwmac->ext_phyclk) {
> -                       val = STID127_ETH_SEL_INTERNAL_NOTEXT_PHYCLK;
> -                       freq = DWMAC_50MHZ;
> -               }
> -       } else if (IS_PHY_IF_MODE_RGMII(dwmac->interface)) {
> -               val = STID127_ETH_SEL_INTERNAL_NOTEXT_TXCLK;
> -               if (spd == SPEED_1000)
> -                       freq = DWMAC_125MHZ;
> -               else if (spd == SPEED_100)
> -                       freq = DWMAC_25MHZ;
> -               else if (spd == SPEED_10)
> -                       freq = DWMAC_2_5MHZ;
> -       }
> -
> -       if (freq)
> -               clk_set_rate(dwmac->clk, freq);
> -
> -       regmap_update_bits(dwmac->regmap, reg, STID127_RETIME_SRC_MASK, val);
> -}
> -
>  static int sti_dwmac_set_mode(struct sti_dwmac *dwmac)
>  {
>         struct regmap *regmap = dwmac->regmap;
> @@ -408,14 +357,7 @@ static const struct sti_dwmac_of_data stih4xx_dwmac_data = {
>         .fix_retime_src = stih4xx_fix_retime_src,
>  };
> 
> -static const struct sti_dwmac_of_data stid127_dwmac_data = {
> -       .fix_retime_src = stid127_fix_retime_src,
> -};
> -
>  static const struct of_device_id sti_dwmac_match[] = {
> -       { .compatible = "st,stih415-dwmac", .data = &stih4xx_dwmac_data},
> -       { .compatible = "st,stih416-dwmac", .data = &stih4xx_dwmac_data},
> -       { .compatible = "st,stid127-dwmac", .data = &stid127_dwmac_data},
>         { .compatible = "st,stih407-dwmac", .data = &stih4xx_dwmac_data},
>         { }
>  };
> --
> 2.34.1
> 

-- 
/Horatiu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
