Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKKDJqOG72kBCQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B504759E8
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16EFEC5F1E9;
	Mon, 27 Apr 2026 15:54:10 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72180C87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2026 15:21:48 +0000 (UTC)
Received: from [127.0.1.1] (unknown [52.177.6.131])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5914F20B7165;
 Thu, 23 Apr 2026 08:21:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5914F20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1776957707;
 bh=2WGY0Xr4OWcuoDKIFjbEVHuS8imyUOJyUmF5Ad3Krqw=;
 h=From:Date:Subject:To:Cc:From;
 b=UfD9SlG8qmtSdJze3JZv8FkmAj1BKyxhCCKdbuCe+jgLX3FGKQkj3yQa5VtGB6Rj9
 YoBSzF0PhML3dQ/4N/1UGK5MGtA/q5K+Wbwr+AbM8fCoqq49QTpiqC37sw8FLZ60ZX
 rQgSpSOY/8vAOJJcH2ny2gClneX0b9jQmL3LdZzs=
From: Jeff Barnes <jeffbarnes@linux.microsoft.com>
Date: Thu, 23 Apr 2026 11:21:41 -0400
MIME-Version: 1.0
Message-Id: <20260423-disallow_rsa_sha1_signing_in_fips_mode-v2-1-a5fe72dd8a71@linux.microsoft.com>
X-B4-Tracking: v=1; b=H4sIAAQ56mkC/5WNSw6CMBRFt0I6toY+AcWR+zCk6RdeAi3pI6gh7
 N3KDswdnTs4Z2PkEjpi92Jjya1IGEMGOBXMDCr0jqPNzKCEpqwAuEVS4xhfMpGSNCghCfuAoZc
 YpMeZ5BSt4zevdQPQKltXLMvm5Dy+j9CzyzwgLTF9ju4qfu/fiVXwvEvdanO1ldDuMaFJkaJfz
 iZOrNv3/Qt9rp+Z4AAAAA==
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Spam-Status: No, score=-3.0 required=1.7 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU autolearn=ham autolearn_force=no
 version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
Cc: linux-kernel@vger.kernel.org, Jeff Barnes <jeffbarnes@linux.microsoft.com>,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] crypto: testmgr - disallow RSA PKCS#1
 SHA-1 sig algs in FIPS mode
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
X-Rspamd-Queue-Id: 67B504759E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[linux.microsoft.com:s=default];
	DATE_IN_PAST(1.00)[96];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.microsoft.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,gmail.com,foss.st.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-kernel@vger.kernel.org,m:jeffbarnes@linux.microsoft.com,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jeffbarnes@linux.microsoft.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.microsoft.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.935];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeffbarnes@linux.microsoft.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]

When booted with fips=1, RSA signature generation using SHA-1 must not be
available.  However, pkcs1pad(rsa,sha1) can currently be instantiated
because it is not present in alg_test_descs; alg_test() falls through the
no_test path and succeeds, after which the algorithm appears in
/proc/crypto as fips-capable.

Add explicit alg_test_descs entries for pkcs1pad(rsa,sha1) and
pkcs1(rsa,sha1) without marking them fips_allowed, so they are treated as
not FIPS-allowed when fips=1 is enabled.

Include both names to cover kernels where RSA sign/verify is provided via
the pkcs1(...) signature template, while pkcs1pad(...) remains for the
traditional wrapper naming and/or RSAES operations.

Signed-off-by: Jeff Barnes <jeffbarnes@linux.microsoft.com>
---
This series fixes an issue where SHA-1 RSA signature generation remains
available when booted with fips=1.

On a FIPS-enabled system, pkcs1pad(rsa,sha1) can be instantiated even
though SHA-1 must not be available for signature generation. The reason
is that the algorithm is not listed in crypto/testmgr.c's alg_test_descs,
so alg_test() falls through the no_test path and succeeds. Once
instantiated, /proc/crypto reports the algorithm as "fips: yes".

This patch adds explicit alg_test_descs entries for:

  - pkcs1pad(rsa,sha1)
  - pkcs1(rsa,sha1)

without setting fips=1, so they are treated as not FIPS-allowed in
FIPS mode.

Both names are covered to handle kernels where RSA signature operations
are provided via the pkcs1(...) signature template, while pkcs1pad(...)
remains for the historical wrapper naming and/or RSAES operations.

Reproducer / evidence (current behavior):
  1) Boot with fips=1 (confirm /proc/sys/crypto/fips_enabled == 1)
  2) Allocate the transform:
       crypto_alloc_akcipher("pkcs1pad(rsa,sha1)", 0, 0)
  3) Observe that /proc/crypto now contains:
       name   : pkcs1pad(rsa,sha1)
       fips   : yes
       selftest: passed
  4) A simple in-kernel demo module can instantiate the transform and reach
     the signing path in FIPS mode.

With this change, attempts to instantiate these SHA-1 RSA signing
templates in FIPS mode are rejected, preventing SHA-1 signature
generation in approved mode.

Thanks for taking a look.
---
Changes in v2:
- Rewrap commit message body to conform to 75-column limit
- Fix From/Signed-off-by address mismatch
Link to v1: https://lore.kernel.org/r/20260422-disallow_rsa_sha1_signing_in_fips_mode-v1-1-1359bc7d41be@microsoft.com
---
 crypto/testmgr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 30671e7bc349..e54d298a26c1 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5306,6 +5306,9 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.sig = __VECS(pkcs1_rsa_none_tv_template)
 		}
+	}, {
+		.alg = "pkcs1(rsa,sha1)",
+		.test = alg_test_null,
 	}, {
 		.alg = "pkcs1(rsa,sha224)",
 		.test = alg_test_null,
@@ -5341,6 +5344,9 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "pkcs1pad(rsa)",
 		.test = alg_test_null,
 		.fips_allowed = 1,
+	}, {
+		.alg = "pkcs1pad(rsa,sha1)",
+		.test = alg_test_null,
 	}, {
 		.alg = "rfc3686(ctr(aes))",
 		.generic_driver = "rfc3686(ctr(aes-lib))",

---
base-commit: 8879a3c110cb8ca5a69c937643f226697aa551d9
change-id: 20260422-disallow_rsa_sha1_signing_in_fips_mode-8fbb6229ad54

Best regards,
-- 
Jeff Barnes <jeffbarnes@linux.microsoft.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
