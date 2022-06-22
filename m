Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B145572F0
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jun 2022 08:17:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB147C5EC76;
	Thu, 23 Jun 2022 06:17:39 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BF60C0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jun 2022 19:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655926706; x=1687462706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SrqNYLhrIYTbLf+pLr5lA6vQS1PpkyYUL/1WuAbc1Ag=;
 b=kyvaVs9T8iHs9JgiyL0d6Du4y/DDKcICi2ptHEmfKsznz6wpXyPxqvMk
 IKjX2A6Gig42xlzRJeZdIuMX8VWguzp1Uqzmq4yhVScTDrxs+U74G+VRe
 S3Qpt/LV/8ekvWlY/RPhNYojZbJS8xaJ74F04shAP/gM87w0KFz+gU2wC
 jeLQvwLWFisqkgfYSjSIyNnCHJYbjOfXMt7ec9R5LisiJwbY6JkLZpPll
 ccQzntM+bexkOthCjwyWOAhDqXJY1zzDuzwDRgd6SDM6k++E1/2qQaHX7
 zgcXBKBVRxxUVAwyhr8vXNHrUMf+S9FOrIjtM/6vPyhrb9Jrurbf266kC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="263559844"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="263559844"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 12:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="715542081"
Received: from bwalker-desk.ch.intel.com ([143.182.136.162])
 by orsmga004.jf.intel.com with ESMTP; 22 Jun 2022 12:38:23 -0700
From: Ben Walker <benjamin.walker@intel.com>
To: vkoul@kernel.org
Date: Wed, 22 Jun 2022 12:37:42 -0700
Message-Id: <20220622193753.3044206-5-benjamin.walker@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220622193753.3044206-1-benjamin.walker@intel.com>
References: <20220503200728.2321188-1-benjamin.walker@intel.com>
 <20220622193753.3044206-1-benjamin.walker@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Jun 2022 06:17:38 +0000
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 04/15] crypto: stm32/hash: Use
	dmaengine_async_is_tx_complete
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

Replace dma_async_is_tx_complete with dmaengine_async_is_tx_complete.
The previous API will be removed in favor of the new one.

Cc: linux-crypto@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Ben Walker <benjamin.walker@intel.com>
---
 drivers/crypto/stm32/stm32-hash.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index d33006d43f761..aef447847c499 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -453,8 +453,7 @@ static int stm32_hash_xmit_dma(struct stm32_hash_dev *hdev,
 					 msecs_to_jiffies(100)))
 		err = -ETIMEDOUT;
 
-	if (dma_async_is_tx_complete(hdev->dma_lch, cookie,
-				     NULL, NULL) != DMA_COMPLETE)
+	if (dmaengine_async_is_tx_complete(hdev->dma_lch, cookie) != DMA_COMPLETE)
 		err = -ETIMEDOUT;
 
 	if (err) {
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
