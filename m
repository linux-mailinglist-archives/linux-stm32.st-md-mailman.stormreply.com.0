Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D302D777519
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:58:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C0A9C6B469;
	Thu, 10 Aug 2023 09:58:57 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB4F7C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:58:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3fe5eb84d43so6422275e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661535; x=1692266335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zT30MW4jzOeQi1uZyE7Ccpk1TKZvogpCYUy/NOvSbr4=;
 b=AJWA9DjnuW6YJYPEhAurKTlb9MzzWpjanEuGmxAhIcghAxzAJj7cy0gLt+n5uLkKS8
 6jWGVQAgR9ofnRWZLJpcr/Ihz/+MZaiEZUdR9KNLCbXiwf7vZMZaFMVuy5JEzEi5WptB
 O27JpOfWnh3XuMMbepD1wCALaOytQKI/OM+Lk5wwKnlDvCCXlh+nCu+wOH3OXJRbPD+3
 poOhQyXLn+ylCJ9XmnDkuCLddpTMe/9jPqFHNzoKyUIy8Ch03Ll501sfzFAGxkOVCwHg
 9KroNgqx5Zipbm8KzYl/k6rqXe1TwA68AukW+4bYi0Y3aajsHmfHk7mp8zFjzocizvIt
 im1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661535; x=1692266335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zT30MW4jzOeQi1uZyE7Ccpk1TKZvogpCYUy/NOvSbr4=;
 b=RNGHgpFsUH7XZKp9w+CIPf0fE1dAPEXRsQeRX0RAzvjkGzQAfSCjRNZRLwCcZeMPm4
 eFjbtPiDxzjJ2wVLgT/ISJmpghnbkyyreSoFav8B/VV7GZQnLt281497BR0t7jRlnN11
 U/OD616ZPQ9SkrTiZrf+jr4KTa6jdIzvxRabvbY7YaFtr84XpRC7vyvYO16CCiIRRIkR
 qd0h/OaJPPNg/DkXkmPqXw0wXv+UEUcauzQAPSzR3bKfeNW66OJQUN5oSZ9MXUw3r41i
 GDXCqThzZpXRZ0PEoQiXsx4z2N5RS7Fjrr77kTr3dkG+gxbW8m44VwECLSTqKu3TSMY6
 HPfw==
X-Gm-Message-State: AOJu0YxkAb29k4CKg12cbGFV8MoW+x8iClz4e0jo9OKGfxun0ks77UQe
 Yvx9e5ctQrjkqOmDmmBuk27hxg==
X-Google-Smtp-Source: AGHT+IEFVgI7lrkYa1atMPu7ocBsjYe8mkIm4LQuqGXlcvMqYeI3ii/7xo+wgL8Nj+yvoj43cJFNxQ==
X-Received: by 2002:a05:6000:8e:b0:317:6849:2d39 with SMTP id
 m14-20020a056000008e00b0031768492d39mr2015146wrx.10.1691661535636; 
 Thu, 10 Aug 2023 02:58:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b003179b3fd837sm1621372wrj.33.2023.08.10.02.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:58:55 -0700 (PDT)
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
Date: Thu, 10 Aug 2023 11:58:43 +0200
Message-Id: <20230810095849.123321-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
References: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [Linux-stm32] [PATCH 3/9] mfd: max77541: Fix
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

'id' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  max77541.c:176:18: error: cast to smaller integer type 'enum max7754x_ids' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/max77541.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/max77541.c b/drivers/mfd/max77541.c
index e147e949c2b3..10c2e274b4af 100644
--- a/drivers/mfd/max77541.c
+++ b/drivers/mfd/max77541.c
@@ -173,7 +173,7 @@ static int max77541_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, max77541);
 	max77541->i2c = client;
 
-	max77541->id  = (enum max7754x_ids)device_get_match_data(dev);
+	max77541->id = (uintptr_t)device_get_match_data(dev);
 	if (!max77541->id)
 		max77541->id  = (enum max7754x_ids)id->driver_data;
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
