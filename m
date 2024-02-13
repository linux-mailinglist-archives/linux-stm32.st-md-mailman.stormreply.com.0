Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF93853AFF
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 20:35:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6DA6C6DD99;
	Tue, 13 Feb 2024 19:35:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC81CC6DD97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 19:35:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B20A61465;
 Tue, 13 Feb 2024 19:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DBBC433C7;
 Tue, 13 Feb 2024 19:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707852912;
 bh=bkYKQG1KP4Jg+1rHds/d+NL5/Q2GcTheiJ1Ko1kkshU=;
 h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
 b=BkgfW4hzsDgjtV38/ZRTQhCKXJMfIgS5XKucIZc6ExOSac6lo+zOnAoa2Kr0jxiTZ
 ZUlcwMmkiM35sgbG25gp0K+wAevsuUszIRww+7ZKbRFcnbLpqaYRPyrTfWb3wW6A9I
 j7ioH9Z7d6mo2UzZ2oMrqmNm/WUgV5d8zIxsSdirRSBNgmNlsfGCgvh0io2gAUxeBY
 NEMGbHwauDnw7jimLWwwSejWgYpl56Gr40W2bVztvjFP8ZZK3g4p3qHS/P1E9wiB58
 Q41YRo3UZ9qTX0QFaW5qE0LdauIFe/ZjNG9vDUGaoBMZvYKo4Tfk/YLHiiScj/3SDg
 MdojCr99B2Giw==
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Feb 2024 13:34:25 -0600
MIME-Version: 1.0
Message-Id: <20240213-arm-dt-cleanups-v1-1-f2dee1292525@kernel.org>
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
Subject: [Linux-stm32] [PATCH 1/6] arm64: dts: freescale: Disable
	interrupt_map check
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

Several Freescale Layerscape platforms extirq binding use a malformed
interrupt-map property missing parent address cells. These are
documented in of_irq_imap_abusers list in drivers/of/irq.c. In order to
enable dtc interrupt_map check tree wide, we need to disable it for
these platforms which will not be fixed (as that would break
compatibility).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/freescale/Makefile | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2e027675d7bb..2cb0212b63c6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -20,23 +20,41 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1046a-frwy.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1046a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1046a-rdb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1046a-tqmls1046a-mbls10xxa.dtb
+DTC_FLAGS_fsl-ls1088a-qds := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1088a-qds.dtb
+DTC_FLAGS_fsl-ls1088a-rdb := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1088a-rdb.dtb
+DTC_FLAGS_fsl-ls1088a-ten64 := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1088a-ten64.dtb
+DTC_FLAGS_fsl-ls1088a-tqmls1088a-mbls10xxa := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1088a-tqmls1088a-mbls10xxa.dtb
+DTC_FLAGS_fsl-ls2080a-qds := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-qds.dtb
+DTC_FLAGS_fsl-ls2080a-rdb := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-rdb.dtb
+DTC_FLAGS_fsl-ls2081a-rdb := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2081a-rdb.dtb
+DTC_FLAGS_fsl-ls2080a-simu := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
+DTC_FLAGS_fsl-ls2088a-qds := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-qds.dtb
+DTC_FLAGS_fsl-ls2088a-rdb := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-rdb.dtb
+DTC_FLAGS_fsl-lx2160a-bluebox3 := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-bluebox3.dtb
+DTC_FLAGS_fsl-lx2160a-bluebox3-rev-a := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-bluebox3-rev-a.dtb
+DTC_FLAGS_fsl-lx2160a-clearfog-cx := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-clearfog-cx.dtb
+DTC_FLAGS_fsl-lx2160a-honeycomb := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-honeycomb.dtb
+DTC_FLAGS_fsl-lx2160a-qds := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-qds.dtb
+DTC_FLAGS_fsl-lx2160a-rdb := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
+DTC_FLAGS_fsl-lx2162a-clearfog := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2162a-clearfog.dtb
+DTC_FLAGS_fsl-lx2162a-qds := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2162a-qds.dtb
 
 fsl-ls1028a-qds-13bb-dtbs := fsl-ls1028a-qds.dtb fsl-ls1028a-qds-13bb.dtbo
@@ -53,6 +71,7 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-qds-85bb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-qds-899b.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-qds-9999.dtb
 
+DTC_FLAGS_fsl-lx2160a-tqmlx2160a-mblx2160a := -Wno-interrupt_map
 fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x-dtbs := fsl-lx2160a-tqmlx2160a-mblx2160a.dtb \
 	fsl-lx2160a-tqmlx2160a-mblx2160a_12_x_x.dtbo \
 	fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtbo

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
