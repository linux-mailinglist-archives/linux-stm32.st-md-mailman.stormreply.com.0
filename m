Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C839D777518
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:58:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E024C6B473;
	Thu, 10 Aug 2023 09:58:55 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 863D4C6B471
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:58:54 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3fe12820bffso5915025e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661534; x=1692266334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+nzMX9FF8kMvDilSoJvEkDnwU2aF0sCzfp1fOHFLkw=;
 b=J/QzEdrotJeq6mkMZKmknV6NSGn1i48xgkQlExfqCknCcWTmLMs+dKECTzaDTq2EZ2
 OX9b58tvVjvvwoKEvSIfaVB0EDLFq8r0/LG956ROPx7m54ErELhjciAQ1tutZYTsbcLD
 tydeQgAnpCdXuBEFaGOS3hbuJdqwiksqMwqmtsPprrnsShUx3mX5eYrlwP8kgk8s9q57
 0j7035BtnLYfAHRMkWtvJfauDV5Bb5jmMHQIhLQRByiZLUkGWC0F0GRgv7u8mehxz9W9
 hhcImeg0tnEL6b6XTqcjtEsdymhyR+MTmp2Xnvkw8GLCiA9w/wZjnSXw1B3etrYs70ZY
 k8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661534; x=1692266334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5+nzMX9FF8kMvDilSoJvEkDnwU2aF0sCzfp1fOHFLkw=;
 b=UonmbEjH2FRezXEK2K63pP5QoQmGZqVEZbLNWNBpp0NYLjnHbHFo4UAQawauU9ry/3
 rE84Vnn31j+E50/g5ZOGfjjf6hPeL1aDyRmU1YX5qDCdZNpKDs/8sz2697UjvRJYhLOB
 TpQ0puM3a+2as4kCjtq5gJ6B5ylHDKpANm5w9c8zid2p4KuYJ8JhgXJGTLqMub7bM6H1
 wHRwdyW8dOknEbFvya1K+GCRhTgesaCJopJx5qfqCXskUZkbSuBT5aHKmggt7tqqEsH0
 6hZMiUbZSRrkCCn2A/EbbfKT4yB50UWGSzpFFsfB+aHUXMLP6eDpQHAFKxIhSqwwk0Uy
 0d7g==
X-Gm-Message-State: AOJu0Yxvvs22BzkJru3by25Mf/QuQANScEv4XahN7LGUos/y7TtUZhHt
 broz++Jl0WMrix2Tcy0iwuvK3T2NHXrYKmSv+rgTlg==
X-Google-Smtp-Source: AGHT+IGOY/Wa6bcolP74qFMq1OnVMSVcWZhnbgWCe3a3KtgXEdLX4dfd1HffY7h7uIWP0SudxOc1Kg==
X-Received: by 2002:a5d:4683:0:b0:317:39e3:7c68 with SMTP id
 u3-20020a5d4683000000b0031739e37c68mr1555463wrq.18.1691661534148; 
 Thu, 10 Aug 2023 02:58:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b003179b3fd837sm1621372wrj.33.2023.08.10.02.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:58:53 -0700 (PDT)
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
Date: Thu, 10 Aug 2023 11:58:42 +0200
Message-Id: <20230810095849.123321-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
References: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [Linux-stm32] [PATCH 2/9] mfd: max14577: Fix
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

'dev_type' is an enum, thus cast of pointer on 64-bit compile test with
W=1 causes:

  max14577.c:406:5: error: cast to smaller integer type 'enum maxim_device_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/max14577.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index 25ed8846b7fb..1f4f5002595c 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -402,8 +402,7 @@ static int max14577_i2c_probe(struct i2c_client *i2c)
 
 		of_id = of_match_device(max14577_dt_match, &i2c->dev);
 		if (of_id)
-			max14577->dev_type =
-				(enum maxim_device_type)of_id->data;
+			max14577->dev_type = (uintptr_t)of_id->data;
 	} else {
 		max14577->dev_type = id->driver_data;
 	}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
