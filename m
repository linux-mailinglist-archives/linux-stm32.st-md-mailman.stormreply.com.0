Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B843494DF6
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jan 2022 13:32:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A8AFC5F1EC;
	Thu, 20 Jan 2022 12:32:10 +0000 (UTC)
Received: from mx4.securetransport.de (mx4.securetransport.de [178.254.6.145])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2850DC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jan 2022 12:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1642680449;
 bh=xlwi6QEytDKwgKpZzwH/CdQl5VkwC/O1dAz1bAahF1U=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jmsopXAoBHgDJtHL7JOMTWJj3qccxiTUZT6KR8+zAZ62Wqb0lXpVVIw20rPtWpgTE
 sdD2u6troG0SJncWxDLu2utFq3IYo8HtWcxvbAn1qEORxLasKm3Ym5h+S+lJZBgIze
 ZLdqnrkX3uCD8KfDp4gO/euofS5nwuLGrCkMl1TqlY298cNxLNDwcOhRbtfzPwxJsR
 nW0r+W+A714gH75OZgHLWJwID4MrKcKE7dM3a2lN+Bec+xHbRlkqKtRWz+MeMv5VAT
 6Zvmdx6pQCM603lpV54NW5w3ph0kj5vkqqiibsX1lZKAWSHkDuzkfi8Ih0xl5U5cSK
 GFLLs/G7uHWhg==
X-secureTransport-forwarded: yes
From: Johann Neuhauser <jneuhauser@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: "Marek MV. Vasut" <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [PATCH 1/5] clk: stm32mp1: Split ETHCK_K into separate MUX and
 GATE clock
Thread-Index: AQHYDKowNA7EPo3h4k2gR/zmZEXweqxqTbYw
Date: Thu, 20 Jan 2022 12:07:09 +0000
Message-ID: <61a45bcf348144beaa9e6678f1ed0fa1@dh-electronics.com>
References: <20220118202958.1840431-1-marex@denx.de>
In-Reply-To: <20220118202958.1840431-1-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Jan 2022 12:32:09 +0000
Cc: "Marek MV. Vasut" <marex@denx.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Stephen Boyd <sboyd@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] clk: stm32mp1: Split ETHCK_K into
 separate MUX and GATE clock
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

> From: Marek Vasut [mailto:marex@denx.de]
> Sent: Tuesday, January 18, 2022 9:30 PM
> 
> The ETHCK_K are modeled as composite clock of MUX and GATE, however per
> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. Peripheral
> clock distribution for Ethernet, ETHPTPDIV divider is attached past the
> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN gate.
> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock are
> in use, ETHCKEN gate can be turned off. Current driver does not permit
> that, fix it.
> 
> This patch converts ETHCK_K from composite clock into a ETHCKEN gate,
> ETHPTP_K from composite clock into ETHPTPDIV divider, and adds another
> NO_ID clock "ck_ker_eth" which models the ETHSRC mux and is parent clock
> to both ETHCK_K and ETHPTP_K. Therefore, all references to ETHCK_K and
> ETHPTP_K remain functional as before.
> 
> [1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
>     Figure 83. Peripheral clock distribution for Ethernet
>     https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/clk/clk-stm32mp1.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
> index 863274aa50e38..23a34ab459a3b 100644
> --- a/drivers/clk/clk-stm32mp1.c
> +++ b/drivers/clk/clk-stm32mp1.c
> @@ -2008,7 +2008,6 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
>         KCLK(DSI_K, "dsi_k", dsi_src, 0, G_DSI, M_DSI),
>         KCLK(ADFSDM_K, "adfsdm_k", sai_src, 0, G_ADFSDM, M_SAI1),
>         KCLK(USBO_K, "usbo_k", usbo_src, 0, G_USBO, M_USBO),
> -       KCLK(ETHCK_K, "ethck_k", eth_src, 0, G_ETHCK, M_ETHCK),
> 
>         /* Particulary Kernel Clocks (no mux or no gate) */
>         MGATE_MP1(DFSDM_K, "dfsdm_k", "ck_mcu", 0, G_DFSDM),
> @@ -2017,11 +2016,16 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
>         MGATE_MP1(GPU_K, "gpu_k", "pll2_q", 0, G_GPU),
>         MGATE_MP1(DAC12_K, "dac12_k", "ck_lsi", 0, G_DAC12),
> 
> -       COMPOSITE(ETHPTP_K, "ethptp_k", eth_src, CLK_OPS_PARENT_ENABLE |
> +       COMPOSITE(NO_ID, "ck_ker_eth", eth_src, CLK_OPS_PARENT_ENABLE |
>                   CLK_SET_RATE_NO_REPARENT,
>                   _NO_GATE,
>                   _MMUX(M_ETHCK),
> -                 _DIV(RCC_ETHCKSELR, 4, 4, 0, NULL)),
> +                 _NO_DIV),
> +
> +       MGATE_MP1(ETHCK_K, "ethck_k", "ck_ker_eth", 0, G_ETHCK),
> +
> +       DIV(ETHPTP_K, "ethptp_k", "ck_ker_eth", CLK_OPS_PARENT_ENABLE |
> +           CLK_SET_RATE_NO_REPARENT, RCC_ETHCKSELR, 4, 4, 0),
> 
>         /* RTC clock */
>         COMPOSITE(RTC, "ck_rtc", rtc_src, CLK_OPS_PARENT_ENABLE,
> --
> 2.34.1
Tested-by: Johann Neuhauser <jneuhauser@dh-electronics.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
