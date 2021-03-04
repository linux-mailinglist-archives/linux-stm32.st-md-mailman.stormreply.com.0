Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3DA32D74C
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 17:05:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D28E0C57B75;
	Thu,  4 Mar 2021 16:05:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD2DDC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 16:05:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124FmXWf007473; Thu, 4 Mar 2021 17:05:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=71DT3hArz4xDKi5JB73DMMto7nDrXRu9nJfBZY/G6+A=;
 b=eywQ7nFif/hIHKl6v4SjG+uPs/2A7mDrFgQtHEVgI5tGF0w8s+u3NuX+Jx9vp9zUJUsF
 sqMtOEmqBq8NU8Zu9X+1GjBfEZNxMsIxWgpBtp0OHkSvYzfNMJVt/VKtPFMziy+bom+M
 Sy226eW2p9ntrYNx3ytRgOSBd3x0EtB8JOt+B/GeBpon0p0I0dPcia1u3jU+AKHvmUYV
 +7vwaLhZoUwPNCORJdZXn5fDlVee7ztkkXlLneO9tuUPCxwZTpox//MJSdxrkVfvnbRI
 tGX9BDEzP7Tr/+CCScGZfdSn4CtL5nU77SN2cVe9G2LjleirJJX8yAUCCttL4yZFU8qy qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfc48f3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 17:05:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5C3C100034;
 Thu,  4 Mar 2021 17:05:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C8A92073BB;
 Thu,  4 Mar 2021 17:05:01 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Mar 2021 17:05:01
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 4 Mar 2021 17:04:39 +0100
Message-ID: <20210304160440.27612-2-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304160440.27612-1-amelie.delaunay@foss.st.com>
References: <20210304160440.27612-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_05:2021-03-03,
 2021-03-04 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RESEND PATCH v3 1/2] dt-bindings: phy:
	phy-stm32-usbphyc: add #clock-cells property
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

usbphyc provides a unique clock called ck_usbo_48m.
STM32 USB OTG needs a 48Mhz clock (utmifs_clk48) for Full-Speed operation.
ck_usbo_48m is a possible parent clock for USB OTG 48Mhz clock.

ck_usbo_48m is available as soon as the PLL is enabled.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
- add Rob's Acked-by
- remove #clock-cells from required properties
---
 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
index 46df6786727a..018cc1246ee1 100644
--- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
@@ -51,6 +51,10 @@ properties:
   vdda1v8-supply:
     description: regulator providing 1V8 power supply to the PLL block
 
+  '#clock-cells':
+    description: number of clock cells for ck_usbo_48m consumer
+    const: 0
+
 #Required child nodes:
 
 patternProperties:
@@ -120,6 +124,7 @@ examples:
         vdda1v8-supply = <&reg18>;
         #address-cells = <1>;
         #size-cells = <0>;
+        #clock-cells = <0>;
 
         usbphyc_port0: usb-phy@0 {
             reg = <0>;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
