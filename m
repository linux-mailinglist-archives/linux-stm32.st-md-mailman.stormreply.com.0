Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 919C26209A8
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Nov 2022 07:42:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4319BC6504A;
	Tue,  8 Nov 2022 06:42:55 +0000 (UTC)
Received: from smtp.cesky-hosting.cz (smtp.cesky-hosting.cz [91.239.200.238])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE4E7C03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Nov 2022 06:42:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at smtp.cesky-hosting.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=elrest.cz;
 s=rampa2-202208; t=1667889774;
 bh=V9/jJPJ9a+5GSM47PiAdHLQKBlIKHvofJMorNo6oRy0=;
 h=From:To:Cc:Subject:Date:From;
 b=vqNnAkr6B/J3zlhwmAFZMQz1PCVkrCGqIn/7icCoiGTrjKwWpJ1Sna3UGkFrRJdFQ
 Eg42cjIgpqbnRiYebkdn9z/ADFOa1RNXWIusvZRo0Rg1yAIfPrgrmhztrL/kOj1nmn
 6e+i17SjVA7tGeNSu3vpqz7CS5ldXeoqo2aNWez4qfCi5Rq9TO/a1YHMsvs7nP9R5z
 5hzD0WRJIj7+gVBUG2tAwx555r/JXWuf88bff9QV8hZqem0Jfe/BOz6APXHQkEkt6l
 hFbcF7MGlfKXHfPKLDEms75Kg9T0kH8PhGprNaoM5oOhKoJxi7onw2T28ObzbkxxO2
 wASwghYQgo5qA==
Received: from localhost.localdomain (unknown [5.181.92.50])
 (Authenticated sender: tomas.marek@elrest.cz)
 by smtp.cesky-hosting.cz (Postfix) with ESMTPSA id 2882078B;
 Tue,  8 Nov 2022 07:42:50 +0100 (CET)
From: Tomas Marek <tomas.marek@elrest.cz>
To: mpm@selenic.com,
	herbert@gondor.apana.org.au
Date: Tue,  8 Nov 2022 07:42:40 +0100
Message-Id: <20221108064240.30878-1-tomas.marek@elrest.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] hwrng: stm32 - rename readl return value
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

Use a more meaningful name for the readl return value variable.

Link: https://lore.kernel.org/all/Y1J3QwynPFIlfrIv@loth.rohan.me.apana.org.au/

Signed-off-by: Tomas Marek <tomas.marek@elrest.cz>
---
 drivers/char/hw_random/stm32-rng.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 366edda4848b..a6731cf0627a 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -49,13 +49,13 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 		/* Manage timeout which is based on timer and take */
 		/* care of initial delay time when enabling rng	*/
 		if (!sr && wait) {
-			int ret;
+			int err;
 
-			ret = readl_relaxed_poll_timeout_atomic(priv->base
+			err = readl_relaxed_poll_timeout_atomic(priv->base
 								   + RNG_SR,
 								   sr, sr,
 								   10, 50000);
-			if (ret)
+			if (err)
 				dev_err((struct device *)priv->rng.priv,
 					"%s: timeout %x!\n", __func__, sr);
 		}
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
