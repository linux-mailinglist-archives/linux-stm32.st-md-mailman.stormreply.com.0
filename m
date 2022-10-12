Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 588155FD487
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 08:13:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12451C64112;
	Thu, 13 Oct 2022 06:13:12 +0000 (UTC)
Received: from smtp.cesky-hosting.cz (smtp.cesky-hosting.cz [91.239.200.238])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A180C640F3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 16:11:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at smtp.cesky-hosting.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=elrest.cz;
 s=rampa2-202208; t=1665591114;
 bh=Kxemadi69pFkVKEwR5Ct+aURnZswpdi+grRKg9XSUXM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bAJz+2sz2IMgY6tsPsXGxVq5bdbCyOqe0lEq1PgQ5u3JnITtPyURer2dO+loY7E5x
 ES28+H560S8Lw3Yr6erJ9FdbqY8sQckLpc2YuRtsT+J911nqp+ERQ3aFJPGDP/oXg7
 4jvGrefQ1rnZSwsi6lJYW4AC8ZIQsdPeVv2huIXYWEEL8SOV6M67z+9dm5QpgePIUZ
 6/uzYAvHawwfnfHHQmMEFbrDKJFnem3we8VmIab58vwiJL46zo0WjDDbprT6IdSQ8y
 jWjub3fTeVjqu6L2U/u49zsdHpy1qBqP9VmtcTcvrt6cbQEiVT/B3ztfQgLX+yyu/M
 9D3XpiQJPxiqw==
X-Thin-Conversation: conversation
Received: from localhost.localdomain (unknown [5.181.92.50])
 (Authenticated sender: tomas.marek@elrest.cz)
 by smtp.cesky-hosting.cz (Postfix) with ESMTPSA id 81D451498;
 Wed, 12 Oct 2022 18:11:54 +0200 (CEST)
From: Tomas Marek <tomas.marek@elrest.cz>
To: mpm@selenic.com,
	herbert@gondor.apana.org.au
Date: Wed, 12 Oct 2022 18:09:23 +0200
Message-Id: <20221012160924.12226-2-tomas.marek@elrest.cz>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221012160924.12226-1-tomas.marek@elrest.cz>
References: <20221012160924.12226-1-tomas.marek@elrest.cz>
X-Mailman-Approved-At: Thu, 13 Oct 2022 06:13:10 +0000
Cc: Tomas Marek <tomas.marek@elrest.cz>, oleg.karfich@wago.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] hwrng: stm32 - fix number of returned
	bytes on read
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

The stm32_rng_read() function uses `retval` variable as a counter of
generated random bytes. However, the same variable is used to store
a result of the polling function in case the driver is waiting until
the TRNG is ready. The TRNG generates random numbers by 16B. One
loop read 4B. So, the function calls the polling every 16B, i.e.
every 4th loop. The `retval` counter is reset on poll call and only
number of bytes read after the last poll call is returned to the
caller. The remaining sampled random bytes (for example 48 out of
64 in case 64 bytes are read) are not used.

Use different variable to store the polling function result and
do not overwrite `retval` counter.

Cc: Oleg Karfich <oleg.karfich@wago.com>
Signed-off-by: Tomas Marek <tomas.marek@elrest.cz>
---
 drivers/char/hw_random/stm32-rng.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index bc22178f83e8..8eaacefd498b 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -49,11 +49,13 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 		/* Manage timeout which is based on timer and take */
 		/* care of initial delay time when enabling rng	*/
 		if (!sr && wait) {
-			retval = readl_relaxed_poll_timeout_atomic(priv->base
+			int ret;
+
+			ret = readl_relaxed_poll_timeout_atomic(priv->base
 								   + RNG_SR,
 								   sr, sr,
 								   10, 50000);
-			if (retval)
+			if (ret)
 				dev_err((struct device *)priv->rng.priv,
 					"%s: timeout %x!\n", __func__, sr);
 		}
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
