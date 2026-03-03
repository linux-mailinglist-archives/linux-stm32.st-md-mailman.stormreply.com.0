Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLwbJiGXpmnmRQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 09:09:05 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 329201EA921
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 09:09:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5A8BC2909A;
	Tue,  3 Mar 2026 08:09:04 +0000 (UTC)
Received: from smtp.jvdsn.com (smtp.jvdsn.com [129.153.194.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DF8EC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2026 06:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jvdsn.com; s=mail;
 t=1772517930; bh=enmyVlM9QgRzuKEYUPIKv1hMr+WrNhZ5gYCBMQMAZ8E=;
 h=From:To:Cc:Subject:Date;
 b=pukjEq0F6SSJxbGXZm4eRcDDr/58o6BsyXvGMdFuIYlRHB03PKiyOyT99FdaLfnVm
 CQwEBGx+A5njCdAYb+wqe+iiwWSzyJcw0k3/CMzNJXB1BtR1wItUSmMO7pTB35oOO9
 JVzYGwEesbjmsT/K+8SzeLfMN81/pf/5dMwgwyCW/17JbYNXfwTr2hQaGQRwVrL+rC
 mY8HQlOL2uM9RCYbklJrfp5hmqM932HwgdeXmtOOQ/kPdZ/vbMIhdyGdwYALME0wOY
 wxDo/CUdzYRUV5yq+6fb8sk7Dqn5aX6jspqDs/trmV8xXfY3S+sfx5CRZdUmC50PdF
 HRMonRhp1VC7w==
From: Joachim Vandersmissen <git@jvdsn.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue,  3 Mar 2026 00:05:09 -0600
Message-ID: <20260303060509.246038-1-git@jvdsn.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Mar 2026 08:09:04 +0000
Cc: Joachim Vandersmissen <git@jvdsn.com>
Subject: [Linux-stm32] [PATCH] crypto: testmgr - block Crypto API xxhash64
	in FIPS mode
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
X-Rspamd-Queue-Id: 329201EA921
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[jvdsn.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[jvdsn.com:s=mail];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-crypto@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:git@jvdsn.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[git@jvdsn.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[git@jvdsn.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[jvdsn.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.915];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jvdsn.com:mid,jvdsn.com:email]
X-Rspamd-Action: add header
X-Spam: Yes

xxhash64 is not a cryptographic hash algorithm, but is offered in the
same API (shash) as actual cryptographic hash algorithms such as
SHA-256. The Cryptographic Module Validation Program (CMVP), managing
FIPS certification, believes that this could cause confusion. xxhash64
must therefore be blocked in FIPS mode.

The only usage of xxhash64 in the kernel is btrfs. Commit fe11ac191ce0
("btrfs: switch to library APIs for checksums") recently modified the
btrfs code to use the lib/crypto API, avoiding the Kernel Cryptographic
API. Consequently, the removal of xxhash64 from the Crypto API in FIPS
mode should now have no impact on btrfs usage.

Signed-off-by: Joachim Vandersmissen <git@jvdsn.com>
---
 crypto/testmgr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 49b607f65f63..d7475d6000dd 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5609,7 +5609,6 @@ static const struct alg_test_desc alg_test_descs[] = {
 #endif
 		.alg = "xxhash64",
 		.test = alg_test_hash,
-		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(xxhash64_tv_template)
 		}
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
