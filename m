Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB72288989D
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 10:44:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 581DEC6B444;
	Mon, 25 Mar 2024 09:44:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F614C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 09:44:34 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P8fHpK027449; Mon, 25 Mar 2024 10:44:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=TumpbS5vUWGOFAnUTrFiTwigoWxOBILory3Y1hvCVq0=; b=wW
 Rh8sbXOSa0HCm1qDw2GTdinczGE4iRNoMKzZ7d+eb5UHjHsJiN0qP3Fr/Xvk53Iz
 J+wNsoVqGlJYXOJz7xjFeEjIAxCLMac/W5bzILa06kMAzLXmbCI6ULLXkNOG14TE
 owDV+JjBKXjFxbj06eSZgJ01Pco8aFl8ESMtwmKfEcwqMYto19eY7vlMUfdaPixj
 zwgosJVIMzgCbGeBt5aQ8ZbhVzMiKMaaTvLUAcsuUSaUVrGiaDFua2GLwyoyFg1i
 ATP2pzEQGPqaqX5OongDIvdKSsYYrkgQYbiZAvJ0IQioenTg4gAJo0aE4qB3bHKQ
 Dbjj1sRZMBV3mg6hdrcA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x29h5mfw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Mar 2024 10:44:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6089F4002D;
 Mon, 25 Mar 2024 10:43:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94129216EF9;
 Mon, 25 Mar 2024 10:42:44 +0100 (CET)
Received: from localhost (10.201.21.128) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 25 Mar
 2024 10:42:44 +0100
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
Date: Mon, 25 Mar 2024 10:42:18 +0100
Message-ID: <20240325094218.56934-3-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240325094218.56934-1-christophe.roullier@foss.st.com>
References: <20240325094218.56934-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.128]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_07,2024-03-21_02,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 2/2] dt-bindings: net: dwmac: Document
	STM32 property st, ext-phyclk
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

The Linux kernel dwmac-stm32 driver currently supports three DT
properties used to configure whether PHY clock are generated by
the MAC or supplied to the MAC from the PHY.

Originally there were two properties, st,eth-clk-sel and
st,eth-ref-clk-sel, each used to configure MAC clocking in
different bus mode and for different MAC clock frequency.
Since it is possible to determine the MAC 'eth-ck' clock
frequency from the clock subsystem and PHY bus mode from
the 'phy-mode' property, two disparate DT properties are
no longer required to configure MAC clocking.

Linux kernel commit
1bb694e20839 ("net: ethernet: stmmac: simplify phy modes management for stm32")
introduced a third, unified, property st,ext-phyclk. This property
covers both use cases of st,eth-clk-sel and st,eth-ref-clk-sel DT
properties, as well as a new use case for 25 MHz clock generated
by the MAC.

The third property st,ext-phyclk is so far undocumented,
document it.

Below table summarizes the clock requirement and clock sources for
supported PHY interface modes.
 __________________________________________________________________________
|PHY_MODE | Normal | PHY wo crystal|   PHY wo crystal   |No 125Mhz from PHY|
|         |        |      25MHz    |        50MHz       |                  |

---------------------------------------------------------------------------
|  MII    |    -   |     eth-ck    |        n/a         |       n/a        |
|         |        | st,ext-phyclk |                    |                  |

---------------------------------------------------------------------------
|  GMII   |    -   |     eth-ck    |        n/a         |       n/a        |
|         |        | st,ext-phyclk |                    |                  |

---------------------------------------------------------------------------
| RGMII   |    -   |     eth-ck    |        n/a         |      eth-ck      |
|         |        | st,ext-phyclk |                    | st,eth-clk-sel or|
|         |        |               |                    | st,ext-phyclk    |

---------------------------------------------------------------------------
| RMII    |    -   |     eth-ck    |      eth-ck        |       n/a        |
|         |        | st,ext-phyclk | st,eth-ref-clk-sel |                  |
|         |        |               | or st,ext-phyclk   |                  |

---------------------------------------------------------------------------

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 80937b28fa046..529665d4fc911 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -85,6 +85,13 @@ properties:
   phy-supply:
     description: PHY regulator
 
+  st,ext-phyclk:
+    description:
+      set this property in RMII mode when you have PHY without crystal 50MHz and want to
+      select RCC clock instead of ETH_REF_CLK. OR in RGMII mode when you want to select
+      RCC clock instead of ETH_CLK125.
+    type: boolean
+
   st,eth-clk-sel:
     description:
       set this property in RGMII PHY when you want to select RCC clock instead of ETH_CLK125.
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
