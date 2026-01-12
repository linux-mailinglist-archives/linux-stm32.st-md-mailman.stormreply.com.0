Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0F2D15258
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 21:01:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB071C5A4CA;
	Mon, 12 Jan 2026 20:01:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F3BDC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 20:01:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 815446000A;
 Mon, 12 Jan 2026 20:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D75C116D0;
 Mon, 12 Jan 2026 20:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768248106;
 bh=iAzLbGMDXQfuE3s4KFa2lQ8l5bKVW/+TK+/FOv2Eho4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cmRTtpW0cY4oNrQtvYdKlC26VlGGgiFUrlh1ys7lAGIXsBImtcv9fbxXcfAzv35w6
 GaCEUXCJJ9DajEsHvVfLZlvLZ1o8g6qhe8jqJP+I/v0W28Qb9X04J0DxlQpqYlF1rk
 rqauQh08FgmsrE9N/Oh9DsGa2zX+Yjq3nhAh4wzrFOzlAxNMN2z97cm3vvzlatqYDl
 rI0tZFsJuf7kCtx/pneTrvKh4BS4Plk3xYDOusK3NsxRQhiyXUjXXEm/FpNgVh0eSj
 bQVUcZUGC3N7QtGsIFi7QPeyQ9vHl8/wPphA6UsoUUdaq3V+JCwd7EA6oyM9cOfoMh
 pGUKXhKqAJiBQ==
Date: Mon, 12 Jan 2026 20:01:40 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aWVTJL_G__7IQTBn@horms.kernel.org>
References: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
 <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: qcom-ethqos:
 convert to set_clk_tx_rate() method
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

On Mon, Jan 12, 2026 at 06:11:29PM +0000, Russell King (Oracle) wrote:
> Set the RGMII link clock using the set_clk_tx_rate() method rather than
> coding it into the .fix_mac_speed() method. This simplifies ethqos's
> ethqos_fix_mac_speed().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 869f924f3cde..d6df3ca757be 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -102,7 +102,6 @@ struct qcom_ethqos {
>  	void __iomem *rgmii_base;
>  	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
>  
> -	unsigned int link_clk_rate;
>  	struct clk *link_clk;
>  	struct phy *serdes_phy;
>  	int serdes_speed;
> @@ -174,19 +173,18 @@ static void rgmii_dump(void *priv)
>  		rgmii_readl(ethqos, EMAC_SYSTEM_LOW_POWER_DEBUG));
>  }
>  
> -static void
> -ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
> +static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> +				  phy_interface_t interface, int speed)
>  {
> +	struct qcom_ethqos *ethqos = bsp_priv;
>  	long rate;
>  
> -	if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
> -		return;
> +	if (!phy_interface_mode_is_rgmii(interface))
> +		return 0;
>  
>  	rate = rgmii_clock(speed);
>  	if (rate > 0)
> -		ethqos->link_clk_rate = rate * 2;
> -
> -	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
> +		clk_set_rate(ethqos->link_clk, rate * 2);

Hi Russell,

An int needs to be returned here.

>  }
>  
>  static void

-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
