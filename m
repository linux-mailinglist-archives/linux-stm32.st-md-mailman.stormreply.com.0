Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45446494DF9
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jan 2022 13:32:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4DB2C60465;
	Thu, 20 Jan 2022 12:32:10 +0000 (UTC)
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADFCFC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jan 2022 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1642681412;
 bh=cjP1hY/gV6YI+gSva1g8dPyS/nmv5JYe3LAPaeC17Hk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=OP3b4icjGxSyzvXTdlJniHzinTA1Gf42AT0/x/Es7MDpZ0PHzqCPPfOO3naV9YDMw
 T/EzdPiIu8fsHUbINNqoqowyaIWlXd9sRFulcP/EACUpChSg6sC6gtO19CN6MzFUBz
 Ce/jgR2JA2n6or0kWVmNNI8iucWKRWhDvefNYMLVNW4c+X3x/K6KOoOJNxld6LUyHW
 F2c4FLNzVQvT/gRqre81jTOcfwWVso6pHJ0S/1ekvrnEeCaY2S2UtKwJso16VlrdTx
 yJj4LURKjbm7vl7rUkxKlXEg7gZSzkRv8l0/hCHlW012SpSYmFQcu/XXWi8XgLMnZJ
 p0j32DBc5T6cA==
X-secureTransport-forwarded: yes
From: Johann Neuhauser <jneuhauser@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: "Marek MV. Vasut" <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [PATCH 5/5] ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on
 DHCOM
Thread-Index: AQHYDKoxtzPgICVgbEyNJNP9H9TX9Kxr02Ow
Date: Thu, 20 Jan 2022 12:08:13 +0000
Message-ID: <5dde4cf58557485790bb7c14497e8cd1@dh-electronics.com>
References: <20220118202958.1840431-1-marex@denx.de>
 <20220118202958.1840431-5-marex@denx.de>
In-Reply-To: <20220118202958.1840431-5-marex@denx.de>
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
Subject: Re: [Linux-stm32] [PATCH 5/5] ARM: dts: stm32: Switch DWMAC RMII
 clock to MCO2 on DHCOM
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
> The DHCOM SoM has two options for supplying ETHRX clock to the DWMAC
> block and PHY. Either (1) ETHCK_K generates 50 MHz clock on ETH_CLK
> pad for the PHY and the same 50 MHz clock are fed back to ETHRX via
> internal eth_clk_fb clock connection OR (2) ETH_CLK is not used at
> all, MCO2 generates 50 MHz clock on MCO2 output pad for the PHY and
> the same MCO2 clock are fed back into ETHRX via ETH_RX_CLK input pad
> using external pad-to-pad connection.
> 
> Option (1) has two downsides. ETHCK_K is supplied directly from either
> PLL3_Q or PLL4_P, hence the PLL output is limited to exactly 50 MHz and
> since the same PLL output is also used to supply SDMMC blocks, the
> performance of SD and eMMC access is affected. The second downside is
> that using this option, the EMI of the SoM is higher.
> 
> Option (2) solves both of those problems, so implement it here. In this
> case, the PLL4_P is no longer limited and can be operated faster, at
> 100 MHz, which improves SDMMC performance (read performance is improved
> from ~41 MiB/s to ~57 MiB/s with dd if=/dev/mmcblk1 of=/dev/null bs=64M
> count=1). The EMI interference also decreases.
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
>  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 22 ++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index 8c41f819f7769..b091d9901e976 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -116,15 +116,29 @@ &dts {
>         status = "okay";
>  };
> 
> +&rcc {
> +       /* Connect MCO2 output to ETH_RX_CLK input via pad-pad connection */
> +       clocks = <&rcc CK_MCO2>;
> +       clock-names = "ETH_RX_CLK/ETH_REF_CLK";
> +
> +       /*
> +        * Set PLL4P output to 100 MHz to supply SDMMC with faster clock,
> +        * set MCO2 output to 50 MHz to supply ETHRX clock with PLL4P/2,
> +        * so that MCO2 behaves as a divider for the ETHRX clock here.
> +        */
> +       assigned-clocks = <&rcc CK_MCO2>, <&rcc PLL4_P>;
> +       assigned-clock-parents = <&rcc PLL4_P>;
> +       assigned-clock-rates = <50000000>, <100000000>;
> +};
> +
>  &ethernet0 {
>         status = "okay";
> -       pinctrl-0 = <&ethernet0_rmii_pins_a>;
> -       pinctrl-1 = <&ethernet0_rmii_sleep_pins_a>;
> +       pinctrl-0 = <&ethernet0_rmii_pins_b &mco2_pins_a>;
> +       pinctrl-1 = <&ethernet0_rmii_sleep_pins_b &mco2_sleep_pins_a>;
>         pinctrl-names = "default", "sleep";
>         phy-mode = "rmii";
>         max-speed = <100>;
>         phy-handle = <&phy0>;
> -       st,eth-ref-clk-sel;
> 
>         mdio0 {
>                 #address-cells = <1>;
> @@ -136,7 +150,7 @@ phy0: ethernet-phy@1 {
>                         /* LAN8710Ai */
>                         compatible = "ethernet-phy-id0007.c0f0",
>                                      "ethernet-phy-ieee802.3-c22";
> -                       clocks = <&rcc ETHCK_K>;
> +                       clocks = <&rcc CK_MCO2>;
>                         reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
>                         reset-assert-us = <500>;
>                         reset-deassert-us = <500>;
> --
> 2.34.1
Tested-by: Johann Neuhauser <jneuhauser@dh-electronics.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
