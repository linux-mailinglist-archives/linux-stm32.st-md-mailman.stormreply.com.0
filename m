Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44750B0C2AE
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 13:20:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08DCDC32E92;
	Mon, 21 Jul 2025 11:20:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23828C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 11:20:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LB7PB1006642;
 Mon, 21 Jul 2025 13:20:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 b1X0fuL9CtcX6g3IEG7r9imekG29ASEidJw6mr4wREU=; b=HYe47YEZUTNoJYQh
 T/2IjBN55bAJkVxJYzyXpIDLAanCNWjT7pm5gU/C8a2OA50PlWv4eidqi6pUKoX+
 3w3Becc2OTbYGGNlmw+FxEWyBfJU+Nms+JDcTLO+rxy7zknVH6UaTfiLobiyzKe4
 uZHvKbHH8+VKLAW92tnTK06bvYj93wJKbsDyQascnWj2lFSFyPzVO52ROIkfnvbP
 a4uOF4DqoFxBG8HpSTyU9v3pZVT8/dQk0xH6YTRA1lYVYwJ8wxZ7nHTUTFnRBUw1
 54bD7BUjJQujLK7kdCZtrvAk3tnwJhKz5aqL7QXi/pp6WR7r5+H0W5kMebBn4hdb
 obH4BQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800sks1g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jul 2025 13:20:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B985540045;
 Mon, 21 Jul 2025 13:18:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDB8F7A320F;
 Mon, 21 Jul 2025 13:17:46 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 13:17:46 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 21 Jul 2025 13:14:43 +0200
MIME-Version: 1.0
Message-ID: <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
In-Reply-To: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Christophe Roullier
 <christophe.roullier@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 Tristram Ha <Tristram.Ha@microchip.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=922;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=Avv0u0uet8c5vtxzqKAUxwgjxaChkzjjAaArsW/vmjk=;
 b=owEB7QES/pANAwAKAar3Rq6G8cMoAcsmYgBofiHY88LFa3fXDxaGmYnrUy6pV1AKeZuGRUcAD
 ReXaesVm4qJAbMEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaH4h2AAKCRCq90auhvHD
 KJ3lDACBs2nHBOOs5HXp4qavSVXFh3fM0Nadp4bsTykIIfRE/DzwWWCk1k5kffsi3m6v4fHG1Hu
 0wwqWl2Aklr448xtZNx+LsFWL4FQQaiAdLrksz+cEoRaaJc8QXopBmDRYpJny2lj3FRyx81TF2Z
 bCx9NTqSLh2T0EZZwe8/Jm/ynHoAdHUDMJELVHgmRL7j7mWULiUPuVEzra65oLaK4uhNQu9gWaP
 qXn+PeTvYLNzwJzr8vuDBJ2ZIu7Iuv95caFuWjVlPUCTpCgYyffvTZ/qJNjQtcaLd9Xr/tCj5r7
 0UWvo++8ZRPZbHObcAF7HLmoCYoPWAiczq7GgIcb4rkf+e/y4fdoj/eTlqRt+eV/F7BYozOlv1G
 +1IlRmapIVGKcPxS+I2Btr2sr46MI0qg0bM6I6ulpY7/LpBhHc+mMqHa1Bnm+EVOgNPsMdPjy7E
 ocZd3sm9hEVVEUKHLhkFyUZ/5DKIhplTCr4jCJD3FKmh3GMNW5NYv0QJsUvf1h/Xvrpls=
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: document st,
 phy-wol property
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

The "st,phy-wol" property can be set to use the wakeup capability of
the PHY instead of the MAC.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 987254900d0da7aab81237f20b1540ad8a17bd21..985bd4c320b3e07fd1cd0aa398d6cce0b55a4e4d 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -121,6 +121,12 @@ properties:
     minItems: 1
     maxItems: 2
 
+  st,phy-wol:
+    description:
+      set this property to use the wakeup capability from the PHY, if supported, instead of the
+      MAC.
+    type: boolean
+
 required:
   - compatible
   - clocks

-- 
2.35.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
