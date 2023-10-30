Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA827DB976
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Oct 2023 13:06:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A614C6B44B;
	Mon, 30 Oct 2023 12:06:03 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 372CEC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 12:06:02 +0000 (UTC)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 75C4B3FD47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1698667560;
 bh=euOHMKbk4HXdz0uT+/ZbQgWhVnv6TwkCQv8wxSBXEso=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=FFd8Oc4qD0mueSSXHsLERhmIKwduYPbpUAZ6pJY94cswI6LNBgNvyOeCBrwicHxuw
 q4NdC3fvLXCal0mrtdTM3YhVhm9O0PRLEWyU14VOLS56KALZY/fj8nxxSQsYtmlZ4t
 U7nDYHjHRCaCoZyJaeplI2U2uGVKfWs8BHZXrKkvsecZJziV1hw0etA9Xc/VbJE2gS
 95G67S/dzuHzF+E/m2ctmyKbDeJOa4gOT3ABVNyJ6nI/Ionu0ip/cyvx35UqUj0dIN
 FL8/HlnLPDZfDmXJDgnapbsHH1c+tXhqeSHgPRMZLkFl+tZp64/VGLqKGwRf6cS+EJ
 FqbRC0wNYDzPw==
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-507a3ae32beso4740903e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 05:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698667558; x=1699272358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=euOHMKbk4HXdz0uT+/ZbQgWhVnv6TwkCQv8wxSBXEso=;
 b=OhvIfTNz9k03kyWVtWhI1zRYVlKpT3rPd+YomIH8gHcrYqeJ2MYvPQ655yAXdKqNmc
 DVHgMw4f/iCSjC3HLF7v2DoxMD8Wv1H6JAUDUz/H/an/WTHsieryHp4GEwQFlu0p995r
 gqOKlb47gQac0qK997C76hdDX+CskU20/k27/VMxeE0B+eLuEHY/VJlnlRGMlnfiC+u0
 78itcE+V4HjqjnYsyz2jeEH5z/6WPAoXAx6+bHkAxHaxf77ZNSR3HpoQccQNZ+S4VHcv
 kpBdz5c7coAuitLijXFT6SyAIGQaf7WZkVHggdcMyLr1rYbUhDigKCdDmQXtkb5rU/Op
 5ZFg==
X-Gm-Message-State: AOJu0YynfZqvrDBue64giY6kC7Jn5kYllfYINdq5Zw4j1Iq0TwrBUOpI
 OsP+pMhRniwsKDDC5MJQzfzsw1t7v3XXVdTVzSf1YvPv9vI3ktH9UIs5gV2QuVOVzgb+wsKIy5D
 03DeS0+Du9SlT0kIHZ/BwpkOcbsL/yNg7bEulZIIXs1UHD/i3I0ynheiOLA==
X-Received: by 2002:a05:6512:1116:b0:506:8d2a:5653 with SMTP id
 l22-20020a056512111600b005068d2a5653mr9066699lfg.47.1698667558574; 
 Mon, 30 Oct 2023 05:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHobGoxATHBl1iHIySw8NC+ytmlfmxCTt4WgEOGt3ZVe5k5kQZ1w74gV7uAK8lEOt8it1GpZA==
X-Received: by 2002:a05:6512:1116:b0:506:8d2a:5653 with SMTP id
 l22-20020a056512111600b005068d2a5653mr9066667lfg.47.1698667558264; 
 Mon, 30 Oct 2023 05:05:58 -0700 (PDT)
Received: from localhost ([159.148.223.140]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24353000000b00507962dd2aesm1416736lfl.207.2023.10.30.05.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 05:05:57 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 30 Oct 2023 14:05:16 +0200
Message-Id: <20231030120517.39424-5-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231030120517.39424-1-dimitri.ledkov@canonical.com>
References: <20231029204823.663930-1-dimitri.ledkov@canonical.com>
 <20231030120517.39424-1-dimitri.ledkov@canonical.com>
MIME-Version: 1.0
Cc: smueller@chronox.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 4/4] crypto: drbg - Remove SHA1 from drbg
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
Reviewed-by: Stephan Mueller <smueller@chronox.de>
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
