Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 289AA4D6158
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Mar 2022 13:15:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3DB8C628A8;
	Fri, 11 Mar 2022 12:15:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BA02C628A4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Mar 2022 12:15:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22B9kioB007226;
 Fri, 11 Mar 2022 13:14:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=mZnPHPm24M02q+judbp3O+Zv8lTtDyzXELqq0TnJu9I=;
 b=Rv2N3KvVOFUTJvDRHMXr/IrgnCXJ09Z0+a34XqUYNgSb/Vhw3GB+tuIzDLEQPiRjPqK6
 OFo4JpGO5hci2GTHjHlvgVH+zpxw2cl01bX7vlrAGn6OTsURQbZzMlWTFVH5jlZmcQIt
 EmhJlnFN3a3ClEDWVo6DUxR5GoVn3gPyP3c1v4fnslEL8MQwYt8qd+so/0szFNDKwqfA
 aQBBmzjp6GrG45OD4wzFRGzkHg8iN8ufLip7Yn6xV/TPhX98HV4GTmRCbzXYSMmGoPe0
 Zz5CGXDXdR0UdkAul/mYMGGm8gzy7nwuqGN2/1RRrbehNeVoEgIO/rnmGRawJrPAge+l dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3eqx822xrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 13:14:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 321F810002A;
 Fri, 11 Mar 2022 13:14:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A9C321E69E;
 Fri, 11 Mar 2022 13:14:51 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 11 Mar 2022 13:14:50
 +0100
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 11 Mar 2022 13:14:48 +0100
Message-ID: <20220311121448.18221-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_05,2022-03-11_02,2022-02-23_01
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: fix pinctrl node name
	warnings (MCU soc)
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
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 2 +-
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 2 +-
 arch/arm/boot/dts/stm32h743.dtsi       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 155d9ffacc83..500bcc302d42 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -45,7 +45,7 @@
 
 / {
 	soc {
-		pinctrl: pin-controller@40020000 {
+		pinctrl: pinctrl@40020000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x40020000 0x3000>;
diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
index 1cf8a23c2644..8f37aefa7315 100644
--- a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
@@ -9,7 +9,7 @@
 
 / {
 	soc {
-		pinctrl: pin-controller@40020000 {
+		pinctrl: pinctrl@40020000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x40020000 0x3000>;
diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 6e42ca2dada2..91dde07a38ba 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -583,7 +583,7 @@ mac: ethernet@40028000 {
 			status = "disabled";
 		};
 
-		pinctrl: pin-controller@58020000 {
+		pinctrl: pinctrl@58020000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "st,stm32h743-pinctrl";
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
