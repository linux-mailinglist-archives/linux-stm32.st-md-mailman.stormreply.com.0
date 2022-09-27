Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E95EB62F
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 02:20:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6E6AC63324;
	Tue, 27 Sep 2022 00:20:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39C53C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 00:20:27 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B130E8494E;
 Tue, 27 Sep 2022 02:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664238026;
 bh=KgCVF7RY/wkAzmn0/wKrahTF/cNmyzL+nT+CKhk/u0Y=;
 h=From:To:Cc:Subject:Date:From;
 b=eD6hju8XLAvTkVqVHj0G2hgC3KyuZOfnwXmmkripivQ1lvDsD0S0fAsOEst+ChwLE
 L2YHsr3BJV1UV/JwMH0QXKFryqDxBkK04EZoTJ5w6SHJ/75SSICb41WmZw7AHoxSzu
 RYnmNVZXBbG62/cKFS10wTJrV6s0doymvgqLVE8ApgSNRKQHD5Z1deppznYK3Hdrzw
 jCoAQRC63F5E+XT3Z2TcsM2oel7En4KYYuEbVOaxGrU3wlcoZAl+X5Rb4roqjuAK4G
 +7MzHpsBKYD+4PMwxA3SgpvSmhrDDDE+Dy6bOGRiGUwhPuNgoJkMXxyPORaY9086H9
 uxoWx75cjEhog==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 27 Sep 2022 02:20:23 +0200
Message-Id: <20220927002023.685128-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Replace SAI format with
	dai-format DT property
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

The dai-format and format are handled equally by sound-core.c , the
later is however the only documented property in audio-graph-port.yaml .
Switch to the later.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      | 4 ++--
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 2 +-
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index 5f586f024060f..4709677151aac 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -242,7 +242,7 @@ sai2a: audio-controller@4400b004 {
 		sai2a_port: port {
 			sai2a_endpoint: endpoint {
 				remote-endpoint = <&sgtl5000_tx_endpoint>;
-				format = "i2s";
+				dai-format = "i2s";
 				mclk-fs = <512>;
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <16>;
@@ -260,7 +260,7 @@ sai2b: audio-controller@4400b024 {
 		sai2b_port: port {
 			sai2b_endpoint: endpoint {
 				remote-endpoint = <&sgtl5000_rx_endpoint>;
-				format = "i2s";
+				dai-format = "i2s";
 				mclk-fs = <512>;
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <16>;
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
index aa79ed1cb1f15..50af4a27d6be4 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -358,7 +358,7 @@ sai2a: audio-controller@4400b004 {
 		sai2a_port: port {
 			sai2a_endpoint: endpoint {
 				remote-endpoint = <&adv7513_i2s0>;
-				format = "i2s";
+				dai-format = "i2s";
 				mclk-fs = <256>;
 			};
 		};
diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 6afff983069b6..7798a2e17c5ca 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -508,7 +508,7 @@ sai2a: audio-controller@4400b004 {
 		sai2a_port: port {
 			sai2a_endpoint: endpoint {
 				remote-endpoint = <&cs42l51_tx_endpoint>;
-				format = "i2s";
+				dai-format = "i2s";
 				mclk-fs = <256>;
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <32>;
@@ -526,7 +526,7 @@ sai2b: audio-controller@4400b024 {
 		sai2b_port: port {
 			sai2b_endpoint: endpoint {
 				remote-endpoint = <&cs42l51_rx_endpoint>;
-				format = "i2s";
+				dai-format = "i2s";
 				mclk-fs = <256>;
 				dai-tdm-slot-num = <2>;
 				dai-tdm-slot-width = <32>;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
