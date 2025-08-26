Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33792B3597B
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 11:54:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB016C3FAD9;
	Tue, 26 Aug 2025 09:54:53 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9C83C3FAD9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 09:54:50 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3c6abcfd142so1372923f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 02:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202090; x=1756806890;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xaRZ3orPuVdXJjVO7RddRtX98nkKU7skjLyME4PeVHk=;
 b=RM/dl5ZYT+STo0Lsl3Z5Mk+e+/vC1Sw+x6NM2b6CKztnloY8RVFr8QeOyqTmvnbmSK
 D0fd9ywba0UgDR63RcoMLNxni/dr7BVuNWn+cBcyjXbwn2+dI8loXstSo3RK8n24TCuk
 e8Yoqjiljv8djzZ74uvDXJZYYzDox1OULiCy7l+AzM9c0NWZ8xgzZwhWqOAHPvMFjV3g
 ML6b41QSwGaz3z57r6+nmTnHhXXzEXV92s97CzfQaKgRez6Ni2bRujovzsqpHzXSCwoJ
 /T65XAM8oqrqsvzmd94dTyiihEH37H2gSLfhpOEpcga3TmYzLp1Y564CAaivObcHI6eR
 iXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756202090; x=1756806890;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xaRZ3orPuVdXJjVO7RddRtX98nkKU7skjLyME4PeVHk=;
 b=XpkLLwMZCvL3hut+Y8zW0zLFObiKXKeSzkGwOC2t3Koh8sib1Sc0WuH/uhbS4AwSBN
 1BPXfITP2rvZai27lJh5peGzlE7e4AW8MvluokHAD5tdvdkZickYZw6pjQ95Hclsl6Po
 lyf693a30bAM+E741xNOhf3J2OVpWPbly2EuMA8fDPRlKjhQjks+ar8JTNHjK7AFb9vD
 Qlpqxi0GOK9c+4VMfQzPwRqrL/AyHbuHhzemgKvvNaoWRaCSMP+LmqVGa+xskFjSilQg
 auGnHZCTEBVejo9YEkjdXxpzKf70HGT4lL3J3qNHBnrbtVPVpmCXtAQg1GATPzHHlNMX
 B90A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUggWYdbQF/HDkI0U7NAX9gRGqP1m8Dl5q1SLdid641cAFiv+TU2rhFDsGFat/M206bbbg0Ta64teI9yA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzC+oNVVn83a46wkA4NOB7i6GlgcGtxyiza+ojGwvkRemtaXL1O
 9+IE1uJ7s7YPUSwvxS667NMRcHjm/5Bu5n/VZ2CM5EO3AUjzinhbqwi1RMHsoJ8AYJzn6zx/1xg
 vjXPgP6U=
X-Gm-Gg: ASbGncvGL4uFkRhm0VU0FXIJksiSbqL4gJeVsQe7AI9tvvcop3b6y/knfJTTjXlaEwA
 JyTWMzI2jkxxbDBPshtHPNvnXs1L+dX931J5Nc8XWnu4WR7hIYnPMAu3zntbydrWM7rR0Q0WGvr
 mgrV1xbhu6rswi+FqWbFg7pw0o1Cy/o90JypZCWbsJMl5SNhKiJ9hFP0OX/FroNzKu7Y/W5aIxK
 DLRtwHFVnKJDBnkpkDtCriOSVaEBYisIZqzA8yUUWmbrrBaTKUdk/MgDEgSeNZMW+86csIwfCxv
 /0+5Ri+gYDgfaAcDzd2ujRtr1wXAk4yH/LqxMb2bzd8BdN55m7j40Xflggmjx9YgUUlyaRJgp5R
 M3915L/JztsRWpfHyog==
X-Google-Smtp-Source: AGHT+IGn0GRxBvM+WD5O7v7/hNVOsDJAMieISnJTHVWyn0GlU/XBWButKenSU4mlUYhOne1RniJKdQ==
X-Received: by 2002:a05:6000:25ee:b0:3c7:44eb:dd77 with SMTP id
 ffacd0b85a97d-3c744ebe211mr9929433f8f.12.1756202090400; 
 Tue, 26 Aug 2025 02:54:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 02:54:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:40 +0200
MIME-Version: 1.0
Message-Id: <20250826-gpio-dbg-show-base-v1-6-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pqwEZ6klxsSv4inQWR27IXYKVls3Qm/tc/R/XY/nCmk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRhrRtwf1VkVEx/r9gY3Cm0Cya/2HLTxHfso
 Z84jtpt+hSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYQAKCRARpy6gFHHX
 ctnOD/9TINMbHZubtrb6oT50/GRpHQJ063AdQj7zfSKZ59ymB2wM/mX8Pl1NkWFkEcxS9+JVk4Q
 lPCGUt2qfdhvXm5FVVMLwUbmtM9xF3GyeqiUrPPM80PrH0YhwCSOhpd8ghSm6QU6/mcbPNIAxnz
 iHZQDZsDHSgZhL6rcYIzKqG1T6MnBHYERna6eOUJvJflW6t1z+OV3LWM3rbImRGtgzgExtv7SLC
 30vj3gnkMzlCC3/9UutUGDNB1kPT2iIHcQlPVPX3NT2J2i9c4JjsPzRHKmOJ/tf23t6sF/WcQY8
 0K/+WFMJgJCYuA+BBeBvluPlLQadUddZSRNVLac8YMfZVbYS+GJgQvIH/51XCZKdmHV4LmsRxW8
 OWeFH5Gxi2NYcqQOuJm92rLshkHQtFYUp9EdF6UniY5jyq2cMRjDlptaZX5r3544iUHG5UFl/px
 k4HJTHxyqPdHLwJDjbPrvddnDgcVqx4s1Jqth/Bz+apACEuyHb6IQAX6QQMzRFNLyE9VSnUNa9C
 iFFiyE1jb5ZspnxT+439i1UlBmTqgbQv2KXU1/QCJAba6Xalc2I3GIjoFd3cmf0xgJ4uhW2RytJ
 GepfYgtLR5FAxX02LJpbPuWxSPU83zXmv7NVjSnrk/lHcncdZLC4mtHIwKf+gcVHuW31WpU23Na
 lZ8o9Gcmx7zGsjA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/6] gpio: xra1403: don't print out global
 GPIO numbers in debugfs callbacks
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
 drivers/gpio/gpio-xra1403.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index faadcb4b0b2df0744711b4a8d211adf71ce49a38..7f3c98f9f902013cb4f1c9109dab331609b28997 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -135,8 +135,7 @@ static void xra1403_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	gcr = value[XRA_GCR + 1] << 8 | value[XRA_GCR];
 	gsr = value[XRA_GSR + 1] << 8 | value[XRA_GSR];
 	for_each_requested_gpio(chip, i, label) {
-		seq_printf(s, " gpio-%-3d (%-12s) %s %s\n",
-			   chip->base + i, label,
+		seq_printf(s, " gpio-%-3d (%-12s) %s %s\n", i, label,
 			   (gcr & BIT(i)) ? "in" : "out",
 			   str_hi_lo(gsr & BIT(i)));
 	}

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
