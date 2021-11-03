Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E374444AC
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Nov 2021 16:33:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48FDEC5E2C9;
	Wed,  3 Nov 2021 15:33:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AADD0C5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Nov 2021 15:33:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A3EFfR0021308;
 Wed, 3 Nov 2021 16:33:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=mYKeBd4Rvz5CtOAEHTz2L9t5qnO8yoveDHhoGmG7whM=;
 b=j5RNufqEae/YrSmA/HIUdjJHd2nDtrcHxJTiAe8I1w2VujVTGyUJxvsQF+XxzqLaMvCD
 wUqTfOe632sXn4q9/iQAMcaovjf36b4/eyYxB4IbEeqjbWnpLNeLqHoWZqPsrmZYd2qA
 nNS3RX6xayIaYsESlXHPHdQZpQw3/vYLkbDTqcnoux7Ie+qkKb8IzXuU/Fw/h0VcRa21
 16ty++0jf5UNUE8BzrOfyh7Zfm5QsOVZP5ibVb83vu7dGi6V5WoHKoTfY7w9p9qVoIgJ
 UQuOF+cAoh/+1f6FciQWLwJCh1JNWaN57TDL8x6Kev7YIcYikHylt+VDYg++hLTW5b+G dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c3db954tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 16:33:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4119410002A;
 Wed,  3 Nov 2021 16:33:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B98224164E;
 Wed,  3 Nov 2021 16:33:14 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov 2021 16:33:13
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 3 Nov 2021 16:33:12 +0100
Message-ID: <20211103153312.41483-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_05,2021-11-03_01,2020-04-07_01
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/1] dmaengine: stm32-dma: avoid 64-bit
	division in stm32_dma_get_max_width
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

From: Arnd Bergmann <arnd@arndb.de>

Using the % operator on a 64-bit variable is expensive and can
cause a link failure:

arm-linux-gnueabi-ld: drivers/dma/stm32-dma.o: in function `stm32_dma_get_max_width':
stm32-dma.c:(.text+0x170): undefined reference to `__aeabi_uldivmod'
arm-linux-gnueabi-ld: drivers/dma/stm32-dma.o: in function `stm32_dma_set_xfer_param':
stm32-dma.c:(.text+0x1cd4): undefined reference to `__aeabi_uldivmod'

As we know that we just want to check the alignment in
stm32_dma_get_max_width(), there is no need for a full division, and
using a simple mask is a faster replacement.

Same in stm32_dma_set_xfer_param(), change this to only allow burst
transfers if the address is a multiple of the length.
stm32_dma_get_best_burst just after will take buf_len into account to fix
burst in case of misalignment.

Fixes: b20fd5fa310c ("dmaengine: stm32-dma: fix stm32_dma_get_max_width")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 2283c500f4ce..83a37a6955a3 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -280,7 +280,7 @@ static enum dma_slave_buswidth stm32_dma_get_max_width(u32 buf_len,
 	       max_width > DMA_SLAVE_BUSWIDTH_1_BYTE)
 		max_width = max_width >> 1;
 
-	if (buf_addr % max_width)
+	if (buf_addr & (max_width - 1))
 		max_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
 
 	return max_width;
@@ -757,7 +757,7 @@ static int stm32_dma_set_xfer_param(struct stm32_dma_chan *chan,
 		 * Set memory burst size - burst not possible if address is not aligned on
 		 * the address boundary equal to the size of the transfer
 		 */
-		if (buf_addr % buf_len)
+		if (buf_addr & (buf_len - 1))
 			src_maxburst = 1;
 		else
 			src_maxburst = STM32_DMA_MAX_BURST;
@@ -813,7 +813,7 @@ static int stm32_dma_set_xfer_param(struct stm32_dma_chan *chan,
 		 * Set memory burst size - burst not possible if address is not aligned on
 		 * the address boundary equal to the size of the transfer
 		 */
-		if (buf_addr % buf_len)
+		if (buf_addr & (buf_len - 1))
 			dst_maxburst = 1;
 		else
 			dst_maxburst = STM32_DMA_MAX_BURST;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
