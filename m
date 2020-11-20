Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C374B2BAC12
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Nov 2020 15:42:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8608DC5663B;
	Fri, 20 Nov 2020 14:42:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C5B5C56635
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Nov 2020 14:33:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKEXH9G018445; Fri, 20 Nov 2020 15:33:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=59iCytnGymJH0uJ5EK2z0sOlGCuFc+6x4wxAG7ErbAo=;
 b=u+b57zftothCtm3XEpszI5WJRg07SvAYq/+dw2XJNsxWNnny1wmUT1z4mQpKxaTckgXF
 cFfpl5gv4zKA+0tBa8iPNXqDyv+9+qK5DGbnNKoGNk6eXmrsJIEANRFn++PQDcM+JGY/
 JwkhlFIadUd7TVgn10QpXtdgUBS+JO3lb4lHZAFBk+JC1+K3xKlKFiCIBGA4Is5N1HUI
 zYF8/sza006dtzvNiYfE2quo4StVNu+Nl3374hDyNWRywfSsUIK8mhG1iMUP9bmwf/+t
 dChMR8sXONRgWd1xeKC11gM313VIrUzOkuevcnfvbETECuHn8FVzHnJWaXDE/q5eWWSO nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t58d7uf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 15:33:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BDB7610002A;
 Fri, 20 Nov 2020 15:33:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B12422777DE;
 Fri, 20 Nov 2020 15:33:29 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Nov 2020 15:33:29
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Fri, 20 Nov 2020 15:33:19 +0100
Message-ID: <20201120143320.30367-4-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120143320.30367-1-amelie.delaunay@st.com>
References: <20201120143320.30367-1-amelie.delaunay@st.com>
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
Subject: [Linux-stm32] [PATCH 3/4] dmaengine: stm32-dma: take address into
	account when computing max width
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

DMA_SxPAR or DMA_SxM0AR/M1AR registers have to be aligned on PSIZE or MSIZE
respectively. This means that bus width needs to be forced to 1 byte when
computed width is not aligned with address.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/dma/stm32-dma.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 62501e5d9e9d..f54ecb123a52 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -264,9 +264,11 @@ static int stm32_dma_get_width(struct stm32_dma_chan *chan,
 }
 
 static enum dma_slave_buswidth stm32_dma_get_max_width(u32 buf_len,
+						       dma_addr_t buf_addr,
 						       u32 threshold)
 {
 	enum dma_slave_buswidth max_width;
+	u64 addr = buf_addr;
 
 	if (threshold == STM32_DMA_FIFO_THRESHOLD_FULL)
 		max_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -277,6 +279,9 @@ static enum dma_slave_buswidth stm32_dma_get_max_width(u32 buf_len,
 	       max_width > DMA_SLAVE_BUSWIDTH_1_BYTE)
 		max_width = max_width >> 1;
 
+	if (do_div(addr, max_width))
+		max_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+
 	return max_width;
 }
 
@@ -707,7 +712,7 @@ static void stm32_dma_issue_pending(struct dma_chan *c)
 static int stm32_dma_set_xfer_param(struct stm32_dma_chan *chan,
 				    enum dma_transfer_direction direction,
 				    enum dma_slave_buswidth *buswidth,
-				    u32 buf_len)
+				    u32 buf_len, dma_addr_t buf_addr)
 {
 	enum dma_slave_buswidth src_addr_width, dst_addr_width;
 	int src_bus_width, dst_bus_width;
@@ -739,7 +744,8 @@ static int stm32_dma_set_xfer_param(struct stm32_dma_chan *chan,
 			return dst_burst_size;
 
 		/* Set memory data size */
-		src_addr_width = stm32_dma_get_max_width(buf_len, fifoth);
+		src_addr_width = stm32_dma_get_max_width(buf_len, buf_addr,
+							 fifoth);
 		chan->mem_width = src_addr_width;
 		src_bus_width = stm32_dma_get_width(chan, src_addr_width);
 		if (src_bus_width < 0)
@@ -788,7 +794,8 @@ static int stm32_dma_set_xfer_param(struct stm32_dma_chan *chan,
 			return src_burst_size;
 
 		/* Set memory data size */
-		dst_addr_width = stm32_dma_get_max_width(buf_len, fifoth);
+		dst_addr_width = stm32_dma_get_max_width(buf_len, buf_addr,
+							 fifoth);
 		chan->mem_width = dst_addr_width;
 		dst_bus_width = stm32_dma_get_width(chan, dst_addr_width);
 		if (dst_bus_width < 0)
@@ -876,7 +883,8 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_slave_sg(
 
 	for_each_sg(sgl, sg, sg_len, i) {
 		ret = stm32_dma_set_xfer_param(chan, direction, &buswidth,
-					       sg_dma_len(sg));
+					       sg_dma_len(sg),
+					       sg_dma_address(sg));
 		if (ret < 0)
 			goto err;
 
@@ -944,7 +952,8 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	ret = stm32_dma_set_xfer_param(chan, direction, &buswidth, period_len);
+	ret = stm32_dma_set_xfer_param(chan, direction, &buswidth, period_len,
+				       buf_addr);
 	if (ret < 0)
 		return NULL;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
