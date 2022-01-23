Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADF84972F6
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jan 2022 17:17:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C326C5F1D3;
	Sun, 23 Jan 2022 16:17:22 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C1EDC5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 16:17:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA086B80DCE;
 Sun, 23 Jan 2022 16:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A09C340E2;
 Sun, 23 Jan 2022 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642954639;
 bh=TZKzEHK2rBhpuSlNNiyInDVoc29/Ahf6Hl9wFlZ94vo=;
 h=Subject:To:Cc:From:Date:From;
 b=StZ33lg3uU+sDgPHYRWjwoD404PKCApgNbGPZ8vXHxcGr3Klef1BMsQJDI5SuT2wf
 VTETJ5KOrJQrM0WAYIGApIyjXtDMEKXXxLwCtJjRLM0MV1pZRVoN+UUfSuwiUUNNSv
 reFDpCLS6G2VJTkJAaPb7KFsf30rP5mHH4UeFewk=
To: alexandre.torgue@foss.st.com, fabien.dessenne@st.com,
 gregkh@linuxfoundation.org, herbert@gondor.apana.org.au,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 lionel.debieve@st.com, marex@denx.de, nicolas.toromanoff@foss.st.com,
 nicolas.toromanoff@st.com
From: <gregkh@linuxfoundation.org>
Date: Sun, 23 Jan 2022 17:17:06 +0100
Message-ID: <1642954626244228@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
Cc: stable-commits@vger.kernel.org
Subject: [Linux-stm32] Patch "crypto: stm32/crc32 - Fix kernel BUG triggered
	in probe()" has been added to the 5.4-stable tree
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


This is a note to let you know that I've just added the patch titled

    crypto: stm32/crc32 - Fix kernel BUG triggered in probe()

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     crypto-stm32-crc32-fix-kernel-bug-triggered-in-probe.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 29009604ad4e3ef784fd9b9fef6f23610ddf633d Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex@denx.de>
Date: Mon, 20 Dec 2021 20:50:22 +0100
Subject: crypto: stm32/crc32 - Fix kernel BUG triggered in probe()

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
 drivers/crypto/stm32/stm32-crc32.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/crypto/stm32/stm32-crc32.c
+++ b/drivers/crypto/stm32/stm32-crc32.c
@@ -230,7 +230,7 @@ static struct shash_alg algs[] = {
 		.digestsize     = CHKSUM_DIGEST_SIZE,
 		.base           = {
 			.cra_name               = "crc32",
-			.cra_driver_name        = DRIVER_NAME,
+			.cra_driver_name        = "stm32-crc32-crc32",
 			.cra_priority           = 200,
 			.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
 			.cra_blocksize          = CHKSUM_BLOCK_SIZE,
@@ -252,7 +252,7 @@ static struct shash_alg algs[] = {
 		.digestsize     = CHKSUM_DIGEST_SIZE,
 		.base           = {
 			.cra_name               = "crc32c",
-			.cra_driver_name        = DRIVER_NAME,
+			.cra_driver_name        = "stm32-crc32-crc32c",
 			.cra_priority           = 200,
 			.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
 			.cra_blocksize          = CHKSUM_BLOCK_SIZE,


Patches currently in stable-queue which might be from marex@denx.de are

queue-5.4/crypto-stm32-cryp-fix-double-pm-exit.patch
queue-5.4/crypto-stm32-crc32-fix-kernel-bug-triggered-in-probe.patch
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
