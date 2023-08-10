Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A677751F
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:59:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13058C6B472;
	Thu, 10 Aug 2023 09:59:07 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BE94C6B471
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:59:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-3fe1fc8768aso6490615e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661545; x=1692266345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bVuqAG+3F8qvCMUvzd26/3b8nCKRcSvskoI/mhLxS7I=;
 b=ksSOYxOFVkT2qDMyrJ9QBdmS1xXtVYG/DwVFHFNz4VM0u1Y4d4rHdP8UHaH6PtL2mx
 sRpCcc7EbrpG3JOaow28og7kFgiPz0EXJwbZJdjZ/uCjEBE6XmzJjU3+bUBlXga/bm1t
 knQf6Nys2YwNfutTBqx6gCRKJzEtf1YKhgVV87fevigV7p8NiMy+VbWrDIRAKVGtCC/1
 Fc9aYo1ZquPOW+MssbVo2S8L8Wp9gQMiMrdo+lLv6CGMOlIl7gXw4eZh7eJug4kU9ewe
 1edAktLWh1Z47nqDcBw+OwBkRV02ozZ6JKqvie/i91XK11X200801VIS6J2cfGDJdAY6
 MO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661545; x=1692266345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bVuqAG+3F8qvCMUvzd26/3b8nCKRcSvskoI/mhLxS7I=;
 b=R+E0d6HCjT029ztp++vE1nW/JKskwbNPioevM1Tkd5YXBO9+grg+yiXJjHutK+TtHF
 94E1cdeTS9pD0Y6Z+bM5ToCxoEJ0iUnWYUScXSv3x7TOFJkTqnrzinVxY4AFK98SugWd
 XK7Ns7TyMXOX5y7jR2gt913b8JMGOkbngjDfwKe7bY9XlJxQSOwBsyUUlNwDAAI+S9p3
 aaoRKb06zAKFALsp1wQtyTG55Ra5zK0ltY3trMnpsn6wpS/hASPL6fYNFUwZYtwMSYba
 fbM3GCFt0/uQtluwoRwcuctTN5cCbhNEI8KRW1tumEtQdju2o7ApwiYozlgciN5IzGRr
 XCAw==
X-Gm-Message-State: AOJu0YyJSvEU6KXYbkh+yu01o7PaBf7qMvc3J/qiZFISSF/BAnrF+P3n
 WSGUT3iTub1MtBJnR8qYmDCmuA==
X-Google-Smtp-Source: AGHT+IFCtq6WipB2zbEW7I5LY2IMam+QHd5OZBc1WfOVn8AUy9sdNsjd5hNeX11xqSry0HmTCBGtPA==
X-Received: by 2002:a05:600c:2493:b0:3fc:f9c:a3ed with SMTP id
 19-20020a05600c249300b003fc0f9ca3edmr1638634wms.22.1691661545133; 
 Thu, 10 Aug 2023 02:59:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b003179b3fd837sm1621372wrj.33.2023.08.10.02.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:59:04 -0700 (PDT)
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
Date: Thu, 10 Aug 2023 11:58:49 +0200
Message-Id: <20230810095849.123321-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
References: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [Linux-stm32] [PATCH 9/9] mfd: mxs-lradc: Fix
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

'soc' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  mxs-lradc.c:145:15: error: cast to smaller integer type 'enum mxs_lradc_id' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/mxs-lradc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
index 111d11fd25aa..21f3033d6eb5 100644
--- a/drivers/mfd/mxs-lradc.c
+++ b/drivers/mfd/mxs-lradc.c
@@ -142,7 +142,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 	if (!of_id)
 		return -EINVAL;
 
-	lradc->soc = (enum mxs_lradc_id)of_id->data;
+	lradc->soc = (uintptr_t)of_id->data;
 
 	lradc->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(lradc->clk)) {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
