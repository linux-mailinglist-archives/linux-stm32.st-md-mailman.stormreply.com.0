Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 632845FD488
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 08:13:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23F7CC6411F;
	Thu, 13 Oct 2022 06:13:12 +0000 (UTC)
Received: from smtp.cesky-hosting.cz (smtp.cesky-hosting.cz [91.239.200.238])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32544C640F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 16:11:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at smtp.cesky-hosting.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=elrest.cz;
 s=rampa2-202208; t=1665591117;
 bh=3PJXsVojE1yIhCWBte/WZxkCcLEvTSwXh4kCjVhKYUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BM9SRrG5yhctNS3csxOccAcSe9vSkB3S2uNE6KRqTiSY34JigW89/x39nfaRLs6Kf
 dLdUsEwN9Dh/DTG0XEyco++ecN6flXxf9+UxHPG2iNlYEEMuZOm8BKEH9+HT7moR5f
 3+SIWdshFStDyvBTir4GfYUmpMZTWXbXsSYZg3C5Pt+qRoA8q3NAYNJIxcCYhxgjKL
 9V+lRum8MNl+/6ZHJdS/qRZvP4g4dQ9nb6ftCi2bTahAJKB1gxCAPjBGtR63Dy6tUq
 NJ5vJI/+JUHuKiaksFyOdvDS7yF5k7chQ2MrGK7vmdhTC0njx+reJ/Q4zjG5omh2VG
 c6hwfMij99J+g==
X-Thin-Conversation: conversation
Received: from localhost.localdomain (unknown [5.181.92.50])
 (Authenticated sender: tomas.marek@elrest.cz)
 by smtp.cesky-hosting.cz (Postfix) with ESMTPSA id 4FB2E1ACF;
 Wed, 12 Oct 2022 18:11:57 +0200 (CEST)
From: Tomas Marek <tomas.marek@elrest.cz>
To: mpm@selenic.com,
	herbert@gondor.apana.org.au
Date: Wed, 12 Oct 2022 18:09:24 +0200
Message-Id: <20221012160924.12226-3-tomas.marek@elrest.cz>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221012160924.12226-1-tomas.marek@elrest.cz>
References: <20221012160924.12226-1-tomas.marek@elrest.cz>
X-Mailman-Approved-At: Thu, 13 Oct 2022 06:13:10 +0000
Cc: Tomas Marek <tomas.marek@elrest.cz>, oleg.karfich@wago.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] hwrng: stm32 - fix read of the last word
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

The stm32_rng_read() function samples TRNG by 4 bytes until at
least 5 bytes are free in the input buffer. The last four bytes
are never read. For example, 60 bytes are returned in case the
input buffer size is 64 bytes.

Read until at least 4 bytes are free in the input buffer. Fill
the buffer entirely in case the buffer size is divisible by 4.

Cc: Oleg Karfich <oleg.karfich@wago.com>
Signed-off-by: Tomas Marek <tomas.marek@elrest.cz>
---
 drivers/char/hw_random/stm32-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 8eaacefd498b..366edda4848b 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -44,7 +44,7 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 
 	pm_runtime_get_sync((struct device *) priv->rng.priv);
 
-	while (max > sizeof(u32)) {
+	while (max >= sizeof(u32)) {
 		sr = readl_relaxed(priv->base + RNG_SR);
 		/* Manage timeout which is based on timer and take */
 		/* care of initial delay time when enabling rng	*/
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
