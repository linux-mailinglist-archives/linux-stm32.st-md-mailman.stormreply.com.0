Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D387E46E
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Mar 2024 08:54:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F381C71285;
	Mon, 18 Mar 2024 07:54:23 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE01FC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Mar 2024 23:10:04 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a44665605f3so412713766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Mar 2024 16:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710717004; x=1711321804;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OppHWKfWTZKJRPOBZ8IE/hPwTxkg/hJdwgKT8S1vkzg=;
 b=XLl5iEgpU5VJvg6HnYk4ns1qloWDgOebYWWj3cTq4UHbta4QDvxToIELj+1TPTeVX5
 mxPg7we38J95qOepp2bSFM7WO3oP35VHM3x+hIJ63IuZqdzdqpbuyPsY50qn57HXNRZv
 p5+OJTshMq/bek/T9NOhmTSgHF3M1dSxTZhg46nScb//E17hPb7U+i+f9Mwb8uZEZrkP
 F3CEMQa+MINr8rxBR3Bz4wIxKlP+5TDFBQ3lpctDKHRBI36qhWhZvNX7wMSHqU50QYI8
 kbVbKqueVWr77OYnYHuIWK7BokEQcbZxVj1hdf3RP0JgtqG7JNeu6ToSTb8lHqCDIEfx
 +wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710717004; x=1711321804;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OppHWKfWTZKJRPOBZ8IE/hPwTxkg/hJdwgKT8S1vkzg=;
 b=Sp8xQ80x4/0R1L8Vv7cvxuySs25FEM/88/mLkvomAySYI3fkrsYsct4YStVoSSEYS3
 CIcQfMEffCJW/EvX6ShYY5CI2I/KYpXFc/KtU8CB0+Cfhhx+lZy0s5Z1wLSlr8Yh7vKq
 Kv1n1G2zd6Ga7nCii1d2TzaNMQ3tzODmxG6DRH69n26hBHrtT2e48kd/BAOzUWQMqBnV
 6QwOvDlc0LXxl7qOvT68OICfWDEUjACFaTYa+UcSwBxvNwk58rea2XWQK8PjWp9tVZCm
 0WOOFFYga2Tu8akXAXdfEQyvN2etJ02FITrk4og/S01qRD5pLxYbZ/l8G96TiOs5MtMQ
 PKKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXStswpv8zfNmWk9JLAuQL5I7VDZ2deH35TxMe0V6qNmH/gq9H3vXUI63+QN3LGIVfyzISa8n1dd48uF0UkpVC1FHgVKKIShQ0fQIjgtAFz/U81eQzlwFZ+
X-Gm-Message-State: AOJu0YxJN1WycrCNDWw8l6N3A1tIT4Ykvf5Jwqeo/XI8ATKbEQNgJwgU
 TL7VRkq9Cmapl1JhUG5l+ImZehO4vOoJVYzpJoCUvIR9vm3CtA7v
X-Google-Smtp-Source: AGHT+IHQunvWWEWfbr/6/+8gKQTg4pQ6vAgajArEEoYssmrVoYfM2++IFTm231t7lc0ApdMDoAFV0g==
X-Received: by 2002:a17:907:20f3:b0:a44:4a94:a6d5 with SMTP id
 rh19-20020a17090720f300b00a444a94a6d5mr5691303ejb.27.1710717003907; 
 Sun, 17 Mar 2024 16:10:03 -0700 (PDT)
Received: from bhlegrsu.conti.de ([2a02:908:2525:6ea0::f845])
 by smtp.gmail.com with ESMTPSA id
 wr6-20020a170907700600b00a4623030893sm4104646ejb.126.2024.03.17.16.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 16:10:03 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
X-Google-Original-From: Wadim Mueller <wadim.mueller@continental.com>
Date: Mon, 18 Mar 2024 00:10:00 +0100
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240317231000.GA22886@bhlegrsu.conti.de>
References: <20240315222754.22366-1-wafgo01@gmail.com>
 <20240315222754.22366-2-wafgo01@gmail.com>
 <cc55daa1-0256-48d1-97a4-0f755fb4951b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc55daa1-0256-48d1-97a4-0f755fb4951b@linaro.org>
X-Mailman-Approved-At: Mon, 18 Mar 2024 07:54:20 +0000
Cc: NXP S32 Linux Team <s32@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Wadim Mueller <wafgo01@gmail.com>,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-clk@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 1/3] arm64: dts: S32G3: Introduce device
 tree for S32G-VNP-RDB3
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

On Sun, Mar 17, 2024 at 03:50:55PM +0100, Krzysztof Kozlowski wrote:
> On 15/03/2024 23:27, Wadim Mueller wrote:
> > This commit adds device tree support for the NXP S32G3-based
> > S32G-VNP-RDB3 Board (Vehicle Networking Platform - Reference Design Board) [1].
> > 
> > The S32G3 features an 8-core ARM Cortex-A53 based SoC developed by NXP.
> > 
> > The device tree files are derived from the official NXP downstream Linux tree [2].
> > 
> > This addition encompasses a limited selection of peripherals that are upstream-supported. Apart from the ARM System Modules (GIC, Generic Timer, etc.), the following IPs have been validated:
> > 
> >     UART: fsl-linflexuart
> >     SDHC: fsl-imx-esdhc
> >     Ethernet: synopsys gmac/stmac
> > 
> > Clock settings for the chip rely on ATF Firmware [3]. Pin control integration into the device tree is pending and currently relies on Firmware/U-Boot settings [4].
> > 
> > These changes were validated using the latest BSP39 Firmware/U-Boot from NXP [5].
> > 
> > The modifications enable booting the official Ubuntu 22.04 from NXP on
> > the RDB3 with default settings from the SD card and eMMC.
> > 
> > [1] https://www.nxp.com/design/design-center/designs/s32g3-vehicle-networking-reference-design:S32G-VNP-RDB3
> > [2] https://github.com/nxp-auto-linux/linux
> > [3] https://github.com/nxp-auto-linux/arm-trusted-firmware
> > [4] https://github.com/nxp-auto-linux/u-boot
> > [5] https://github.com/nxp-auto-linux/auto_yocto_bsp
> > 
> > Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  arch/arm64/boot/dts/freescale/s32g3.dtsi      | 352 ++++++++++++++++++
> >  .../boot/dts/freescale/s32g399a-rdb3.dts      |  57 +++
> >  .../dt-bindings/clock/nxp,s32-scmi-clock.h    | 158 ++++++++
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.
> 
> Bindings are not DTS.
> 
> >  4 files changed, 568 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/s32g3.dtsi
> >  create mode 100644 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> >  create mode 100644 include/dt-bindings/clock/nxp,s32-scmi-clock.h
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 2cb0212b63c6..e701008dbc7b 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -252,3 +252,4 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx-rpidsi.dtb
> >  dtb-$(CONFIG_ARCH_S32) += s32g274a-evb.dtb
> >  dtb-$(CONFIG_ARCH_S32) += s32g274a-rdb2.dtb
> >  dtb-$(CONFIG_ARCH_S32) += s32v234-evb.dtb
> > +dtb-$(CONFIG_ARCH_S32) += s32g399a-rdb3.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > new file mode 100644
> > index 000000000000..481ddcfd3a6d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > @@ -0,0 +1,352 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/clock/nxp,s32-scmi-clock.h>
> > +/ {
> > +	compatible = "nxp,s32g3";
> 
> Order your patches correctly. Bindings come before users.
> 
> > +	interrupt-parent = <&gic>;
> > +	#address-cells = <0x02>;
> > +	#size-cells = <0x02>;
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		cpu-map {
> > +			cluster0 {
> > +				core0 {
> > +					cpu = <&cpu0>;
> > +				};
> > +
> > +				core1 {
> > +					cpu = <&cpu1>;
> > +				};
> > +
> > +				core2 {
> > +					cpu = <&cpu2>;
> > +				};
> > +
> > +				core3 {
> > +					cpu = <&cpu3>;
> > +				};
> > +			};
> > +
> > +			cluster1 {
> > +				core0 {
> > +					cpu = <&cpu4>;
> > +				};
> > +
> > +				core1 {
> > +					cpu = <&cpu5>;
> > +				};
> > +
> > +				core2 {
> > +					cpu = <&cpu6>;
> > +				};
> > +
> > +				core3 {
> > +					cpu = <&cpu7>;
> > +				};
> > +			};
> > +		};
> > +
> > +		cpu0: cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x0>;
> > +			enable-method = "psci";
> > +			clocks = <&dfs S32_SCMI_CLK_A53>;
> > +			next-level-cache = <&cluster0_l2_cache>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu1: cpu@1 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x1>;
> > +			enable-method = "psci";
> > +			clocks = <&dfs S32_SCMI_CLK_A53>;
> > +			next-level-cache = <&cluster0_l2_cache>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu2: cpu@2 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x2>;
> > +			enable-method = "psci";
> > +			clocks = <&dfs S32_SCMI_CLK_A53>;
> > +			next-level-cache = <&cluster0_l2_cache>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu3: cpu@3 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x3>;
> > +			enable-method = "psci";
> > +			clocks = <&dfs S32_SCMI_CLK_A53>;
> > +			next-level-cache = <&cluster0_l2_cache>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu4: cpu@100 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x100>;
> > +			enable-method = "psci";
> > +			clocks = <&dfs S32_SCMI_CLK_A53>;
> > +			next-level-cache = <&cluster1_l2_cache>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu5: cpu@101 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x101>;
> > +			enable-method = "psci";
> > +			clocks = <&dfs S32_SCMI_CLK_A53>;
> > +			next-level-cache = <&cluster1_l2_cache>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu6: cpu@102 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x102>;
> > +			enable-method = "psci";
> > +			clocks = <&dfs S32_SCMI_CLK_A53>;
> > +			next-level-cache = <&cluster1_l2_cache>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu7: cpu@103 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x103>;
> > +			enable-method = "psci";
> > +			clocks = <&dfs S32_SCMI_CLK_A53>;
> > +			next-level-cache = <&cluster1_l2_cache>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cluster0_l2_cache: l2-cache0 {
> 
> l2-cache-0
> 
> > +			compatible = "cache";
> > +			status = "okay";
> 
> Why do you need it? It's enabled by default.
> 

Thanks for the hint, will drop it.

> Anyway it incomplete:
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
>

I was not aware of this make target. Thanks for pointing me to the doc.
I will try to remove all warnings and come back with a fixed version.

> > +		};
> > +
> > +		cluster1_l2_cache: l2-cache1 {
> 
> l2-cache-1
> 
> > +			compatible = "cache";
> > +			status = "okay";
> > +		};
> > +	};
> > +
> > +	pmu {
> > +		compatible = "arm,cortex-a53-pmu";
> > +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > +	};
> > +
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* sec-phys */
> > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* virt */
> > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* hyp-virt */
> > +		             <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>, /* sec-phys */
> > +		             <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>; /* phys */
> > +		always-on;
> > +	};
> > +
> > +	reserved-memory  {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		scmi_tx_buf: shm@d0000000 {
> > +			compatible = "arm,scmi-shmem";
> > +			reg = <0x0 0xd0000000 0x0 0x80>;
> > +			no-map;
> > +		};
> > +
> > +		scmi_rx_buf: shm@d0000080 {
> > +			compatible = "arm,scmi-shmem";
> > +			reg = <0x0 0xd0000080 0x0 0x80>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	firmware {
> > +		scmi: scmi {
> > +			compatible = "arm,scmi-smc";
> > +			mbox-names = "tx", "rx";
> > +			shmem = <&scmi_tx_buf>, <&scmi_rx_buf>;
> > +			arm,smc-id = <0xc20000fe>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			status = "okay";
> 
> Drop or explain why is it needed.
> 

status is superfluous, right?

> > +			interrupts = <GIC_SPI 300 IRQ_TYPE_EDGE_RISING>;
> > +			interrupt-names = "p2a_notif";
> > +
> > +			dfs: protocol@13 {
> > +				reg = <0x13>;
> > +				#clock-cells = <1>;
> > +			};
> > +
> > +			clks: protocol@14 {
> > +				reg = <0x14>;
> > +				#clock-cells = <1>;
> > +			};
> > +
> > +			reset: protocol@16 {
> > +				reg = <0x16>;
> > +				#reset-cells = <1>;
> > +			};
> > +
> > +			pinctrl_scmi: protocol@80 {
> > +				reg = <0x80>;
> > +				#pinctrl-cells = <2>;
> > +
> > +				status = "disabled";
> > +			};
> > +		};
> > +
> > +		psci: psci {
> > +			compatible = "arm,psci-1.0";
> > +			method = "smc";
> > +		};
> > +	};
> > +
> > +	soc@0 {
> > +		compatible = "simple-bus";
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges = <0 0 0 0x80000000>;
> > +
> > +		uart0: serial@401c8000 {
> > +			compatible = "nxp,s32g3-linflexuart",
> > +				     "fsl,s32v234-linflexuart";
> > +			reg = <0x401c8000 0x3000>;
> > +			interrupts = <GIC_SPI 82 IRQ_TYPE_EDGE_RISING>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uart1: serial@401cc000 {
> > +			compatible = "nxp,s32g3-linflexuart",
> > +				     "fsl,s32v234-linflexuart";
> > +			reg = <0x401cc000 0x3000>;
> > +			interrupts = <GIC_SPI 83 IRQ_TYPE_EDGE_RISING>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uart2: serial@402bc000 {
> > +			compatible = "nxp,s32g3-linflexuart",
> > +				     "fsl,s32v234-linflexuart";
> > +			reg = <0x402bc000 0x3000>;
> > +			interrupts = <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
> > +			status = "disabled";
> > +		};
> > +
> > +		gic: interrupt-controller@50800000 {
> > +			compatible = "arm,gic-v3";
> > +			#interrupt-cells = <3>;
> > +			interrupt-controller;
> > +			reg = <0x50800000 0x10000>,
> > +			      <0x50900000 0x200000>,
> > +			      <0x50400000 0x2000>,
> > +			      <0x50410000 0x2000>,
> > +			      <0x50420000 0x2000>;
> > +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +			mbi-ranges = <167 16>;
> > +		};
> > +
> > +		qspi: spi@40134000 {
> 
> Keep order by unit address.
> 

Will fix that, thanks.

> > +			compatible = "nxp,s32g3-qspi";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			reg = <0x0 0x00000000 0x0 0x20000000>,
> > +				<0x0 0x40134000 0x0 0x1000>;
> > +			reg-names = "QuadSPI-memory", "QuadSPI";
> > +			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> > +			clock-names = "qspi_en", "qspi";
> > +			clocks = <&clks S32_SCMI_CLK_QSPI_FLASH1X>,
> > +				 <&clks S32_SCMI_CLK_QSPI_FLASH1X>;
> > +			spi-max-frequency = <200000000>;
> > +			spi-num-chipselects = <2>;
> > +			status = "disabled";
> > +		};
> > +
> > +		usdhc0: mmc@402f0000 {
> > +			compatible = "nxp,s32g3-usdhc",
> > +			             "nxp,s32g2-usdhc";
> > +			reg = <0x402f0000 0x1000>;
> > +			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&clks S32_SCMI_CLK_USDHC_MODULE>,
> > +				 <&clks S32_SCMI_CLK_USDHC_AHB>,
> > +				 <&clks S32_SCMI_CLK_USDHC_CORE>;
> > +			clock-names = "ipg", "ahb", "per";
> > +			status = "disabled";
> > +		};
> > +
> > +		gmac0: ethernet@4033c000 {
> > +			status = "disabled";
> 
> Random code... sorry, but status does not come first. Put it last and
> please read carefully DTS coding style.
>

Will be fixed, thanks!

> > +			compatible = "nxp,s32-dwmac";
> > +			reg = <0x4033c000 0x2000>, /* gmac IP */
> > +			      <0x4007c004 0x4>;    /* S32 CTRL_STS reg */
> > +			interrupt-parent = <&gic>;
> > +			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "macirq";
> > +			tx-fifo-depth = <20480>;
> > +			rx-fifo-depth = <20480>;
> > +			dma-coherent;
> > +			snps,mtl-rx-config = <&mtl_rx_setup_gmac0>;
> > +			snps,mtl-tx-config = <&mtl_tx_setup_gmac0>;
> > +			clocks = <&clks S32_SCMI_CLK_GMAC0_AXI>,
> > +				 <&clks S32_SCMI_CLK_GMAC0_AXI>,
> > +				 <&clks S32_SCMI_CLK_GMAC0_TX_SGMII>,
> > +				 <&clks S32_SCMI_CLK_GMAC0_TX_RGMII>,
> > +				 <&clks S32_SCMI_CLK_GMAC0_TX_RMII>,
> > +				 <&clks S32_SCMI_CLK_GMAC0_TX_MII>,
> > +				 <&clks S32_SCMI_CLK_GMAC0_RX_SGMII>,
> > +				 <&clks S32_SCMI_CLK_GMAC0_RX_RGMII>,
> > +				 <&clks S32_SCMI_CLK_GMAC0_RX_RMII>,
> > +				 <&clks S32_SCMI_CLK_GMAC0_RX_MII>,
> > +				 <&clks S32_SCMI_CLK_GMAC0_TS>;
> > +			clock-names = "stmmaceth", "pclk",
> > +				      "tx_sgmii", "tx_rgmii",
> > +				      "tx_rmii", "tx_mii",
> > +				      "rx_sgmii", "rx_rgmii",
> > +				      "rx_rmii", "rx_mii",
> > +				      "ptp_ref";
> > +
> > +			mtl_rx_setup_gmac0: rx-queues-config {
> > +				snps,rx-queues-to-use = <5>;
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				queue@0 {};
> > +				queue@1 {};
> > +				queue@2 {};
> > +				queue@3 {};
> > +				queue@4 {};
> > +			};
> > +
> > +			mtl_tx_setup_gmac0: tx-queues-config {
> > +				snps,tx-queues-to-use = <5>;
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				queue@0 {};
> > +				queue@1 {};
> > +				queue@2 {};
> > +				queue@3 {};
> > +				queue@4 {};
> > +			};
> > +
> > +			gmac0_mdio: mdio0 {
> 
> mdio?
>

Can you please explain what the problem with mdio is? Is it the label?

> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> 
> > +				compatible = "snps,dwmac-mdio";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +			};
> > +		};
> > +
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> > new file mode 100644
> > index 000000000000..707b503c0165
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> > @@ -0,0 +1,57 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "s32g3.dtsi"
> > +
> > +/ {
> > +	model = "NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)";
> > +	compatible = "nxp,s32g399a-rdb3", "nxp,s32g3";
> 
> Missing bindings.
> 

Will be fixed. Thanks

> 
> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
