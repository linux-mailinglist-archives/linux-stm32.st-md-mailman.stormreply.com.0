Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE01731375
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 11:20:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2D0AC65E58;
	Thu, 15 Jun 2023 09:20:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8456AC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 09:20:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35F8n71N015855; Thu, 15 Jun 2023 11:20:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=p2lyRTx/f/Eq2J7X5jktzbOdWXyKg7WmlkwEC2qamrQ=;
 b=2Y0d0BgxiEhEjkhMYX79e1MhsQBqjoNVLP2ZoVRoYUgxgaaYLjPv5taBMAKkuQW1MVQc
 BBFuSmTYFxDn2IrkC3+vhQwSt7YPt0MhpHAb8IYldW5V629tX3fnzdj1CmusnmuaeoOV
 TB8fBKfBc6MxlmSFw5L9xylKdWNWQ2NAJG4rFpL2ykSLpuAIPFSibMh/7kZiCEdq613X
 a209T4RieQy4ag2gawLrsMTc/K/nLfxgnQfUpc9N6GT/7KwZcd1RKMnEEsKDZdl8ESYU
 4TWYyFr2wLrlWI5BvXQx6z2a6uIWSl24MEcuH1+Ii7UwjeoXFDGBt3wLkAeHNXwN1IiD 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r7wgx1em6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 11:20:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32E8D100046;
 Thu, 15 Jun 2023 11:20:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A5AF21A231;
 Thu, 15 Jun 2023 11:20:21 +0200 (CEST)
Received: from localhost (10.201.21.210) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 15 Jun
 2023 11:20:20 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>
Date: Thu, 15 Jun 2023 11:19:56 +0200
Message-ID: <20230615092001.1213132-2-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615092001.1213132-1-yann.gautier@foss.st.com>
References: <20230615092001.1213132-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.210]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Xiang wangx <wangxiang@cdjrlc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/6] dt-bindings: mmc: mmci: Add st,
	stm32mp25-sdmmc2 compatible
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

For STM32MP25, we'll need to distinguish how is managed the delay block.
This is done through a new comptible dedicated for this SoC, as the
delay block registers are located in SYSCFG peripheral.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
index 1c96da04f0e53..e47b3418b6c77 100644
--- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
+++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
@@ -59,6 +59,12 @@ properties:
           - const: st,stm32-sdmmc2
           - const: arm,pl18x
           - const: arm,primecell
+      - description: Entry for STMicroelectronics variant of PL18x for
+          STM32MP25. This dedicated compatible is used by bootloaders.
+        items:
+          - const: st,stm32mp25-sdmmc2
+          - const: arm,pl18x
+          - const: arm,primecell
 
   clocks:
     description: One or two clocks, the "apb_pclk" and the "MCLK"
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
