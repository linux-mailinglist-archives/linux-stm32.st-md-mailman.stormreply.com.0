Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D843A4F6F
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2019 09:02:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15580C35E01;
	Mon,  2 Sep 2019 07:02:14 +0000 (UTC)
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
 [192.185.168.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDABFC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2019 16:14:26 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 05C511621F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2019 11:14:26 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 3jXdiF8IGiQer3jXdiYHv0; Fri, 30 Aug 2019 11:14:26 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aGYr2FM4QQtcTWRAHMFf23E34Ywi1aRTuyHCXd6kje0=; b=pAliF8TGvjsDz5WSKpj+xjc670
 wG3SdMnDpV0CMTt6RY56y+kj5QAhp2VlSc66xWk513X6/TkKw8+aHdNS5DlJCWj2wigHMxromxRDb
 iPMa3sVurbFOI1x6bHYrFu01Ip3EMiC/12ms7poxNoi/ph1lIjLU6lXhk48DXileLCfFVsD9pJ4vq
 cfz7hSg96NYDOrSLiAHa4CBH656OaB0m3kdO7QTCtTdurZlwthlR6Lqs+ZfQFij4WWCpJIx0nA2ZY
 4AgSPWtE4OGElW/r2HR+6Kfro853MmI01eRtd1Emp6UirKMojcshO4o8s21IWNAPiR/Gc3CBsE8U+
 0+f630WA==;
Received: from [189.152.216.116] (port=34988 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1i3jXc-000lDa-Le; Fri, 30 Aug 2019 11:14:24 -0500
Date: Fri, 30 Aug 2019 11:14:23 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20190830161423.GA3483@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.152.216.116
X-Source-L: No
X-Exim-ID: 1i3jXc-000lDa-Le
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.152.216.116]:34988
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:02:12 +0000
Cc: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dma: Use struct_size() helper
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

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct stm32_dma_desc {
	...
        struct stm32_dma_sg_req sg_req[];
};


Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

So, replace the following function:

static struct stm32_dma_desc *stm32_dma_alloc_desc(u32 num_sgs)
{
       return kzalloc(sizeof(struct stm32_dma_desc) +
                      sizeof(struct stm32_dma_sg_req) * num_sgs, GFP_NOWAIT);
}

with:

kzalloc(struct_size(desc, sg_req, num_sgs), GFP_NOWAIT)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/dma/stm32-dma.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index e4cbe38d1b83..5989b0893521 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -243,12 +243,6 @@ static void stm32_dma_write(struct stm32_dma_device *dmadev, u32 reg, u32 val)
 	writel_relaxed(val, dmadev->base + reg);
 }
 
-static struct stm32_dma_desc *stm32_dma_alloc_desc(u32 num_sgs)
-{
-	return kzalloc(sizeof(struct stm32_dma_desc) +
-		       sizeof(struct stm32_dma_sg_req) * num_sgs, GFP_NOWAIT);
-}
-
 static int stm32_dma_get_width(struct stm32_dma_chan *chan,
 			       enum dma_slave_buswidth width)
 {
@@ -853,7 +847,7 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_slave_sg(
 		return NULL;
 	}
 
-	desc = stm32_dma_alloc_desc(sg_len);
+	desc = kzalloc(struct_size(desc, sg_req, sg_len), GFP_NOWAIT);
 	if (!desc)
 		return NULL;
 
@@ -954,7 +948,7 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_cyclic(
 
 	num_periods = buf_len / period_len;
 
-	desc = stm32_dma_alloc_desc(num_periods);
+	desc = kzalloc(struct_size(desc, sg_req, num_periods), GFP_NOWAIT);
 	if (!desc)
 		return NULL;
 
@@ -989,7 +983,7 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_memcpy(
 	int i;
 
 	num_sgs = DIV_ROUND_UP(len, STM32_DMA_ALIGNED_MAX_DATA_ITEMS);
-	desc = stm32_dma_alloc_desc(num_sgs);
+	desc = kzalloc(struct_size(desc, sg_req, num_sgs), GFP_NOWAIT);
 	if (!desc)
 		return NULL;
 
-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
