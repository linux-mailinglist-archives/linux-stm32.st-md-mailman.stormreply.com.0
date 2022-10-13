Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D45FE50B
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 00:13:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 708BDC6411F;
	Thu, 13 Oct 2022 22:13:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA492C64108
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 22:13:00 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AAC4784E34;
 Fri, 14 Oct 2022 00:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665699180;
 bh=RWcSBHM81ysltzwY2A/NmyAX78Ciud8oMZOK8DUgNwg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SPbT0t3OCnmXYIiu6QJKD6xXRsgDxXkt3IKJgsdwD7CTcGN/F+WHtlPd+LalNXbJl
 V1iKHfoi2riyWuRCGAukDFnPzZe5VjMsvxaSKZBjWskVcKx/FJ07ykN3SbB0dJecL5
 nboUxYC/B0qxuj+w9ZRSmSvIiUOrDgrE0KPUTMomVby+49xNYkuwKxaAZSKJSA0ZBT
 6YUsaw99oQd57XUsMgTEDfrIioK7GjkSw9xUCHFe9s7GR9QJp7AE/5juLt1QHMgFr8
 4HT/8DKAvOHXA9c4cPhF7cxBnTmnhNkdS2Y8n+Jhu1gfC32p7vbIigRctWUxpplv6J
 J44AMFUea3HWw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 14 Oct 2022 00:12:41 +0200
Message-Id: <20221013221242.218808-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013221242.218808-1-marex@denx.de>
References: <20221013221242.218808-1-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH v2 2/3] ARM: dts: qcom: Drop MMCI
	interrupt-names
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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
V2: Add RB from Linus
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 2 --
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 2 --
 arch/arm/boot/dts/qcom-msm8660.dtsi | 5 -----
 arch/arm/boot/dts/qcom-msm8960.dtsi | 2 --
 5 files changed, 14 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 942aa2278355d..ee258afaf296b 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1129,7 +1129,6 @@ sdcc1: mmc@12400000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12400000 0x2000>;
 				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -1147,7 +1146,6 @@ sdcc3: mmc@12180000 {
 				status = "disabled";
 				reg = <0x12180000 0x2000>;
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
@@ -1165,7 +1163,6 @@ sdcc4: mmc@121c0000 {
 				status = "disabled";
 				reg = <0x121c0000 0x2000>;
 				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC4_CLK>, <&gcc SDC4_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 90c08b51680aa..11b3104f01e1d 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -728,7 +728,6 @@ sdcc3: mmc@12180000 {
 				status = "disabled";
 				reg = <0x12180000 0x2000>;
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -748,7 +747,6 @@ sdcc1: mmc@12400000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12400000 0x2000>;
 				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index b47c86412de2c..0acbe62784be6 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -362,7 +362,6 @@ sdcc1: mmc@12180000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12180000 0x2000>;
 				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -382,7 +381,6 @@ sdcc2: mmc@12140000 {
 				status = "disabled";
 				reg = <0x12140000 0x2000>;
 				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC2_CLK>, <&gcc SDC2_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index ddce7d64ba991..5133333da94ea 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -549,7 +549,6 @@ sdcc1: mmc@12400000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12400000 0x8000>;
 				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -565,7 +564,6 @@ sdcc2: mmc@12140000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12140000 0x8000>;
 				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC2_CLK>, <&gcc SDC2_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -580,7 +578,6 @@ sdcc3: mmc@12180000 {
 				status = "disabled";
 				reg = <0x12180000 0x8000>;
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
@@ -596,7 +593,6 @@ sdcc4: mmc@121c0000 {
 				status = "disabled";
 				reg = <0x121c0000 0x8000>;
 				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC4_CLK>, <&gcc SDC4_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
@@ -611,7 +607,6 @@ sdcc5: mmc@12200000 {
 				status = "disabled";
 				reg = <0x12200000 0x8000>;
 				interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC5_CLK>, <&gcc SDC5_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index c5740da3754c7..9a7a4e38c23cd 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -308,7 +308,6 @@ sdcc1: mmc@12400000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12400000 0x8000>;
 				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -325,7 +324,6 @@ sdcc3: mmc@12180000 {
 				status = "disabled";
 				reg = <0x12180000 0x8000>;
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
