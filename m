Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 248E04D6156
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Mar 2022 13:14:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9D9AC628A8;
	Fri, 11 Mar 2022 12:14:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2860C628A4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Mar 2022 12:14:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22B9kmH9007519;
 Fri, 11 Mar 2022 13:14:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=EdcURazVt+c0nmYLTmhQVE6ArzEwbBcfE+iE4T18VC4=;
 b=c3vrx9fNjx0k4xb8T8VUTbXxkKJGtXIhm1PK4yIxi5CV+dY16aiCLht8fjepJF3OZhbF
 RowmcrTjjZBrHVtysJPjNd1TmXK5hf1MT/rpDQS4xLCkLABySRxlSMTVFfaPHLa+sNYH
 K9zzqcLN0gSNjWb9OnaVgSnP/fWpOa3mRXdykU9MHy4PhtYHMdR18tyoFbJ0B2h1b/ls
 kbDXCHuI5sI1AK5ZNTSbLZie1Ly5VaqlLnQZ9HkhqBALhJo2KJH5X/ZiXI23zoiLpKQr
 z+0SLR04K2w3I/qds6e8Mbbd/iLZyR+GemXhfadZ4ZIPYgMZVUyjptdslBfiCWuu9YRS ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3eqx822xpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 13:14:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72E2710002A;
 Fri, 11 Mar 2022 13:14:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A2F921E69C;
 Fri, 11 Mar 2022 13:14:17 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 11 Mar 2022 13:14:16
 +0100
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 11 Mar 2022 13:13:23 +0100
Message-ID: <20220311121323.18125-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_05,2022-03-11_02,2022-02-23_01
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: fix pinctrl node name
	warnings (MPU soc)
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

The recent addition pinctrl.yaml in commit c09acbc499e8 ("dt-bindings:
pinctrl: use pinctrl.yaml") resulted in some node name warnings.
Fix the node names to the preferred 'pinctrl'.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 arch/arm/boot/dts/stm32mp131.dtsi | 2 +-
 arch/arm/boot/dts/stm32mp151.dtsi | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index 86126dc0d898..57a911cddebe 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -164,7 +164,7 @@ ts_cal2: calib@5e {
 		 * Break node order to solve dependency probe issue between
 		 * pinctrl and exti.
 		 */
-		pinctrl: pin-controller@50002000 {
+		pinctrl: pinctrl@50002000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "st,stm32mp135-pinctrl";
diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 1cfc2f011e70..489fb9979085 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1602,7 +1602,7 @@ tamp: tamp@5c00a000 {
 		 * Break node order to solve dependency probe issue between
 		 * pinctrl and exti.
 		 */
-		pinctrl: pin-controller@50002000 {
+		pinctrl: pinctrl@50002000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "st,stm32mp157-pinctrl";
@@ -1733,7 +1733,7 @@ gpiok: gpio@5000c000 {
 			};
 		};
 
-		pinctrl_z: pin-controller-z@54004000 {
+		pinctrl_z: pinctrl@54004000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "st,stm32mp157-z-pinctrl";
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
