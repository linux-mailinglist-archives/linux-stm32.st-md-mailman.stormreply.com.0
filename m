Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71175718EEE
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jun 2023 01:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37003C6A616;
	Wed, 31 May 2023 23:10:56 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BDA7C69069
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 23:10:55 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9113A846D8;
 Thu,  1 Jun 2023 01:10:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685574655;
 bh=tDonX/f79Ik45V9YBqk/CP4xiQZtcS9hSQvn3JIZ4Ms=;
 h=From:To:Cc:Subject:Date:From;
 b=HZWFsWKYJVSg3Y8hryMKiTo6YVyq0zk0+PrgN7HlOJivNyMg2lUBAOQ/lzVPhLpmy
 n0XSTe9/W893pfWHF7e/Ko/HfOARpVVWdzS+r6gkFXBrTGQ8XfXIN/cH3NuBRD1FLm
 0cCDCDd+0B9rgVikVIHoGUHoehs6ZKmbk16w5ACyRxXw85e5DaURuu0BZslb4l13su
 d/J7tPehJ4RagcDe911AaGp9VrJUYgB9HBxZf3LislhvS2IDBzMZhM4KT71PJ9HTW3
 s7D6xFBxW+Sdm8iRZ3J3D+xxUP1MLphTJnC+KsD3mfboUc8EBFPhrknhFLyhifGqcp
 Lk0F3aa51Ya8w==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu,  1 Jun 2023 01:10:44 +0200
Message-Id: <20230531231044.574541-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Deduplicate DSI node
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

All boards using the DSI node duplicate the same pattern common pattern
in board DTs, that pattern is ports with endpoint labels and the same
in-SoC regulator connection. Move that common pattern into stm32mp157.dtsi
instead.

The two boards which do define panel@0 directly in the DSI bridge node now
have #address-cells/#size-cells in their board DT instead of it being in
stm32mp157.dtsi and activated incorrectly for all boards, even the ones
which use e.g. another DSI-to-something bridge.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/stm32mp157.dtsi             | 18 ++++++++++++
 ...tm32mp157a-icore-stm32mp1-ctouch2-of10.dts | 24 ++++------------
 .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   | 28 ++++++-------------
 arch/arm/boot/dts/stm32mp157c-dk2.dts         | 28 ++++++-------------
 arch/arm/boot/dts/stm32mp157c-ev1.dts         | 28 ++++++-------------
 5 files changed, 48 insertions(+), 78 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157.dtsi b/arch/arm/boot/dts/stm32mp157.dtsi
index 5e733cd16ff9e..6197d878894de 100644
--- a/arch/arm/boot/dts/stm32mp157.dtsi
+++ b/arch/arm/boot/dts/stm32mp157.dtsi
@@ -22,9 +22,27 @@ dsi: dsi@5a000000 {
 			reg = <0x5a000000 0x800>;
 			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
 			clock-names = "pclk", "ref", "px_clk";
+			phy-dsi-supply = <&reg18>;
 			resets = <&rcc DSI_R>;
 			reset-names = "apb";
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_out: endpoint {
+					};
+				};
+			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
index 4279b26547dfd..df97e03d2a5ac 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
@@ -46,26 +46,14 @@ panel_in_lvds: endpoint {
 
 &dsi {
 	status = "okay";
-	phy-dsi-supply = <&reg18>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
+};
 
-		port@0 {
-			reg = <0>;
-			dsi_in: endpoint {
-				remote-endpoint = <&ltdc_ep0_out>;
-			};
-		};
+&dsi_in {
+	remote-endpoint = <&ltdc_ep0_out>;
+};
 
-		port@1 {
-			reg = <1>;
-			dsi_out: endpoint {
-				remote-endpoint = <&bridge_in>;
-			};
-		};
-	};
+&dsi_out {
+	remote-endpoint = <&bridge_in>;
 };
 
 &i2c6 {
diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
index efba542898207..f8e4043463964 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
@@ -46,26 +46,14 @@ panel_out_bridge: endpoint {
 
 &dsi {
 	status = "okay";
-	phy-dsi-supply = <&reg18>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
+};
 
-		port@0 {
-			reg = <0>;
-			dsi_in_ltdc: endpoint {
-				remote-endpoint = <&ltdc_out_dsi>;
-			};
-		};
+&dsi_in {
+	remote-endpoint = <&ltdc_out_dsi>;
+};
 
-		port@1 {
-			reg = <1>;
-			dsi_out_bridge: endpoint {
-				remote-endpoint = <&bridge_in_dsi>;
-			};
-		};
-	};
+&dsi_out {
+	remote-endpoint = <&bridge_in_dsi>;
 };
 
 &i2c6 {
@@ -88,7 +76,7 @@ ports {
 			port@0 {
 				reg = <0>;
 				bridge_in_dsi: endpoint {
-					remote-endpoint = <&dsi_out_bridge>;
+					remote-endpoint = <&dsi_out>;
 					data-lanes = <1 2>;
 				};
 			};
@@ -108,7 +96,7 @@ &ltdc {
 
 	port {
 		ltdc_out_dsi: endpoint {
-			remote-endpoint = <&dsi_in_ltdc>;
+			remote-endpoint = <&dsi_in>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index 4bef2300ed7ca..510cca5acb79c 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -34,26 +34,6 @@ &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
-	phy-dsi-supply = <&reg18>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-			dsi_in: endpoint {
-				remote-endpoint = <&ltdc_ep1_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-			dsi_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
 
 	panel@0 {
 		compatible = "orisetech,otm8009a";
@@ -70,6 +50,14 @@ panel_in: endpoint {
 	};
 };
 
+&dsi_in {
+	remote-endpoint = <&ltdc_ep1_out>;
+};
+
+&dsi_out {
+	remote-endpoint = <&panel_in>;
+};
+
 &i2c1 {
 	touchscreen@38 {
 		compatible = "focaltech,ft6236";
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 49ca94c19b02b..874770c997997 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -100,30 +100,10 @@ dcmi_0: endpoint {
 };
 
 &dsi {
-	phy-dsi-supply = <&reg18>;
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
 
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-			dsi_in: endpoint {
-				remote-endpoint = <&ltdc_ep0_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-			dsi_out: endpoint {
-				remote-endpoint = <&dsi_panel_in>;
-			};
-		};
-	};
-
 	panel@0 {
 		compatible = "raydium,rm68200";
 		reg = <0>;
@@ -140,6 +120,14 @@ dsi_panel_in: endpoint {
 	};
 };
 
+&dsi_in {
+	remote-endpoint = <&ltdc_ep0_out>;
+};
+
+&dsi_out {
+	remote-endpoint = <&dsi_panel_in>;
+};
+
 &ethernet0 {
 	status = "okay";
 	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
