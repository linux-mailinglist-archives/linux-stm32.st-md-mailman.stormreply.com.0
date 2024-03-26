Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A85AB88CE58
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70309C71288;
	Tue, 26 Mar 2024 20:24:39 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C458C71281
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:39 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-56c1364ff79so3166130a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484679; x=1712089479;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Evydkn1Lb5ncyuedil0BLosCcwb0y4nVC6Xek2Vd9oM=;
 b=D12KlcOZgRh8LiUsZVSNKUjMKswOnOfbELtk2qXEQZqGgxRBUvUlqj/2VQLKeFH8kF
 I9+tvPcmA1bqW2thawQL6q7sprKUK48mmBa5RtVr1JBBgWwAcfJjcq2nMuhxYIBz4g9G
 q0SK+MEbmR60G74pesUVauX74TehP0iMfEsQNluvuONzsaAgU4ZJ7Zw7S1ii3WAh+GcC
 UF4vMDTDY5BN6aZj4HNkS4KjiQkCMwqADdRIhlkddipPp/RXMjz1quIxdTVhtPBmJl/Z
 iUXGM+ZUo8YsnkDh2VUJh2/6YQ+IW4jBP/GHz+G44XhTf3U+Zy0vpKwSAugrfkLL+JQX
 jqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484679; x=1712089479;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Evydkn1Lb5ncyuedil0BLosCcwb0y4nVC6Xek2Vd9oM=;
 b=dUxNcV/A3JM23lkyEldvgsWwTOjudEhrfXtpFBbvAIi07MhMsTHvh1V3be57nKTOps
 n7WN8NTzgqewBE7ApRIC9uRKgw4jb5AS+8TSqrLni4cQQpygDMMR2euCF5WKhMDFn/1a
 z6bT1rvezl/GfFHHZiF4TI6iWb4B4zLvL9IHJC1mTRNUrllVqUC1/y6m3rt/gDhMc+Fi
 ipf+rEfBT4VQm7VG+QxSflnfFTD8Pdv1JXTj/PNukHeBkmJmDb/rA26hCrMuvpH/nJtb
 OXBh9DcJRjSUMYuMXvP4iAFDzNFjt5q7CIzvXCr/PpydgdMXEHwisbQcnZxgGMa6iBHf
 oqCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkCLVcOwWONEb264VVZEJ/4BlaTGu+iGceI6nQdsUutnZ1ot04Ud1BtOhjOtLUK+M10f4USbysWPJ8ZdTz9lKEVRsBQIBzxG9TyG6Q9b/euke6R3INtEj1
X-Gm-Message-State: AOJu0Yy2EJUyWuJNjJYZYbZ9CSg11tO4PGcmIfTnhOiKq3VFe6SJ37IS
 vNOFhuI4JEW6NO3Ho/mSKCdUl+NSm1HYEDYwRv12mScoiYFPFZkVbi7RXQNJ+rM=
X-Google-Smtp-Source: AGHT+IFgvfjWWox9Uo3i/AT2VYhjSoo4ckuT5rPp5BpEMm6OBEQgZd29xjK7bZzgB1ctJUvP8kQ51A==
X-Received: by 2002:a17:906:3013:b0:a47:3409:2948 with SMTP id
 19-20020a170906301300b00a4734092948mr499391ejz.38.1711484678778; 
 Tue, 26 Mar 2024 13:24:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:49 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-19-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=679;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ojs7mEKPrcvVUr2JWEMqEzKtHrhLtgwuKK5bfH7PiKY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7cQ2wMjp46pnEE8icKKqMelI6pPSmG+hUfb
 2ZrlhxjMw+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu3AAKCRDBN2bmhouD
 13gZD/4v9CVFU7qVO1P9WYH/VG3+reXnSoM713azcrYjyCKdI7dioF4epmmI1zi/UB/Ls061Qv8
 SrlosGP6BdnuD97+Kvw/cpKXm9HmT9jZkcDUKzpPh9JIh/t1us2INa0wjhDPp4P4wb5vS1VQbqf
 knzsoX+/dcV5b+/3iPoc6xeP0r9lhTYHmVHMmW+eSiiGBW2QCBbJsYnKrnNhv6rLaRSq57U1nHx
 pT71c7XiLtDPKStg5wPxjzjpHq4jWPxaTFrh3LQmtnRzN5bhVUbrCUzab+4ktZS9yimWLF4a+Oo
 iAT7g98DxDdr8jSClcqQu87kLTLqjxaseT/J1dplC/DdXUdP5Mep1DYMRjKI3Q/YYlWvTBJ0lNt
 5myY9ur2Ia4Nueg1OJ3LZT3VmNq2tcSG3uWqM3D1NLDlM8ptjTMnfEMaAio2NCUpuiRo2x6H2Jc
 ZcF1QzB99fnqpxdMfZ4KJNgdRfZyMp3/9Z7xlMC4J2UTLz1mm1aQRplMfE5t2wRcqNTDQ6SEorz
 Ok5M2JDCYslcCDpBS8zXB/nwzbwFGsCubbWPopaZpdma6LdVcyKYFnBHeRjMptl4qFsnIPRL+J2
 zLgKtjqK87ihte/KUXER7VcN2ABZHfh6N3p+xK2LfGxwdEyjrz72tFdE1bh8ND0soV3z3u97Ju4
 aPVYjjB/5NvG2Zw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 19/19] vfio: amba: drop owner assignment
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
 drivers/vfio/platform/vfio_amba.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
index 485c6f9161a9..ff8ff8480968 100644
--- a/drivers/vfio/platform/vfio_amba.c
+++ b/drivers/vfio/platform/vfio_amba.c
@@ -134,7 +134,6 @@ static struct amba_driver vfio_amba_driver = {
 	.id_table = vfio_amba_ids,
 	.drv = {
 		.name = "vfio-amba",
-		.owner = THIS_MODULE,
 	},
 	.driver_managed_dma = true,
 };

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
