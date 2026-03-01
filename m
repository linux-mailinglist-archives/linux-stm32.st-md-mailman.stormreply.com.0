Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HULCblApWkg7AUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 08:48:09 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD991D420B
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 08:48:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 486E8C5663A;
	Mon,  2 Mar 2026 07:48:08 +0000 (UTC)
Received: from smtpo67.poczta.onet.pl (smtpo67.poczta.onet.pl [141.105.16.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEA84C030D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 15:54:49 +0000 (UTC)
Received: from laptop-olek.lan (83.24.116.171.ipv4.supernova.orange.pl
 [83.24.116.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: aleksaander@onet.pl)
 by smtp.poczta.onet.pl (Onet) with ESMTPSA id 4fP67x2PW4z1yPN;
 Sun,  1 Mar 2026 16:54:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onet.pl; s=2011;
 t=1772380483; bh=CWWljyeTXpcrrdYkBL5S3tW7oQHbh58qXHfzE8MsFHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c0hnQ+qApzy9Mrhfw7WT76OmFir97p1V/mS0qET5IZxDHrJ4xmbWYdAZmgLznB3A3
 xSmNxDaQXOSnH0Bl9nbbu0ThorY6trJvcNPQPyQFEq9ZBdaHolyJ1FCQoJVkHNKKR4
 4PxmFwZvKmUHh20xvho6KzgzXzEXOuFyme+YxtDs=
From: Aleksander Jan Bajkowski <aleksaander@onet.pl>
To: herbert@gondor.apana.org.au, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun,  1 Mar 2026 16:53:42 +0100
Message-ID: <20260301155351.5840-5-aleksaander@onet.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260301155351.5840-1-aleksaander@onet.pl>
References: <20260301155351.5840-1-aleksaander@onet.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Mar 2026 07:48:07 +0000
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [Linux-stm32] [PATCH 5/5] crypto: testmgr - Add test vectors for
	authenc(hmac(sha512), rfc3686(ctr(aes)))
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
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[onet.pl : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[onet.pl:s=2011];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-crypto@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:olek2@wp.pl,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[onet.pl];
	FREEMAIL_CC(0.00)[wp.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[aleksaander@onet.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[onet.pl:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.951];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aleksaander@onet.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[onet.pl:mid,wp.pl:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: BBD991D420B
X-Rspamd-Action: no action

From: Aleksander Jan Bajkowski <olek2@wp.pl>

Test vectors were generated starting from existing RFC3686(CTR(AES)) test
vectors and adding HMAC(SHA512) computed with software implementation.
Then, the results were double-checked on Mediatek MT7986 (safexcel).
Platform pass self-tests.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 crypto/testmgr.c |   6 +-
 crypto/testmgr.h | 291 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 296 insertions(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index ae969d196cf0..c56356c3c889 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4280,8 +4280,12 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.fips_allowed = 1,
 	}, {
 		.alg = "authenc(hmac(sha512),rfc3686(ctr(aes)))",
-		.test = alg_test_null,
+		.generic_driver = "authenc(hmac-sha512-lib,rfc3686(ctr(aes-generic)))",
+		.test = alg_test_aead,
 		.fips_allowed = 1,
+		.suite = {
+			.aead = __VECS(hmac_sha512_aes_ctr_rfc3686_tv_temp)
+		}
 	}, {
 		.alg = "blake2b-160",
 		.generic_driver = "blake2b-160-lib",
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 7fa97fe5fd68..f6852153dec0 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -17091,6 +17091,297 @@ static const struct aead_testvec hmac_sha512_aes_cbc_tv_temp[] = {
 	},
 };
 
+static const struct aead_testvec hmac_sha512_aes_ctr_rfc3686_tv_temp[] = {
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
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\xae\x68\x52\xf8\x12\x10\x67\xcc"
+			  "\x4b\xf7\xa5\x76\x55\x77\xf3\x9e"
+			  "\x00\x00\x00\x30",
+		.klen	= 8 + 64 + 20,
+		.iv	= "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.assoc	= "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\xe4\x09\x5d\x4f\xb7\xa7\xb3\x79"
+			  "\x2d\x61\x75\xa3\x26\x13\x11\xb8"
+			  "\xa4\x45\x3a\x44\x9c\xe5\x1c\xd9"
+			  "\x10\x43\x51\x2e\x76\x5e\xf8\x9d"
+			  "\x03\x12\x1a\x31\x00\x33\x10\xb4"
+			  "\x94\x4b\x70\x84\x6c\xda\xb1\x46"
+			  "\x24\xb6\x3b\x2a\xec\xd5\x67\xb8"
+			  "\x65\xa2\xbd\xac\x18\xe2\xf8\x55"
+			  "\xc6\x91\xb0\x92\x84\x2d\x74\x44"
+			  "\xa7\xee\xc3\x44\xa0\x07\x0e\x62",
+		.clen	= 16 + 64,
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
+			  "\x30\x31\x32\x33\x34\x35\x36\x37"
+			  "\x38\x39\x3a\x3b\x3c\x3d\x3e\x3f"
+			  "\x40\x41\x42\x43\x44\x45\x46\x47"
+			  "\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f"
+			  "\x50\x51\x52\x53\x54\x55\x56\x57"
+			  "\x58\x59\x5a\x5b\x5c\x5d\x5e\x5f"
+			  "\x7e\x24\x06\x78\x17\xfa\xe0\xd7"
+			  "\x43\xd6\xce\x1f\x32\x53\x91\x63"
+			  "\x00\x6c\xb6\xdb",
+		.klen	= 8 + 64 + 20,
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
+			  "\xec\x67\x0d\xb3\xbd\x98\x13\x01"
+			  "\x2b\x04\x9b\xe6\x06\x67\x3c\x76"
+			  "\xcd\x41\xb7\xcc\x70\x6c\x7f\xc8"
+			  "\x67\xbd\x22\x39\xb2\xaa\xe8\x88"
+			  "\xe0\x4f\x81\x52\xdf\xc9\xc3\xd6"
+			  "\x44\xf4\x66\x33\x87\x64\x61\x02"
+			  "\x02\xa2\x64\x15\x2b\xe9\x0b\x3d"
+			  "\x4c\xea\xa1\xa5\xa7\xc9\xd3\x1b",
+		.clen	= 32 + 64,
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
+			  "\x22\x33\x44\x55\x66\x77\x88\x99"
+			  "\xaa\xbb\xcc\xdd\xee\xff\x11\x22"
+			  "\x33\x44\x55\x66\x77\x88\x99\xaa"
+			  "\xbb\xcc\xdd\xee\xff\x11\x22\x33"
+			  "\x44\x55\x66\x77\x88\x99\xaa\xbb"
+			  "\xcc\xdd\xee\xff\x11\x22\x33\x44"
+			  "\x76\x91\xbe\x03\x5e\x50\x20\xa8"
+			  "\xac\x6e\x61\x85\x29\xf9\xa0\xdc"
+			  "\x00\xe0\x01\x7b",
+		.klen	= 8 + 64 + 20,
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
+			  "\x6f\x90\xb6\xa3\x35\x43\x59\xff"
+			  "\x1e\x32\xd6\xfe\xfa\x33\xf9\xf0"
+			  "\x31\x2f\x03\x2d\x88\x1d\xab\xbf"
+			  "\x0e\x19\x16\xd9\xf3\x98\x3e\xdd"
+			  "\x0c\xec\xfe\xe8\x89\x13\x91\x15"
+			  "\xf6\x61\x65\x5c\x1b\x7d\xde\xc0"
+			  "\xe4\xba\x6d\x27\xe2\x89\x23\x24"
+			  "\x15\x82\x37\x3d\x48\xd3\xc9\x32",
+		.clen	= 36 + 64,
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
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x16\xaf\x5b\x14\x5f\xc9\xf5\x79"
+			  "\xc1\x75\xf9\x3e\x3b\xfb\x0e\xed"
+			  "\x86\x3d\x06\xcc\xfd\xb7\x85\x15"
+			  "\x00\x00\x00\x48",
+		.klen	= 8 + 64 + 28,
+		.iv	= "\x36\x73\x3c\x14\x7d\x6d\x93\xcb",
+		.assoc	= "\x36\x73\x3c\x14\x7d\x6d\x93\xcb",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\x4b\x55\x38\x4f\xe2\x59\xc9\xc8"
+			  "\x4e\x79\x35\xa0\x03\xcb\xe9\x28"
+			  "\x25\xea\xdc\xad\x52\xb8\x0f\x70"
+			  "\xe7\x39\x83\x80\x10\x3f\x18\xc4"
+			  "\xf8\x59\x14\x25\x5f\xba\x20\x87"
+			  "\x0b\x04\x5e\xf7\xde\x41\x39\xff"
+			  "\xa2\xee\x84\x3f\x9d\x38\xfd\x17"
+			  "\xc0\x66\x5e\x74\x39\xe3\xd3\xd7"
+			  "\x3d\xbc\xe3\x99\x2f\xe7\xef\x37"
+			  "\x61\x03\xf3\x9e\x01\xaf\xba\x9d",
+		.clen	= 16 + 64,
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
+			  "\x30\x31\x32\x33\x34\x35\x36\x37"
+			  "\x38\x39\x3a\x3b\x3c\x3d\x3e\x3f"
+			  "\x40\x41\x42\x43\x44\x45\x46\x47"
+			  "\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f"
+			  "\x50\x51\x52\x53\x54\x55\x56\x57"
+			  "\x58\x59\x5a\x5b\x5c\x5d\x5e\x5f"
+			  "\x7c\x5c\xb2\x40\x1b\x3d\xc3\x3c"
+			  "\x19\xe7\x34\x08\x19\xe0\xf6\x9c"
+			  "\x67\x8c\x3d\xb8\xe6\xf6\xa9\x1a"
+			  "\x00\x96\xb0\x3b",
+		.klen	= 8 + 64 + 28,
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
+			  "\x51\xa3\xe6\x1d\x23\x7d\xd1\x18"
+			  "\x55\x9c\x1c\x92\x2b\xc2\xcd\xfe"
+			  "\x8a\xa8\xa5\x96\x65\x2e\x9d\xdb"
+			  "\x06\xd2\x1c\x57\x2b\x76\xb5\x9c"
+			  "\xd4\x3e\x8b\x61\x54\x2d\x08\xe5"
+			  "\xb2\xf8\x88\x20\x0c\xad\xe8\x85"
+			  "\x61\x8e\x5c\xa4\x96\x2c\xe2\x7d"
+			  "\x4f\xb6\x1d\xb2\x8c\xd7\xe3\x38",
+		.clen	= 32 + 64,
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
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x77\x6b\xef\xf2\x85\x1d\xb0\x6f"
+			  "\x4c\x8a\x05\x42\xc8\x69\x6f\x6c"
+			  "\x6a\x81\xaf\x1e\xec\x96\xb4\xd3"
+			  "\x7f\xc1\xd6\x89\xe6\xc1\xc1\x04"
+			  "\x00\x00\x00\x60",
+		.klen	= 8 + 64 + 36,
+		.iv	= "\xdb\x56\x72\xc9\x7a\xa8\xf0\xb2",
+		.assoc	= "\xdb\x56\x72\xc9\x7a\xa8\xf0\xb2",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\x14\x5a\xd0\x1d\xbf\x82\x4e\xc7"
+			  "\x56\x08\x63\xdc\x71\xe3\xe0\xc0"
+			  "\x6b\x68\x0b\x99\x9a\x4d\xc8\xb9"
+			  "\x35\xea\xcd\x56\x3f\x40\xa2\xb6"
+			  "\x68\xda\x59\xd8\xa0\x89\xcd\x52"
+			  "\xb1\x6e\xed\xc1\x42\x10\xa5\x0f"
+			  "\x88\x0b\x80\xce\xc4\x67\xf0\x45"
+			  "\x5d\xb2\x9e\xde\x1c\x79\x52\x0d"
+			  "\xff\x75\x36\xd5\x0f\x52\x8e\xe5"
+			  "\x31\x85\xcf\x1d\x31\xf8\x62\x67",
+		.clen	= 16 + 64,
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
+			  "\x30\x31\x32\x33\x34\x35\x36\x37"
+			  "\x38\x39\x3a\x3b\x3c\x3d\x3e\x3f"
+			  "\x40\x41\x42\x43\x44\x45\x46\x47"
+			  "\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f"
+			  "\x50\x51\x52\x53\x54\x55\x56\x57"
+			  "\x58\x59\x5a\x5b\x5c\x5d\x5e\x5f"
+			  "\xf6\xd6\x6d\x6b\xd5\x2d\x59\xbb"
+			  "\x07\x96\x36\x58\x79\xef\xf8\x86"
+			  "\xc6\x6d\xd5\x1a\x5b\x6a\x99\x74"
+			  "\x4b\x50\x59\x0c\x87\xa2\x38\x84"
+			  "\x00\xfa\xac\x24",
+		.klen	= 8 + 64 + 36,
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
+			  "\x9a\xac\x38\xbd\xf3\xcf\xd5\xd0"
+			  "\x09\x07\xa6\xe1\x7f\xd6\x79\x98"
+			  "\x4e\x90\x0e\xc0\x3d\xa0\xf2\x12"
+			  "\x52\x79\x9c\x17\xff\xb9\xb8\xe3"
+			  "\x2f\x31\xcb\xbd\x63\x70\x72\x7b"
+			  "\x4e\x1e\xd1\xde\xb5\x6b\x7d\x54"
+			  "\x68\x56\xdd\xe5\x53\xee\x29\xd2"
+			  "\x85\xa1\x73\x61\x00\xa9\x26\x8f",
+		.clen	= 32 + 64,
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
