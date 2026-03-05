Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePcvEELjqWl1HAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 21:10:42 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C3221800E
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 21:10:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B2A9C8F26E;
	Thu,  5 Mar 2026 20:10:41 +0000 (UTC)
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16E99C8F26D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 20:10:39 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 46920 invoked from network);
 5 Mar 2026 21:10:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
 t=1772741438; bh=G5Gj/FdJXLAflQMWWZlCHZY2f41mFn+DjNy+2rUUMNc=;
 h=From:To:Cc:Subject;
 b=dbiWWkyLE5FpA77qWAeY/JbqFX+O4q3CMZ1A4CRCINjvclulTDBaIDTpe0qXvspb+
 DhA1wQRHdDueAVS2gyFVKzXsbHLOUgcvllpkUR7olFiwLG8eJeNQVuQn1dsV3ajsBF
 Tu10jHzPYnDrinLfZ52+dxQONs8knHF35NNbl9BvXvcBG95ns3J/FFoWK2KhOm9ILl
 QOsvxyRqTSL2RyyY2W4KbtcvP2ZH51bRzfqdII5qc1XLSH1ubAauEJeXWYYQT8FQwa
 lRdtsaUfsDxblBO57Cd4YyqI4Tcc2/WnXvwVsdfZBp4Qcp3CpK/TIGxvfoB3Ik11/W
 LxzYzE/gZWkdw==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan)
 (olek2@wp.pl@[83.24.116.171]) (envelope-sender <olek2@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
 for <herbert@gondor.apana.org.au>; 5 Mar 2026 21:10:38 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  5 Mar 2026 21:08:20 +0100
Message-ID: <20260305201036.63280-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-WP-DKIM-Status: good (id: wp.pl) 
X-WP-MailID: 952f8e22d526090698749299813a85c1
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [AMPx]                               
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [Linux-stm32] [PATCH v2 1/5] crypto: testmgr - Add test vectors for
	authenc(hmac(sha1), rfc3686(ctr(aes)))
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
X-Rspamd-Queue-Id: D5C3221800E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[wp.pl:s=20241105];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[wp.pl : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-crypto@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:olek2@wp.pl,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[wp.pl];
	FORGED_SENDER(0.00)[olek2@wp.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wp.pl:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olek2@wp.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[wp.pl];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.417];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Test vectors were generated starting from existing RFC3686(CTR(AES)) test
vectors and adding HMAC(SHA1) computed with software implementation.
Then, the results were double-checked on Mediatek MT7986 (safexcel).
Platform pass self-tests.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v2:
- rename aes-generic -> aes-lib
---
 crypto/testmgr.c |   6 +-
 crypto/testmgr.h | 221 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 4985411dedae..abbaaafa2502 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4128,8 +4128,12 @@ static const struct alg_test_desc alg_test_descs[] = {
 		}
 	}, {
 		.alg = "authenc(hmac(sha1),rfc3686(ctr(aes)))",
-		.test = alg_test_null,
+		.generic_driver = "authenc(hmac-sha1-lib,rfc3686(ctr(aes-lib)))",
+		.test = alg_test_aead,
 		.fips_allowed = 1,
+		.suite = {
+			.aead = __VECS(hmac_sha1_aes_ctr_rfc3686_tv_temp)
+		}
 	}, {
 		.alg = "authenc(hmac(sha224),cbc(aes))",
 		.generic_driver = "authenc(hmac-sha224-lib,cbc(aes-lib))",
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 1c69c11c0cdb..4efc22899fec 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -14873,6 +14873,227 @@ static const struct aead_testvec hmac_sha1_aes_cbc_tv_temp[] = {
 	},
 };
 
+static const struct aead_testvec hmac_sha1_aes_ctr_rfc3686_tv_temp[] = {
+	{ /* RFC 3686 Case 1 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x14"	/* enc key length */
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00"
+			  "\xae\x68\x52\xf8\x12\x10\x67\xcc"
+			  "\x4b\xf7\xa5\x76\x55\x77\xf3\x9e"
+			  "\x00\x00\x00\x30",
+		.klen	= 8 + 20 + 20,
+		.iv	= "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.assoc	= "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\xe4\x09\x5d\x4f\xb7\xa7\xb3\x79"
+			  "\x2d\x61\x75\xa3\x26\x13\x11\xb8"
+			  "\x70\xdc\x6b\x62\x43\xa1\x2f\x08"
+			  "\xf1\xec\x93\x7d\x69\xb2\x8e\x1f"
+			  "\x0a\x97\x39\x86",
+		.clen	= 16 + 20,
+	}, { /* RFC 3686 Case 2 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x14"	/* enc key length */
+			  "\x20\x21\x22\x23\x24\x25\x26\x27"
+			  "\x28\x29\x2a\x2b\x2c\x2d\x2e\x2f"
+			  "\x30\x31\x32\x33"
+			  "\x7e\x24\x06\x78\x17\xfa\xe0\xd7"
+			  "\x43\xd6\xce\x1f\x32\x53\x91\x63"
+			  "\x00\x6c\xb6\xdb",
+		.klen	= 8 + 20 + 20,
+		.iv	= "\xc0\x54\x3b\x59\xda\x48\xd9\x0b",
+		.assoc	= "\xc0\x54\x3b\x59\xda\x48\xd9\x0b",
+		.alen	= 8,
+		.ptext	= "\x00\x01\x02\x03\x04\x05\x06\x07"
+			  "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
+			  "\x10\x11\x12\x13\x14\x15\x16\x17"
+			  "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f",
+		.plen	= 32,
+		.ctext	= "\x51\x04\xa1\x06\x16\x8a\x72\xd9"
+			  "\x79\x0d\x41\xee\x8e\xda\xd3\x88"
+			  "\xeb\x2e\x1e\xfc\x46\xda\x57\xc8"
+			  "\xfc\xe6\x30\xdf\x91\x41\xbe\x28"
+			  "\x6b\x7b\x4d\x39\x36\x1c\x12\x5f"
+			  "\x72\xd2\x88\xb2\x26\xa6\xa6\xb5"
+			  "\x1d\x3a\x49\xa6",
+		.clen	= 32 + 20,
+	}, { /* RFC 3686 Case 3 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x14"	/* enc key length */
+			  "\x11\x22\x33\x44\x55\x66\x77\x88"
+			  "\x99\xaa\xbb\xcc\xdd\xee\xff\x11"
+			  "\x22\x33\x44\x55"
+			  "\x76\x91\xbe\x03\x5e\x50\x20\xa8"
+			  "\xac\x6e\x61\x85\x29\xf9\xa0\xdc"
+			  "\x00\xe0\x01\x7b",
+		.klen	= 8 + 20 + 20,
+		.iv	= "\x27\x77\x7f\x3f\x4a\x17\x86\xf0",
+		.assoc	= "\x27\x77\x7f\x3f\x4a\x17\x86\xf0",
+		.alen	= 8,
+		.ptext	= "\x00\x01\x02\x03\x04\x05\x06\x07"
+			  "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
+			  "\x10\x11\x12\x13\x14\x15\x16\x17"
+			  "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f"
+			  "\x20\x21\x22\x23",
+		.plen	= 36,
+		.ctext	= "\xc1\xcf\x48\xa8\x9f\x2f\xfd\xd9"
+			  "\xcf\x46\x52\xe9\xef\xdb\x72\xd7"
+			  "\x45\x40\xa4\x2b\xde\x6d\x78\x36"
+			  "\xd5\x9a\x5c\xea\xae\xf3\x10\x53"
+			  "\x25\xb2\x07\x2f"
+			  "\x2c\x86\xa0\x90\x8e\xc1\x02\x1d"
+			  "\x51\xdc\xd6\x21\xc7\x30\xcc\x32"
+			  "\x38\x55\x47\x64",
+		.clen	= 36 + 20,
+	}, { /* RFC 3686 Case 4 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x1c"	/* enc key length */
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00"
+			  "\x16\xaf\x5b\x14\x5f\xc9\xf5\x79"
+			  "\xc1\x75\xf9\x3e\x3b\xfb\x0e\xed"
+			  "\x86\x3d\x06\xcc\xfd\xb7\x85\x15"
+			  "\x00\x00\x00\x48",
+		.klen	= 8 + 20 + 28,
+		.iv	= "\x36\x73\x3c\x14\x7d\x6d\x93\xcb",
+		.assoc	= "\x36\x73\x3c\x14\x7d\x6d\x93\xcb",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\x4b\x55\x38\x4f\xe2\x59\xc9\xc8"
+			  "\x4e\x79\x35\xa0\x03\xcb\xe9\x28"
+			  "\xe9\x4e\x49\xf0\x6b\x8d\x58\x2b"
+			  "\x26\x7f\xf3\xab\xeb\x2f\x74\x2f"
+			  "\x45\x43\x64\xc1",
+		.clen	= 16 + 20,
+	}, { /* RFC 3686 Case 5 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x1c"	/* enc key length */
+			  "\x20\x21\x22\x23\x24\x25\x26\x27"
+			  "\x28\x29\x2a\x2b\x2c\x2d\x2e\x2f"
+			  "\x30\x31\x32\x33"
+			  "\x7c\x5c\xb2\x40\x1b\x3d\xc3\x3c"
+			  "\x19\xe7\x34\x08\x19\xe0\xf6\x9c"
+			  "\x67\x8c\x3d\xb8\xe6\xf6\xa9\x1a"
+			  "\x00\x96\xb0\x3b",
+		.klen	= 8 + 20 + 28,
+		.iv	= "\x02\x0c\x6e\xad\xc2\xcb\x50\x0d",
+		.assoc	= "\x02\x0c\x6e\xad\xc2\xcb\x50\x0d",
+		.alen	= 8,
+		.ptext	= "\x00\x01\x02\x03\x04\x05\x06\x07"
+			  "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
+			  "\x10\x11\x12\x13\x14\x15\x16\x17"
+			  "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f",
+		.plen	= 32,
+		.ctext	= "\x45\x32\x43\xfc\x60\x9b\x23\x32"
+			  "\x7e\xdf\xaa\xfa\x71\x31\xcd\x9f"
+			  "\x84\x90\x70\x1c\x5a\xd4\xa7\x9c"
+			  "\xfc\x1f\xe0\xff\x42\xf4\xfb\x00"
+			  "\xab\xc4\xfa\x6d\x20\xe1\xce\x72"
+			  "\x0e\x92\x4e\x97\xaa\x4d\x30\x84"
+			  "\xb6\xd8\x4d\x3b",
+		.clen	= 32 + 20,
+	}, { /* RFC 3686 Case 7 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x24"	/* enc key length */
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00"
+			  "\x77\x6b\xef\xf2\x85\x1d\xb0\x6f"
+			  "\x4c\x8a\x05\x42\xc8\x69\x6f\x6c"
+			  "\x6a\x81\xaf\x1e\xec\x96\xb4\xd3"
+			  "\x7f\xc1\xd6\x89\xe6\xc1\xc1\x04"
+			  "\x00\x00\x00\x60",
+		.klen	= 8 + 20 + 36,
+		.iv	= "\xdb\x56\x72\xc9\x7a\xa8\xf0\xb2",
+		.assoc	= "\xdb\x56\x72\xc9\x7a\xa8\xf0\xb2",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\x14\x5a\xd0\x1d\xbf\x82\x4e\xc7"
+			  "\x56\x08\x63\xdc\x71\xe3\xe0\xc0"
+			  "\x3d\x6c\x23\x27\xda\x0e\x7f\x29"
+			  "\xfd\x8d\x3c\x1b\xf7\x7a\x63\xd9"
+			  "\x7e\x0f\xe9\xf6",
+		.clen	= 16 + 20,
+	}, { /* RFC 3686 Case 8 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x24"	/* enc key length */
+			  "\x20\x21\x22\x23\x24\x25\x26\x27"
+			  "\x28\x29\x2a\x2b\x2c\x2d\x2e\x2f"
+			  "\x30\x31\x32\x33"
+			  "\xf6\xd6\x6d\x6b\xd5\x2d\x59\xbb"
+			  "\x07\x96\x36\x58\x79\xef\xf8\x86"
+			  "\xc6\x6d\xd5\x1a\x5b\x6a\x99\x74"
+			  "\x4b\x50\x59\x0c\x87\xa2\x38\x84"
+			  "\x00\xfa\xac\x24",
+		.klen	= 8 + 20 + 36,
+		.iv	= "\xc1\x58\x5e\xf1\x5a\x43\xd8\x75",
+		.assoc	= "\xc1\x58\x5e\xf1\x5a\x43\xd8\x75",
+		.alen	= 8,
+		.ptext	= "\x00\x01\x02\x03\x04\x05\x06\x07"
+			  "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
+			  "\x10\x11\x12\x13\x14\x15\x16\x17"
+			  "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f",
+		.plen	= 32,
+		.ctext	= "\xf0\x5e\x23\x1b\x38\x94\x61\x2c"
+			  "\x49\xee\x00\x0b\x80\x4e\xb2\xa9"
+			  "\xb8\x30\x6b\x50\x8f\x83\x9d\x6a"
+			  "\x55\x30\x83\x1d\x93\x44\xaf\x1c"
+			  "\xe7\xee\x22\xa4\xdd\xbf\x5d\x44"
+			  "\x3b\x43\x1c\x69\x55\x11\xd5\xad"
+			  "\x14\x5f\x44\xa6",
+		.clen	= 32 + 20,
+	},
+};
+
 static const struct aead_testvec hmac_sha1_ecb_cipher_null_tv_temp[] = {
 	{ /* Input data from RFC 2410 Case 1 */
 #ifdef __LITTLE_ENDIAN
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
