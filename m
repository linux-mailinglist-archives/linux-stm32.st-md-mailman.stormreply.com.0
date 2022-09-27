Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6FE5ECCB5
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 21:17:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 795B7C640F1;
	Tue, 27 Sep 2022 19:17:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F2C5C63325
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 19:17:54 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B115D84DEC;
 Tue, 27 Sep 2022 21:17:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664306274;
 bh=4vMbhbwGpwD7+mJZLz+7XjKP9e1tqSkXhVPOjHx2Sz4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j7ZRNuoZLlUNjoIFBN7WWfSH/Zo/cc8jARg3LruUCzVPq7iz0trQU07+gO70WdcF6
 YhuIRX+fIklcxgLxgqiCtOGUxiyWmDHwJ7isCo896nZHW/bezTTj3Bm4O8gdFmM2ci
 dZcOXws74LAi7xoM0OLH2sj2wLgieSwmBxHABpYlh0f++DOLkRYyJZvi9Urk2KqrjZ
 +s529+BxIXvKGCocd3DeXdPRPmQYuFFjCjpI7Hd9vO6ssrAP8Sz20gg0xO2Ri/YUFP
 pWL7ZaHwI6dKl6rpEXtAi8X39thlSBe6t26KZuPbDzPjwT0Cxk9D69W9F/vOValSjE
 Lmk0+GxAdF9CA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 27 Sep 2022 21:17:36 +0200
Message-Id: <20220927191736.299702-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927191736.299702-1-marex@denx.de>
References: <20220927191736.299702-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: Drop MMCI interrupt-names
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

The pl18x MMCI driver does not use the interrupt-names property,
the binding document has been updated to recommend this property
be unused, remove it.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Yann Gautier <yann.gautier@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32h743.dtsi  | 2 --
 arch/arm/boot/dts/stm32mp131.dtsi | 2 --
 arch/arm/boot/dts/stm32mp151.dtsi | 3 ---
 3 files changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 2059593da21dc..28e3deb20e1e1 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -375,7 +375,6 @@ sdmmc1: mmc@52007000 {
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x52007000 0x1000>;
 			interrupts = <49>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC1_CK>;
 			clock-names = "apb_pclk";
 			resets = <&rcc STM32H7_AHB3_RESET(SDMMC1)>;
@@ -389,7 +388,6 @@ sdmmc2: mmc@48022400 {
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x48022400 0x400>;
 			interrupts = <124>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC2_CK>;
 			clock-names = "apb_pclk";
 			resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index 47dc07abe4e37..4c9e095ed2a8a 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -356,7 +356,6 @@ sdmmc1: mmc@58005000 {
 			arm,primecell-periphid = <0x20253180>;
 			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC1_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC1_R>;
@@ -371,7 +370,6 @@ sdmmc2: mmc@58007000 {
 			arm,primecell-periphid = <0x20253180>;
 			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC2_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC2_R>;
diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index e02b3f5d44cba..5491b6c4dec20 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1118,7 +1118,6 @@ sdmmc3: mmc@48004000 {
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x48004000 0x400>;
 			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC3_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC3_R>;
@@ -1439,7 +1438,6 @@ sdmmc1: mmc@58005000 {
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58005000 0x1000>;
 			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC1_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC1_R>;
@@ -1454,7 +1452,6 @@ sdmmc2: mmc@58007000 {
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58007000 0x1000>;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC2_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC2_R>;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
