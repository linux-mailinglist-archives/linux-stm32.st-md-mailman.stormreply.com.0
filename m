Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A7377751C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:59:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3440C6B473;
	Thu, 10 Aug 2023 09:59:01 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8B39C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:59:00 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb72b9so6061415e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 02:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661540; x=1692266340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFuO5hxxZfdPQonjF+3OJq8vcIVSzlxg9gVUs4JTzVc=;
 b=s7ppzoSXQLQxBtitHlQtQUbeSWBZt39Nydg9EJcgmTYLu+1Mfx9sgXrzRAYNULlsxM
 k8DnnJGF1oHjf0125Ac/No6SiAS1nt6h6RWEkG42gs5RBOJbJ43dUKUsJ7bGBuAl87z1
 A9e5FRmOl+wM9VxY7+Av/Mz7/RBUbK2TQeyXPSe7dl8caLPOjdWplXwVLQPArjgevCFl
 9pW4sUG8b983mK9kAATsVq/gEeWEm2LpnF8m4vIHqM6LucPO0bLwv1oNyi24hrmouByb
 PDUR8MfR/MhPvH5xGs60/uco2WBE6EA8q+G9QCpop2VodTuQ2wA8rkWoZK+YYOKFq1m0
 ESCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661540; x=1692266340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFuO5hxxZfdPQonjF+3OJq8vcIVSzlxg9gVUs4JTzVc=;
 b=bS3nVLfUMuu9XsI27tV8oqtrPeKSN/hZNXy0vDtveg8ZU4hZYx1wjGLzP4Sdo5fBXK
 SCfC72hjGZtwvzHAbcwLLlGelNKx8mYl5VZudRgVn0OdFIJ4RelPB9Sy3L44gWSVFCl4
 YqJ3EikGkNah2F6fQJSo25AhUAeUMN32swo4UwHH7JxxsBMC+he6eQjiw/m+fKjUgOc8
 XAr+ORNDg9GBMrlQD8RLKKnfwRXddqZ/FBVoqXQKCGF5rPhso7VQdeZ9ZUrvJmmJ4bc0
 CEycIY28YCdHKUm+7JqPQl3th94nCDxUTf1A9YvtQeOHws63INQqgRh25Y/ZmgzuoxSo
 k0Wg==
X-Gm-Message-State: AOJu0YzCjdes5dZc5DzaX6qq8+WhQ3zWRM79rfRbbgKl2QeDCMZN/N5O
 oFIvAXIv25bvWrODbfUaYEZOug==
X-Google-Smtp-Source: AGHT+IForamv537Mzb3auqFWpWhZvSzFSsI6c+QRtf/dRFBJMkYQoT92gxmF1fSxOMILj0xv468ssQ==
X-Received: by 2002:a05:600c:450:b0:3fe:16c8:65fa with SMTP id
 s16-20020a05600c045000b003fe16c865famr1544464wmb.4.1691661540340; 
 Thu, 10 Aug 2023 02:59:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b003179b3fd837sm1621372wrj.33.2023.08.10.02.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:58:59 -0700 (PDT)
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
Date: Thu, 10 Aug 2023 11:58:46 +0200
Message-Id: <20230810095849.123321-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
References: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [Linux-stm32] [PATCH 6/9] mfd: tc3589: Fix
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

'version' is an enum, thus cast of pointer on 64-bit compile test with
W=1 causes:

  tc3589x.c:343:13: error: cast to smaller integer type 'enum tc3589x_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/tc3589x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index 16df64e3c0be..1a6ab8e7a614 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -340,7 +340,7 @@ tc3589x_of_probe(struct device *dev, enum tc3589x_version *version)
 	of_id = of_match_device(tc3589x_match, dev);
 	if (!of_id)
 		return ERR_PTR(-ENODEV);
-	*version = (enum tc3589x_version) of_id->data;
+	*version = (uintptr_t) of_id->data;
 
 	for_each_child_of_node(np, child) {
 		if (of_device_is_compatible(child, "toshiba,tc3589x-gpio"))
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
