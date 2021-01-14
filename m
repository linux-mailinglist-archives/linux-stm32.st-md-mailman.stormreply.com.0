Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19C2F66D5
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 18:08:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25A8EC424C0;
	Thu, 14 Jan 2021 17:08:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A813C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 17:08:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EH24CD022150; Thu, 14 Jan 2021 18:08:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=np1LZ5Nti5hJcLddfSYIake473MbPSioTavlhlxkSJE=;
 b=SAazzmQcWP8Lm+DDtWPYEJanI508uj+URtilUnpyQTPdvdQNPsB16q05r9Iia+ycUVyC
 KFUtLB2r1R+2mOdp/vHZrejJYrr7BXdYpJHzq06b0kKKlu/4CRwexB0X6aYKgwJzQKvP
 5I9pCV3Fgstv6gPXZ5BWZCSyuf9d1SID34LW0bG9jgL0JW7KeRVXRogPgFQmg/JS+vM1
 oiCeqzGbrV/UhI2NPVvJZJp3YrkX1r01/idH1lTfMeS9fHD0fr5FXM3Ipf9ZL4ZdiTJL
 O5lDr42/n9Gizl1gURjTXRktXOeHhXAZYNap2b1kPEP/2sSkJFMuJfLO/2IYVeZ1QMK3 wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gxe9bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 18:08:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6985210002A;
 Thu, 14 Jan 2021 18:08:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58CEC2A4D76;
 Thu, 14 Jan 2021 18:08:37 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 18:08:36 +0100
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210106204347.475920-1-marex@denx.de>
 <20210106204347.475920-3-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <e7ccdf7c-c7fa-4d03-2400-d4d89815d5d0@foss.st.com>
Date: Thu, 14 Jan 2021 18:08:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210106204347.475920-3-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_06:2021-01-14,
 2021-01-14 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 3/4] [RFC] ARM: dts: stm32: Add mux for
	ETHRX clock
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

Hi Marek

On 1/6/21 9:43 PM, Marek Vasut wrote:
> The implementation of ETH_RX_CLK/ETH_REF_CLK handling currently does not
> permit selecting the clock input from SoC pad. To make things worse, the
> implementation of this is partly present and is split between the clock
> driver and dwmac4 driver. Moreover, the ETHRX clock parent is incorrect.

Sorry but I don't understand which configuration is missing. I think we 
can handle all possible cases for RMII. At the glue layer 
(dwmac-stm32.c) clocks gates and syscfg are set regarding device tree 
binding (see the tab in dwmac-stm32.c). You could have a look here for 
more details: 
https://wiki.st.com/stm32mpu/wiki/Ethernet_device_tree_configuration

Regarding the clock parent, yes it is not at the well frequency if you 
want to select this path. Our current "clock tree" is done to fit with 
our ST reference boards (we have more peripherals than PLL outputs so we 
have to make choices). So yes for customer/partners boards this clock 
tree has to be modified to better fit with the need (either using 
assigned-clock-parent or by modifying bootloader clock tree (tf-a or 
u-boot)).

> 
> First, the ETHRX clock in clk-stm32mp1.c only represents the ETHRXEN gate,
> however it should represent also ETH_REF_CLK_SEL mux. The problem is that
> the ETH_REF_CLK_SEL mux is currently configured in the DWMAC4 driver and
> the ETH_REF_CLK_SEL bit is part of SYSCFG block, not the DWMAC4 or the
> clock block.

dwmac4-stm32 doesn't contain code for dwmac4 but it contains the glue 
around the dwmac4: syscfg, clocks ...

> 
> Second, the ETHRX parent clock is either eth_clk_fb (ETHCK_K) or external
> ETH_RX_CLK/ETH_REF_CLK_SEL, it is never CK_AXI.

Why CK_AXI ?

Regards
Alex

> 
> This patch attempts to address the clock selection by adding fixed factor
> clock to DT, which allows the user to select its upstream clock.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp151.dtsi | 8 ++++++++
>   drivers/clk/clk-stm32mp1.c        | 2 +-
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 32875eabd357..8c2a5d0875d8 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -82,6 +82,14 @@ clk_csi: clk-csi {
>   			compatible = "fixed-clock";
>   			clock-frequency = <4000000>;
>   		};
> +
> +		clk_eth_rx: eth-rx-clk {
> +			compatible = "fixed-factor-clock";
> +			clocks = <&rcc ETHCK_K>;
> +			#clock-cells = <0>;
> +			clock-div = <1>;
> +			clock-mult = <1>;
> +		};
>   	};
>   
>   	thermal-zones {
> diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
> index a875649df8b8..63971d40f15c 100644
> --- a/drivers/clk/clk-stm32mp1.c
> +++ b/drivers/clk/clk-stm32mp1.c
> @@ -1892,7 +1892,7 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
>   	PCLK(MDMA, "mdma", "ck_axi", 0, G_MDMA),
>   	PCLK(GPU, "gpu", "ck_axi", 0, G_GPU),
>   	PCLK(ETHTX, "ethtx", "ck_axi", 0, G_ETHTX),
> -	PCLK(ETHRX, "ethrx", "ck_axi", 0, G_ETHRX),
> +	PCLK(ETHRX, "ethrx", "eth-rx-clk", 0, G_ETHRX),
>   	PCLK(ETHMAC, "ethmac", "ck_axi", 0, G_ETHMAC),
>   	PCLK(FMC, "fmc", "ck_axi", CLK_IGNORE_UNUSED, G_FMC),
>   	PCLK(QSPI, "qspi", "ck_axi", CLK_IGNORE_UNUSED, G_QSPI),
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
