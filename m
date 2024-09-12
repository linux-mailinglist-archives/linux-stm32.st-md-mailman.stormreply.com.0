Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A3992858
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:42:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7FAAC71287;
	Mon,  7 Oct 2024 09:42:36 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FB96C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2024 12:49:58 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso8082875e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2024 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726145397; x=1726750197;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3rp8VVpH/dfJ3MmMbT8/Q3u0ccTN+30a/lu2S0UiEGQ=;
 b=ifdRoWMJa1M8mYg6RK8HrDpCq59qBiqqwo+AFm/OeffQgTjy7gtsZsYocFL6gfIpeU
 IIDZxfCL4YmSGrzOFfu3uK1anyFbzUa+CxQqH/cZGsMwprFgWSHbmOPBqjhJJQ1cOSgY
 /3iRxGsioQjWzRA1Aow5VIatOhN7iso6yVG1DrDR+WXBamaQ4Hur2knqodFV5fGuIXv9
 fhJDufefY6yvTr6wWlZugTXpBitM4uqan3Ng1pB2Hh09VFjMYw+XjaghjOCaQqQc/f7a
 Mx8o0jGAIN+eFzGpP2jbmLHjIsAdV69zlSUw/bGom5a7SNg2+14TiyZ++fswenuGv142
 tKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726145397; x=1726750197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3rp8VVpH/dfJ3MmMbT8/Q3u0ccTN+30a/lu2S0UiEGQ=;
 b=YDn6ISG+gNLvzKxs7UILzVBfmLfgaM7VoWZFW4ONC73XMK4V8hAUyzougZ32yaaMaZ
 F4cg3LUH7urwWi8BK8IvZeg2lQZ1UPOQpF6DEx2J8DhHewYjPfxAtw5hmEzx7QC6anV2
 qBE98ZqJ0r8LEhpCcM2PXBjXB42YULzkC8uDdLIC0kjLCuxTs7eRQTaBVM5XU/OLaZn9
 RDni1Y0x7CzH5GN/poGtQsMewD4Z9Mp0eG76ReMsOt10EXzr5WXwY0U44bj1EZn1jewh
 kJjAi4V6NjHMa2IV1UsnE1DyaxpN8XbQbI5nmxCOJR0QtRn7Gb3/c9qkbWAkdp2hBxci
 4qoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy18RSqaW+04WIX2qWEWxmrQXAbz4RXe1EHqsCH/2xmQ3aEMUkTC3Si03M9panFchspWmvL5/NGktdCg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6qpL++Jr9rryiBcM+5ZhwT3Rd8e12KgXnhATZDHW9TLisyAMa
 HH0oNhj1UHb+tSRfN6afOn3brT+p0d4rwxIk4GlK+buvBzrdnB3e
X-Google-Smtp-Source: AGHT+IHvi+LdQatFb0FXKtNS+8padGl4YLk4uDGuOprj1zEkd8AriHOoq/BcAdcDtYHdudFTCHDnHA==
X-Received: by 2002:a05:600c:3581:b0:42c:c401:6d67 with SMTP id
 5b1f17b1804b1-42cdb4e6966mr20929535e9.6.1726145396696; 
 Thu, 12 Sep 2024 05:49:56 -0700 (PDT)
Received: from void.void ([141.226.9.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb5affb16sm148200105e9.37.2024.09.12.05.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 05:49:56 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 12 Sep 2024 15:49:34 +0300
Message-ID: <20240912124944.43284-1-algonell@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:42:34 +0000
Cc: linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Andrew Kreimer <algonell@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stm32: Fix a typo
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

Fix a typo in comments.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/pwm/pwm-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index f85eb41cb084..eb24054f9729 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -222,7 +222,7 @@ static int stm32_pwm_capture(struct pwm_chip *chip, struct pwm_device *pwm,
 
 		scale = max_arr / min(max_arr, raw_prd);
 	} else {
-		scale = priv->max_arr; /* bellow resolution, use max scale */
+		scale = priv->max_arr; /* below resolution, use max scale */
 	}
 
 	if (psc && scale > 1) {
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
