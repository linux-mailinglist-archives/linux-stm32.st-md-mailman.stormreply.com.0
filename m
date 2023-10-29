Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B87DB7DAE4A
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Oct 2023 21:48:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48213C6B444;
	Sun, 29 Oct 2023 20:48:47 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B816C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Oct 2023 20:48:45 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 94C863FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Oct 2023 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1698612523;
 bh=CZ05zwSbIcchFahU+bSausQMNazT3la51HxfbHwy+5I=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=py+GHluTdHh8pMJBALbmSYiS6ky8DSzBZncEodK5tOnKIO+mlRWqep10emeyWme6/
 ZYDo5H1I5zziUGBTbWS9ZvEZemhxaov87rsKIJ1NftTHoSvmMFoBibmQ+o8gTC0hzd
 Uz9B7raVzSLh8PLuQi1sZdTcRURrTtB8rVwme+CItLq9xFsA3A7JuDZNlIoxGdsznv
 zLKsJGF/ENXlc0EWK0HI8T1H387KpuN2x4qfuh1ETPdLQJ0ry4U0OgFywBR2zithXf
 KujGHnyzyF7rz+7PiYM2HHYq9SgKUWsaXHnujbo1MVdJWEVUYejJfb0uaDjk4Oc9bt
 uu/jh94aTyZqQ==
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32da39f7f2bso1819551f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Oct 2023 13:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698612520; x=1699217320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZ05zwSbIcchFahU+bSausQMNazT3la51HxfbHwy+5I=;
 b=YuhpkIxXbSDp38UWBY+FwitqjCtxSmQ5x49maOvHbY2jCj8v2BUEDmZACyOCMIract
 NJPvULeOcGuKmc9l31zVry8N54yKl0ZZzj7jiFrntDwr1GxqY7tPMhUswnDNYmamdcVb
 SIRiYCLH2tofhPQXWcTwzVyRN8AATxAwMNXzlIbYwxRK7pyPDn+WnyF/wv3aS7zwowsR
 auzkZMeOnn48fXfMG2rYtFJpY9omiJ/Zn/YkljBrQ/UqG/CVFea2z9Xv2mYl9lkofFbU
 n8dvg4WLO2XQDqfrfdjJrtCsaa1UBBik8Of/G09hsmqsb9yFF93ByP8bTAZb5iZL4ZrR
 Lj1g==
X-Gm-Message-State: AOJu0YzIc4i7JtNgFZAWwpvUNakmMwhVCtm1iG5iG30J4qMkMIxxuQPN
 zRP/N2YpBhVxZ/cqw5g8wwqVCPDyf5Q84UIsvjv+B/rOymd84uc0jMNrHA0GM8xfkxDQerobIni
 t++u4c4dsmV/+i3haVjlc6HJmjhaO8Z8v9asWa/q22pIC5xuP3GKwy+YphQ==
X-Received: by 2002:adf:e881:0:b0:32d:7162:7ffe with SMTP id
 d1-20020adfe881000000b0032d71627ffemr6439297wrm.69.1698612520286; 
 Sun, 29 Oct 2023 13:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3296prb3EpPU46aNfWMI+tY2ZtonmUuq5do3RPO8Q2CMxhHwePLbXIh9Z2jhDbnqlm9vTAg==
X-Received: by 2002:adf:e881:0:b0:32d:7162:7ffe with SMTP id
 d1-20020adfe881000000b0032d71627ffemr6439283wrm.69.1698612520054; 
 Sun, 29 Oct 2023 13:48:40 -0700 (PDT)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
 by smtp.gmail.com with ESMTPSA id
 d2-20020adff842000000b0032d9a1f2ec3sm6661495wrq.27.2023.10.29.13.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 13:48:39 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 29 Oct 2023 22:48:23 +0200
Message-Id: <20231029204823.663930-4-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231029204823.663930-1-dimitri.ledkov@canonical.com>
References: <20231029204823.663930-1-dimitri.ledkov@canonical.com>
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 simo@redhat.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 4/4] crypto: drbg - Remove SHA1 from drbg
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

SP800-90C 3rd draft states that SHA-1 will be removed from all
specifications, including drbg by end of 2030. Given kernels built
today will be operating past that date, start complying with upcoming
requirements.

No functional change, as SHA-256 / SHA-512 based DRBG have always been
the preferred ones.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 crypto/drbg.c    | 16 ----------------
 crypto/testmgr.c | 25 ++++---------------------
 2 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/crypto/drbg.c b/crypto/drbg.c
index 99666193d9..bccadaedcf 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -139,12 +139,6 @@ static const struct drbg_core drbg_cores[] = {
 #endif /* CONFIG_CRYPTO_DRBG_CTR */
 #ifdef CONFIG_CRYPTO_DRBG_HASH
 	{
-		.flags = DRBG_HASH | DRBG_STRENGTH128,
-		.statelen = 55, /* 440 bits */
-		.blocklen_bytes = 20,
-		.cra_name = "sha1",
-		.backend_cra_name = "sha1",
-	}, {
 		.flags = DRBG_HASH | DRBG_STRENGTH256,
 		.statelen = 111, /* 888 bits */
 		.blocklen_bytes = 48,
@@ -166,12 +160,6 @@ static const struct drbg_core drbg_cores[] = {
 #endif /* CONFIG_CRYPTO_DRBG_HASH */
 #ifdef CONFIG_CRYPTO_DRBG_HMAC
 	{
-		.flags = DRBG_HMAC | DRBG_STRENGTH128,
-		.statelen = 20, /* block length of cipher */
-		.blocklen_bytes = 20,
-		.cra_name = "hmac_sha1",
-		.backend_cra_name = "hmac(sha1)",
-	}, {
 		.flags = DRBG_HMAC | DRBG_STRENGTH256,
 		.statelen = 48, /* block length of cipher */
 		.blocklen_bytes = 48,
@@ -648,8 +636,6 @@ MODULE_ALIAS_CRYPTO("drbg_pr_hmac_sha384");
 MODULE_ALIAS_CRYPTO("drbg_nopr_hmac_sha384");
 MODULE_ALIAS_CRYPTO("drbg_pr_hmac_sha256");
 MODULE_ALIAS_CRYPTO("drbg_nopr_hmac_sha256");
-MODULE_ALIAS_CRYPTO("drbg_pr_hmac_sha1");
-MODULE_ALIAS_CRYPTO("drbg_nopr_hmac_sha1");
 
 /* update function of HMAC DRBG as defined in 10.1.2.2 */
 static int drbg_hmac_update(struct drbg_state *drbg, struct list_head *seed,
@@ -768,8 +754,6 @@ MODULE_ALIAS_CRYPTO("drbg_pr_sha384");
 MODULE_ALIAS_CRYPTO("drbg_nopr_sha384");
 MODULE_ALIAS_CRYPTO("drbg_pr_sha256");
 MODULE_ALIAS_CRYPTO("drbg_nopr_sha256");
-MODULE_ALIAS_CRYPTO("drbg_pr_sha1");
-MODULE_ALIAS_CRYPTO("drbg_nopr_sha1");
 
 /*
  * Increment buffer
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 216878c8bc..209b21ef79 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4849,14 +4849,6 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.drbg = __VECS(drbg_nopr_ctr_aes256_tv_template)
 		}
-	}, {
-		/*
-		 * There is no need to specifically test the DRBG with every
-		 * backend cipher -- covered by drbg_nopr_hmac_sha256 test
-		 */
-		.alg = "drbg_nopr_hmac_sha1",
-		.fips_allowed = 1,
-		.test = alg_test_null,
 	}, {
 		.alg = "drbg_nopr_hmac_sha256",
 		.test = alg_test_drbg,
@@ -4865,7 +4857,10 @@ static const struct alg_test_desc alg_test_descs[] = {
 			.drbg = __VECS(drbg_nopr_hmac_sha256_tv_template)
 		}
 	}, {
-		/* covered by drbg_nopr_hmac_sha256 test */
+		/*
+		 * There is no need to specifically test the DRBG with every
+		 * backend cipher -- covered by drbg_nopr_hmac_sha512 test
+		 */
 		.alg = "drbg_nopr_hmac_sha384",
 		.test = alg_test_null,
 	}, {
@@ -4875,10 +4870,6 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.drbg = __VECS(drbg_nopr_hmac_sha512_tv_template)
 		}
-	}, {
-		.alg = "drbg_nopr_sha1",
-		.fips_allowed = 1,
-		.test = alg_test_null,
 	}, {
 		.alg = "drbg_nopr_sha256",
 		.test = alg_test_drbg,
@@ -4910,10 +4901,6 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "drbg_pr_ctr_aes256",
 		.fips_allowed = 1,
 		.test = alg_test_null,
-	}, {
-		.alg = "drbg_pr_hmac_sha1",
-		.fips_allowed = 1,
-		.test = alg_test_null,
 	}, {
 		.alg = "drbg_pr_hmac_sha256",
 		.test = alg_test_drbg,
@@ -4929,10 +4916,6 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "drbg_pr_hmac_sha512",
 		.test = alg_test_null,
 		.fips_allowed = 1,
-	}, {
-		.alg = "drbg_pr_sha1",
-		.fips_allowed = 1,
-		.test = alg_test_null,
 	}, {
 		.alg = "drbg_pr_sha256",
 		.test = alg_test_drbg,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
