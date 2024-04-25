Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2912E8B1C2C
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 09:49:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D269FC71290;
	Thu, 25 Apr 2024 07:49:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 590D1C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 07:49:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P72VrZ032344;
 Thu, 25 Apr 2024 09:49:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=cCsDk+4Aum2chjAhcJX8uB4K6blwXHcO0YE8sWRZIQI=; b=4o
 nwIYwLnYdIt/p60SXvXA0VQ9GAYuCcW/giq0VbVXuFh0ZvLgSQCAI2UcAF4lqULw
 x9RAwncI7I1bO1B4rwLQzKrdGGXartbVbfjAMZCYQW8gbEuNngGzTfoBthDHje7Y
 jPWfQgi5ot1bNJ8xxJl0L1rKvsRNHew4OVvrJuimd9B5LOePmYygO0khVchIxabZ
 452gBZptx2x3xRajSTp6xj5IRH+LjFMrsDVJ/ympN1/XlHh2H89ztXFxxzFrFmQN
 PQl8wjd5mZOdSfCHCNVC7jH/VUVdvmx6CpImEfzX84hWvsz2rcuU8sJlHogWSF30
 ZYpsGoY6Pnx9qXBVMKQQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4kbc3w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Apr 2024 09:49:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 875A540045;
 Thu, 25 Apr 2024 09:49:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5E14212FD9;
 Thu, 25 Apr 2024 09:48:52 +0200 (CEST)
Received: from localhost (10.48.86.112) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 09:48:52 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pascal
 Paillet <p.paillet@foss.st.com>
Date: Thu, 25 Apr 2024 09:48:32 +0200
Message-ID: <20240425094829.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240425074835.760134-1-patrick.delaunay@foss.st.com>
References: <20240425074835.760134-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_06,2024-04-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: regulator: st,
	stm32mp1-pwr-reg: add correct compatible
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

Remove the unexpected comma in the compatible "st,stm32mp1,pwr-reg"
and define the new compatible "st,stm32mp1-pwr-reg".
The old compatible is only keep for compatibility with old device trees.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
index c9586d277f41..2a52f9e769c2 100644
--- a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
+++ b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32mp1,pwr-reg
+    enum:
+      - st,stm32mp1-pwr-reg
+      - st,stm32mp1,pwr-reg
 
   reg:
     maxItems: 1
@@ -37,7 +39,7 @@ additionalProperties: false
 examples:
   - |
     pwr@50001000 {
-      compatible = "st,stm32mp1,pwr-reg";
+      compatible = "st,stm32mp1-pwr-reg";
       reg = <0x50001000 0x10>;
       vdd-supply = <&vdd>;
       vdd_3v3_usbfs-supply = <&vdd_usb>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
