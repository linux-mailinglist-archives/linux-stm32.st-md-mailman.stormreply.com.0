Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44EB35979
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 11:54:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5B16C3FAD9;
	Tue, 26 Aug 2025 09:54:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA50EC3FAD9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 09:54:49 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45a20c51c40so41661535e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202089; x=1756806889;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CYPPBVbCADpKhi1bi9q9qzWJoLo8lysoUYAIi1sKWso=;
 b=18XcM+F+oM0rlv6QSyuhhWd2JvRuOr+2gJJoFQ6oXBQKzaFmFtcID2rD1Q0DbTW4m7
 5q0FPGeErjjS8xnyNv/tzreij0PIOhy6wuqnrxjeqLaJf0fyAKZx04+0DOhSXIKs4LGc
 q5kRq+N6eDXdLGmvoNhYbUjvKourjLWGO/nQXeU1KxlxUlReq9sTv5A1vboHlniYRoqr
 JTCwZ4pvdhWy9cSBHbtST/B671WnHDguGc/stOYcCFq1AbY0LZ2D/qcaWjJWMopOWRL+
 NLVNMVC9SNDamP2AOtnqCnLLSdVpuA+y3BCchBy/AvwkYwon2tLcmBgZatO76gixa760
 JHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756202089; x=1756806889;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CYPPBVbCADpKhi1bi9q9qzWJoLo8lysoUYAIi1sKWso=;
 b=UJcHP08QKz0vEY7D9LJl0l+fvGzDwsEj3BEph1n/mXtNd96fgNHS5My/Lynv78NL9k
 YudVS+HEBbnN0RkUnVcUeufp+e6K8Qtr/1Bsq3yzODg7P/G95U4reYVKwuvHRV+HGv29
 JdsUAu1vg5SYYUJKhNk8d05QOYPzJtTGOtVL/Up0OEA5rOa/jIEqJ/X3B5ESvLgndFvx
 OjqBdpph3HjTCUjWrpVr6KvxVvzDxwGU5vvjdOCba6c0Wau1tc2Gna5RVpJj6dflW4Sf
 Z/n4DkAEuxMpy402tj3SwL+BaHt8evfLCr/iUxBcp/FHxeY99YoCDZKrR2lgvy3JNeSm
 USRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCzvCRwMDT+zm5n5rIvCSN1JrRvZ4KdMLy1vlzsxBN5IPOHoccMRVakkOp5qBnRzBRDi79kWb62L9DSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy6beFWDwRv6c5bzv/jaovKVn1kyTSJ+eo9KqnI/jE23aGwPFJl
 l5Y4za+LX/HFYIMWPie1rt/QntU7pltQUMyeHapAdp35vUsd9AziIpfsP0Y8ob0XQDk=
X-Gm-Gg: ASbGncsxIEhp975DzeNa1r5BFvxjIFqhwejphUAu7LQ6wbxU34H8kiZ+cPADsjGxD82
 9CIFoc0TPGtrJWghUU7G5LjbRHOcta6dSdcF25u1IV3m4o7o2MAqRnMa0Ab+0Cx+n84FPx/jSRJ
 1LgJYV4aQJtLtB+uuiw4OoWaqujSnNS90hDiPvs8G01AZwuzxUyIWjR4v+86tPTFXdRC+a1biTi
 8Sea6SahUaDzji9pJur+BriR0ipF1e9uIBXQN5jU3MZFDEn8NyIWKuj8Vf/fR4JDfoArn0KWzNn
 /RrliQmgH/vJgjtVJbAKwqW5boWWkZlhW515lk7DtXd7uLfK5Ja1c6pcX6XAQAQjjp5j7S5TJoX
 sd9q3Xm+NMw9WR3Mi/g==
X-Google-Smtp-Source: AGHT+IGpWBizMY//MBhSvlr9tBPYwg0Y5CIU4h89Pdi4ol5gUDn6YVkBG9JRn0IY9DS4Uz+pdj2F+w==
X-Received: by 2002:a05:600c:a4b:b0:459:d3d0:650e with SMTP id
 5b1f17b1804b1-45b56f781f1mr93995895e9.13.1756202089140; 
 Tue, 26 Aug 2025 02:54:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 02:54:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:39 +0200
MIME-Version: 1.0
Message-Id: <20250826-gpio-dbg-show-base-v1-5-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Ih0doZjhwnqEDQvY4BwLNFHdMVjlZY2PNt5pCcC7YMw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRhcpj4kqrJ8fCQz7UztTDjdV8EBVimDDXsl
 58MvqCng/aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYQAKCRARpy6gFHHX
 clN6EADhb6sNqywomuQGbo2ieaNoLgLHDA7EmFyphMzWXyAawSNEGuBX4/n0ThtHi25Yi4innjv
 mCr991m26FZq3T/hcccGRbWPXAF5EvVzn8oFTa3ABrM9hxRg1uGzD6d6vdwzo9kp18GW0HfyQcs
 Fz+md/af5QDQzJRHzG2w4D2NDTc+iWdT0lX2nd8Vr08n3FPtw+yJvnaJbavDtGdCgpD41gTLUd8
 3vyl33Idw2mbNroYq2RQFezk84pCh5Y65qYyJAu/8cugvbwXkyFJ8qBHDQqKX6kiYOFGRUsyxuX
 A3wepapXNcOKLKAwA9b3s8SQJug6czXExk29z2Rv9ijJuPxArPScEv5LdYdwIhAEad7u43YpZm/
 sHfCTKhb3PbsY1R6u0J9EQ4GS7rScCaWU/L3ulx/aR8ocK2D+3mSEnIchmuHmmL5PRGzAS0E535
 H5ieprNvRn8jxG+T7OLs+3W70GIYk53ud0qSyduu6VUuN9Nul1eEtgKZplHMjiNkM05iIzDRY+t
 Ggl5wWu2ww+8AjSJnjxEtuTZS4DnKwSg+f4z4sN//F10F0SFquqsVrklUQxSQXFzutLCzrKbg4r
 t6/BU4KTwKIxNB+VFO2hx4KL0iKISjpUkEb7pNTtM6oDhaErh0AULImXD3xg5rgVRmQcToBtyN1
 X2vSa8ptjrUp0zQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/6] gpio: mvebu: don't print out global GPIO
 numbers in debugfs callbacks
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to further limit the number of references to the GPIO base
number stored in struct gpio_chip, replace the global GPIO numbers in
the output of debugfs callbacks by hardware offsets.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mvebu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 261ffd0c614b7189287c361f392f3df6d1b0bc57..ac799fced950e306a967d1965a13f8e1802e77b4 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -898,7 +898,7 @@ static void mvebu_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		msk = BIT(i);
 		is_out = !(io_conf & msk);
 
-		seq_printf(s, " gpio-%-3d (%-20.20s)", chip->base + i, label);
+		seq_printf(s, " gpio-%-3d (%-20.20s)", i, label);
 
 		if (is_out) {
 			seq_printf(s, " out %s %s\n",

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
