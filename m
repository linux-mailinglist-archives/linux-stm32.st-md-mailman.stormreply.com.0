Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 095FA287C8C
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Oct 2020 21:38:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6BF1C3FAD7;
	Thu,  8 Oct 2020 19:38:11 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E77E3C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Oct 2020 19:38:08 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C6hM36BgZz1s8NL;
 Thu,  8 Oct 2020 21:38:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C6hM35vRNz1qvJ3;
 Thu,  8 Oct 2020 21:38:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id OO_t3nc8c0Mn; Thu,  8 Oct 2020 21:38:06 +0200 (CEST)
X-Auth-Info: 9YIzH+INRh6CidONxHE0cpF6KlXgGs8wOy/Vr0+ETMw=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  8 Oct 2020 21:38:06 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu,  8 Oct 2020 21:38:00 +0200
Message-Id: <20201008193800.129513-2-marex@denx.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201008193800.129513-1-marex@denx.de>
References: <20201008193800.129513-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: Add KS8851 on FMC2 to
	STM32MP1 DHCOM
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

Add bindings for the KS8851 ethernet present on the STM32MP1 DHCOM SoM.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index bc6b2b33078d..f62bf170408e 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -11,6 +11,7 @@
 / {
 	aliases {
 		ethernet0 = &ethernet0;
+		ethernet1 = &ksz8851;
 	};
 
 	memory@c0000000 {
@@ -132,6 +133,40 @@
 	};
 };
 
+&fmc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&fmc_pins_b>;
+	pinctrl-1 = <&fmc_sleep_pins_b>;
+	status = "okay";
+
+	ksz8851: ks8851mll@1,0 {
+		compatible = "micrel,ks8851-mll";
+		reg = <1 0x0 0x2>, <1 0x2 0x20000>;
+		interrupt-parent = <&gpioc>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		bank-width = <2>;
+
+		/* Timing values are in nS */
+		st,fmc2-ebi-cs-mux-enable;
+		st,fmc2-ebi-cs-transaction-type = <4>;
+		st,fmc2-ebi-cs-buswidth = <16>;
+		st,fmc2-ebi-cs-address-setup-ns = <5>;
+		st,fmc2-ebi-cs-address-hold-ns = <5>;
+		st,fmc2-ebi-cs-bus-turnaround-ns = <5>;
+		st,fmc2-ebi-cs-data-setup-ns = <45>;
+		st,fmc2-ebi-cs-data-hold-ns = <1>;
+		st,fmc2-ebi-cs-write-address-setup-ns = <5>;
+		st,fmc2-ebi-cs-write-address-hold-ns = <5>;
+		st,fmc2-ebi-cs-write-bus-turnaround-ns = <5>;
+		st,fmc2-ebi-cs-write-data-setup-ns = <45>;
+		st,fmc2-ebi-cs-write-data-hold-ns = <1>;
+	};
+};
+
+&gpioc {
+	status = "okay";
+};
+
 &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_a>;
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
