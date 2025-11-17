Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A31C63E4C
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Nov 2025 12:45:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F035C62D20;
	Mon, 17 Nov 2025 11:45:37 +0000 (UTC)
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DDC9C628CF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 11:45:36 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1763379935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EKOO8XcxSZ0+vg9AvoUfk3Tgt5QFmAZQ9PUVXdNHUKA=;
 b=wRBTKJNqHgHPZEHOiePGSbwWQP7B3UZy9nbCHlkHQGtRIVWN5j5KQCDZrMcAsYodE4/9q8
 ZfKpdU4KCBZMtTorUqxKnspgQ8WNYEzLcp3coYVcjmw+KEECZeIYAE9mVWgG1jP3YghSqa
 ywghcSpqlzL357FRpM4kH4Ps/QAglqM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 17 Nov 2025 12:44:26 +0100
Message-ID: <20251117114426.99713-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Thorsten Blum <thorsten.blum@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH] crypto: testmgr - Add missing DES weak and
	semi-weak key tests
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

Ever since commit da7f033ddc9f ("crypto: cryptomgr - Add test
infrastructure"), the DES test suite has tested only one of the four
weak keys and none of the twelve semi-weak keys.

DES has four weak keys and twelve semi-weak keys, and the kernel's DES
implementation correctly detects and rejects all of these keys when the
CRYPTO_TFM_REQ_FORBID_WEAK_KEYS flag is set. However, only a single weak
key was being tested. Add tests for all 16 weak and semi-weak keys.

While DES is deprecated, it is still used in some legacy protocols, and
weak/semi-weak key detection should be tested accordingly.

Tested on arm64 with cryptographic self-tests.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 crypto/testmgr.h | 120 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 268231227282..bd8dbd9b7fc7 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -9023,6 +9023,126 @@ static const struct cipher_testvec des_tv_template[] = {
 		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
 		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
 		.len	= 8,
+	}, { /* Weak key */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xe0\xe0\xe0\xe0\xf1\xf1\xf1\xf1",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Weak key */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x1f\x1f\x1f\x1f\x0e\x0e\x0e\x0e",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Weak key */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 1a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x01\xfe\x01\xfe\x01\xfe\x01\xfe",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 1b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xfe\x01\xfe\x01\xfe\x01\xfe\x01",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 2a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x1f\xe0\x1f\xe0\x0e\xf1\x0e\xf1",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 2b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xe0\x1f\xe0\x1f\xf1\x0e\xf1\x0e",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 3a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x01\xe0\x01\xe0\x01\xf1\x01\xf1",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 3b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xe0\x01\xe0\x01\xf1\x01\xf1\x01",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 4a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x1f\xfe\x1f\xfe\x0e\xfe\x0e\xfe",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 4b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xfe\x1f\xfe\x1f\xfe\x0e\xfe\x0e",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 5a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x01\x1f\x01\x1f\x01\x0e\x01\x0e",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 5b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x1f\x01\x1f\x01\x0e\x01\x0e\x01",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 6a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xe0\xfe\xe0\xfe\xf1\xfe\xf1\xfe",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 6b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xfe\xe0\xfe\xe0\xfe\xf1\xfe\xf1",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
 	}, { /* Two blocks -- for testing encryption across pages */
 		.key	= "\x01\x23\x45\x67\x89\xab\xcd\xef",
 		.klen	= 8,
-- 
2.51.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
