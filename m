Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BABF853B06
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 20:35:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 336A2C6DD97;
	Tue, 13 Feb 2024 19:35:23 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 989B5C6DD97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 19:35:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E51B4CE1E4C;
 Tue, 13 Feb 2024 19:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E623CC433C7;
 Tue, 13 Feb 2024 19:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707852919;
 bh=wSVuDaYSgh8MRixfbgvvFkBg3ejCEwObxIZSwlWgJa4=;
 h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
 b=sU1N4Ggyxhx9lERFgDp3HswZEeDvw732OLECne+I4Atpgqblh4cjja3l1sOtHoYl9
 l4dwZ+ziMxlfjtve6lVljsTFIcvmXjKYBQ67e/js6lCJzMDx3omgBVxFxh+cpbdJ3K
 ueRtx+gAJt1uQoXbtpoQhKfp/FrApaqLNGG8OsjkSURY5NvOmoE/UZMuIglTGuJlN/
 igWEIOhI1bq6q1be+4Q4sWE31EpquEUWwrCaPxrrf3CxjTIr8R4S3/iF0K6nLZMv1n
 mhE2OnbR162tkiAXlw/c2oDCTV64L+hKXBoPRMs21+2xmFBfgTWGJgpMvp15ZtC2JP
 0GPOgUMijJiWg==
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Feb 2024 13:34:28 -0600
MIME-Version: 1.0
Message-Id: <20240213-arm-dt-cleanups-v1-4-f2dee1292525@kernel.org>
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
To: soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tsahee Zidenberg <tsahee@annapurnalabs.com>, 
 Antoine Tenart <atenart@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
 Tony Lindgren <tony@atomide.com>, Chanho Min <chanho.min@lge.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
X-Mailer: b4 0.13-dev
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/6] arm: dts: Fix dtc interrupt_map warnings
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

The dtc interrupt_map warning is off because its dependency,
interrupt_provider, is off by default. Fix all the warnings so it can be
enabled.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-gateway-7001.dts     | 2 ++
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-goramo-multilink.dts | 2 ++
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi                        | 8 ++++----
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-gateway-7001.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-gateway-7001.dts
index 4d70f6afd13a..6d5e69035f94 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-gateway-7001.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-gateway-7001.dts
@@ -60,6 +60,8 @@ pci@c0000000 {
 			 * We have slots (IDSEL) 1 and 2 with one assigned IRQ
 			 * each handling all IRQs.
 			 */
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0xf800 0 0 7>;
 			interrupt-map =
 			/* IDSEL 1 */
 			<0x0800 0 0 1 &gpio0 11 IRQ_TYPE_LEVEL_LOW>, /* INT A on slot 1 is irq 11 */
diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-goramo-multilink.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-goramo-multilink.dts
index 9ec0169bacf8..5f4c849915db 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-goramo-multilink.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-goramo-multilink.dts
@@ -89,6 +89,8 @@ pci@c0000000 {
 			 * The slots have Ethernet, Ethernet, NEC and MPCI.
 			 * The IDSELs are 11, 12, 13, 14.
 			 */
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0xf800 0 0 7>;
 			interrupt-map =
 			/* IDSEL 11 - Ethernet A */
 			<0x5800 0 0 1 &gpio0 4 IRQ_TYPE_LEVEL_LOW>, /* INT A on slot 11 is irq 4 */
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
index 2045fc779f88..27429d0fedfb 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
@@ -340,10 +340,10 @@ pcie_rc: pcie@1c00000 {
 					  "msi8";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 141 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 142 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 143 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 144 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 141 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 142 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 143 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 144 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_PIPE_CLK>,
 				 <&gcc GCC_PCIE_AUX_CLK>,

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
