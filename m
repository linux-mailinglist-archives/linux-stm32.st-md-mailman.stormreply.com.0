Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F16628AE54
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Oct 2020 08:49:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 399FFC3FAD9;
	Mon, 12 Oct 2020 06:49:08 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03089C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Oct 2020 02:06:01 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 16E6E3CE7B6A12A113A0;
 Sat, 10 Oct 2020 10:05:59 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Sat, 10 Oct 2020
 10:05:50 +0800
From: Ye Bin <yebin10@huawei.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <linux-crypto@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Sat, 10 Oct 2020 10:16:37 +0800
Message-ID: <20201010021637.112091-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 12 Oct 2020 06:49:07 +0000
Cc: Ye Bin <yebin10@huawei.com>
Subject: [Linux-stm32] [PATCH] crypto: testmgr - Fix format argument warning
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

Fix follow warning:
[crypto/testmgr.c:2317]: (warning) %d in format string (no. 5) requires
'int' but the argument type is 'unsigned int'.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 crypto/testmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index a64a639eddfa..aefa4b6b8d78 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -2315,7 +2315,7 @@ static void generate_random_aead_testvec(struct aead_request *req,
 	if (vec->setkey_error == 0 && vec->setauthsize_error == 0)
 		generate_aead_message(req, suite, vec, prefer_inauthentic);
 	snprintf(name, max_namelen,
-		 "\"random: alen=%u plen=%u authsize=%u klen=%u novrfy=%d\"",
+		 "\"random: alen=%u plen=%u authsize=%u klen=%u novrfy=%u\"",
 		 vec->alen, vec->plen, authsize, vec->klen, vec->novrfy);
 }
 
-- 
2.16.2.dirty

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
