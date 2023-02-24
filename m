Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE086A3B9A
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Feb 2023 08:17:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CF8EC69065;
	Mon, 27 Feb 2023 07:17:23 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.237])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDC13C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 05:19:05 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 5896C1A00A14;
 Thu, 23 Feb 2023 13:19:44 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXrtiH0GntNQ; Thu, 23 Feb 2023 13:19:40 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
 (Authenticated sender: kunyu@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 10B9E1A0092F;
 Thu, 23 Feb 2023 13:19:40 +0800 (CST)
From: Li kunyu <kunyu@nfschina.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, mcoquelin.stm32@gmail.com
Date: Sat, 25 Feb 2023 05:50:19 +0800
Message-Id: <20230224215019.3687-1-kunyu@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Mon, 27 Feb 2023 07:17:23 +0000
Cc: linux-kernel@vger.kernel.org, Li kunyu <kunyu@nfschina.com>,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] stm32: stm32-hash: Add kmalloc_array
	allocation check
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

If rctx->hw_context allocation of the context pointer failed. Returning
-ENOMEM and assigning NULL to the out pointer should improve the
robustness of the function.

Signed-off-by: Li kunyu <kunyu@nfschina.com>
---
 drivers/crypto/stm32/stm32-hash.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index d33006d43f76..18e79f62be96 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -970,6 +970,10 @@ static int stm32_hash_export(struct ahash_request *req, void *out)
 	rctx->hw_context = kmalloc_array(3 + HASH_CSR_REGISTER_NUMBER,
 					 sizeof(u32),
 					 GFP_KERNEL);
+	if (rctx->hw_context == NULL) {
+		out = NULL;
+		return -ENOMEM;
+	}
 
 	preg = rctx->hw_context;
 
-- 
2.18.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
