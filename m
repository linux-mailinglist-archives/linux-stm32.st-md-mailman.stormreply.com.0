Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B237108B99
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Nov 2019 11:27:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E972C36B11;
	Mon, 25 Nov 2019 10:27:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19E13C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 10:27:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPAR9LU008283; Mon, 25 Nov 2019 11:27:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=8y417jH9pUhx+qJrqcveEBhpHl79/MlPJT2zJMNWxbs=;
 b=Ueff3Vkq9ht5vcZShB+nSK3r8AkhkK9GM2Fy+/kczFLOXI4n7bWihIU6yg4GKbmI1vvn
 6nVHb36nTDtFP+rbojZWJUKakx4I6A024c8FoehgoJm3M+uBysDUhowu6P6aFjXechlc
 HCST1zCbrzo9KwSPd/kPgzUD+4cMipBtE0tQT28DEF1TcuzdwxuDKA1gmf27j3KyogAf
 mCEA4BCquRaIDQK5wk33je71i2Kh0IIDvoayOhqGO49ldtj9j2ly0IFlkXlTomBpbr8D
 yP0wqa3hA8lWv8SHT4mc0nPCtlSKWMqYMRR/bStbpcIU+d81ErcZKnS1Ma287pkWhkpt xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weu428m9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 11:27:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75BFD100038;
 Mon, 25 Nov 2019 11:27:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67D862B0115;
 Mon, 25 Nov 2019 11:27:11 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 25 Nov 2019 11:27:10
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Mon, 25 Nov 2019 11:26:58 +0100
Message-ID: <20191125102659.22853-2-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125102659.22853-1-amelie.delaunay@st.com>
References: <20191125102659.22853-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_02:2019-11-21,2019-11-25 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: usb: dwc2: add support for
	STM32MP15 SoCs USB OTG HS and FS
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

Add the specific compatible string for the DWC2 IP found in the STM32MP15
SoCs.
STM32MP15 SoCs uses sensing comparators to detect Vbus valid levels and
ID pin state. usb33d-supply described the regulator supplying Vbus and ID
sensing comparators.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index aafff3a6904d..c2c8d40076cf 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -23,6 +23,9 @@ Required properties:
   configured in HS mode;
   - "st,stm32f7-hsotg": The DWC2 USB HS controller instance in STM32F7 SoCs
     configured in HS mode;
+  - "st,stm32mp15-fsotg": The DWC2 USB controller instance in STM32MP15 SoCs,
+  configured in FS mode (using dedicated FS transceiver).
+  - "st,stm32mp15-hsotg": The DWC2 USB controller instance in STM32MP15 SoCs;
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
 - clocks: clock provider specifier
@@ -46,6 +49,8 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
                           on for remote wakeup during suspend.
 - snps,reset-phy-on-wake: If present indicates that we need to reset the PHY when
                           we detect a wakeup.  This is due to a hardware errata.
+- usb33d-supply: external VBUS and ID sensing comparators supply, in order to
+		 perform OTG operation, used on STM32MP15 SoCs.
 
 Deprecated properties:
 - g-use-dma: gadget DMA mode is automatically detected
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
