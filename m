Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC9988CE3E
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5D3FC6DD93;
	Tue, 26 Mar 2024 20:24:09 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B568C6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:08 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a4a387ff7acso313354766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484648; x=1712089448;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cS6l3DFyZZnaHeh/4JIde34mk8Loy614n3vF51Qtne4=;
 b=gyGPvqUoa6j2yeJsx7vVhrOrGTzBBFQS+OPFT2Shq4pm4qgV1Af6tvl3u3dfMrXNCY
 H4ViVz6MlxAZXvyzVsxry4VyY8W+bceaUnUAGQ+/x6Yu49eYdojNaliFwh89ci8wIMTs
 P7AsYbfdLLTfB/umQ8lagQ2/dTM6ONxohVY0pMY4kvZWoGUgoE0t1ihqSHABUju4+a0c
 QnH5Bk8s7JuzcCs/hXZ1gq2D/24XR1GH/GPOfgPE5R4RW8iDIxECmEek9NVPFhSWpMOk
 wCZ96oqYB2gipzYsoNnDeX/xwWkNfNBVv0XvViwXcDplmdxIe9ztQBQtP8wIxIQc9h9e
 45zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484648; x=1712089448;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cS6l3DFyZZnaHeh/4JIde34mk8Loy614n3vF51Qtne4=;
 b=gyuDbN7FneC2YcgSZoJMWJBD5/ghJww4ZMJV/T9jiuV/tTa36qOuNVYJa/V8tOGpeh
 57cQxzlsgAJnJ8q3MweNNr7usCRcnUNcAerFLNfIJVLXembOmKp9i17V827VvkYqiyC9
 mjVekpNyWlEFDkzO4vB3jIu30qkS794Zinb7D3zLJOLHVpIecvmNYUq3vq7toZWamUso
 2WBZAQxmUqkFSsaPPnif3bWG+TEfprJpBpWBsScnLITRtlnHtnXDNZQfEWHXzyrhUHIG
 0u0T2+EjBr4sdFNPQIj09Qnt10fy+7PMO2CFO60Aram54GGovMusGC/ydsozbR/jrhHY
 LgIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVURwhO7MHuPfQJZAKm85NN6klp6H3PlNo/kHfgUbdF60pIrOOf+0Zwyw/7+xpxOr/QCt4umjmv/h9YlR4COLHPiQNDYgTDD1/E/EB65H4c7UQkZRethFX3
X-Gm-Message-State: AOJu0YzhWACZlbvaIsfVFQa2TDpeaoaZQ4lX2fRWm7AxAdD1UGeEMJJQ
 r+avdjJAr83KaeeFh2AJ+aL/LWMmLLbL25OYoBxOpqr/Y5GfaK3eh8iyk+zvDcU=
X-Google-Smtp-Source: AGHT+IHH9/GNxpyIkXwZHA9aKbHJoaISBEw7CCGiO/tr5xtDA/461qS+hvMLh2XB50VnnElFIf4DRQ==
X-Received: by 2002:a17:906:ae5b:b0:a46:da87:26e9 with SMTP id
 lf27-20020a170906ae5b00b00a46da8726e9mr1373608ejb.77.1711484647788; 
 Tue, 26 Mar 2024 13:24:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:34 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-4-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=759;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OegJxEVoCh+2bPB0kaSuE8HSowWXNd7MSXtbllgm3ec=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7O3XhDWR0q73ZKyq6XFUMDnvOhhzKDH2CrZ
 vvB8ceCmhWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMuzgAKCRDBN2bmhouD
 1xKlD/9ExjFMSjdPGngGOSZcBFRS70Gp3v66nFNAWDnXMWpCuRjIg1ArvtwHE38reg4ukpjqisf
 eZCnXRa9ADyqy+n/8uJ3w7ccn9tZzDdmY3L4SaI3cMc5HAp5XYeMiX/cYKdzE2ALwBdMxY75TMl
 /Q4uKyo75bB3pM4Np7wfBBBiZpwLYTa1LMr4VmXOGaAZkgm+XRCGwl12VNZMp0avw+UiS+qs2Gt
 SGJV0hSOzf3ufcb54mIoz6VKTaN1q3MOdbc9z9aGqvotG1VRuPvn9QVd6jbVXoKayIt/mlwW3NG
 pIwRq2UVU2hDBYcoMS+S4c6bU2CIgajMVMkHzei39+/20OgcwjrWUB6i1KLzbe/lQtmgGs3S/HU
 Giw5gW49yn1lA40ZqEvOHRr4qRe538gVZB6dQVKv5Q5tQeE69z0jsfgey5aGbebR6mmkltOGVrc
 IQkvCmCeQ6yEGnOai1AvBGnrZk6G5nj3JN+fOyB1n53ihepFxqhVskEuWfqCB+5qNpiNntr1V6W
 +Do14xIInZSsuAnpGc06u6viXcysJyCkz2w4evz53wfEEK7kSq7roG5ncSgoI1OZZMabAYlCvp4
 3V9JqlpOMehdE2bAHiefJWpzv1Kaz1nz/2SomhlaDJh7L8Zb6g0brqigl4UQzGhW/g+NhHo+Gq5
 Wt9X4UAzVmw5Xqw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 04/19] coresight: etm3x: drop owner assignment
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
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 9d5c1391ffb1..8b362605d242 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -1008,7 +1008,6 @@ MODULE_DEVICE_TABLE(amba, etm_ids);
 static struct amba_driver etm_driver = {
 	.drv = {
 		.name	= "coresight-etm3x",
-		.owner	= THIS_MODULE,
 		.pm	= &etm_dev_pm_ops,
 		.suppress_bind_attrs = true,
 	},

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
