Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9LDUOmdRh2niWQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Feb 2026 15:51:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5823B106416
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Feb 2026 15:51:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0810C8F261;
	Sat,  7 Feb 2026 14:51:18 +0000 (UTC)
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A58A1C87ECF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Feb 2026 14:51:17 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 30724 invoked from network);
 7 Feb 2026 15:51:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
 t=1770475876; bh=g8RweSPsSx90HGKGWAf4fbdUjyVCzKHo/JKtMVQFa5s=;
 h=From:To:Cc:Subject;
 b=WyJj2duGCo2fZY760i4V2WxafPRpd8OLmZArPEyF5d43kqbdwL/o6IN7x1Dc3HAmp
 af6BlUUfCbKRAD6jIFfnanEHS8hJ2wyVddBfPCFt/0X2Y8JLR8mlKW+5deYII2F/ss
 ru7RkbsayF0ZgNuGCI1ApS99Kb2EFnlkeQ7Z0c7E/jf2zOxwi/rRUzqNsoK71SnxDu
 9f4RqCq1IZcR0YjCStWlPuSfwbClwzx2FGKDQU9RU21wpe5YTPFPSig8OihRwq7VmG
 cZNMJxgq1NsLptht3IH1aUj8ISW1d7Ck7QPFV20k656kfeQfSyg3A37y9EwxqpcRFL
 M0S7hDUAgQF9A==
Received: from 83.5.238.100.ipv4.supernova.orange.pl (HELO laptop-olek.lan)
 (olek2@wp.pl@[83.5.238.100]) (envelope-sender <olek2@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
 for <herbert@gondor.apana.org.au>; 7 Feb 2026 15:51:16 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat,  7 Feb 2026 15:51:03 +0100
Message-ID: <20260207145113.375192-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-WP-DKIM-Status: good (id: wp.pl) 
X-WP-MailID: 48011265b9172d94413420b8c64bca8f
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000008 [ERv0]                               
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [Linux-stm32] [PATCH] crypto: testmgr - Add test vectors for
	authenc(hmac(md5), cbc(des))
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
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olek2@wp.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5823B106416
X-Rspamd-Action: no action

Test vector was generated using a software implementation and then double
checked on Mediatek MT7981 (safexcel) and NXP P2020 (talitos). Both
platforms pass self-tests.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 crypto/testmgr.c |  7 ++++++
 crypto/testmgr.h | 57 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 3d60d9ae9416..a14829b67894 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4079,6 +4079,13 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.aead = __VECS(aegis128_tv_template)
 		}
+	}, {
+		.alg = "authenc(hmac(md5),cbc(des))",
+		.generic_driver = "authenc(hmac-md5-lib,cbc(des-generic))",
+		.test = alg_test_aead,
+		.suite = {
+			.aead = __VECS(hmac_md5_des_cbc_tv_temp)
+		}
 	}, {
 		.alg = "authenc(hmac(md5),cbc(des3_ede))",
 		.generic_driver = "authenc(hmac-md5-lib,cbc(des3_ede-generic))",
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 92b54038d24a..971a1129236c 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -17509,6 +17509,63 @@ static const struct aead_testvec hmac_sha512_aes_cbc_tv_temp[] = {
 	},
 };
 
+static const struct aead_testvec hmac_md5_des_cbc_tv_temp[] = {
+	{ /*Generated with cryptopp*/
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x08"	/* enc key length */
+			  "\x11\x22\x33\x44\x55\x66\x77\x88"
+			  "\x99\xaa\xbb\xcc\xdd\xee\xff\x11"
+			  "\xE9\xC0\xFF\x2E\x76\x0B\x64\x24",
+		.klen	= 8 + 16 + 8,
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
+		.ctext	= "\x70\xd6\xde\x64\x87\x17\xf1\xe8"
+			  "\x54\x31\x85\x37\xed\x6b\x01\x8d"
+			  "\xe3\xcc\xe0\x1d\x5e\xf3\xfe\xf1"
+			  "\x41\xaa\x33\x91\xa7\x7d\x99\x88"
+			  "\x4d\x85\x6e\x2f\xa3\x69\xf5\x82"
+			  "\x3a\x6f\x25\xcb\x7d\x58\x1f\x9b"
+			  "\xaa\x9c\x11\xd5\x76\x67\xce\xde"
+			  "\x56\xd7\x5a\x80\x69\xea\x3a\x02"
+			  "\xf0\xc7\x7c\xe3\xcb\x40\xe5\x52"
+			  "\xd1\x10\x92\x78\x0b\x8e\x5b\xf1"
+			  "\xe3\x26\x1f\xe1\x15\x41\xc7\xba"
+			  "\x99\xdb\x08\x51\x1c\xd3\x01\xf4"
+			  "\x87\x47\x39\xb8\xd2\xdd\xbd\xfb"
+			  "\x66\x13\xdf\x1c\x01\x44\xf0\x7a"
+			  "\x1a\x6b\x13\xf5\xd5\x0b\xb8\xba"
+			  "\x53\xba\xe1\x76\xe3\x82\x07\x86"
+			  "\x95\x9e\x7d\x37\x1e\x60\xaf\x7c"
+			  "\x53\x12\x61\x68\xef\xb4\x47\xa6",
+			  .clen	= 128 + 16,
+	},
+};
+
 static const struct aead_testvec hmac_sha1_des_cbc_tv_temp[] = {
 	{ /*Generated with cryptopp*/
 #ifdef __LITTLE_ENDIAN
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
