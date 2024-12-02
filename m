Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC939E0E96
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Dec 2024 23:07:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3464EC78F63;
	Mon,  2 Dec 2024 22:07:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8469C78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2024 22:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tz4mFzbX9P9yZ/D0ZDZ+CHiKfmuXSyJYiag6bxKZjO8=; b=onAkKEu03knw+yi7mGzMg38F/a
 eahRL0lxTZx3whiM4B1MeXRexDYWzMYK9BxBpAjL218lJRkT3cNpjCWYiRjWd334Ah2wQ7MujmY3q
 bq95CThA6JvVB7z3DvP8QhRGb4t27jySO6SfLxGJKdmHLW3jI/DzpTbyhBj8UJqb4JYqp07TzxAEP
 pZ4pxgISjskPougD7Wssqqk44PW/wrW9sEiZGfW1XgZ6DYMZv5O73usxojtbU7Z3m1hBq0o0g6+RC
 ySXEJFbmfd0cgDr6aJ1mRJb0TpQVA9JDZSZsBO8fIVEc/ASQQ6vsXF6uHfFzJVnTFINuN8FiyiaYs
 qrJYl1Tg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39114)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tIEZn-0000ru-0X;
 Mon, 02 Dec 2024 22:07:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tIEZk-0003v9-2I;
 Mon, 02 Dec 2024 22:07:28 +0000
Date: Mon, 2 Dec 2024 22:07:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jan.petrous@oss.nxp.com
Message-ID: <Z04voJN9uj1Vefef@shell.armlinux.org.uk>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
 <20241202-upstream_s32cc_gmac-v7-2-bc3e1f9f656e@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241202-upstream_s32cc_gmac-v7-2-bc3e1f9f656e@oss.nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 0x1207@gmail.com, Jose Abreu <joabreu@synopsys.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v7 02/15] net: driver: stmmac:
 Extend CSR calc support
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

As per patch 1, no need for "driver:" in the subject line.

Thanks.

On Mon, Dec 02, 2024 at 11:03:41PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Add support for CSR clock range up to 800 MHz.
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h      | 2 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
>  include/linux/stmmac.h                            | 2 ++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 1367fa5c9b8e..70d601f45481 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -257,6 +257,8 @@ struct stmmac_safety_stats {
>  #define CSR_F_150M	150000000
>  #define CSR_F_250M	250000000
>  #define CSR_F_300M	300000000
> +#define CSR_F_500M	500000000
> +#define CSR_F_800M	800000000
>  
>  #define	MAC_CSR_H_FRQ_MASK	0x20
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9b262cdad60b..3cb7ad6ccc4e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -325,6 +325,10 @@ static void stmmac_clk_csr_set(struct stmmac_priv *priv)
>  			priv->clk_csr = STMMAC_CSR_150_250M;
>  		else if ((clk_rate >= CSR_F_250M) && (clk_rate <= CSR_F_300M))
>  			priv->clk_csr = STMMAC_CSR_250_300M;
> +		else if ((clk_rate >= CSR_F_300M) && (clk_rate < CSR_F_500M))
> +			priv->clk_csr = STMMAC_CSR_300_500M;
> +		else if ((clk_rate >= CSR_F_500M) && (clk_rate < CSR_F_800M))
> +			priv->clk_csr = STMMAC_CSR_500_800M;
>  	}
>  
>  	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 75cbfb576358..865d0fe26f98 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -34,6 +34,8 @@
>  #define	STMMAC_CSR_35_60M	0x3	/* MDC = clk_scr_i/26 */
>  #define	STMMAC_CSR_150_250M	0x4	/* MDC = clk_scr_i/102 */
>  #define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/124 */
> +#define	STMMAC_CSR_300_500M	0x6	/* MDC = clk_scr_i/204 */
> +#define	STMMAC_CSR_500_800M	0x7	/* MDC = clk_scr_i/324 */
>  
>  /* MTL algorithms identifiers */
>  #define MTL_TX_ALGORITHM_WRR	0x0
> 
> -- 
> 2.47.0
> 
> 
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
