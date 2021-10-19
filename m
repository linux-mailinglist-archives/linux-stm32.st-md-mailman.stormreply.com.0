Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4056E433AA1
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 17:35:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9A3EC5C854;
	Tue, 19 Oct 2021 15:35:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3538C5C852
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 15:35:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84BEE61074;
 Tue, 19 Oct 2021 15:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634657736;
 bh=DxWRJWAj/zdrQswUAfCVlDVJpMFIF9IpXMFPLAXRYKM=;
 h=From:To:Cc:Subject:Date:From;
 b=GMsDOCQAJEt1Pl+XVrt0Iv8x1+PjbfYdPlx9J7nbNsAiudShRlGG9Dr3cDkSrF6bN
 14GyBkn5FUfK98ABuA7gwqGb+nIWyFMebbtGStkFXt73MCDjAOx608vUXnFLIkAgHr
 rWirUVzn9ynJxsdrp05ZZy3HGtcCavsgD4g4E02kDGG4PW6K6/FVOL26xJ74NV0UhR
 69HvskM7S6jwMecRCS6K8SjQYKtw/Ck/uBW9+emraQTk5MuPfDZKjenF9WYhLg/GQy
 xZNqZmdzfl2r8Ip4jjO01eRN9z9Xtpko7dQx+h0W9V4PBVbv5MHSQhT2zKfIZV7QCl
 zl/O9vWN6eAgg==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 19 Oct 2021 17:35:27 +0200
Message-Id: <20211019153532.366429-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, Zhang Qilong <zhangqilong3@huawei.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dma: avoid 64-bit division
	in stm32_dma_get_max_width
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

In stm32_dma_set_xfer_param(), it is possible to pass a non-power-of-two
length, so this does not work. I assume this would in fact be a mistake,
and the hardware does not work correctly with a burst of e.g. 5 bytes
on a five-byte aligned address. Change this to only allow burst
transfers if the address is a multiple of the length, and that length
is a power-of-two number.

Fixes: b20fd5fa310c ("dmaengine: stm32-dma: fix stm32_dma_get_max_width")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/stm32-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 2283c500f4ce..102278f7d13e 100644
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
+		if (!is_power_of_2(buf_len) || (buf_addr & (buf_len -1)))
 			src_maxburst = 1;
 		else
 			src_maxburst = STM32_DMA_MAX_BURST;
@@ -813,7 +813,7 @@ static int stm32_dma_set_xfer_param(struct stm32_dma_chan *chan,
 		 * Set memory burst size - burst not possible if address is not aligned on
 		 * the address boundary equal to the size of the transfer
 		 */
-		if (buf_addr % buf_len)
+		if (!is_power_of_2(buf_len) || (buf_addr & (buf_len -1)))
 			dst_maxburst = 1;
 		else
 			dst_maxburst = STM32_DMA_MAX_BURST;
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
