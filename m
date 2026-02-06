Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFGpOqtAhmmFLQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 20:27:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 699CC102BA3
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 20:27:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CCAFC87EDD;
	Fri,  6 Feb 2026 19:27:39 +0000 (UTC)
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DC70C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Feb 2026 19:27:37 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 44129 invoked from network);
 6 Feb 2026 20:27:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
 t=1770406056; bh=6gftHVR+vy3nM7U0t2O69oN1ej/ezopf8Hrbjo9I60w=;
 h=From:To:Cc:Subject;
 b=dpUiM22RLFPBbQAugmoBY09/ozjCxd36za8mP3jSPbA8DUE/5negt7hmbZvi5I3bK
 b75NKhr/uAsH7gei7BEsEf3MnKvLOAjjw9uODhnspzRomJ6wyQ0+3aAJVugAcHVVp4
 1+YyLcnL3s9VpzN2EqdCY2YDBDmjkqFBWLl223Syrgo91anxfMz8Vm8D/BZu2dAqgD
 3xvuu2TFrHJPHFDdNQK02dZ+p3rlroLV9KtNwS76XR+na0s9hpz9HLrzKhWoH/a1Hu
 QFEQgBXCPqEzW3ferqao6k+40MwE7iQLYOmxgsZL6uFXmtE1P1ootpgn7owbt0LCIj
 6Sf1yj2nDg2QQ==
Received: from 83.5.238.100.ipv4.supernova.orange.pl (HELO laptop-olek.lan)
 (olek2@wp.pl@[83.5.238.100]) (envelope-sender <olek2@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
 for <herbert@gondor.apana.org.au>; 6 Feb 2026 20:27:35 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri,  6 Feb 2026 20:26:59 +0100
Message-ID: <20260206192732.478178-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <linux-kernel@vger.kernel.org>
References: <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
X-WP-DKIM-Status: good (id: wp.pl) 
X-WP-MailID: 51800c7626cbd9910c5677c24232fcb4
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [MEMU]                               
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [Linux-stm32] [PATCH] crypto: tesmgr - allow
	authenc(hmac(sha224/sha384), cbc(aes)) in fips mode
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[wp.pl:s=20241105];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[wp.pl : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-crypto@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:olek2@wp.pl,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[olek2@wp.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[wp.pl];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[wp.pl];
	DKIM_TRACE(0.00)[wp.pl:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olek2@wp.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wp.pl:mid,wp.pl:email]
X-Rspamd-Queue-Id: 699CC102BA3
X-Rspamd-Action: no action

The remaining combinations of AES-CBC and SHA* have already been marked
as allowed. This commit does the same for SHA224 and SHA384.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 crypto/testmgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index bf286a4f5351..b230d651f9f9 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4134,6 +4134,7 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "authenc(hmac(sha224),cbc(aes))",
 		.generic_driver = "authenc(hmac-sha224-lib,cbc(aes-generic))",
 		.test = alg_test_aead,
+		.fips_allowed = 1,
 		.suite = {
 			.aead = __VECS(hmac_sha224_aes_cbc_tv_temp)
 		}
@@ -4196,6 +4197,7 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "authenc(hmac(sha384),cbc(aes))",
 		.generic_driver = "authenc(hmac-sha384-lib,cbc(aes-generic))",
 		.test = alg_test_aead,
+		.fips_allowed = 1,
 		.suite = {
 			.aead = __VECS(hmac_sha384_aes_cbc_tv_temp)
 		}
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
