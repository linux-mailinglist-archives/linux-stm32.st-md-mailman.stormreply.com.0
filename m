Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6190656D8A8
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 10:47:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 054F3C640EE;
	Mon, 11 Jul 2022 08:47:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65EF4C03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 08:47:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26B8FshS003448;
 Mon, 11 Jul 2022 10:47:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=HV0ANHZFRy9GO7TFGDc5FELdAQU34TvOwuvKCtvBo8U=;
 b=Wif42qjpsDkLpOTcJNleWPGy5KsyXTzAJIInsYsSk1Jr5wciVs1VzM0Rn4gZeFnoAwxT
 ZvtSYcl/3kYVB5sAYP0UpSAMswLDRQ1YRDkvjc/MBClMlwsWccVFkx15bK1NUg/9wmK4
 Q4MKW+OQfT7VGaQdp/K1r2eEkt5kpYpYEQ5F5SVpK5VT1yUIKKK5+5pEdUfOeoS0WuZV
 +6UFVRSmKLQrzpsTFXenJgkGe1hZx5DKTOUT+LrgMjspFurSijUBhywqQXCsZOaSCVoY
 eIUDFEthWCTSvclOwEBLmd5TI97voQ1yi0I+MlsXRjROHDV4EF44ClO/DdCHOlxi28Ru Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h71121pg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 10:47:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B66A810002A;
 Mon, 11 Jul 2022 10:47:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C979F21513F;
 Mon, 11 Jul 2022 10:47:20 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 11 Jul
 2022 10:47:19 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Jonathan Corbet <corbet@lwn.net>, Vinod Koul <vkoul@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Mon, 11 Jul 2022 10:46:59 +0200
Message-ID: <20220711084703.268481-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_14,2022-07-08_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] STM32 DMA-MDMA chaining feature
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

This patchset (re)introduces STM32 DMA-MDMA chaining feature.

As the DMA is not able to generate convenient burst transfer on the DDR,
it penalises the AXI bus when accessing the DDR. While it accesses
optimally the SRAM. The DMA-MDMA chaining then consists in having an SRAM
buffer between DMA and MDMA, so the DMA deals with peripheral and SRAM,
and the MDMA with SRAM and DDR.

The feature relies on the fact that DMA channel Transfer Complete signal
can trigger a MDMA channel transfer and MDMA can clear the DMA request by
writing to DMA Interrupt Clear register.

A deeper introduction can be found in patch 1.

Previous implementation [1] has been dropped as nacked.
Unlike this previous implementation (where all the stuff was embedded in
stm32-dma driver), the user (in peripheral drivers using dma) has now to
configure the MDMA channel.

[1] https://lore.kernel.org/lkml/1538139715-24406-1-git-send-email-pierre-yves.mordret@st.com/

Amelie Delaunay (4):
  docs: arm: stm32: introduce STM32 DMA-MDMA chaining feature
  dmaengine: stm32-dmamux: set dmamux channel id in dma features
    bitfield
  dmaengine: stm32-dma: add support to trigger STM32 MDMA
  dmaengine: stm32-mdma: add support to be triggered by STM32 DMA

 .../arm/stm32/stm32-dma-mdma-chaining.rst     | 365 ++++++++++++++++++
 drivers/dma/stm32-dma.c                       |  56 ++-
 drivers/dma/stm32-dmamux.c                    |   2 +-
 drivers/dma/stm32-mdma.c                      |  70 +++-
 4 files changed, 490 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/arm/stm32/stm32-dma-mdma-chaining.rst

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
