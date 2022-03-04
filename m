Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F4F4CD57C
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 14:52:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B255C5F1EF;
	Fri,  4 Mar 2022 13:52:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D02DC5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 13:52:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 224BsWNn027044;
 Fri, 4 Mar 2022 14:51:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=yG2HlQUVVcKdPHhJLDBcI8iIPMmmChs9y0unwzPfcW8=;
 b=KZ4DoPUyPhrUbK8Ynakguzw0ymd9Ak+sX7T+7rL5n2Ikf976kGd5CtfAcST2e9tmTdj6
 DkP912YQg4M18Dj6Kl7zt28ySFDolR+PkiLn8C9EGxmBJL9zOoaFcn7DZ8Ak3LIXN7P7
 D8LamAgQ4Gh18If+mDqJsy6Nst8bF8VESFVPMf/RVxV1RotgMnVaxOfK/LlwvNEu7CLT
 tkTogtL0uFq3N4V8mzKJdR2tcPNa0kpEW9yEegkV5oBFK5pNDmdO5j4HEYmAyBjgHnHZ
 ynJDlodPs7N1y5WcLZjn9ADQo5Mh0Ka5ErelWHgcknfcbILnZ86AOkGRKfi1qmAZ92Xz 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ek4jxd557-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 14:51:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A038100034;
 Fri,  4 Mar 2022 14:51:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7067E2278B6;
 Fri,  4 Mar 2022 14:51:43 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 4 Mar 2022 14:51:42
 +0100
From: Yann Gautier <yann.gautier@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Mar 2022 14:51:32 +0100
Message-ID: <20220304135134.47827-2-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304135134.47827-1-yann.gautier@foss.st.com>
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_06,2022-03-04_01,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, devicetree@vger.kernel.org,
 Marek Vasut <marex@denx.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: mmc: mmci: add a property to
	disable DMA LLI
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

On STMicroelectronics variant of PL18x, the DMA Linked Lists are supported
starting from revision v2 of the peripheral. But it has limitations,
as all the buffers should be aligned on block size (except the last one).
But this cannot be guaranteed with SDIO. We should then have a property
to disable the support of LLI.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
index 1e69a5a42439..309a2c0426e5 100644
--- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
+++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
@@ -145,6 +145,11 @@ properties:
       driver to sample the receive data (for example with a voltage switch
       transceiver).
 
+  st,disable-dma-lli:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: ST Micro-specific property, disable DMA linked lists.
+      It is used for SDIO.
+
   st,cmd-gpios:
     maxItems: 1
     description:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
