Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC01614CD7D
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2020 16:36:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B5B3C36B0B;
	Wed, 29 Jan 2020 15:36:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF72BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 15:36:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TFNdPo030981; Wed, 29 Jan 2020 16:36:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=8Dj/ZHHrmEfV1u3H7MKsV7iGJiHB3s1tpyoS859SbVI=;
 b=s8f6/RFxaFy5xx1Uv1kJ3RJZQu4kJdrxJ6VXlc/zBQZFdn9bN3eyU31mecfnINOymzsK
 4VAzuwX0O8Hc5jEiEqv15ClB10RbMX7zivU9J8Zm1NTD712g0Dm67SS0mmeB+2pP4Nox
 ukx/Nt/3LKMZj/YvzkMyQPcfgthmqy6qfBfmE7G+PrXc2Tr1eIR7WZ5KM3WUqE74+WW5
 Efa3X0+pk1RlJfJB0KmZGKpiV42JtAEYuWue4KlpG5o+9j0euOAcrnX3qK692SesuzV6
 y+G6uk3s/ZOPi0c0e4zT3xKUDVmqMjEE7Cqd7IO3Lm8AoQmj2kfUkEy/lKBkHUTn0uzw Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpb45e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 16:36:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7EC4C10002A;
 Wed, 29 Jan 2020 16:36:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E7062BC7C5;
 Wed, 29 Jan 2020 16:36:34 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Jan 2020 16:36:33
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Wed, 29 Jan 2020 16:36:20 +0100
Message-ID: <20200129153628.29329-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/8] STM32 DMA driver fixes and improvements
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

This series brings improvements to the STM32 DMA driver, with support of
power management and descriptor reuse. Probe function gets a cleanup and
properties like copy_align and max_segment_size are set.
A "sleeping function called from invalid context" bug is also fixed. And
to avoid a race with vchan_complete, driver now adopts
vchan_terminate_vdesc().

Amelie Delaunay (4):
  dmaengine: stm32-dma: use dma_set_max_seg_size to set the sg limit
  dmaengine: stm32-dma: add copy_align constraint
  dmaengine: stm32-dma: fix sleeping function called from invalid
    context
  dmaengine: stm32-dma: use vchan_terminate_vdesc() in .terminate_all

Etienne Carriere (2):
  dmaengine: stm32-dma: use reset controller only at probe time
  dmaengine: stm32-dma: driver defers probe for reset

Pierre-Yves MORDRET (2):
  dmaengine: stm32-dma: add suspend/resume power management support
  dmaengine: stm32-dma: enable descriptor_reuse

 drivers/dma/stm32-dma.c | 96 ++++++++++++++++++++++++++++-------------
 1 file changed, 67 insertions(+), 29 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
