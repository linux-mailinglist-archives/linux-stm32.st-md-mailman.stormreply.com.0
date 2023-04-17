Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 399826E4E04
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 18:08:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C441BC6A5FA;
	Mon, 17 Apr 2023 16:08:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7468C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 16:08:48 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33HDxpnV018583; Mon, 17 Apr 2023 18:08:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=mPV7GLBx8x0NE9kJ5R1Z38xG1GCGlkd5tMt4db0xXFs=;
 b=sTgMELsV/HrXPnrIHwkrhZmtAAZO7UjwGyYXA9w1sHR62g4+7jwupD4aN4prTzIsTA9V
 WcZvwwp/aFNUFB7OzDLTMiTpFg2EL3UM+BzyVu9bnUxU2yK6jGgkL+PHabssNohLJUaV
 3rQfv0zJMT6bZXCY++RqwmqnzZCrSwuM4SKpYCZQcxSKL9Qth9HrCIi4iemaFVGcNbbK
 QgzeErY0TCDyNMIckO5rIyuEZUvpOPuiRSOeBcxT8v7PfqTJ+EvQTVh4aOjXLTBsXlC3
 GmYYaL5FvUFyCRGG2JGf2+fnx6Ox+gYv55ASNeahBhmYg/7DporIGfLa5t641lQpfv8B Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q10vdupg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 18:08:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2F34100034;
 Mon, 17 Apr 2023 18:08:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC1AC22F7A3;
 Mon, 17 Apr 2023 18:08:28 +0200 (CEST)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 17 Apr
 2023 18:08:28 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
Date: Mon, 17 Apr 2023 18:08:18 +0200
Message-ID: <20230417180757.v2.1.If11ffa6edfdfef0869478412ec3cec3169483cb9@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_10,2023-04-17_01,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] ARM: dts: stm32: remove extra space in
	stm32mp15xx-dkx.dtsi
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

Remove unnecessary space in device tree stm32mp15xx-dkx.dtsi.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- update commit title to reflect what the change is
  V1="ARM: dts: stm32: fix typo in stm32mp15xx-dkx.dtsi"

 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 11370ae0d868..ccd6c4722bd3 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -382,21 +382,21 @@ vref_ddr: vref_ddr {
 				regulator-always-on;
 			};
 
-			 bst_out: boost {
+			bst_out: boost {
 				regulator-name = "bst_out";
 				interrupts = <IT_OCP_BOOST 0>;
-			 };
+			};
 
 			vbus_otg: pwr_sw1 {
 				regulator-name = "vbus_otg";
 				interrupts = <IT_OCP_OTG 0>;
-			 };
+			};
 
-			 vbus_sw: pwr_sw2 {
+			vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
 				regulator-active-discharge = <1>;
-			 };
+			};
 		};
 
 		onkey {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
