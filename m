Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3E12BAC10
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Nov 2020 15:42:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1928DC56635;
	Fri, 20 Nov 2020 14:42:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD0A2C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Nov 2020 14:33:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKEW5S9018622; Fri, 20 Nov 2020 15:33:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Q/Gjr3ITiryqY9OUE5GqxlvOOPrVt6lzWL9Ty4Gmi2g=;
 b=wPHkOlhHS0IAw6vqlLmel19PYgB1hRbX1z5NozqpBgD3kCmPSY6+dR3OhrF5gOTMDs3V
 XD0KKea6xmgB77RzuzD0OzLlJUMMHAR5b8oiBm68ZlOpVvW5ndd11slLW2utkToiW78O
 hvdx8KJQmNMRIYoLfBPRTrvgwYgOUw9eYFyCFiuStMxzB7GKOFQhC9xB716dA/3vRWOT
 NQZkj9d6l0AXIK82KD68XtOF1bSEVVBo/oaXNsvGQOUGG4PnHW0KXUmZx6bA0Mfn9lcW
 dGzqdLx0ZCvQpbkAIVjfpFBE48f1mx3ihNn2rxYpv7q/9R5LHqisJV3jatJVCgmPKY+N Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t70h7n0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 15:33:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A24E10002A;
 Fri, 20 Nov 2020 15:33:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A49A2777DE;
 Fri, 20 Nov 2020 15:33:26 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Nov 2020 15:33:25
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Fri, 20 Nov 2020 15:33:16 +0100
Message-ID: <20201120143320.30367-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_07:2020-11-20,
 2020-11-20 signatures=0
X-Mailman-Approved-At: Fri, 20 Nov 2020 14:42:45 +0000
Cc: Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] Bunch of improvements for STM32 DMA
	controllers
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

This series brings 3 patches for STM32 DMA and 1 for STM32 MDMA.
They increase the reliability and the efficiency of the transfers.

Amelie Delaunay (4):
  dmaengine: stm32-dma: rework irq handler to manage error before xfer
    events
  dmaengine: stm32-dma: clean channel configuration when channel is
    freed
  dmaengine: stm32-dma: take address into account when computing max
    width
  dmaengine: stm32-mdma: rework interrupt handler

 drivers/dma/stm32-dma.c  | 47 +++++++++++++++++++----------
 drivers/dma/stm32-mdma.c | 64 +++++++++++++++++++++-------------------
 2 files changed, 65 insertions(+), 46 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
