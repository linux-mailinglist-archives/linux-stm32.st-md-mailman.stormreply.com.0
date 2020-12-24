Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACAE2E24C7
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Dec 2020 07:24:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4C21C57183;
	Thu, 24 Dec 2020 06:24:46 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70CCEC5717D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Dec 2020 06:24:43 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4D1g631gf9z1qqks;
 Thu, 24 Dec 2020 07:24:43 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4D1g631Gnqz1tYVw;
 Thu, 24 Dec 2020 07:24:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id EmKNw3aTGGyG; Thu, 24 Dec 2020 07:24:41 +0100 (CET)
X-Auth-Info: hZl5/nar9ZTXm+ecXg8IuY3FzEPsmy/DhKNayIPJqx0=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 24 Dec 2020 07:24:41 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 24 Dec 2020 07:24:38 +0100
Message-Id: <20201224062438.92582-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix GPIO hog names on DHCOM
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

The GPIO hog node name should match regex '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$',
make it so and fix the following two make dtbs_check warnings:

arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dt.yaml: hog-usb-port-power: $nodename:0: 'hog-usb-port-power' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dt.yaml: hog-usb-hub: $nodename:0: 'hog-usb-hub' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi   | 4 ++--
 arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
index 62ab23824a3e..cb68afbbea68 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
@@ -33,7 +33,7 @@ &gpiob {
 	 * during TX anyway and that it only controls drive enable DE
 	 * line. Hence, the RX is always enabled here.
 	 */
-	rs485-rx-en {
+	rs485-rx-en-hog {
 		gpio-hog;
 		gpios = <8 GPIO_ACTIVE_HIGH>;
 		output-low;
@@ -61,7 +61,7 @@ &gpioi {
 	 * order to reset the Hub when USB bus is powered down, but
 	 * so far there is no such functionality.
 	 */
-	usb-hub {
+	usb-hub-hog {
 		gpio-hog;
 		gpios = <2 GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
index 356150d28c42..b99f2b891629 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
@@ -43,7 +43,7 @@ &gpioa {
 	 * in order to turn on port power when USB bus is powered up, but so
 	 * far there is no such functionality.
 	 */
-	usb-port-power {
+	usb-port-power-hog {
 		gpio-hog;
 		gpios = <13 GPIO_ACTIVE_LOW>;
 		output-low;
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
