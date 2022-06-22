Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 850515545C4
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jun 2022 13:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37A78C5E2C6;
	Wed, 22 Jun 2022 11:37:14 +0000 (UTC)
Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5EC9C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jun 2022 02:03:24 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 9C70D1E80CD1;
 Wed, 22 Jun 2022 10:03:15 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_IKXUawNFvw; Wed, 22 Jun 2022 10:03:13 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
 (Authenticated sender: liqiong@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 5DBFA1E80C7D;
 Wed, 22 Jun 2022 10:03:12 +0800 (CST)
From: Li Qiong <liqiong@nfschina.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Date: Wed, 22 Jun 2022 10:02:08 +0800
Message-Id: <20220622020208.25776-1-liqiong@nfschina.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Wed, 22 Jun 2022 11:37:12 +0000
Cc: renyu@nfschina.com, yuzhe@nfschina.com, linux-kernel@vger.kernel.org,
 Li Qiong <liqiong@nfschina.com>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] crypto: stm32 - Handle failure of
	kmalloc_array()
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

As the possible failure of the kmalloc_array(), therefore it
should be better to check it and return '-ENOMEM' on error.

Signed-off-by: Li Qiong <liqiong@nfschina.com>
---
 drivers/crypto/stm32/stm32-hash.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index d33006d43f76..fc03e32e364f 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -970,6 +970,8 @@ static int stm32_hash_export(struct ahash_request *req, void *out)
 	rctx->hw_context = kmalloc_array(3 + HASH_CSR_REGISTER_NUMBER,
 					 sizeof(u32),
 					 GFP_KERNEL);
+	if (!rctx->hw_context)
+		return -ENOMEM;
 
 	preg = rctx->hw_context;
 
-- 
2.11.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
