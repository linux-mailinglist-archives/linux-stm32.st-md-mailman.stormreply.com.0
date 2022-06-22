Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 020AD5572EF
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jun 2022 08:17:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99B30C5E2CC;
	Thu, 23 Jun 2022 06:17:39 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37ADFC03FD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jun 2022 18:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655924014; x=1687460014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=prwrS1jSAxwYJXS6zrdVXKa0GwZvymzpmn7Mdh5vPkw=;
 b=ILCBXc5UIrvKI+nm0d4KWeEE6FqcTk63SWo72d456o1IGYlfG2HemXx8
 y1zyqZL+jpwNy0Wltsbo5Q30FYxVn05RQcckqvklE2yrMf8rzdwoCoRoA
 R+YHY+vII6ECA3UdvLun8ch/bzdKMyJaUjA5je6uj00B/Ekhtvq0TIvxT
 Qa52TE0EBVtByRzjHm40uYToL5HRYiBP5kVJwNbxBVRQSE/M6heYGIQBp
 ugwNlV1o05R7/3S7ZpoohtiEqjTz3si5/zv7f8HBbnyRZH6R4lwebcobC
 0p0ANcPE8gM8Qx6c4GUsj0VBf7aeZ/ARw8Ud4mYAiTKkFiFxohO/t7XMO g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="278063641"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="278063641"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 11:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="677700660"
Received: from bwalker-desk.ch.intel.com ([143.182.136.162])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2022 11:53:32 -0700
From: Ben Walker <benjamin.walker@intel.com>
To: vkoul@kernel.org
Date: Wed, 22 Jun 2022 11:53:30 -0700
Message-Id: <20220622185330.3043566-1-benjamin.walker@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Jun 2022 06:17:38 +0000
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 04/15] crypto: stm32/hash: Use
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
