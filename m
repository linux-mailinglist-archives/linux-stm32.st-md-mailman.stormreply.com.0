Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F04817372
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 15:21:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C120AC6DD70;
	Mon, 18 Dec 2023 14:21:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE869C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 14:21:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0A34E000B;
 Mon, 18 Dec 2023 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1702909281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQw29QHd8zTMi7v6dsnaa4P9rlD914DPy1yBSIn+0Cg=;
 b=K8RybCH1i6Prm5fa0N3t6j9euM7ngUB07bbFmAdpt+An6uh4uFbqfK4M7CzJFJFSDWxlum
 inexve6GYD5Sy6m6FBgATSjQ6GUJBNvfcUBXEO4dhq4u4LzdYr7wmyf/KwMMOe1DntNOLX
 S/e5Ms+/5q4DZIECN0SN9FcxietLbMQ0a4vC1DauiU7gZufwGKHwQ/MzGI8YTbHi2yfdbw
 9o0vTP63H+W9xYd/5zNmbSuG4saDGvT6WpWSGauWcb8/80aDwVBTRAYip03UoSvLrxUh7n
 XtU1PSDuLs0lGrK3Luy6b8awrD94GB7xUoWYec5SpU2r3hNzM7GBtbStd+UfUg==
Date: Mon, 18 Dec 2023 15:21:12 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <20231218152112.4adc5961@device-28.home>
In-Reply-To: <20231218071118.21879-1-quic_snehshah@quicinc.com>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos:
 Add support for 2.5G SGMII
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

Hi,

On Mon, 18 Dec 2023 12:41:18 +0530
Sneh Shah <quic_snehshah@quicinc.com> wrote:

> Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
> mode for 1G/100M/10M speed.
> Added changes to configure serdes phy and mac based on link speed.
> 
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 31 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index d3bf42d0fceb..b3a28dc19161 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -21,6 +21,7 @@
>  #define RGMII_IO_MACRO_CONFIG2		0x1C
>  #define RGMII_IO_MACRO_DEBUG1		0x20
>  #define EMAC_SYSTEM_LOW_POWER_DEBUG	0x28
> +#define ETHQOS_MAC_AN_CTRL		0xE0
>  
>  /* RGMII_IO_MACRO_CONFIG fields */
>  #define RGMII_CONFIG_FUNC_CLK_EN		BIT(30)
> @@ -78,6 +79,10 @@
>  #define ETHQOS_MAC_CTRL_SPEED_MODE		BIT(14)
>  #define ETHQOS_MAC_CTRL_PORT_SEL		BIT(15)
>  
> +/*ETHQOS_MAC_AN_CTRL bits */
> +#define ETHQOS_MAC_AN_CTRL_RAN			BIT(9)
> +#define ETHQOS_MAC_AN_CTRL_ANE			BIT(12)
> +
>  struct ethqos_emac_por {
>  	unsigned int offset;
>  	unsigned int value;
> @@ -109,6 +114,7 @@ struct qcom_ethqos {
>  	unsigned int num_por;
>  	bool rgmii_config_loopback_en;
>  	bool has_emac_ge_3;
> +	unsigned int serdes_speed;

Looks like you are storing SPEED_XXX definitions here, which can be
negative in case of SPEED_UNKNOWN, so this should be an int.

>  };
>  
>  static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
> @@ -600,27 +606,47 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
>  
>  static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  {
> -	int val;
> -
> +	int val, mac_an_value;
>  	val = readl(ethqos->mac_base + MAC_CTRL_REG);
> +	mac_an_value = readl(ethqos->mac_base + ETHQOS_MAC_AN_CTRL);
>  
>  	switch (ethqos->speed) {
> +	case SPEED_2500:
> +		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
> +		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> +			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> +			      RGMII_IO_MACRO_CONFIG2);
> +		if (ethqos->serdes_speed != SPEED_2500)
> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> +		mac_an_value &= ~ETHQOS_MAC_AN_CTRL_ANE;
> +		break;
>  	case SPEED_1000:
>  		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
>  		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>  			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
>  			      RGMII_IO_MACRO_CONFIG2);
> +		if (ethqos->serdes_speed != SPEED_1000)
> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
>  		break;
>  	case SPEED_100:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
> +		if (ethqos->serdes_speed != SPEED_1000)
> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);

I understand that SGMII's serdes always runs at 1000 / 2500, but this
check doesn't make much sense then, if the speed isn't 1000, then you
set the serdes PHY's speed to 100, and the assignment that comes after
that switch-case will also set the serdes speed to 100.

Also, if the serdes PHY really needs to be configured differently for
10/100/1000, then switching from speed 1000 to speed 100 for example
won't trigger a serdes PHY reconfiguration here.

My guess is that you want something like :

	phy_set_speed(ethqos->serdes_phy, SPEED_1000)

and the assignment at the end of the switch-case should be
SPEED_1000/SPEED_2500 only (see the comment bellow).

> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
>  		break;
>  	case SPEED_10:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
> +		if (ethqos->serdes_speed != SPEED_1000)
> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);

Same remark here

> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
>  		break;
>  	}
>  
>  	writel(val, ethqos->mac_base + MAC_CTRL_REG);
> +	writel(mac_an_value, ethqos->mac_base + ETHQOS_MAC_AN_CTRL);
> +	ethqos->serdes_speed = ethqos->speed;

Although the code will behave the same, as you are storing the true
serdes speed here, shouldn't it be either SPEED_1000 or SPEED_2500 ?

You'll end-up storing SPEED_10 / SPEED_100 should the link use these
speeds, which doesn't represent the true serdes speed.

This would spare serdes reconfigurations when alternating between
10/100/1000M speeds.

>  	return val;
>  }
> @@ -789,6 +815,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  				     "Failed to get serdes phy\n");
>  
>  	ethqos->speed = SPEED_1000;
> +	ethqos->serdes_speed = SPEED_1000;
>  	ethqos_update_link_clk(ethqos, SPEED_1000);
>  	ethqos_set_func_clk_en(ethqos);
>  

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
