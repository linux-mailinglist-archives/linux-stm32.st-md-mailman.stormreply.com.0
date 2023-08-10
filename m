Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E106677751A
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:58:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA007C6B473;
	Thu, 10 Aug 2023 09:58:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7D37C6B473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:58:57 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso689623f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661537; x=1692266337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ulC0rUCgM79VoK8ODBpFngeO7joEM2mXw44qcZoQUFU=;
 b=NQbGCh+TQMHjAbZGfILAsXjghrFOWpO++Oo0JbNQNJ07f9cnL+UKwEmYRcJk6tUbv0
 TKaX6/yXLKmPPKHLTD1EwK8K0WmK7bhQRRWmsr6ZzrKmBL0HaEnOQVgNiqyrujcFvbeO
 I9jyUbzqCpvru8gPhT91Oo0Tdkt1eZLrbKDZEJKfayS/D0iYN7pMhH6JMYfIKo5U5+HT
 nnJT2ut4yzHE1MN3Nycb6qwWOe9Voz2KNqZ/YrrSoarHwHaCuF/3+mHklOkWnpeZfzJa
 oWP/6FmEsH0+M4BM4nDkPBBLjIqHTwVXB/LfD70mg/k9dIjnvEUMMldV7Ik46ZvJfZFt
 c5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661537; x=1692266337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ulC0rUCgM79VoK8ODBpFngeO7joEM2mXw44qcZoQUFU=;
 b=jb+YK5ND4mAoItaBCbKNw5e+9VnZISstFe6x4La6YTd2yeYLPB4crAYs6Iaikqa2KL
 buxmaSYTXgyZCO5wlAljP0c3RkKPidrln1ArsVhK6xxjYQC34yS+whqfE8BahrpEelY8
 MmZfUMZfSE/JmZexiypy/joLrQ00FaLh4di1XJTC6BsHiziecex6mRSgxGoHUJKiGAUq
 8qjF1DYGeA5+8f39MG5FhKdyPE3Mg9L82+7q6gKMipwkIJO6e9nqVO5dYfhNYR6esZMg
 zTo4cgWhTfa4TY2eVnvEEoIKQMUbfgIECF866kA56VAHsrwpWiSZJCXQDVgAHTRh0aC5
 jokQ==
X-Gm-Message-State: AOJu0Yys+wJhSOBEcCLJDt5ZYSnCanqTuHY8s3+wBLKum7NZeCXefSb7
 fxv9i6Hs2wPEw7JUh2oNveSqlQ==
X-Google-Smtp-Source: AGHT+IFj2aXstTHIer9E4PGTHLUE0TVA00q0pkg/2yS1aXKJ/NorUjW8QJokHx3v8suWkFHQtlG+EQ==
X-Received: by 2002:a5d:4908:0:b0:317:61de:abb5 with SMTP id
 x8-20020a5d4908000000b0031761deabb5mr1653955wrq.69.1691661537197; 
 Thu, 10 Aug 2023 02:58:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b003179b3fd837sm1621372wrj.33.2023.08.10.02.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:58:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Date: Thu, 10 Aug 2023 11:58:44 +0200
Message-Id: <20230810095849.123321-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
References: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [Linux-stm32] [PATCH 4/9] mfd: hi6421-pmic: Fix
	Wvoid-pointer-to-enum-cast warning
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

'type' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  hi6421-pmic-core.c:62:9: error: cast to smaller integer type 'enum hi6421_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/hi6421-pmic-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/hi6421-pmic-core.c b/drivers/mfd/hi6421-pmic-core.c
index cb5cf4a81c06..a6a890537a1e 100644
--- a/drivers/mfd/hi6421-pmic-core.c
+++ b/drivers/mfd/hi6421-pmic-core.c
@@ -59,7 +59,7 @@ static int hi6421_pmic_probe(struct platform_device *pdev)
 	id = of_match_device(of_hi6421_pmic_match, &pdev->dev);
 	if (!id)
 		return -EINVAL;
-	type = (enum hi6421_type)id->data;
+	type = (uintptr_t)id->data;
 
 	pmic = devm_kzalloc(&pdev->dev, sizeof(*pmic), GFP_KERNEL);
 	if (!pmic)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
