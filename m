Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B16619672
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 13:46:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C54DC65045;
	Fri,  4 Nov 2022 12:46:00 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFCBCC65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 12:45:58 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id a27so2910750qtw.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Nov 2022 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5elYzGUUhcG7jBLIymC1j8QNrbtC0sWvhntpSYVQ4R8=;
 b=FCutypUx78aC10zJPvZ6+omdmHxH490VngbcFbDSS7FUJ/8yZ0sE4i26bT8vb12XWD
 Q76FKPf4ZjxvdJq7e1l/jPw9IOqHoCy0OVQbNozFmHnKymBIuO63LJaDn/hzAAeAwC6/
 bBWE4rgQPHLqkFd9Bl/w8mB5R6icUepuO/9X6GGRqBB7poZidiMSSvOkUYZahUc7ms8h
 Ro/1Q4rUWkglbwFO1phi+Zb0ZfaAp10kIK2C12s9u8LVpcLzbqMBgLiCLhniXBMY8iU1
 8VPdnEeh3DjJl9E2Ye4eJMggHK7Te+NCSzR9ctInAKZhJ8ZXVNJDRv2cw1eHUZwI0NYp
 7dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5elYzGUUhcG7jBLIymC1j8QNrbtC0sWvhntpSYVQ4R8=;
 b=IxyM3J521yDXU2Syz5UbP8ImC2iL20oL9AeS5ROKbj3IBSTEsLiGk0VFoTo9NXeJ+p
 9MNVU/eM/qmbIiP8zs4t8RRat61ry0Xo62Xs0mjyPCWaeF6qoZUU5ccIE/NkCq6Y99U/
 zEwkYA7j98EsRAbUcpktn78vDFBzDOJk8V/xgyR/cgWImfhfok7PVGp31jDhouLX0ztF
 QGHGfk26SEwzOiXIU2d+2SblyUesililMCf1JMQ/SNtdbZeBV4TncJTaaZntb1GnnGtl
 /GNV3z4cFQYk7KMFruoK7/R6F/j0DXBbKLKuaFUVDzW/NxuzMa6hnpnfqjHlhfI+B13S
 Mapg==
X-Gm-Message-State: ACrzQf0oyI5wmvb2lPl2zv1/BlC3Sq49qIw4h0U1JSggDCAJkKzdJcn3
 onmft0EIJ0WwmxXRjTKvlwFZGw==
X-Google-Smtp-Source: AMsMyM7x+1p1BNA4rARbrggZXqpnSUt5GbutmQsB+HPkas2qJr6nZkzUiwqroejtLSIl5kIsrcrXeA==
X-Received: by 2002:ac8:690c:0:b0:3a5:45a4:ab91 with SMTP id
 bt12-20020ac8690c000000b003a545a4ab91mr11397450qtb.248.1667565957897; 
 Fri, 04 Nov 2022 05:45:57 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a05620a414300b006ee7e223bb8sm2836373qko.39.2022.11.04.05.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 05:45:57 -0700 (PDT)
Message-ID: <4fd9dabb-c8f3-b826-2eb2-ab8b5816102a@linaro.org>
Date: Fri, 4 Nov 2022 08:45:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Sriranjani P <sriranjani.p@samsung.com>, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20221104120517.77980-1-sriranjani.p@samsung.com>
 <CGME20221104115902epcas5p209442971ba9f4cb001a933bda3c50b25@epcas5p2.samsung.com>
 <20221104120517.77980-4-sriranjani.p@samsung.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104120517.77980-4-sriranjani.p@samsung.com>
Cc: devicetree@vger.kernel.org, Jayati Sahu <jayati.sahu@samsung.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Pankaj Dubey <pankaj.dubey@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] arm64: dts: fsd: Add Ethernet support
 for FSYS0 Block of FSD SoC
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

On 04/11/2022 08:05, Sriranjani P wrote:
> The FSD SoC contains two instances of Synopsys DWC QoS Ethernet IP, one
> in FSYS0 block and other in PERIC block.
> 
> Adds device tree node for Ethernet in FSYS0 Block and enables the same for
> FSD platform.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts      |  9 ++++
>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 56 ++++++++++++++++++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi         | 38 +++++++++++++++
>  3 files changed, 103 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index 1db6ddf03f01..42bf25c680e2 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -30,6 +30,15 @@
>  	};
>  };
>  
> +&ethernet_0 {
> +	status = "okay";
> +
> +	fixed-link {
> +		speed=<1000>;

Missing spaces around =.

> +		full-duplex;
> +	};
> +};
> +
>  &fin_pll {
>  	clock-frequency = <24000000>;
>  };
> diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> index d0abb9aa0e9e..8c7e43085a2b 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> @@ -64,6 +64,62 @@
>  		samsung,pin-pud = <FSD_PIN_PULL_NONE>;
>  		samsung,pin-drv = <FSD_PIN_DRV_LV2>;
>  	};
> +
> +	eth0_tx_clk: eth0-tx-clk-pins {
> +		samsung,pins = "gpf0-0";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_DOWN>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
> +	};
> +
> +	eth0_tx_data: eth0-tx-data-pins {
> +		samsung,pins = "gpf0-1", "gpf0-2", "gpf0-3", "gpf0-4";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_UP>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
> +	};
> +
> +	eth0_tx_ctrl: eth0-tx-ctrl-pins {
> +		samsung,pins = "gpf0-5";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_UP>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
> +	};
> +
> +	eth0_phy_intr: eth0-phy-intr-pins {
> +		samsung,pins = "gpf0-6";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_NONE>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
> +	};
> +
> +	eth0_rx_clk: eth0-rx-clk-pins {
> +		samsung,pins = "gpf1-0";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_UP>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
> +	};
> +
> +	eth0_rx_data: eth0-rx-data-pins {
> +		samsung,pins = "gpf1-1", "gpf1-2", "gpf1-3", "gpf1-4";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_UP>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
> +	};
> +
> +	eth0_rx_ctrl: eth0-rx-ctrl-pins {
> +		samsung,pins = "gpf1-5";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_UP>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV6>;
> +	};
> +
> +	eth0_mdio: eth0-mdio-pins {
> +		samsung,pins = "gpf1-6", "gpf1-7";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_NONE>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
> +	};
>  };
>  
>  &pinctrl_peric {
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
> index f35bc5a288c2..2495928b71dc 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -32,6 +32,7 @@
>  		spi0 = &spi_0;
>  		spi1 = &spi_1;
>  		spi2 = &spi_2;
> +		eth0 = &ethernet_0;

Not every board will have ethernet, so this should be in board DTS.
However other question is - why do you need it?

>  	};
>  
>  	cpus {
> @@ -860,6 +861,43 @@
>  			clocks = <&clock_fsys0 UFS0_MPHY_REFCLK_IXTAL26>;
>  			clock-names = "ref_clk";
>  		};
> +
> +		ethernet_0: ethernet@15300000 {
> +			compatible = "tesla,dwc-qos-ethernet-4.21";
> +			reg = <0x0 0x15300000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =
> +				/* ptp ref clock */

That's not a formatting used in sources. I doubt that they are actually
useful as you copy the name of the clock.

> +				<&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_CLK_PTP_REF_I>,
> +				/* aclk clocks */
> +				<&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_ACLK_I>,
> +				/* hclk clocks */
> +				<&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_HCLK_I>,
> +				/* rgmii clocks */
> +				<&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_RGMII_CLK_I>,
> +				/* rxi clocks */
> +				<&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_CLK_RX_I>;
> +			clock-names =
> +				/* ptp ref clocks */
> +				"ptp_ref",
> +				/* aclk clocks */
> +				"master_bus",
> +				/* hclk clocks */
> +				"slave_bus",
> +				/* rgmii clk */
> +				"tx",
> +				/* rxi clocks */
> +				"rx";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&eth0_tx_clk>, <&eth0_tx_data>, <&eth0_tx_ctrl>,
> +				<&eth0_phy_intr>, <&eth0_rx_clk>, <&eth0_rx_data>,
> +				<&eth0_rx_ctrl>, <&eth0_mdio>;
> +			local-mac-address = [45 54 48 30 4d 43];

So all devices in the world will have exactly the same MAC address? I
don't think that's desired :)

> +			rx-clock-skew = <&sysreg_fsys0 0x0 0x2>;

Where is the property documented?

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

Please confirm that you perform above.

> +			iommus = <&smmu_fsys0 0x0 0x1>;
> +			status = "disabled";

Status is last.

> +			phy-mode = "rgmii";
> +		};
>  	};
>  };
>  

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
