Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAD791433D
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 09:12:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 584EEC78002;
	Mon, 24 Jun 2024 07:12:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44A95C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 07:12:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NEdBwo027079;
 Mon, 24 Jun 2024 09:12:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7QQp0ll7mULHxC80OBumXN8x5vwlpC7MjkT/JCmD22E=; b=b+eZTLPozRZezVUI
 +H9TGuB8K749xxqRMe/tP6YWQ7N7DlqsNKIPoAAGfWFDgJ4V6iuPqZ9UH6bvsswk
 8Ud9196dE76iWQ6Ml1GYDt/bB1UlKJq2RY/x1Ao4AoqrXBN5zBnbeBzXGXjeLnsR
 X2kScg410kuR2yMAaoQAWNowIttyqIltBkInlAynUgsltcZDvIw+C9OyF8//dtTa
 j/vHPFo4f0wsbtxMQhvS53Hs3SYI7TkP+K2At9QOECk4b+oXBEz/EO0ihA9L9A2N
 hWQLZbE3PnxqmkLk/cUpmio8FE8FXJ/qJh8yNeTXd5G4NKV5SWGTKHjMmynbZK5B
 n0w3Hg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywngd5f8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 09:12:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 45E0540044;
 Mon, 24 Jun 2024 09:12:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCFED2115F0;
 Mon, 24 Jun 2024 09:11:03 +0200 (CEST)
Received: from localhost (10.48.86.164) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 24 Jun
 2024 09:11:03 +0200
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
Date: Mon, 24 Jun 2024 09:10:51 +0200
Message-ID: <20240624071052.118042-2-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240624071052.118042-1-christophe.roullier@foss.st.com>
References: <20240624071052.118042-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_06,2024-06-21_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [net-next,
	PATCH v3 1/2] dt-bindings: net: add STM32MP25 compatible in
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index f6e5e0626a3f..bf23838fe6e8 100644
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
@@ -121,8 +126,9 @@ allOf:
         compatible:
           contains:
             enum:
-              - st,stm32mp1-dwmac
               - st,stm32-dwmac
+              - st,stm32mp1-dwmac
+              - st,stm32mp25-dwmac
     then:
       properties:
         st,syscon:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
