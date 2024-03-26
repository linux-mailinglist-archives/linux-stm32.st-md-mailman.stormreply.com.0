Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE5988CE4F
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31B01C71287;
	Tue, 26 Mar 2024 20:24:31 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52A6FC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:29 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a46ea03c2a5so36408666b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484669; x=1712089469;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PsGMZVojJ8C70w++rBfj6RoYwUbfH5A2iM2yGofnBw4=;
 b=VC8NDiElHujdwy2elTKqOwfUdWNYhvAAKwrMDLjkVaCy1HlPef5Mr0Cde1zaVWam2L
 jTur70NQuSbOzxcdBn90FRW1Khpj3whQszXuQjZeUPpWP9fudrr5oEjQ0gT+YpFSYZST
 /SP/34HdWlHry6R2qOZAsujvtYzsu4SQS/MJJmDnEXdwxpgTCT5ghPVqh9wbNV/g/+m6
 WoisIgwgGdolb/vEwjl/eek1E0jqSVpKVtDm65sLvTbiYqT6kMN7CVnsJLH4cp/OOOVw
 V7Pj7IaWtqv2sAcG+JgddY0EL9tH368ys5rEjnya65yIegcehlF5azBJS1Va3DB5oauL
 yJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484669; x=1712089469;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PsGMZVojJ8C70w++rBfj6RoYwUbfH5A2iM2yGofnBw4=;
 b=nZhVMPVRTWbD0VRQouiKglmnaWkL/umbkLQVN7DZ1bgt/0kLK2CpkWe2tFKrnZgz4g
 +HgRu0EJUaRejJ3X2whwzru8tnPR8OfEFuxD/PMYFp5NoOtfMjtPO4fF0h8aBabJ+KXz
 U2REgE1NtjncOKrB9KLsiVw3SRSXjkVIs+2AVUuTKhPoG/m8LP/aVzUZcAf3azXE9nzE
 YcaAKGx7iGDOac8W2v8UWBVOiSMBcGnctoZeHFGVvkV5HYv6WNQEGS86UUOB/CMwKWKk
 mNUjkepKhl/mbzMhVMx8GmryRw1iw3oouyvJ0oVDC6LuO03zWk77YqcTtPCnJuSbdQUL
 2Tmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUawRWvrTnO1DVPSwdFS4d7FZEt0f4dlvAt0bzYzA9Kox8F90tBXb/ppejQL/M8cwtDjkhVTxlAXJAK37zK1vWxDBgtSbMimFmQTQwnpKwfIxGYDM75Q5Ea
X-Gm-Message-State: AOJu0YxgdHA7RW7Cs/X2qryIb0fz82Qh38D8kO19ki805bahxlCPilue
 qnxbsKilox9NOHpqw9YCGLHVEIH10sfsq1J8vKhn2DZRImBLO0M9xu9WEKgNTSQ=
X-Google-Smtp-Source: AGHT+IHmg5rYTO8UGtft9sv37ciYnybAFPwpWY/SdRPJpcr/NpSWN2L0glBTXoz0FMh1/rJxCe/mHg==
X-Received: by 2002:a17:906:2b56:b0:a4d:f924:dd30 with SMTP id
 b22-20020a1709062b5600b00a4df924dd30mr1856464ejg.27.1711484668981; 
 Tue, 26 Mar 2024 13:24:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:44 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=684;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PiuxZrMIhu4YE9ePGusRzKlLsI9F5/aZep2EtBiAXkQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7XOnweD5fuRrpZasTw5YorRCvt7rz83nEnl
 mxTb0IGYS+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu1wAKCRDBN2bmhouD
 100WEACWUJ3bHNUybrnLzHEW+50Of4V7yzTuUxCdwKIibp17CQYMnV9k05Cp/IkUiZieYeDG3b6
 dTgDp0izc2qKekHwXcoqBRz9Oh17xN5R2lsOXeoV4CduUn2cOAoTlqR4xRD20lMvdaet5Juy9zh
 vGavY8WUeoW6+dF//oLQn5YKrb4/+6mQIEEmSFVShckTfUSXhmO/R7mb7oF+UhqNYTlCPyi/PLT
 pFP2gLwXmq0jOXnqqizAjWI68WG9f32UGxHjh08HwOk3pkrQQQNu6UbwrdwOzWw+sPAznCGQ6oY
 w8EHMBCaihOHxPRJaJBRdlJRT0gaSjdMUkN/7pi6bZx6LnWewJ1gYnp4fobQnV4HBSelma7K1ov
 E+dr5l2ROqsfBstb04HV504A4DKquVZpJZRVy+ezozr1/n8URBMRZ0ripxZu4gJn13Gf9sqK8xo
 YAWtKrwZnyntWEwCnuq0yFJQsTk1w7kzgurw0YsmWRFVDTnZgxjLOzSOBliN+KeWanVkAZ0fMVc
 kV/4DPQyArEwIf/1PYjLS+oTpvw1Bjdfi+oxxVNN/61v9BQ+vKKVBX95pkg7UtUa0rhGKrXgzH7
 yoADgidig2D3rnRwwQi0E+vgBUAMXMTcdVC7fun9luTFX8Sa32soVTpLNXy146pHsGpBJ0TDFMB
 xEEp5fyTubgsP1Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 14/19] i2c: nomadik: drop owner assignment
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

Depends on first amba patch.
---
 drivers/i2c/busses/i2c-nomadik.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 4f41a3c7824d..17fb313565b8 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1194,7 +1194,6 @@ MODULE_DEVICE_TABLE(amba, nmk_i2c_ids);
 
 static struct amba_driver nmk_i2c_driver = {
 	.drv = {
-		.owner = THIS_MODULE,
 		.name = DRIVER_NAME,
 		.pm = pm_ptr(&nmk_i2c_pm),
 	},

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
