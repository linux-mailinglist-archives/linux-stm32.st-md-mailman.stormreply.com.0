Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1409E7B2C
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 22:50:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC86CC78038;
	Fri,  6 Dec 2024 21:50:10 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D44D7C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 21:50:03 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e388503c0d7so2465151276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2024 13:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733521803; x=1734126603;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E1ATQ+hwSVg06F/3XJmwp6Pc51et8mTf/y94acpTuzc=;
 b=Tu6S/fJptO7ouvB1O5wRHqBz7kgQsr5VHzNeFS/tpq69KQlNU4wfLygjDzd6+JVt5f
 k5tkCO25A69E9byTyh3tcTIY/2O62zhmXU+Ll4guT5gzNiHqWYDuE5u8xByrcqQc4ZRo
 gLcK0ErUPDj3cEJRhPjTqlli93MjztruFoBYD3eY1zp3MyXrb+oq6JFfoUAWlsHkD2kE
 dSAOWfSJicTH9Sw/ufIyE0dKLkiA2vUehgBMCi1KbTh/MdLmrSAXJORJRQkL70K9ssFh
 +XOI5eLXAv5F7OrNxedUOIH4M7ybmo781lspP+iuGaLTgsRdS6pwwo9M67V15npKq12n
 apMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733521803; x=1734126603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E1ATQ+hwSVg06F/3XJmwp6Pc51et8mTf/y94acpTuzc=;
 b=aXf0oBM/nzGWqTK+4HbRLYQqdMprgbstaYbQ/MNBglj08RNFxuSsZS6L30f8DZDMfv
 f/0J9DRJgBdN0fwhRFiYVW4FA1ywnApE2W3Pl01t6/XgNO6r7QJsF1so1iQUBjG1ajvC
 LCCrL+SS59tBO6GvGP0/tQPgfap2wgqXac3CWxq6XeKiztCL+feypPiJAaqXeJUFNET5
 XJjtNND/3KP/t30fqh/JmX2e/CLYwZBeZrVnUtu9XJGbmtyg1nEy3Mz+CsDNiwsYXGHV
 +T0tC2SeqwQMuHwUtOaN59oEs9o3kKOafP1NEe+uhVXkQU68+H5sLoaqyBMHQUWXMbus
 G69w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeci9jdRNoSn3qMfYvK+bhl62PbsL4WNTg5LBgi1QAa6G8d05W3AEKgNwyZ7f8KyIVQ+uw8Xx+qsNyWA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzZKPEBe4wXobrIoz4tQ2fCgUpzDDZMHQa0PyJdlm9yHGc24DTC
 TQnFreR1W4MRRiNJOSg7CaSCVZDf35Q3hPKoxoR1tH/yjVldBf88
X-Gm-Gg: ASbGnctnPQe0WnZh9jF08t5XdVPY0yfISrgJC54TOiQKu4DXAuSkQCSv4xnXk4KDbhO
 SaVmbXJeMNWD4uRr4p/h4hdw2It44D5mk+qrT7m/qvKSgrGDUsPHqwNKV8VfyA+tEaXKty5sptM
 Cad/rw8LPW9XyU88dOxF9ggHoUXqICT1X+zGEQG1tKidU4XBwEl2PK9AusSFvFjZDXe9oDe/ZB+
 +xOjbAVHfgGSdqgC/59V7re61buITVs6dF3O59DpaIymRkrH2eT7MkAxmd/0Q==
X-Google-Smtp-Source: AGHT+IHkD9Ci5WOwSKQRn4HpRXLx7B5Rbt64C1MzXq6No2+Ek1WnLIKvhB0xUCl9WeQHCE1aUg0ICQ==
X-Received: by 2002:a05:6902:2b88:b0:e39:a3d9:48eb with SMTP id
 3f1490d57ef6-e3a0b133286mr5243945276.26.1733521802732; 
 Fri, 06 Dec 2024 13:50:02 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-467296f2d0bsm25474161cf.39.2024.12.06.13.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 13:50:01 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: ukleinek@kernel.org
Date: Fri,  6 Dec 2024 16:53:18 -0500
Message-Id: <20241206215318.3402860-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, hierry.reding@gmail.com,
 Mingwei Zheng <zmw12306@gmail.com>,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] pwm: stm32-lp: Add check for clk_enable()
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
We used APP-Miner to find it.

Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Add tool name in the commit log.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pwm/pwm-stm32-lp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
index 989731256f50..f09d097d6284 100644
--- a/drivers/pwm/pwm-stm32-lp.c
+++ b/drivers/pwm/pwm-stm32-lp.c
@@ -167,8 +167,12 @@ static int stm32_pwm_lp_get_state(struct pwm_chip *chip,
 	regmap_read(priv->regmap, STM32_LPTIM_CR, &val);
 	state->enabled = !!FIELD_GET(STM32_LPTIM_ENABLE, val);
 	/* Keep PWM counter clock refcount in sync with PWM initial state */
-	if (state->enabled)
-		clk_enable(priv->clk);
+	if (state->enabled) {
+		int ret = clk_enable(priv->clk);
+
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
