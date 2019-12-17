Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5A612277D
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2019 10:22:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E49AC36B0F;
	Tue, 17 Dec 2019 09:22:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 841D9C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 09:22:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBH9HuQK001317; Tue, 17 Dec 2019 10:22:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=bIVPxQpH1y2Nz/DK2A/oJ0wAran2ozG4/+vhkdgb6pc=;
 b=N0Z/2exOg83ERHatB2ajspECSMyg4lICfAkuW7kJincP8rUKG6oDKa4yv8JPa10aSH4j
 2MHyWqJ9HJxmIYmzcYl/GI1iZsKyZAGDI0e3EMRRWCCwErX9LK0bXTF8xJrPv2+/f59x
 jkkjBRMw0fmNl1E0aLz3G0NEsCYiUN0dxzZWO4xdmn8LlR5ubi90gkGMMW5vVnrGHQsG
 aN1pqunAxZCApNVvEagOk2WazPNNPm70BicZ4tWftlYaKwwkUB35siZ9ffluvqyG83bn
 jytitTmP2CfyVc/6BJAshFwPIfiSoZZL4WkkY02p7wq+2i7TAFRt1Io0Wjp5B3t1of+v GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wvqgpnksy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 10:22:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 459E9100038;
 Tue, 17 Dec 2019 10:22:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FE212A64E4;
 Tue, 17 Dec 2019 10:22:29 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 17 Dec 2019 10:22:28
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <vkoul@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Tue, 17 Dec 2019 10:21:55 +0100
Message-ID: <20191217092201.20022-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_01:2019-12-16,2019-12-16 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] Convert STM32 dma to json-schema
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

This series convert STM32 dma, mdma and dmamux bindings to json-schema.
Yaml bindings use dma-controller and dma-router schemas where nodes names
are verified which lead to fix stm32f746, stm32f743 and stm32mp157 device
tree files.

Benjamin Gaignard (6):
  dt-bindings: dma: Convert stm32 DMA bindings to json-schema
  dt-bindings: dma: Convert stm32 MDMA bindings to json-schema
  dt-bindings: dma: Convert stm32 DMAMUX bindings to json-schema
  ARM: dts: stm32: fix dma controller node name on stm32f746
  ARM: dts: stm32: fix dma controller node name on stm32f743
  ARM: dts: stm32: fix dma controller node name on stm32mp157c

 .../devicetree/bindings/dma/st,stm32-dma.yaml      | 102 ++++++++++++++++++++
 .../devicetree/bindings/dma/st,stm32-dmamux.yaml   |  52 ++++++++++
 .../devicetree/bindings/dma/st,stm32-mdma.yaml     | 105 +++++++++++++++++++++
 .../devicetree/bindings/dma/stm32-dma.txt          |  83 ----------------
 .../devicetree/bindings/dma/stm32-dmamux.txt       |  84 -----------------
 .../devicetree/bindings/dma/stm32-mdma.txt         |  94 ------------------
 arch/arm/boot/dts/stm32f746.dtsi                   |   4 +-
 arch/arm/boot/dts/stm32h743.dtsi                   |   6 +-
 arch/arm/boot/dts/stm32mp157c.dtsi                 |   6 +-
 9 files changed, 267 insertions(+), 269 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/stm32-dma.txt
 delete mode 100644 Documentation/devicetree/bindings/dma/stm32-dmamux.txt
 delete mode 100644 Documentation/devicetree/bindings/dma/stm32-mdma.txt

-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
