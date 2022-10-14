Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2605FF009
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 16:16:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E504C65042;
	Fri, 14 Oct 2022 14:16:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93BB3C65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 14:16:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EAT6D5022413;
 Fri, 14 Oct 2022 16:16:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=QJkdlha7hhplN6y54cwgCZoQ4JVyU6BQmPtqvBb5nxg=;
 b=w/Zlx9wvgAvn9tfLA9jmagZU8Vf3rquxUt94eUCxQyg/39mt933HI4m1BP+wYQcQJ1bb
 2qSFDgy0Di/fGdaS4/OOak7Pr66hXTEuRoFtTbYSO4RngfmQbK/f3nOxOjwVx3XTaHxj
 cwBUOUX3BVc1jpkdlSaNBoe17LLBQ1rH5GLcxYFnwuFR2Ra1z+cJDfdooV4GCf5VexKI
 UxCoTvvg1T2E6BSeKiBkSHIx9fo5AOBNFWEiP3ftK/p2QtNCkLWfyCP81RcBll/CInvK
 +To9cVA2TxJJp7PexB8zpNJPIfopzet7FXmCnQZb/D9W0obk/MYHB6bLVC3niN2PiFqk EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k64m7x0s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 16:16:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B472D10002A;
 Fri, 14 Oct 2022 16:16:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B072F231505;
 Fri, 14 Oct 2022 16:16:45 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 16:16:45 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 14 Oct 2022 16:15:06 +0200
Message-ID: <20221014141509.211149-8-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014141509.211149-1-fabrice.gasnier@foss.st.com>
References: <20221014141509.211149-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 07/10] ARM: dts: stm32: enable USB Host
	EHCI on stm32mp135f-dk
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

USBH Host EHCI controller manages the USB High-Speed hub controller IC
offering Type-A CN5 & CN6 connectors available on stm32mp135f-dk.
USB Host OHCI controller doesn't need to be enabled as Full-Speed and
Low-Speed traffic will be managed by the hub.
This USB2514B onboard hub is supplied by a 3v3 PMIC regulator.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/stm32mp135f-dk.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
index af87fb36eabc..02ff2bc664da 100644
--- a/arch/arm/boot/dts/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
@@ -145,6 +145,19 @@ &uart4 {
 	status = "okay";
 };
 
+&usbh_ehci {
+	phys = <&usbphyc_port0>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	/* onboard HUB */
+	hub@1 {
+		compatible = "usb424,2514";
+		reg = <1>;
+		vdd-supply = <&v3v3_sw>;
+	};
+};
+
 &usbphyc {
 	status = "okay";
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
