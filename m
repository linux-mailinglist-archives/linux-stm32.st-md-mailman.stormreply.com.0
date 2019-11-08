Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1463CF449C
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2019 11:35:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3E38C36B0B;
	Fri,  8 Nov 2019 10:35:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F880C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 10:35:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA8AW5l4025161; Fri, 8 Nov 2019 11:35:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=nKtzaJ8d0mLSAdY0pF9P5PdC5k4sDl9VNShab3X7XfE=;
 b=wk24A/O3TpfIcHvhOa1SRQb+uC7TMJQeAsOkd6aXcl//2+WsRizWP1b2xELY9d2PtA1/
 tRAj7R35frQ/9CurARkIK2HD29eKOKKddprfKmzVFdDUxcqo9T+2ZBshMMhlaPFVbhlp
 UkmXM6DjFjf1B51I9g54Ml75F9C5lCI15HqSX9uPNIDs8bjITQr3r5Ij/z6HO0lFN84Q
 8zVDMlkQW4YW8UFPLwq4n2tgIkWbROh1bQofgXOLm3iXZjslMU+Rz52kaJHi/cct4QyA
 rMku0p5t2ttHVfFI/yCR+o0rtAZOMOq+Wxenk+n8rNckm1EwYJemdV+veXbsN3vSwqVt CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w41vh3166-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 11:35:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2608E10002A;
 Fri,  8 Nov 2019 11:35:32 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1041A2B0FED;
 Fri,  8 Nov 2019 11:35:32 +0100 (CET)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019
 11:35:31 +0100
Received: from localhost (10.201.22.222) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 11:35:30
 +0100
From: Christophe Roullier <christophe.roullier@st.com>
To: <davem@davemloft.net>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <mripard@kernel.org>, <martin.blumenstingl@googlemail.com>,
 <alexandru.ardelean@analog.com>, <narmstrong@baylibre.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Fri, 8 Nov 2019 11:35:25 +0100
Message-ID: <20191108103526.22254-2-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108103526.22254-1-christophe.roullier@st.com>
References: <20191108103526.22254-1-christophe.roullier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.222]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_02:2019-11-07,2019-11-08 signatures=0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: net: dwmac: increase
	'maxItems' for 'clocks', 'clock-names' properties
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

This change is needed for some soc based on snps,dwmac, which have
more than 3 clocks.

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4845e29411e4..376a531062c2 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -27,6 +27,7 @@ select:
           - snps,dwmac-3.710
           - snps,dwmac-4.00
           - snps,dwmac-4.10a
+          - snps,dwmac-4.20a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -62,6 +63,7 @@ properties:
         - snps,dwmac-3.710
         - snps,dwmac-4.00
         - snps,dwmac-4.10a
+        - snps,dwmac-4.20a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
 
@@ -87,7 +89,8 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
+    additionalItems: true
     items:
       - description: GMAC main clock
       - description: Peripheral registers interface clock
@@ -97,6 +100,8 @@ properties:
           clock will be used and this is fine on some platforms.
 
   clock-names:
+    minItems: 1
+    maxItems: 5
     additionalItems: true
     contains:
       enum:
@@ -342,6 +347,7 @@ allOf:
               - allwinner,sun50i-a64-emac
               - snps,dwmac-4.00
               - snps,dwmac-4.10a
+              - snps,dwmac-4.20a
               - snps,dwxgmac
               - snps,dwxgmac-2.10
               - st,spear600-gmac
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
