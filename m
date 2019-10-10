Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3583CD2A40
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2019 15:03:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5400C36B0C;
	Thu, 10 Oct 2019 13:03:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 989B6C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 13:03:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9AD1h73005680; Thu, 10 Oct 2019 15:02:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Lrgg/JupVUGfx1EGZYXupcFmvCwMUXEFDk4NGGs/DEM=;
 b=Ea4HNDZ8L1C/e6Lzy8QRdZUdC+Hk25JWFCYZUnWqGyjQQIG4woiazEpBlpEu7LnCt1LK
 zvTBvXtqnFYR1FHlFhK7h3ZM82I661+9R1M+GrEIJ8WLkK7EOtUAvoq19pDTBLmBQ9NJ
 X+NhV7iPKEeSTbnTwcdn95yClLC5T1T8ojfob2c+EB0hfEjERbOZMTdfhbvwgwRxhWK1
 zPfGF0cexHrIYmC0SAojbvDZHWOpEdXBLPSRJJc0sjqfh/yeNXDfKTZIK5awaiXtuD+a
 ANDOANFlDAbodjbG9ZnRhJGfmSEGmFhrjueGr+ESl8T8z0kLeo4/0z2ymq1hlEbRySBn OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegn13t3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2019 15:02:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB81810002A;
 Thu, 10 Oct 2019 15:02:51 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 96E2F2AA31D;
 Thu, 10 Oct 2019 15:02:51 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 10 Oct
 2019 15:02:51 +0200
Received: from localhost (10.201.21.218) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 10 Oct 2019 15:02:51
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <linux-stm32@st-md-mailman.stormreply.com>, <alexandre.torgue@st.com>,
 <robh@kernel.org>, <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Thu, 10 Oct 2019 15:02:47 +0200
Message-ID: <20191010130247.32027-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.218]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-10_04:2019-10-10,2019-10-10 signatures=0
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add hdmi audio support to
	stm32mp157a-dk1 board
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

Add HDMI audio support through Sil9022 HDMI transceiver
on stm32mp157a-dk1 board.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 5ad4cef9e971..7a20640c00a9 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -92,7 +92,7 @@
 			"Playback" , "MCLK",
 			"Capture" , "MCLK",
 			"MICL" , "Mic Bias";
-		dais = <&sai2a_port &sai2b_port>;
+		dais = <&sai2a_port &sai2b_port &i2s2_port>;
 		status = "okay";
 	};
 };
@@ -173,6 +173,7 @@
 		reset-gpios = <&gpioa 10 GPIO_ACTIVE_LOW>;
 		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-parent = <&gpiog>;
+		#sound-dai-cells = <0>;
 		status = "okay";
 
 		ports {
@@ -185,6 +186,13 @@
 					remote-endpoint = <&ltdc_ep0_out>;
 				};
 			};
+
+			port@3 {
+				reg = <3>;
+				sii9022_tx_endpoint: endpoint {
+					remote-endpoint = <&i2s2_endpoint>;
+				};
+			};
 		};
 	};
 
@@ -370,6 +378,23 @@
 	};
 };
 
+&i2s2 {
+	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
+	clock-names = "pclk", "i2sclk", "x8k", "x11k";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2s2_pins_a>;
+	pinctrl-1 = <&i2s2_pins_sleep_a>;
+	status = "okay";
+
+	i2s2_port: port {
+		i2s2_endpoint: endpoint {
+			remote-endpoint = <&sii9022_tx_endpoint>;
+			format = "i2s";
+			mclk-fs = <256>;
+		};
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
