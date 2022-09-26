Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D645EB4BC
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 00:44:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83229C63324;
	Mon, 26 Sep 2022 22:44:49 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D5E7C5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 22:44:48 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 772F384CB1;
 Tue, 27 Sep 2022 00:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664232287;
 bh=bJOjJLE3F6IPO0mWD51ephZYxHPsdgsPC4jrVy/SqN0=;
 h=From:To:Cc:Subject:Date:From;
 b=bMrxIOZ9s5PpMRzzurhmmbBHApXfr6WbT9shdS4jPZuqgHROqFAdAlm2pJN3PumW3
 KQaOs/3NAcZ2h9Nzuk6ncFIktvhzh4sMODlleEKv/15X9wA9dtCpkV1KDw7rZYTTCG
 GgdDVVK/Q9l6K0xS/kIRunuq51JRWbCvKfl/gCtkyNbWPcJNZgiXgPX7Qh/BKbi95d
 /DU/+wQUsOwYizFyrset5z0kP/EruVHq6U0tFWRuLSyYcSnouCcrjV4lwm5ykOKAeT
 AvIoQJYqPBzRHwosUQSQP8NqJG3U7wJ/rpqLztfVneBCUqFu6wUn0uhFK4SRdxwDcE
 ucczngcFr1mGg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 27 Sep 2022 00:44:37 +0200
Message-Id: <20220926224437.546566-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Rename mdio0 to mdio
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

Replace "mdio0" node with "mdio" to match mdio.yaml DT schema.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi     | 2 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts                | 2 +-
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts            | 2 +-
 arch/arm/boot/dts/stm32mp157c-odyssey.dts            | 2 +-
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi         | 2 +-
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi   | 2 +-
 arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi | 2 +-
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi               | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
index 30156b7546ed6..aef02e6421a36 100644
--- a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
@@ -173,7 +173,7 @@ &ethernet0 {
 	phy-handle = <&phy0>;
 	st,eth-ref-clk-sel;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 050c3c27a4203..b72d5e8aa4669 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -144,7 +144,7 @@ &ethernet0 {
 	max-speed = <1000>;
 	phy-handle = <&phy0>;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index e8d2ec41d5374..cb00ce7cec8b1 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -112,7 +112,7 @@ &ethernet0 {
 	phy-handle = <&ethphy>;
 	status = "okay";
 
-	mdio0 {
+	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey.dts b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
index ed66d25b8bf3d..a8b3f7a547036 100644
--- a/arch/arm/boot/dts/stm32mp157c-odyssey.dts
+++ b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
@@ -41,7 +41,7 @@ &ethernet0 {
 	assigned-clock-rates = <125000000>; /* Clock PLL4 to 750Mhz in ATF/U-Boot */
 	st,eth-clk-sel;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 9c415a6b206f9..155843e1402fb 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -125,7 +125,7 @@ &ethernet0 {
 	max-speed = <100>;
 	phy-handle = <&phy0>;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
index 90933077d66de..6f7dbabe3f350 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -151,7 +151,7 @@ &ethernet0 {
 	max-speed = <1000>;
 	phy-handle = <&phy0>;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
index 27477bb219ded..c32c160f97f20 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
@@ -78,7 +78,7 @@ &ethernet0 {
 	max-speed = <1000>;
 	phy-handle = <&phy0>;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 8b48d3c89a047..6afff983069b6 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -141,7 +141,7 @@ &ethernet0 {
 	max-speed = <1000>;
 	phy-handle = <&phy0>;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
