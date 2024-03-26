Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E922988CE41
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF98DC6DD96;
	Tue, 26 Mar 2024 20:24:11 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 346ECC6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:10 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-56c2b4850d2so1334780a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484650; x=1712089450;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MUoAEonqbq6mZXdrDqe4h4/X1Y47oOMjA1M1PU77dgA=;
 b=ZeM38qhOBwwIZgsfGSldEe5SthdSv9Uw5d02WnUlxpa8n9rCSfBMHh2B7rlOYEAzX9
 zBGv07fbR9cpafBXpZsC2ommZ1fHJ0kC53zr69Mn9DXFcRphjepxE400WRgLMlGFixw8
 /wZZC2MIQwBguu6v0JiPCFe+h4peR4hgb3mybWm2HspzUkJ3Aq1F+Ru8ut/JOLmSdl8X
 Qjm8HkuFfxZMHMF1GLoxg8qI8nFdE54dHRZtBGkMTwNd04fCJtKG26+D9ThoUhrtRFFZ
 7cpmZZxD7zgLC0MN/MDAEB1mf2ejtxsgwGuPVzHzz+0yKVadK47k0n2PTGigl/SE+N8D
 tRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484650; x=1712089450;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MUoAEonqbq6mZXdrDqe4h4/X1Y47oOMjA1M1PU77dgA=;
 b=XkBLXkq9mwHFO9fd4qXBCg+mkX3xk1oxcmMXZKVK6ydicbBtqiTWMgML6Qy/WgqhG7
 LIoo/TdZoc/2q1yBsnYf8IABTwpdSvC5cmxz/pKdLZ/jxxJOZFvjYajJjWJF9FCGaHqR
 202jCl3bb2Ek4GmXIwLnOWJKReHMtwa6tx13dAJtGKcdjaSjcAywBJ8Ke4eEVXDy+ft5
 BvoocZwIh3WfZSsfUtXFb8c/AHvcYOSH23f/NYyGkQMWH6FQUo9D+ewWJlsXr70cTEq2
 bfXWmTp9zusE1131pg1wgff75aDgoXcsyShQjA+n5nUkjpU7C5ZduQpSGvENvzhTTxi+
 D/gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpxkBOjMpJT6O56iIKTmty9NsGgfStygZoWYO9E2SAauI8RubnuJLMFR/eFCYnGmM2AtPuN8w/Fhlz35Fqzsc+TqQoG4B838HqevJsysDk9A1GDagy/tuJ
X-Gm-Message-State: AOJu0YzSC7t8Wc1269fxE2YhVzP2RblYHq4N0sbbJ8jKhuPhKjYXLsez
 hglUX4UZH3i9Nv2PldglIkqophvIf3rfQIpJoFWFvOh2EUY47Lvuva6qEspV3pY=
X-Google-Smtp-Source: AGHT+IFktIMOuGQr83iXCOXqE8Qfk01qdlT5fhCvZP9F6Upy1Aunb2VLAuZdlUWX1tsm3QMok6//tw==
X-Received: by 2002:a17:907:868d:b0:a47:5351:e8a8 with SMTP id
 qa13-20020a170907868d00b00a475351e8a8mr3611593ejc.33.1711484649819; 
 Tue, 26 Mar 2024 13:24:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:35 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-5-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=773;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dLMLqJMRutmhpAj9QPWjvHyuzryPfsbXssGz64hwg7s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7PqZxAqSLMTcZ+iIF2WgxJbOdjAERugmhHY
 Ri9uz+X3quJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMuzwAKCRDBN2bmhouD
 11YBEACKdHpjBts0bi85xrrB+V5bm9+C4a6btkKtB6exqkvpm4CJ6/J1wcZaqXuGclO7BcdfjMl
 Wfw+1cBXtd0NrHO0VdsLJe6YLD9lvVPx2MufQK9ZxVODxsQ/DONPj4t7bhOG4f+Q4yspNCN2a6m
 rdIx3+WzHtym438cEFWjgJuGtbFIDXHwWXPlo0Po+q3EHnvj21GGEO6yFP4zQGUTmKajdk1IASV
 FZVy5GpeKJ1K2KV8l8rCd+tYMsK32cWOgIUQGvExNx75N2Pm5Ac7zoUmbYpfL2ELwwXacdnw15N
 YkMnKu/VoXvsQ4gPjqyrviCQiifoPEV5O45ywNGJA2AjmEFdU9CMzJsxhoSa2OKchbgpy3sLjhB
 dvD9oBigcYn1nmkv93lRanSpS/lvGIOHbf2JWd/jblCUX3TVFUCibn6bicchBLObQH6VWD2+TPc
 Y0+nGtp5BdsRosXAMD3STQy8PZ+qo0K+JJ7tHHreyDspmRbCuel9ZlJ+Rj7htk4toMx5Nx3YPJE
 TvqW5MMDyOtqGWsSzuzvFG3tgcSiWZSwKRNt7jYKyfmMQKSQmFs7j6dp5iMNGqtlmGh9LP+SAa+
 aT6QiowSX4npz2oDHTUwakI4hcjbRDz1lt9HcvbvjBeabKhZcLb/SAsuX7VuWZxNygOkk51wrXG
 vYYXvPCZhk/EFLg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 05/19] coresight: etm4x: drop owner assignment
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

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index c2ca4a02dfce..e6cd9705596c 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2344,7 +2344,6 @@ MODULE_DEVICE_TABLE(amba, etm4_ids);
 static struct amba_driver etm4x_amba_driver = {
 	.drv = {
 		.name   = "coresight-etm4x",
-		.owner  = THIS_MODULE,
 		.suppress_bind_attrs = true,
 	},
 	.probe		= etm4_probe_amba,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
