Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C8C9E635C
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 02:23:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 132C7C78033;
	Fri,  6 Dec 2024 01:23:17 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A285C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 01:23:09 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-46689dba2fbso9281141cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2024 17:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733448188; x=1734052988;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jvGV4uV7dd9ya0e1OrNzeXExW0G1jrTQiEOMfyJbCNQ=;
 b=E92Jzz+cvA/CJ+y9u+82xtt8KG2BFE6b17FF/L/ZWu4Cw0TE++RpAsygIBVGLGYsIY
 dpLWGfINR80w+HJYrRrIM7Pqlm3tmbAiIa0fyaIFr36SSX519JOmSBBmKbjnUEW4v8rt
 /3XMs0ULIuBWDtDFMupayI6AYLIqCHvoKgZXypRrcEnv1L91cDkR1WLcDRrEfosvZkBp
 xCXptSpkUbXZkO0oX37ffPbVmpuZMnaeTVrEQAE6lhv80EO6wthzZ52Gz+CnFTbhNSyE
 gYnA3GBDXFJhPue1x8K60x/fjGE4QKgtVZRSY/7/egaOCLJXc56eh30MVg877SlhKoDw
 MjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733448188; x=1734052988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jvGV4uV7dd9ya0e1OrNzeXExW0G1jrTQiEOMfyJbCNQ=;
 b=QuDo08Sqa7hEU6Y2l69S5JgL9uSLQWRlcIPF9o4D6xnx15XfWpC3KewgdAsgHkoMfw
 eS16DtMIcQFKbaA0/iG0fQ6mkV132TVUA5HbXzm5/IJUsBF7M1Y2liEryVBaxNaqBDIJ
 yKKldi4mxXqDjhHZnN6c+z7fClCs4vECBlHQ81otlSL9q/bmN6HHC53czX4s7ZPVLa6U
 TCsiWrxkCrNh5++ByE+Xu7OKQdgW7zRRomwKK4Zlnicmk3WrKph9HlnB55S3dLKQwQkh
 ePtj7mFa5eJqCwJerkZruH9LDcFeOtAD0Q5QUarPSb9OR5XNH90Fj4WosFwZrkkRDYjY
 yAWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXJQRgRg58mU5o/Rkt/hAdeK71QRkn2dZBY3jMVF4N2/Psri3HGIqPqwk8VnkELMlAToBm6a+l2qluzA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzDHOyuM6hkxXgnPw7T1fKoimO8IZgeP9kvTa1Qg4WxgvOoxCh6
 4SiBDMDC17L/4rW5KURJ49JWzmIH/JAkU9wMMCH6AghN1rQYswq/
X-Gm-Gg: ASbGncu+46i1vmH/TxZfYVsIi4rV2eUMxflmoHtD9EuASA53PiBaqRbfBYDiBNQkoF5
 fV2E1ItMh7n+AiVPDrMEEp7F8O7OyWev9Cx82N6xhd0jsmLSDrrkr9pc4pTStGj4eoMykXXAf/K
 Fynu3LKSURRmGqK9U80UgifpKbPI0gJaM/HWv6J2KykRyZ3xg/cuq177+ZF44GTHaKOH8n6ZN5H
 gK6TnYdSqVYLXfcH5LAINmVo14ja5wop2SetaeNq8R82bB6zmQRw1Eqhrg2cw==
X-Google-Smtp-Source: AGHT+IHK+wEHEpKWNH9K1+ZII620j8IfRKrpZnPMtL3z9CL/V1j63cap8ccn1cWykpj5ec/jt9vrgQ==
X-Received: by 2002:ac8:5d12:0:b0:461:1fc4:1016 with SMTP id
 d75a77b69052e-46734cbf6b3mr19416161cf.7.1733448188457; 
 Thu, 05 Dec 2024 17:23:08 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-467296d4d42sm14619631cf.32.2024.12.05.17.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 17:23:07 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: fabrice.gasnier@foss.st.com, ukleinek@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 hierry.reding@gmail.com, lee@kernel.org
Date: Thu,  5 Dec 2024 20:26:05 -0500
Message-Id: <20241206012605.2877412-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 Mingwei Zheng <zmw12306@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2] pwm: stm32-lp: Add check for clk_enable()
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
Changelog:

v1 -> v2

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
