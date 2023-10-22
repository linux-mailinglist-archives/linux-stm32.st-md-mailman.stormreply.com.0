Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD79C7D2532
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Oct 2023 20:22:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ADBCC6B47E;
	Sun, 22 Oct 2023 18:22:40 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E12E9C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Oct 2023 18:22:39 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 044C33FA6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Oct 2023 18:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1697998959;
 bh=G21LvQrZs30vZixQb7qoXSrQRZ+ChOighJd9yL5njGg=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=XnLrftOr4IzrIg6cLChua4GUyA7wkyQ1FEcZY+2hgAW5v6y0g2Kqf42SABbfzQg+X
 rODK3UdeUNWirZhNFaPwrAt6J3GiyQROkocFTYFiR/Gt1jgApA3tmMSmE8kIK0m59A
 is3d7xugP6mupXvo7unbGvzrpnNquVy586RRc1Qx5tRDib2wb9CECVwh2vPnNSx9PH
 Q8QNi5sTP2AkdoUe9ixAqglbwxC4cOJwoJJ8zJIJWenGZkLjrvm3OXGL7fX/TiDmBb
 dlCIACGlj9q5MuNZp5kErnJVTSDyN5ozNKlSlnoRmd/jyzOtqDphwqrPZnuZMlz7RN
 y6A4xcCfEKsdg==
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f5df65fa35so13905505e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Oct 2023 11:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697998958; x=1698603758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G21LvQrZs30vZixQb7qoXSrQRZ+ChOighJd9yL5njGg=;
 b=q4lptjzOKKMy5ABn/Ze/y5KntpucUeji0a97CfUwwNFKqSG8C8iBpieM2bVf8p3ESj
 UUHBfoFrI1ErfZt3U7YFMllp+1lijxFedhq9pUqSyfPzYDauF/X3glrlyrrUpE2x1276
 +f3wkW8y1yic1Uuuz3v8oPpLvmsVvFc9D4itPjkzhcHPtHCjsWUb+3mKpC8akkB2QGF7
 FxJE3xuws5uTnlqgmUNBJF8n4mwcSqKdULzQpHhcs4kxU+IWpVELLk16c4OH9pmPJSX4
 YC3TdEL96tEwqkwKk8CQsVzkH0oCI7dTXxzosBIIOn45Kw4vO3inApmn3ergzsOfowXI
 sNOQ==
X-Gm-Message-State: AOJu0Yzl25lPVcxYrCFHzGCKdrl7jMaLYbW2mudunLnlzHOOBdbZ4l+N
 0oICdRMw2fTm+pPDkfgK/NNRbTvPg6WES8/fct02gSP2YN31uMIxZaGe1mw4ruFIYYvKbnc417k
 yKILXYkLVtUew6Gg1OCJnFpLRNZbeTICv0Qft86oglpKz+C+JDxsEwoAojA==
X-Received: by 2002:adf:e387:0:b0:321:6779:944d with SMTP id
 e7-20020adfe387000000b003216779944dmr5166506wrm.47.1697998958651; 
 Sun, 22 Oct 2023 11:22:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAZvQT1bUdK5D86F47MwaUC8hGREbp8ZcoKdB+ACNOR56da1Ev4XH0crCuR05/TvtIF23FDw==
X-Received: by 2002:adf:e387:0:b0:321:6779:944d with SMTP id
 e7-20020adfe387000000b003216779944dmr5166502wrm.47.1697998958286; 
 Sun, 22 Oct 2023 11:22:38 -0700 (PDT)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b0032da87e32e2sm6143324wrq.4.2023.10.22.11.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Oct 2023 11:22:38 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: herbert@gondor.apana.org.au, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 22 Oct 2023 19:22:05 +0100
Message-Id: <20231022182208.188714-4-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231022182208.188714-1-dimitri.ledkov@canonical.com>
References: <20231022182208.188714-1-dimitri.ledkov@canonical.com>
MIME-Version: 1.0
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/6] crypto: rsa-pkcs1pad - Add FIPS 202 SHA-3
	support
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

Add support in rsa-pkcs1pad for FIPS 202 SHA-3 hashes, sizes 256 and
up. As 224 is too weak for any practical purposes.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 crypto/rsa-pkcs1pad.c | 25 ++++++++++++++++++++++++-
 crypto/testmgr.c      | 12 ++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index d2e5e104f8..e32e497d29 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -61,6 +61,24 @@ static const u8 rsa_digest_info_sha512[] = {
 	0x05, 0x00, 0x04, 0x40
 };
 
+static const u8 rsa_digest_info_sha3_256[] = {
+	0x30, 0x31, 0x30, 0x0d, 0x06, 0x09,
+	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x08,
+	0x05, 0x00, 0x04, 0x20
+};
+
+static const u8 rsa_digest_info_sha3_384[] = {
+	0x30, 0x41, 0x30, 0x0d, 0x06, 0x09,
+	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x09,
+	0x05, 0x00, 0x04, 0x30
+};
+
+static const u8 rsa_digest_info_sha3_512[] = {
+	0x30, 0x51, 0x30, 0x0d, 0x06, 0x09,
+	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x0A,
+	0x05, 0x00, 0x04, 0x40
+};
+
 static const struct rsa_asn1_template {
 	const char	*name;
 	const u8	*data;
@@ -74,8 +92,13 @@ static const struct rsa_asn1_template {
 	_(sha384),
 	_(sha512),
 	_(sha224),
-	{ NULL }
 #undef _
+#define _(X) { "sha3-" #X, rsa_digest_info_sha3_##X, sizeof(rsa_digest_info_sha3_##X) }
+	_(256),
+	_(384),
+	_(512),
+#undef _
+	{ NULL }
 };
 
 static const struct rsa_asn1_template *rsa_lookup_asn1(const char *name)
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 54135c7610..a074430223 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5468,6 +5468,18 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "pkcs1pad(rsa,sha512)",
 		.test = alg_test_null,
 		.fips_allowed = 1,
+	}, {
+		.alg = "pkcs1pad(rsa,sha3-256)",
+		.test = alg_test_null,
+		.fips_allowed = 1,
+	}, {
+		.alg = "pkcs1pad(rsa,sha3-384)",
+		.test = alg_test_null,
+		.fips_allowed = 1,
+	}, {
+		.alg = "pkcs1pad(rsa,sha3-512)",
+		.test = alg_test_null,
+		.fips_allowed = 1,
 	}, {
 		.alg = "poly1305",
 		.test = alg_test_hash,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
