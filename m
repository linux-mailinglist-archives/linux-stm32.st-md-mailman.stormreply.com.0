Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DDA8CD99E
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2024 20:05:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB8D7C6C838;
	Thu, 23 May 2024 18:05:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3650FC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2024 18:05:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NHUkvL014089;
 Thu, 23 May 2024 20:05:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 TIHHv5VnBC4M6BAYS8GF3x1yTwxcxgzzLyrVLp3iXdI=; b=gLmirwFxgIiLAdfe
 R91WJo4kgRSNfiM0C0uT10JTEamGW6JyrmCfSV0dCR0rG5GLPP9HNq39+1f7Dvlu
 HxbKtxrv0aGDrrA2gOROazR7BO9KsCPzmxz07pDXQfYsQW4bvvlGUyWSd0lM7lj+
 Xy9rotRmvUyHvQXyWlxPeLh/9i7aoB/9xkatduI/HKkAv3zYDDNl5n27eMwIbztk
 qIRxAWRLLT/8WRFVZ8NPSY2OBFaeouec53SBLtvEvMjk8574QO3XXgWyJQ3RtLj3
 Mb1FgoJCPVrFJ6/rGYJ4OuDuetDGInPxIWxNLDHIW1JA47fVcjb7PsAeG+MhZeSF
 TtFIhQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yaa8t82hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 May 2024 20:05:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 22D9F40044;
 Thu, 23 May 2024 20:05:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 715C221BF62;
 Thu, 23 May 2024 20:04:39 +0200 (CEST)
Received: from localhost (10.48.87.205) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 20:04:39 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pascal
 Paillet <p.paillet@foss.st.com>
Date: Thu, 23 May 2024 20:04:33 +0200
Message-ID: <20240523200353.v4.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523180435.583257-1-patrick.delaunay@foss.st.com>
References: <20240523180435.583257-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.205]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_11,2024-05-23_01,2024-05-17_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/2] dt-bindings: regulator: st,
	stm32mp1-pwr-reg: add compatible for STM32MP13
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

Add new compatible "st,stm32mp13-pwr-reg" for STM32MP13 SoC family.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v4:
- use fallback as proposed by Marek on V3 for STM32MP13:
  compatible = "st,stm32mp13-pwr-reg", "st,stm32mp1,pwr-reg"

Changes in v3:
- Replace oneOf/const by enum; solve the V2 issues for dt_binding_check

Changes in v2:
- update for Rob review, only add compatible for STM32MP13 family

 .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
index c9586d277f41..3cb2dad18781 100644
--- a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
+++ b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
@@ -11,7 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32mp1,pwr-reg
+    oneOf:
+      - items:
+          - const: st,stm32mp1,pwr-reg
+      - items:
+          - const: st,stm32mp13-pwr-reg
+          - const: st,stm32mp1,pwr-reg
 
   reg:
     maxItems: 1
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
