Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBE088CE49
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEE2DC71288;
	Tue, 26 Mar 2024 20:24:22 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F713C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:21 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2d28051376eso109302651fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484660; x=1712089460;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JKOnOabUB6pF+ej5SQDvcGeRRaglO84Sz9O3R1GaVFA=;
 b=sZAToUWTyqcFOFKZg0WudokDk3MNivCzEpM32jcVX2et3NspQkhJ7KVKlBU/n8LGGA
 yV9pyKNxfLd+Yi5gUWerFNNhXxSPF5324Z/TYpqwRD0j+tB8wh+etOl51RLk6VCzNHzI
 2HynSgAAncWS18xdeQkdqDtUbkz2L5473pK4hCDavHC32zxNxRi8JRI2SEpMxnfe/Lx8
 oEpBGy0RyJxilPvT4/UKGJgu+CKrMo0pRAFDlh9GkA9OCniIE2kjhQ9TeFy/JKOA9B5G
 ZoB949WO9CaiDqk2zf0N/jyYetopdNN+4hUnJlsWm28/DGyYi4CiZvPmYAYPkjGGeOcr
 KpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484660; x=1712089460;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JKOnOabUB6pF+ej5SQDvcGeRRaglO84Sz9O3R1GaVFA=;
 b=TcXtVngb+1xitvqxJTviImlKSPpwhE4dQ3M6/8a5h98yj/cAYgikeBKj4dOHB0EB+E
 MR6A06cUBcaZoj0/Yr/yKi6+5xK0/7ik5+Pi4NYnES60/v4oEo7QYpVQC8C4mM/XyJ+V
 F8CzO66UbaBcTxWMjZStyBuFdOrpkW1TRdnZX1W20z8bRzHcKwDA2O/1NMdLAcDUlFy3
 tXOD4YF8FjUjd1zd19SK27MD1LVVXhR+oLNBY+m7Nt4nUE8SKEOpI6cw+lWe+NoWYVop
 hU0wagyGp7N2F/ODLp12XEz5EiYbdcbZj63cKbNd/VVDPbVNfW5f5zhmEavP4rTOxSkU
 XBSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsqy652njL3gBMCBiLtfTfn2B0Vv6quwRgmx7+EgId9hBVhlPkIIdyF7sdgBnCAIikyp2qXWqqWDKp2jS0gSNXX1Sgv95Kps01lNGhhkZfVHrPQCSupgn6
X-Gm-Message-State: AOJu0YyUBt6hEq8UZmxhEMw+iOYaMzgmJXb1TiZOcsWNFEfKTAIjuMZJ
 lDonaKny2JJoWu6IiBTMnShHsWS2Z3/eYtfgGoAJXS5BEGyIWpMlIB+SAHweWxg=
X-Google-Smtp-Source: AGHT+IESmzkKIx7adnGUE8VL685+RZ7GFnBS4CbHBYXytjFSFZVBSl9GE7H4tv5Ufd2Mfv7gRTK1NA==
X-Received: by 2002:a2e:97c3:0:b0:2d6:8e88:5a8b with SMTP id
 m3-20020a2e97c3000000b002d68e885a8bmr610711ljj.32.1711484660485; 
 Tue, 26 Mar 2024 13:24:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:40 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-10-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=745;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GHYJDWqnZoc7/rYug0BmurqWnNvrY/zLtghYn4WZPjI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7UHCFK8a0nQ6hsfzaGBQG3fZhmF1o3Dz7kU
 68k5ByzCrKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu1AAKCRDBN2bmhouD
 12sbD/0bm9OxvO/yndxGXeD2ddir4+4GYj3zVF50/RCNP239KPawL714M6CqzE7jBWZUy2LZoLW
 pHHRmfpLw35XdFoNQv9vOyr5vIpdp6vH3L4o+zd3qdmBq603IIXiukXSMsw9xD9mM68xuon9cPO
 yZh9gLd7KC9zG3r6j6QDfTq42SoZVTVN/d3QugZKcgLO19tuw+5+i+QRNsie29m9D4MkSIu1yPg
 xMnaTymj0YvBhrERC1Qnc6N9NKa1i4Y6EdI1TAmw6x3qMXxpvxogoVFRujzpzX9AqNfUm8+5L1t
 jMxLXiBrW4p+tU38wlDISWmbZjiNogv/0VoamQKnmzjGqBCJ9XIX7mJBGv9RmEmcu7zyXNKbThm
 YN2SN9a/wu88AG6ZyQt+Ph2UPmrC7FjYQolln39hVlYXDPXp3ePlfH7t1h53gj9FvUjvyqGLaOK
 QPOf94OGpPJ65+iscAfXc2IbQ8aFFZGIWbZQx8gDTdv/koUUtWRthD1VmaU2SAJwMbRV0LKrCPM
 FOlzvEuL3zlKvPsG41il3k4BsIxm9qGgi8oa0vYEHuAFylq+x/fFvQGZtEKbQAwmDrwHX6XmAfg
 +Mr9ombJvshL+qUH/J6LTKxly06KNIdHmIaoSDc0/0pIW/ph2gVexYDQ0SxHlepokzpj/yhKFUJ
 qzrs4LxRd1z5t7w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 10/19] coresight: tmc: drop owner assignment
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
 drivers/hwtracing/coresight/coresight-tmc-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 72005b0c633e..0d251cae814f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -602,7 +602,6 @@ MODULE_DEVICE_TABLE(amba, tmc_ids);
 static struct amba_driver tmc_driver = {
 	.drv = {
 		.name   = "coresight-tmc",
-		.owner  = THIS_MODULE,
 		.suppress_bind_attrs = true,
 	},
 	.probe		= tmc_probe,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
