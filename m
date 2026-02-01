Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HlrEOg4f2mglwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Feb 2026 12:28:40 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B99E3C5BE3
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Feb 2026 12:28:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AF63C56612;
	Sun,  1 Feb 2026 11:28:39 +0000 (UTC)
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C273C01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Feb 2026 11:28:38 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 3160 invoked from network);
 1 Feb 2026 12:28:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
 t=1769945316; bh=/MfwfCTQ2QheiPcRl9dLEuVTRmc97tG+vjYeZQwO0Ao=;
 h=From:To:Cc:Subject;
 b=F4MdyiWFWHFPx38n4hqWuWj2OOcYypKlpGg2PPRaUobkWaibc5T65jtPvsvns2UQ0
 /rU7afYTcgc7L78NH2quW7gYyljMlXljZD4cdgfMbg0wN/OSTYEB4J+WoCiP6pdgfr
 pQIL2zvguiDWqVYxrdlusf+yehpmMamuJ81WSgYUNTUj4mkOapUUzJBvXWGNHC/ahD
 L9oSNQQSNVBPo21PoZpMkhp5iJj/b9BB38ZsjqvdI2B83VZJSp2Pmvzww4rCKTKSo8
 RodDVNCMGpiEQX3oz+ynu6iAK3CKSJLs8fAStnC1NThkZQ5sOooLDYovTD/zB/RUVq
 Dr9oPNnUHsg6w==
Received: from 83.5.238.100.ipv4.supernova.orange.pl (HELO laptop-olek.lan)
 (olek2@wp.pl@[83.5.238.100]) (envelope-sender <olek2@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
 for <herbert@gondor.apana.org.au>; 1 Feb 2026 12:28:36 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun,  1 Feb 2026 12:27:08 +0100
Message-ID: <20260201112834.3378-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-WP-DKIM-Status: good (id: wp.pl) 
X-WP-MailID: 704c276ecd49b0c0ab7a0051055d0b4b
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000008 [wfs3]                               
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [Linux-stm32] [PATCH] crypto: testmgr - Add test vectors for
	authenc(hmac(md5), cbc(des3_ede))
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
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-crypto@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:olek2@wp.pl,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olek2@wp.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: B99E3C5BE3
X-Rspamd-Action: no action

Test vector was generated using a software implementation and then double
checked using a hardware implementation on NXP P2020 (talitos). The
encryption part is identical to authenc(hmac(sha1),cbc(des3_ede)),
only HMAC is different.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 crypto/testmgr.c |  7 ++++++
 crypto/testmgr.h | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index f3e068382073..0fef46c35367 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4086,6 +4086,13 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.aead = __VECS(hmac_md5_aes_cbc_tv_temp)
 		}
+	}, {
+		.alg = "authenc(hmac(md5),cbc(des3_ede))",
+		.generic_driver = "authenc(hmac-md5-lib,cbc(des3_ede-generic))",
+		.test = alg_test_aead,
+		.suite = {
+			.aead = __VECS(hmac_md5_des3_ede_cbc_tv_temp)
+		}
 	}, {
 		.alg = "authenc(hmac(md5),ecb(cipher_null))",
 		.generic_driver = "authenc(hmac-md5-lib,ecb-cipher_null)",
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index dd690da11bae..c582255373d1 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -17481,6 +17481,65 @@ static const struct aead_testvec hmac_sha512_des_cbc_tv_temp[] = {
 	},
 };
 
+static const struct aead_testvec hmac_md5_des3_ede_cbc_tv_temp[] = {
+	{ /*Generated with cryptopp*/
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x18"	/* enc key length */
+			  "\x11\x22\x33\x44\x55\x66\x77\x88"
+			  "\x99\xaa\xbb\xcc\xdd\xee\xff\x11"
+			  "\xE9\xC0\xFF\x2E\x76\x0B\x64\x24"
+			  "\x44\x4D\x99\x5A\x12\xD6\x40\xC0"
+			  "\xEA\xC2\x84\xE8\x14\x95\xDB\xE8",
+		.klen	= 8 + 16 + 24,
+		.iv	= "\x7D\x33\x88\x93\x0F\x93\xB2\x42",
+		.assoc  = "\x00\x00\x43\x21\x00\x00\x00\x01"
+			  "\x7D\x33\x88\x93\x0F\x93\xB2\x42",
+		.alen   = 16,
+		.ptext	= "\x6f\x54\x20\x6f\x61\x4d\x79\x6e"
+			  "\x53\x20\x63\x65\x65\x72\x73\x74"
+			  "\x54\x20\x6f\x6f\x4d\x20\x6e\x61"
+			  "\x20\x79\x65\x53\x72\x63\x74\x65"
+			  "\x20\x73\x6f\x54\x20\x6f\x61\x4d"
+			  "\x79\x6e\x53\x20\x63\x65\x65\x72"
+			  "\x73\x74\x54\x20\x6f\x6f\x4d\x20"
+			  "\x6e\x61\x20\x79\x65\x53\x72\x63"
+			  "\x74\x65\x20\x73\x6f\x54\x20\x6f"
+			  "\x61\x4d\x79\x6e\x53\x20\x63\x65"
+			  "\x65\x72\x73\x74\x54\x20\x6f\x6f"
+			  "\x4d\x20\x6e\x61\x20\x79\x65\x53"
+			  "\x72\x63\x74\x65\x20\x73\x6f\x54"
+			  "\x20\x6f\x61\x4d\x79\x6e\x53\x20"
+			  "\x63\x65\x65\x72\x73\x74\x54\x20"
+			  "\x6f\x6f\x4d\x20\x6e\x61\x0a\x79",
+		.plen	= 128,
+		.ctext	= "\x0e\x2d\xb6\x97\x3c\x56\x33\xf4"
+			  "\x67\x17\x21\xc7\x6e\x8a\xd5\x49"
+			  "\x74\xb3\x49\x05\xc5\x1c\xd0\xed"
+			  "\x12\x56\x5c\x53\x96\xb6\x00\x7d"
+			  "\x90\x48\xfc\xf5\x8d\x29\x39\xcc"
+			  "\x8a\xd5\x35\x18\x36\x23\x4e\xd7"
+			  "\x76\xd1\xda\x0c\x94\x67\xbb\x04"
+			  "\x8b\xf2\x03\x6c\xa8\xcf\xb6\xea"
+			  "\x22\x64\x47\xaa\x8f\x75\x13\xbf"
+			  "\x9f\xc2\xc3\xf0\xc9\x56\xc5\x7a"
+			  "\x71\x63\x2e\x89\x7b\x1e\x12\xca"
+			  "\xe2\x5f\xaf\xd8\xa4\xf8\xc9\x7a"
+			  "\xd6\xf9\x21\x31\x62\x44\x45\xa6"
+			  "\xd6\xbc\x5a\xd3\x2d\x54\x43\xcc"
+			  "\x9d\xde\xa5\x70\xe9\x42\x45\x8a"
+			  "\x6b\xfa\xb1\x91\x13\xb0\xd9\x19"
+			  "\x99\x09\xfb\x05\x35\xc8\xcc\x38"
+			  "\xc3\x1e\x5e\xe1\xe6\x96\x84\xc8",
+			  .clen	= 128 + 16,
+	},
+};
+
 static const struct aead_testvec hmac_sha1_des3_ede_cbc_tv_temp[] = {
 	{ /*Generated with cryptopp*/
 #ifdef __LITTLE_ENDIAN
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
