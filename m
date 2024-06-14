Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89616908C47
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 15:10:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3940FC78012;
	Fri, 14 Jun 2024 13:10:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BA78C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 13:10:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ECC56p017587;
 Fri, 14 Jun 2024 15:09:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 FLqA5KEQW8fsF+Pb8lvwIsQznW/5gUhbmt7k9cyS9cQ=; b=NVj2LLh+u6hiIDA4
 F8ArC0DESHsqFBgJ6A/P+rvNyw0hWBmRRC3EYicItoiY3OcozANwgL9mq4ojpOuJ
 PWPt7if5v1xhjsVDKIzl1N1SHmkZOKp/0B8McSPWZrJ/smkBJiTD9fjXU35kh1lp
 t5YrbNuxr2fcKY8wakIvpJ5v1pwccwxRr5gK9IbiHT6bb6+i8SfZX5+jGUcrLpGT
 ZgzLuGdhQek+q9bis/SimjnXdf0twbLMvNZm6DeABqdPy/bP2UYrHlGJaYip3D92
 s6QUVNZm+ZHnl1r6a+sv4WaBbg5lxizrcTBzN8YqJQcFMKxVwV3jtPXZ7TbjlTIz
 Syqo8A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp314de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 15:09:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 11CA940048;
 Fri, 14 Jun 2024 15:09:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B99BF2132E1;
 Fri, 14 Jun 2024 15:08:23 +0200 (CEST)
Received: from localhost (10.252.5.68) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 15:08:22 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>, Marek Vasut <marex@denx.de>
Date: Fri, 14 Jun 2024 15:08:11 +0200
Message-ID: <20240614130812.72425-2-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240614130812.72425-1-christophe.roullier@foss.st.com>
References: <20240614130812.72425-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.5.68]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_10,2024-06-14_03,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [net-next,
	PATCH 1/2] dt-bindings: net: add STM32MP25 compatible in
	documentation for stm32
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

New STM32 SOC have 2 GMACs instances.
GMAC IP version is SNPS 5.30

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index f6e5e0626a3f..d087d8eaea12 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -23,12 +23,17 @@ select:
           - st,stm32-dwmac
           - st,stm32mp1-dwmac
           - st,stm32mp13-dwmac
+          - st,stm32mp25-dwmac
   required:
     - compatible
 
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - st,stm32mp25-dwmac
+          - const: snps,dwmac-5.20
       - items:
           - enum:
               - st,stm32mp1-dwmac
@@ -121,6 +126,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - st,stm32mp25-dwmac
               - st,stm32mp1-dwmac
               - st,stm32-dwmac
     then:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
