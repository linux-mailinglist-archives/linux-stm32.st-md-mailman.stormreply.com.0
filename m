Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 061B277751B
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:59:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1AF1C6B471;
	Thu, 10 Aug 2023 09:59:00 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26D36C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:58:59 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3fe2d218eedso6477305e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661539; x=1692266339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MndypYtimqWx47ssa6TipsWDywYZl6jKKyiOJ5e6wQ=;
 b=BgZuTsBnQIcEbiKxpCFTaYAGSE/pf91bMc65eHED0Ch2hhnsQucs14PtvTZOpNzEMo
 APwUn4TJpCnn7mttawJ5SNZHSJ7ZmaeNNFWTWgFtWUd+CfIHEv6hAg8KrYnLXhV5clu5
 lVErd0uADSlQr2r+1bxQU/bUFs5of4Gl0vOv+0k7xccf8z82TSo5EkzbPdZv7KYyWO7H
 vjdEqOBOap96GT+EARYW6ytXkDtwvdasVTMcgolpTz+7zAun20jEQsopFS2fHuwR5s+d
 ztGJ1Myt8wGu4hDu3A755hNpiVu3MnkB8CSKzIog8Su4Hphprc7TJBiIqt+cB6DlAbQV
 ygTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661539; x=1692266339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MndypYtimqWx47ssa6TipsWDywYZl6jKKyiOJ5e6wQ=;
 b=Vqqes2mT0rkz2Go6FMCG02Be5Mjmwaqq0vXQRQk9xzuDL0qWdeg3iYHpIkfYdyE/n9
 DBsR1cVIRq6sHdBp02r+FU/IRh44AJa12W50nz4dKhrqpVVto3MOLl/HvRbB2kIwSCP9
 wKsEjpLloh/yIEKTmxlFrp6SY9KkPpGpgWXk7mNb9BYgAtcjccYYzSabOfFpnC44QciO
 ixze72F1M0hLtNb48pTPCJCfiOARt0glY4bNrL961R/b4ulO36DxI39uYVVsPcAKWYKp
 ikhPJ/P9jpuBxQsTiaku9XVXqJ44HueUYg7qo32YFd+/JkVsiHt94UY8Yf7iqHesT2hk
 1jag==
X-Gm-Message-State: AOJu0YyhzYxYiG70r5wcfggMi6Ii0WwphtP8dARCwfHZI7W9XPq09X/m
 Vv/SgoDz+jUQ5GBKwBtrrYzaEw==
X-Google-Smtp-Source: AGHT+IHVzJomICOvo889M7h65ixaG1lcUa3kKQExp6Cg6l/h2zj1FMty+G/XGFpNRnF9vXehctBCnA==
X-Received: by 2002:adf:e74f:0:b0:317:dfaf:827e with SMTP id
 c15-20020adfe74f000000b00317dfaf827emr1505852wrn.71.1691661538840; 
 Thu, 10 Aug 2023 02:58:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b003179b3fd837sm1621372wrj.33.2023.08.10.02.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:58:58 -0700 (PDT)
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
Date: Thu, 10 Aug 2023 11:58:45 +0200
Message-Id: <20230810095849.123321-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
References: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [Linux-stm32] [PATCH 5/9] mfd: lp87565: Fix
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

  lp87565.c:95:23: error: cast to smaller integer type 'enum lp87565_device_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/lp87565.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
index 88ce4d7c50a7..1b7f8349911d 100644
--- a/drivers/mfd/lp87565.c
+++ b/drivers/mfd/lp87565.c
@@ -92,7 +92,7 @@ static int lp87565_probe(struct i2c_client *client)
 
 	of_id = of_match_device(of_lp87565_match_table, &client->dev);
 	if (of_id)
-		lp87565->dev_type = (enum lp87565_device_type)of_id->data;
+		lp87565->dev_type = (uintptr_t)of_id->data;
 
 	i2c_set_clientdata(client, lp87565);
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
