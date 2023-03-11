Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 452976B59E1
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Mar 2023 10:09:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03D06C6A60C;
	Sat, 11 Mar 2023 09:09:39 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9307C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 09:09:36 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pavE5-002xai-8B; Sat, 11 Mar 2023 17:09:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 11 Mar 2023 17:09:17 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Sat, 11 Mar 2023 17:09:17 +0800
References: <ZAxFBR3TdA7jUAgJ@gondor.apana.org.au>
To: Linus Walleij <linus.walleij@linaro.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Li kunyu <kunyu@nfschina.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com
Message-Id: <E1pavE5-002xai-8B@formenos.hmeau.com>
Subject: [Linux-stm32] [v7 PATCH 4/8] crypto: stm32 - Remove unused
	hdev->err field
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

The variable hdev->err is never read so it can be removed.

Also remove a spurious inclusion of linux/crypto.h.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 drivers/crypto/stm32/stm32-hash.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index e16f9aaec6bf..e35fee945371 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/crypto.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
@@ -183,7 +182,6 @@ struct stm32_hash_dev {
 	struct ahash_request	*req;
 	struct crypto_engine	*engine;
 
-	int			err;
 	unsigned long		flags;
 
 	struct dma_chan		*dma_lch;
@@ -894,7 +892,6 @@ static int stm32_hash_hw_init(struct stm32_hash_dev *hdev,
 		stm32_hash_write(hdev, HASH_STR, 0);
 		stm32_hash_write(hdev, HASH_DIN, 0);
 		stm32_hash_write(hdev, HASH_IMR, 0);
-		hdev->err = 0;
 	}
 
 	return 0;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
