Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AE68D8502
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 16:30:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17116C712A2;
	Mon,  3 Jun 2024 14:30:17 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76A3AC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 14:30:15 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E7E2D88308;
 Mon,  3 Jun 2024 16:30:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717425015;
 bh=D1FOb8+LRm3aTJoqLkva7vJcqtsDNNOiof4KFRfCgww=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=U5JsTJpKB9XrS+tOJLOdQnsrjPnXzbEKxTliEtCsqgl9KiPEoZiH/ruyYK8A4xR6w
 6BTejiu4wQw10P32WDrayv4apql6SINcNU1zBEL1UleFpWvNjsXYUWPagQhgFk1d7C
 AOnA5FvELgXNYWpNKVmVbPMvFUvBhKE3FNFkFO46G1s3+Keqj69pNyCis9vnebE+Po
 QgJ8ePGlpDpOea5a0C3f+LEQF70txG3PZy1lQ4PqAlIjg1X4ztyN/N1vGSXaUIVHNp
 o1J7lMtU3Se4D24YoY8YTLAaEg06HeQdXRgkQrCEMt6L1j1I9L/B6n/KE25YxFMyM0
 t+0qPGhF12zDQ==
Message-ID: <f1c30ac7-cec1-422f-9114-7b30321d3563@denx.de>
Date: Mon, 3 Jun 2024 16:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sai Krishna Gajula <saikrishnag@marvell.com>
References: <20240603092757.71902-1-christophe.roullier@foss.st.com>
 <20240603092757.71902-3-christophe.roullier@foss.st.com>
Content-Language: en-US
In-Reply-To: <20240603092757.71902-3-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 02/11] net: stmmac: dwmac-stm32:
 Separate out external clock rate validation
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 6/3/24 11:27 AM, Christophe Roullier wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Pull the external clock frequency validation into a separate function,
> to avoid conflating it with external clock DT property decoding and
> clock mux register configuration. This should make the code easier to
> read and understand.
> 
> This does change the code behavior slightly. The clock mux PMCR register
> setting now depends solely on the DT properties which configure the clock
> mux between external clock and internal RCC generated clock. The mux PMCR
> register settings no longer depend on the supplied clock frequency, that
> supplied clock frequency is now only validated, and if the clock frequency
> is invalid for a mode, it is rejected.
> 
> Previously, the code would switch the PMCR register clock mux to internal
> RCC generated clock if external clock couldn't provide suitable frequency,
> without checking whether the RCC generated clock frequency is correct. Such
> behavior is risky at best, user should have configured their clock correctly
> in the first place, so this behavior is removed here.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>   .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 54 +++++++++++++++----
>   1 file changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index c92dfc4ecf570..43340a5573c64 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> @@ -157,25 +157,57 @@ static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat, bool resume)
>   	return stm32_dwmac_clk_enable(dwmac, resume);
>   }
>   
> +static int stm32mp1_validate_ethck_rate(struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
> +	const u32 clk_rate = clk_get_rate(dwmac->clk_eth_ck);

 From Sai in
Re: [net-next,RFC,PATCH 1/5] net: stmmac: dwmac-stm32: Separate out 
external clock rate validation

Please check reverse x-mass tree is followed for these variables, if 
possible.

> +	switch (plat_dat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		if (clk_rate == ETH_CK_F_25M)
> +			return 0;
> +		break;
> +	case PHY_INTERFACE_MODE_GMII:
> +		if (clk_rate == ETH_CK_F_25M)
> +			return 0;
> +		break;

 From Sai in
Re: [net-next,RFC,PATCH 1/5] net: stmmac: dwmac-stm32: Separate out 
external clock rate validation

Please check, whether we can combine the two cases..

> +	case PHY_INTERFACE_MODE_RMII:
> +		if (clk_rate == ETH_CK_F_25M || clk_rate == ETH_CK_F_50M)
> +			return 0;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		if (clk_rate == ETH_CK_F_25M || clk_rate == ETH_CK_F_125M)
> +			return 0;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	dev_err(dwmac->dev, "Mode %s does not match eth-ck frequency %d Hz",
> +		phy_modes(plat_dat->mac_interface), clk_rate);
> +	return -EINVAL;
> +}

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
