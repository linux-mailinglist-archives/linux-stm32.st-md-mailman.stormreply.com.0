Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 892845595F1
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jun 2022 11:01:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EF1CC5E2C6;
	Fri, 24 Jun 2022 09:01:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95A67C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jun 2022 09:01:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 i67-20020a1c3b46000000b003a03567d5e9so1310168wma.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jun 2022 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DYqi+SGcB0+t2X+VYlC5fZRvt40T3yhMiNazUS1RDXg=;
 b=KTYM3gqN0dbVx0MMpORszENXRVGhqUN/bTd+qbPxDHuW4jPEtauSJwiVkn98ROISpr
 idy6ijgKO6qKA0rE95x5zivQtOETae5BhPw1v4j0c646Qc/6i3unmDqArgdPI4e9hLoI
 MN7bC75nrHoxtLMWdIi+tXEHI52cjL61npeOLG1TP5owvNFkVxOdSauASv73mvfrKQoq
 C9GYBei1j3zCBHlu99Mgwc9i+BZdlSqTur0naohCBXLYYvvI6PddLqqEsIKEJG737wjB
 bE3EmaCI6ft4CWSLe+XkdpKbapkmLgcd/j3BheqsousuJcAcVv1ZysNs4ymDF0mTouMn
 NcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DYqi+SGcB0+t2X+VYlC5fZRvt40T3yhMiNazUS1RDXg=;
 b=qWLGeABpfx1+AX/f7SABtWhm+YgB1li5Z0tL/pMgMvHcNa1tyAi4PG8GHNtXEUTKCi
 bDXcGsjeUL9J/1Q3/3L7MOqQtaWSH5WjUFESoIUvz2PxcPVqeEI9pwye9y/l4zx/jIK4
 mu0OuM1VRZAQcJCv0lBFGE23lDc8RfzMHdKAoXFuGSzZvjeSTydxbkB2NyI9Sj07oceQ
 OHOtFcvKS5s9h3//WeAqJ75bspC5VSAOcf0ObZTjDvnQH+K2r4gO/CVzZFrBWTMSjDf4
 QmqEP92ZgvivfhH29uqfeyTGuLVaGAIUgKVMnWTb5njSGxc8iyWs83dlUA66/rNiH7dB
 8ULA==
X-Gm-Message-State: AJIora/91QxSzLbEjdyM+6hmTnbD/rsj5rD9aoZ8gwdnpb4XSbqnPMfn
 mghovLBVJK3P6wC9rdhUq5qpsA==
X-Google-Smtp-Source: AGRyM1vJblVpTyNWcE6m4PbaUdDUJM1SUYRY98T5uH//0OhEeRyez3qBnHqTgu2Krcaa4KOZaxCo9A==
X-Received: by 2002:a05:600c:3b1f:b0:3a0:2f82:7d6b with SMTP id
 m31-20020a05600c3b1f00b003a02f827d6bmr2476743wms.3.1656061315059; 
 Fri, 24 Jun 2022 02:01:55 -0700 (PDT)
Received: from lmecxl1178.lme.st.com
 ([2a04:cec0:11eb:7fe2:cb1a:9cd7:1545:5dfc])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a05600c1c0900b0039c7f790f6asm6717084wms.30.2022.06.24.02.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 02:01:54 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 24 Jun 2022 11:00:55 +0200
Message-Id: <20220624090055.569400-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: fix pwr regulators
	references to use scmi
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

Fixes stm32mp15*-scmi DTS files introduced in [1] to also access PWR
regulators through SCMI service. This is needed since enabling secure
only access to RCC clock and reset controllers also enables secure
access only on PWR voltage regulators reg11, reg18 and usb33 hence
these must also be accessed through SCMI Voltage Domain protocol.
This change applies on commit [2] that already corrects issues from
commit [1].

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Link: [1] https://lore.kernel.org/linux-arm-kernel/20220422150952.20587-7-alexandre.torgue@foss.st.com
Link: [2] https://lore.kernel.org/linux-arm-kernel/20220613071920.5463-1-alexandre.torgue@foss.st.com
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 arch/arm/boot/dts/stm32mp15-scmi.dtsi      | 52 ++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts |  1 +
 arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts |  1 +
 3 files changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/stm32mp15-scmi.dtsi
index e90cf3acd0b3..d2afb6667479 100644
--- a/arch/arm/boot/dts/stm32mp15-scmi.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-scmi.dtsi
@@ -27,6 +27,37 @@ scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
 			};
+
+			scmi_voltd: protocol@17 {
+				reg = <0x17>;
+
+				scmi_reguls: regulators {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					scmi_reg11: reg11@0 {
+						reg = <0>;
+						regulator-name = "reg11";
+						regulator-min-microvolt = <1100000>;
+						regulator-max-microvolt = <1100000>;
+					};
+
+					scmi_reg18: reg18@1 {
+						voltd-name = "reg18";
+						reg = <1>;
+						regulator-name = "reg18";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					scmi_usb33: usb33@2 {
+						reg = <2>;
+						regulator-name = "usb33";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+					};
+				};
+			};
 		};
 	};
 
@@ -45,3 +76,24 @@ scmi_shm: scmi-sram@0 {
 		};
 	};
 };
+
+&reg11 {
+	status = "disabled";
+};
+
+&reg18 {
+	status = "disabled";
+};
+
+&usb33 {
+	status = "disabled";
+};
+
+&usbotg_hs {
+	usb33d-supply = <&scmi_usb33>;
+};
+
+&usbphyc {
+	vdda1v1-supply = <&scmi_reg11>;
+	vdda1v8-supply = <&scmi_reg18>;
+};
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
index 03226a596904..97e4f94b0a24 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
@@ -35,6 +35,7 @@ &cryp1 {
 };
 
 &dsi {
+	phy-dsi-supply = <&scmi_reg18>;
 	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
 };
 
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
index 7842384ddbe4..3b9dd6f4ccc9 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
@@ -36,6 +36,7 @@ &cryp1 {
 };
 
 &dsi {
+	phy-dsi-supply = <&scmi_reg18>;
 	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
