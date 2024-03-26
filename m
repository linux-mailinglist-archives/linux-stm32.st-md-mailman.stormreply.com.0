Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E3888CE3C
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C484C6DD93;
	Tue, 26 Mar 2024 20:24:07 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17BEBC6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:06 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a46ba938de0so803390566b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484645; x=1712089445;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iXiHjg9z5WjtRj7FyN981q22Cf3/qPHIvV7q8gsMVd8=;
 b=coLw7W2XYV3A+3cO48AyOz1WhOSRvq9G1mnr3NmqMeLoDtBGS/pqCQKxdRVmGvqcgg
 kutbHHReNGiY+LVQKcWjyh8d22C3+amIhuYRJA9D+hf0AuVG3LNJJrCO4z6lfpJdSRUx
 ltBs3cPj+Kh1ac/IpiyWHjQgs6KlO9A9z7qz2YVDqt9u4n3OBny9Yf3tC3eesEpk5XRT
 hWs4jflkisiufx4+9QNzeBysFCMy2/GW3ITFcdT3frr5KOzRJtUsvNGjtzB9YTB9UzWH
 MneLW1VSFWhNFazc5gQJPk2DtOIa81jPzpLHF77/nWQe1s/lUklht/0qGtn8WYQZzp9D
 Cn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484645; x=1712089445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iXiHjg9z5WjtRj7FyN981q22Cf3/qPHIvV7q8gsMVd8=;
 b=o9F5TDBiYlF2ua8SNP+49x/dqbP4ypBEXlHaQryEU3KcRz6Xhx6y5/gZnChprj34Rl
 cWqAqRhXjxhoOj0RUddXrTzUVnN5AxhpAcaE8IaI2MFfUlcb+2p3lEPU/v0CPnRltkDS
 VW7VAjg8kJe02sc21WczCdSeRfZD2y+uTqtfy3jre5Gf1zgGp//7IrkMtLsZRU0aMSLA
 Cap1mTMpRDC6zyuJ9mFhRk4X4obdPneyYadG05gD38eKHKraWg9Y/y98h7BRPzMn27lQ
 8qcGu2VvVWNZG5oQd4SUszkmFBXHUx/C8/EmLiAGGIvELqqCOqyTohGM7WI6b6nnL7WB
 28pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4OzVg176FB2YEHDoTJD8Qe/QWVCGJwAk/YZHYeVpzbzfjEgT+gUbLD41h/1qTn9C0Jx/3Z1qbp9RFiU8XjR4fEI7Z6hXPni2Tv/RuU0rrbsLYOsAtsMhd
X-Gm-Message-State: AOJu0Yw+mbeb2o98WEfYJqgY5d2tnsjekdwNWSjDH6fMCPMVWn1tyx7N
 YCnD32tfqqhWIof+Dnk+BuF5NYamnHVgpUMeLlC5adunj+9NRcV2rI/RxHdtI/8=
X-Google-Smtp-Source: AGHT+IEfy9gjsew9ETjHc7FFOuJT2jM+L2jQiDOYJkSH4p0nwSV/DeAW7YcWUd59qggx/U12Voj5nQ==
X-Received: by 2002:a17:906:15c2:b0:a47:35c6:910c with SMTP id
 l2-20020a17090615c200b00a4735c6910cmr2699146ejd.22.1711484645499; 
 Tue, 26 Mar 2024 13:24:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:33 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-3-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0tCOGOTEtsk1MNOC81cBK1OFb61otkPtGFYTYNaDfAE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7Ow6S6gU7K4xDsl5z8ZYW2obxkxWcKgTa9z
 D8mHyRiajqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMuzgAKCRDBN2bmhouD
 14LtD/9FUnFagmEFO7sKZPZnAcq1cBTmy/uTlAtbqeDP6H4YewQ8W9uGOFTYp8fC8IUnU7uyY2Q
 8ZnWnr1zDTQ5IHHMNTOCR0Achdhw9VSQQOSPwH5J0Ao9g7XB52Y2st0OMpx1UJfFUFkBVQsyqti
 gEQ24BTObJeM1nnLCARdwUTLjhYrZjV1cpBkR2revehYTsFJMckEWO9F0mhkw96si1zGX1B7YiM
 +BBbIK647s16FHygeAFUSNHtoJs/Ln2mhayP/40EwBbmfx2mZL4mHsMoNzHKzqHRbAkBQCk4GH6
 pTAIThqPv2TnYrVAjNKWHlOe35c+oSID75/EXe0HY9M4PADM9nWzucSCVtQk22IVJ77okKqkHmd
 Ef+xUKR2Mtw2yRT268Pyp5emSM2wXId/BDxoqwrvQJfxfrJJBDCVRAzlmjB8yz5Hq+ZnXgfASmz
 lhWJo32QM06Pb8dtzaWO4J0OGeOHu/bvLKNCUS996msar7BNqnTV862YrclcjvslGAVq3k4Ufrg
 tI+qt228BBRKLgbw96RP1WU4lrXpXrQZUWAjgGIr74ojyuYR8/w+kTXVD80ydtgKGdI5Qc46TXW
 9IcpF7erQW3bWFrfSb7yJKJUPe1Q8o+s0n0Ml+8eNJUaqi2ivyRh1dXiixULJSEfdkA4EnBW792
 sPlFZr2NZ9dt+VA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 03/19] coresight: catu: drop owner assignment
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
 drivers/hwtracing/coresight/coresight-catu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 3949ded0d4fa..375bd0d89b0c 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -590,7 +590,6 @@ MODULE_DEVICE_TABLE(amba, catu_ids);
 static struct amba_driver catu_driver = {
 	.drv = {
 		.name			= "coresight-catu",
-		.owner			= THIS_MODULE,
 		.suppress_bind_attrs	= true,
 	},
 	.probe				= catu_probe,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
