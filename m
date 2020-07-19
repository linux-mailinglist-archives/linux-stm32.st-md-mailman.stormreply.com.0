Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13630225A3E
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jul 2020 10:40:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C382FC36B37;
	Mon, 20 Jul 2020 08:40:54 +0000 (UTC)
Received: from smtp.al2klimov.de (smtp.al2klimov.de [78.46.175.9])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01D24C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jul 2020 09:49:57 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id A182EBC07E;
 Sun, 19 Jul 2020 09:49:54 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 herbert@gondor.apana.org.au, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Date: Sun, 19 Jul 2020 11:49:48 +0200
Message-Id: <20200719094948.57487-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam-Level: ******
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Spam: Yes
X-Mailman-Approved-At: Mon, 20 Jul 2020 08:40:53 +0000
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [Linux-stm32] [PATCH for v5.9] ARM: STM32: Replace HTTP links with
	HTTPS ones
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

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 arch/arm/mach-stm32/Makefile.boot | 2 +-
 crypto/testmgr.h                  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32/Makefile.boot b/arch/arm/mach-stm32/Makefile.boot
index cec195d4fcba..5dde7328a7a9 100644
--- a/arch/arm/mach-stm32/Makefile.boot
+++ b/arch/arm/mach-stm32/Makefile.boot
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Empty file waiting for deletion once Makefile.boot isn't needed any more.
 # Patch waits for application at
-# http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7889/1 .
+# https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7889/1 .
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index d29983908c38..cdcf0d2fe40d 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -16231,7 +16231,7 @@ static const struct cipher_testvec aes_lrw_tv_template[] = {
 			  "\xe9\x5d\x48\x92\x54\x63\x4e\xb8",
 		.len	= 48,
 	}, {
-/* http://www.mail-archive.com/stds-p1619@listserv.ieee.org/msg00173.html */
+/* https://www.mail-archive.com/stds-p1619@listserv.ieee.org/msg00173.html */
 		.key    = "\xf8\xd4\x76\xff\xd6\x46\xee\x6c"
 			  "\x23\x84\xcb\x1c\x77\xd6\x19\x5d"
 			  "\xfe\xf1\xa9\xf3\x7b\xbc\x8d\x21"
@@ -21096,7 +21096,7 @@ static const struct aead_testvec aegis128_tv_template[] = {
 
 /*
  * All key wrapping test vectors taken from
- * http://csrc.nist.gov/groups/STM/cavp/documents/mac/kwtestvectors.zip
+ * https://csrc.nist.gov/groups/STM/cavp/documents/mac/kwtestvectors.zip
  *
  * Note: as documented in keywrap.c, the ivout for encryption is the first
  * semiblock of the ciphertext from the test vector. For decryption, iv is
@@ -22825,7 +22825,7 @@ static const struct cipher_testvec xeta_tv_template[] = {
  * FCrypt test vectors
  */
 static const struct cipher_testvec fcrypt_pcbc_tv_template[] = {
-	{ /* http://www.openafs.org/pipermail/openafs-devel/2000-December/005320.html */
+	{ /* https://www.openafs.org/pipermail/openafs-devel/2000-December/005320.html */
 		.key	= "\x00\x00\x00\x00\x00\x00\x00\x00",
 		.klen	= 8,
 		.iv	= "\x00\x00\x00\x00\x00\x00\x00\x00",
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
