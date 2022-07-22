Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AEA57E1FD
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jul 2022 15:07:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 654A5C06F81;
	Fri, 22 Jul 2022 13:07:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B9BBC03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 13:07:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M8W1QO015132;
 Fri, 22 Jul 2022 15:06:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=rLtXOZaBhBJ4Za2tM1rJodMY0MHpDsHiAJ70GxqUcbQ=;
 b=TqAN19qdbfB3ydLJDQWEwlthuh3Iu2v8O9iY1tq3FEGhMdERGc9yhFHvF5qCha6WygDp
 NT1xxjXFirS8aKTuHFMrIojHkCauPHI1tKslJSkQTDdKqYbbhntuuLC+c/MltkHxSU1q
 5ssB7iHetBXVn3Z7poKiwxxrF80gEfW79y6PPfEsJeTiq7VXuF945PHiixzUcGnnI4at
 x8He/1Jeb8tWRPyhmkKGm7ai9O7Sn74HiR/h2oV/uNzWVTvnmJ6vEJU+sUwNYoU9Dc5b
 OgbHUIg9fMcrsV/SGXUDTiq9ZGU0hmhZ7l5jwIS6jgbuTKcxQOwROxH0Ymojxg3OoXSy jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hf805dnb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 15:06:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 953FA10002A;
 Fri, 22 Jul 2022 15:06:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 90B80228A4F;
 Fri, 22 Jul 2022 15:06:43 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Jul
 2022 15:06:40 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mka@chromium.org>,
 <alexandre.torgue@foss.st.com>
Date: Fri, 22 Jul 2022 15:05:53 +0200
Message-ID: <20220722130554.236925-4-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722130554.236925-1-fabrice.gasnier@foss.st.com>
References: <20220722130554.236925-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_04,2022-07-21_02,2022-06-22_01
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/4] ARM: dts: stm32: add support for USB2514B
	onboard hub on stm32mp15xx-dkx
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

Add support for USB2514B onboard hub on stm32mp15 DK boards. The HUB
is supplied by a 3v3 PMIC regulator.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 333c2af97130a..8b48d3c89a047 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -677,6 +677,14 @@ &usart3 {
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
 	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	/* onboard HUB */
+	hub@1 {
+		compatible = "usb424,2514";
+		reg = <1>;
+		vdd-supply = <&v3v3>;
+	};
 };
 
 &usbotg_hs {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
