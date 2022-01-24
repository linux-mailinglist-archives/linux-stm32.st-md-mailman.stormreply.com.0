Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC632498B0C
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 20:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ACF8C5F1D5;
	Mon, 24 Jan 2022 19:10:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4518EC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 19:10:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 00AA660010;
 Mon, 24 Jan 2022 19:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCC4C340E5;
 Mon, 24 Jan 2022 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643051421;
 bh=WO3Y96d8ujRmduRbZRHZ6fINYqgCWEHggCq4NSV+Gr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=120WpT3DMAm5gwTtnDcLqpTrylMDnHHv2SCS5IVegT57QiGZUqCGGfY53BFDfEp+f
 DhwVq9WwZ76FAx4GjwiWEssvIgWxGmZKszJ+y5cK0FE3/G2biqzSq4KeanhgYgNUSm
 NYJ5ZLH8fZXy9B/oA9TuNUgf/M1J49/GUF41dq40=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Date: Mon, 24 Jan 2022 19:43:52 +0100
Message-Id: <20220124183942.146431609@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124183937.101330125@linuxfoundation.org>
References: <20220124183937.101330125@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Lionel Debieve <lionel.debieve@st.com>,
 Nicolas Toromanoff <nicolas.toromanoff@st.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, stable@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4.14 157/186] crypto: stm32/crc32 - Fix kernel
	BUG triggered in probe()
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

From: Marek Vasut <marex@denx.de>

commit 29009604ad4e3ef784fd9b9fef6f23610ddf633d upstream.

The include/linux/crypto.h struct crypto_alg field cra_driver_name description
states "Unique name of the transformation provider. " ... " this contains the
name of the chip or provider and the name of the transformation algorithm."

In case of the stm32-crc driver, field cra_driver_name is identical for all
registered transformation providers and set to the name of the driver itself,
which is incorrect. This patch fixes it by assigning a unique cra_driver_name
to each registered transformation provider.

The kernel crash is triggered when the driver calls crypto_register_shashes()
which calls crypto_register_shash(), which calls crypto_register_alg(), which
calls __crypto_register_alg(), which returns -EEXIST, which is propagated
back through this call chain. Upon -EEXIST from crypto_register_shash(), the
crypto_register_shashes() starts unregistering the providers back, and calls
crypto_unregister_shash(), which calls crypto_unregister_alg(), and this is
where the BUG() triggers due to incorrect cra_refcnt.

Fixes: b51dbe90912a ("crypto: stm32 - Support for STM32 CRC32 crypto module")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: <stable@vger.kernel.org> # 4.12+
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Lionel Debieve <lionel.debieve@st.com>
Cc: Nicolas Toromanoff <nicolas.toromanoff@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-crypto@vger.kernel.org
Acked-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/crypto/stm32/stm32_crc32.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/crypto/stm32/stm32_crc32.c
+++ b/drivers/crypto/stm32/stm32_crc32.c
@@ -206,7 +206,7 @@ static struct shash_alg algs[] = {
 		.digestsize     = CHKSUM_DIGEST_SIZE,
 		.base           = {
 			.cra_name               = "crc32",
-			.cra_driver_name        = DRIVER_NAME,
+			.cra_driver_name        = "stm32-crc32-crc32",
 			.cra_priority           = 200,
 			.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
 			.cra_blocksize          = CHKSUM_BLOCK_SIZE,
@@ -228,7 +228,7 @@ static struct shash_alg algs[] = {
 		.digestsize     = CHKSUM_DIGEST_SIZE,
 		.base           = {
 			.cra_name               = "crc32c",
-			.cra_driver_name        = DRIVER_NAME,
+			.cra_driver_name        = "stm32-crc32-crc32c",
 			.cra_priority           = 200,
 			.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
 			.cra_blocksize          = CHKSUM_BLOCK_SIZE,


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
