Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 625CB349BCE
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 22:45:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E572C57B60;
	Thu, 25 Mar 2021 21:45:40 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02972CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 21:45:37 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F5zDc5fN0z1qs3t;
 Thu, 25 Mar 2021 22:45:36 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F5zDc536Gz1qqwh;
 Thu, 25 Mar 2021 22:45:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id NWpCBjqF4d8K; Thu, 25 Mar 2021 22:45:35 +0100 (CET)
X-Auth-Info: oC7nGH1xfNimfLnIhKKKRxm+ka9AABgxWYiGSOtnr+g=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 25 Mar 2021 22:45:35 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 25 Mar 2021 22:45:33 +0100
Message-Id: <20210325214533.80061-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Alexandre Torgue <alexandre.torgue@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable crc1 and cryp1 where
	applicable on DHSOM
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

Enable the CRC accelerator on all STM32MP15xx DHSOM based systems
and CRYP accelerator on all STM32MP15x[CF] DHSOM based systems.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts   | 4 ++++
 arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts    | 4 ++++
 arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts | 4 ++++
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi    | 4 ++++
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi    | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts b/arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts
index 02a39132958e..b4e504f026ce 100644
--- a/arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts
+++ b/arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts
@@ -20,6 +20,10 @@ / {
 		     "st,stm32mp153";
 };
 
+&cryp1 {
+	status = "okay";
+};
+
 &m_can1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_a>;
diff --git a/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts b/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
index d3b81382f97c..6dd8216c235e 100644
--- a/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
@@ -20,6 +20,10 @@ / {
 		     "st,stm32mp157";
 };
 
+&cryp1 {
+	status = "okay";
+};
+
 &m_can1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_a>;
diff --git a/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts b/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
index cfb8f8a0c82d..7067a860aaff 100644
--- a/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
@@ -20,6 +20,10 @@ / {
 		     "st,stm32mp157";
 };
 
+&cryp1 {
+	status = "okay";
+};
+
 &m_can1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_a>;
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 7365be965979..50806c84432a 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -92,6 +92,10 @@ adc2: adc@100 {
 	};
 };
 
+&crc1 {
+	status = "okay";
+};
+
 &dac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
index 803eb8bc9c85..013ae369791d 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
@@ -21,6 +21,10 @@ memory@c0000000 {
 	};
 };
 
+&crc1 {
+	status = "okay";
+};
+
 &dts {
 	status = "okay";
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
