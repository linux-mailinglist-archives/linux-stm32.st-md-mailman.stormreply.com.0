Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 196EC42C1DC
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Oct 2021 15:57:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADADEC5C838;
	Wed, 13 Oct 2021 13:57:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6E88C5C834
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Oct 2021 13:57:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DCEj34008563; 
 Wed, 13 Oct 2021 15:57:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=G0u9JIo2wy2zA/FCcvEd+3dPHJbUVXDHveBHelOr2AM=;
 b=Yy1Ndv95IcIoSHydjYbubk4YPGeJqTLSKOAsd4GmX0v/z3kVs/kmyI35Co2UQPf9/AfQ
 kEBW9vc2kGXhdjocYSSEd2CorIkycc5cY9K1CFGn6Git13kC5+NVK7bolW64iV72o6JA
 O+CLm3BQwlqjQYxIviXF/+0HoCfqYdZmd2cQv5S1bUVxevHWb4fQ6ISWKtvZk7V7FVcI
 OiWDge5uhEYevWrIccy8vVAMZWQhXqOt2SLc2SiiINykUXz7hj8ke1qPqcQrMGqHVxMc
 5X+1/6zt5zmduUrVQ8kgZMZpMZWHH7/xzlID553GnjLXGMIvrO18HxJpCVesvwEFIKsX mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bnuactnt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 15:57:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B4A1100034;
 Wed, 13 Oct 2021 15:57:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 843CE22F7C9;
 Wed, 13 Oct 2021 15:57:24 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 13 Oct 2021 15:57:23
 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>
Date: Wed, 13 Oct 2021 15:57:02 +0200
Message-ID: <1634133425-25670-2-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634133425-25670-1-git-send-email-fabrice.gasnier@foss.st.com>
References: <1634133425-25670-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_05,2021-10-13_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 1/4] dt-bindings: usb: dwc2: Add reference
	to usb-drd.yaml
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

Add a reference to usb-drd.yaml, in order to:
- extend possible supported properties
- avoid duplicated definitions of standard properties
Remove definitions for dr_mode and usb-role-switch standard properties.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 10c7d9b..0acbb7a 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -9,6 +9,9 @@ title: DesignWare HS OTG USB 2.0 controller Bindings
 maintainers:
   - Rob Herring <robh@kernel.org>
 
+allOf:
+  - $ref: usb-drd.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -101,12 +104,9 @@ properties:
     description: reference to the VBUS and ID sensing comparators supply, in
       order to perform OTG operation, used on STM32MP15 SoCs.
 
-  dr_mode:
-    enum: [host, peripheral, otg]
+  dr_mode: true
 
-  usb-role-switch:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description: Support role switch.
+  usb-role-switch: true
 
   g-rx-fifo-size:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
