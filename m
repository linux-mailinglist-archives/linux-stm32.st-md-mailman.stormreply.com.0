Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0832E9E4E04
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 08:13:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B23F9C78002;
	Thu,  5 Dec 2024 07:13:27 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 162DBC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 05:14:29 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-46695478d03so7467541cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Dec 2024 21:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733375668; x=1733980468;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zqIsEszztQaofpg7Apmowpob1qU+kHY4W1kZzuvfgdE=;
 b=Xmbby/yvbMjqvSxDD8NQe6GQhvsHrAsY4jP1sB+duk0tHtRR8KI86xYW7IYTYXSrCF
 YKY85bE7FPEHSoBQwVzP8WI+mKLMy/eB8E6V5pu7rUq83YftYVLwBAaxrjP+pRiLZGMt
 KKp3Jk9Yp89x4QG+TVKOtt65mw2WB8mwstLGbihbG6AlwLIBWYvXRZS48MXIK8i+mpKc
 Y4knYHo4kNfpZeGjHMEYtFMcWqAbG8Tuqwa5H33xunVL6mPF2rFikJELQv8U6Pa+EWgM
 IYfbTw3xYCXokfT9lKUgSQ6/Vx+oPJt+4+fIAvBdIN00FfXKNczdsgJtDvdWSm+jQo8H
 M9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733375668; x=1733980468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zqIsEszztQaofpg7Apmowpob1qU+kHY4W1kZzuvfgdE=;
 b=ftCuXunrJVPeqTTu9fG9n205XuIbHmuJyDEJMhEAhssbxbsv/jbJfMjo6Bcbz0kVxC
 fVw3UxIQSCfcoIVX2wDoxiBwQ4PVdrCxbyoSm6oxPCQff8k0gNz4LHFiPcxl55+IjuPp
 obWRT+WNOilkYKTuYwX1/zPe+Y/hsK5/lUPKMpIMis+DUyd4s6nq1o7j1nDBPEABtN4T
 qSr9QCIFttrvRyHfYZqwEloaOAGOVVhbIjA9pcCgEv1AGndS7TM0gcz/k8zbyCfD88Dk
 CxgBY4ONwYNmPjTb+DJ9DsNaDNPDIqW0UDTRFC8tXoxpud4kE1BbhIYW2EGCW/gpJKfG
 Foag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEFb2575HzQmACFZRLSFEbTzmpOCHNJVTntoWYek47j2G989uT+MRlqn+rsO054D0fG02dAVwYQQYy6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwzDugexIeh92UHr62D9B/XnA1W5jg30l+9Exa+4WJWPCb2epuZ
 iM+sr1JJPu+hmxh++ku+cS/mcOQswErRKWLY3kLE5BYz8mraFFUt
X-Gm-Gg: ASbGncuVYaum8rRMkUPd6OkRV6V3croe7+DuQMYCmWzQwYilUFaizrtUxTDX5pTdQ1v
 hoZf5jVD5cwArrOd7wcuYxpiIx9MktYMj2X6aQP7xojLRHVAH+0OU6bxp2kQgdyiNNtlPKWJ/GS
 nkt7iJ65EOeUa8cGQ1spA22HjuCOUtfx02Rc3w2bsTXa0k2JfJdyRDPcSKvH85PRvSOKu9QtkDe
 q/1waSY9MkvvgC+2tsG10Wq8r57JslK8MoXmNRE3N+Klki4NlW7dNKx3nu06w==
X-Google-Smtp-Source: AGHT+IHzGOaqKMeldKYNCc7I7mqnuoEWuHAjvkW6hiehdx/v3xwHIV4vK2uaIYyHVBgVn+HHe4JCfw==
X-Received: by 2002:a05:622a:1992:b0:463:5bd4:59b8 with SMTP id
 d75a77b69052e-4670c712e88mr150275551cf.40.1733375667946; 
 Wed, 04 Dec 2024 21:14:27 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-467297c239dsm4041821cf.77.2024.12.04.21.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 21:14:26 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: fabrice.gasnier@foss.st.com, ukleinek@kernel.org, coquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, thierry.reding@gmail.com, lee@kernel.org
Date: Thu,  5 Dec 2024 00:17:46 -0500
Message-Id: <20241205051746.2465490-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Dec 2024 07:13:26 +0000
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 Mingwei Zheng <zmw12306@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stm32-lp: Add check for clk_enable()
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

Add check for the return value of clk_enable() to catch the potential
error.

Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/pwm/pwm-stm32-lp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
index 989731256f50..4abef304417d 100644
--- a/drivers/pwm/pwm-stm32-lp.c
+++ b/drivers/pwm/pwm-stm32-lp.c
@@ -163,12 +163,16 @@ static int stm32_pwm_lp_get_state(struct pwm_chip *chip,
 	unsigned long rate = clk_get_rate(priv->clk);
 	u32 val, presc, prd;
 	u64 tmp;
+	int ret;
 
 	regmap_read(priv->regmap, STM32_LPTIM_CR, &val);
 	state->enabled = !!FIELD_GET(STM32_LPTIM_ENABLE, val);
 	/* Keep PWM counter clock refcount in sync with PWM initial state */
-	if (state->enabled)
-		clk_enable(priv->clk);
+	if (state->enabled) {
+		ret = clk_enable(priv->clk);
+		if (ret)
+			return ret;
+	}
 
 	regmap_read(priv->regmap, STM32_LPTIM_CFGR, &val);
 	presc = FIELD_GET(STM32_LPTIM_PRESC, val);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
