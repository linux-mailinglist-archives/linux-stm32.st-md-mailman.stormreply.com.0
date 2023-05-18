Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A697077C9
	for <lists+linux-stm32@lfdr.de>; Thu, 18 May 2023 04:05:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76593C6B442;
	Thu, 18 May 2023 02:05:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEFC7C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 May 2023 02:05:55 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7694F860F1;
 Thu, 18 May 2023 04:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684375554;
 bh=txEd+mjTbK7UJ4x9dqv/n3gIh4TCN6LC1jcntuypXSI=;
 h=From:To:Cc:Subject:Date:From;
 b=y8eMzqQN8POMx5nk/wIZZpmFOzkDsvb+e9b66/2UYwydd7yL/QWytJaKRybbzzDd2
 ul142aRFwSDpvcXVREqANvGBY12vgFS2cQoSucNCNJcWBO7CCDpGtmEHx7b3WJzeXn
 NRcQwVEPygqwsFJJBjh+buyPCSuQ1rKvf2EcWhcKokR+tVht1tByM34eGEDS7w0vQm
 8mstoRxv8e10OubIQe9rZ37T6J0482EiUOMFq4ZjiOkhx9bf4gWZt9p8rDcj9eB7LE
 qS3FEcD2pgoYH6hV2Ry2Iw/vFSTQgddM9Wctsh0mMA0v8a+SzDddqGadlEgV5NXgDL
 dUDil9WQFxdHQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 18 May 2023 04:05:47 +0200
Message-Id: <20230518020547.487670-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Update to generic ADC
	channel binding on DHSOM systems
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

The generic ADC channel binding is recommended over legacy one, update the
DT to the modern binding. No functional change. For further details, see
commit which adds the generic binding to STM32 ADC binding document:
664b9879f56ef ("dt-bindings: iio: stm32-adc: add generic channel binding")

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi  | 24 ++++++----
 .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 44 +++++++++++++++----
 2 files changed, 52 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index a38009f8456b8..95f3fbdcb3d17 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -80,17 +80,25 @@ &adc {
 	vdda-supply = <&vdda>;
 	vref-supply = <&vdda>;
 	status = "okay";
+};
 
-	adc1: adc@0 {
-		st,min-sample-time-nsecs = <5000>;
-		st,adc-channels = <0>;
-		status = "okay";
+&adc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	channel@0 {
+		reg = <0>;
+		st,min-sample-time-ns = <5000>;
 	};
+};
 
-	adc2: adc@100 {
-		st,adc-channels = <1>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
+&adc2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	channel@1 {
+		reg = <1>;
+		st,min-sample-time-ns = <5000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
index 2b52515457e4b..02c1a7474826c 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -111,17 +111,45 @@ &adc {
 	vdda-supply = <&vdda>;
 	vref-supply = <&vdda>;
 	status = "okay";
+};
 
-	adc1: adc@0 {
-		st,adc-channels = <0 1 6>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
+&adc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	channel@0 {
+		reg = <0>;
+		st,min-sample-time-ns = <5000>;
 	};
 
-	adc2: adc@100 {
-		st,adc-channels = <0 1 2>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
+	channel@1 {
+		reg = <1>;
+		st,min-sample-time-ns = <5000>;
+	};
+
+	channel@6 {
+		reg = <6>;
+		st,min-sample-time-ns = <5000>;
+	};
+};
+
+&adc2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	channel@0 {
+		reg = <0>;
+		st,min-sample-time-ns = <5000>;
+	};
+
+	channel@1 {
+		reg = <1>;
+		st,min-sample-time-ns = <5000>;
+	};
+
+	channel@2 {
+		reg = <2>;
+		st,min-sample-time-ns = <5000>;
 	};
 };
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
