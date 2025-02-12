Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1C6A322E4
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2025 10:54:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DE5CC78034;
	Wed, 12 Feb 2025 09:54:07 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C69FBC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 09:53:59 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f1e8efef5so126998f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 01:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739354039; x=1739958839;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tIR7kxuCYlEHmDo3YVqs1C3HW9gsJqd1zOT7FkNeONI=;
 b=sa62gs8Euj1Td8ytLIuM2trYjc982YFYPwQCvOqOJjilN+8BuBkTvtquHxh6OXkeWZ
 6hDncZwWHFDBREnelHB/HJ0sjqg/Ey55WvfmzevuOwpJXBWSHdauwz2X7u9/XU2djB48
 YvChiJbhEtX88m2gv8CNY9+7PmzD0YoPEiHI1JRhlj7TywrbPfIc5uDEOaUfS+xg7aeN
 sIcoltzSKUcoYgtj/uuNP2g8j5pCMvbjpQ9XzkVaggaNohS+HfH8Qvxl+CZVss4RKLRU
 uOjq9kegZ74C3+VTHG3yLlAC6YUyFgsVOjPvIU4/p8BXNMA7ut9aDyjoQpjQzERrVi8U
 BVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739354039; x=1739958839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tIR7kxuCYlEHmDo3YVqs1C3HW9gsJqd1zOT7FkNeONI=;
 b=lIW63fQzFLgpYsigfkIM5faQLePGiu9y92gszBP5Lmnp4eS42hcwVa/dVhOVsveCnX
 amk4qzYEiWmWaDWoxa2EWOSXf6NjTI36evtPWYwVnF2cOU8j9NNvYk1mzCsn0BKuuMYB
 CxUY5bFizjE6UmAncy7cCx9TuKDHpZUjaFJvb8oWDaTaKR9gUfK+554s0+lpruaU3Qny
 ViPWZWqnv8mJCEOR6WoukBxlT52P8rkw9skAeVmpuu9iJO9H3/QbA+ZBpjP96kG2vwgi
 E8snEOt+zMou3UhvjIlNh6UfeHSCC0KaLMfgsi+F5D31e5HPRjKt49+AHAKxIVyh55re
 DAKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoWhLDd4ZAvDocHQLTp/qxhG8wYqdj2xpyNnh9pOiSmFX5yZWt1Sdqk+gkY4ErFGfmUQbm75bh2lw60Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzA2NBxiUuP3s1bl6LSpsQL41wD0Wr0SFP6p+Acn8AganU3w8ko
 YUFv43CpWTX96WGepYwTu06WpSNwplKnO2Z6+EimZKsyVsuy0CKEcly5BSMQLWM=
X-Gm-Gg: ASbGncuh8KT2EmYBrcVjbiLG20mADNu6rcqWcXfeK4rNF/yPoa/TTT3Ag8F+4jjdu/p
 cKh5j7cZvqeuXXWjiH92Ms/UP5PQbs9sZALLEZQ2hxbHTBoyhkuwpjPl3LVQedu52XUNow28jDS
 Y8FJ+ggT/fRGDivrVrAWyI9DQXD8cvVcwLzf5B6SI/BN3U87+45+8EEHv9QcKkqM2GE/BXPE2YO
 cPYEVchUnBC0FQ6iV/1d21XPZibNIYempRQwtWtRXuKk/XWb46TGt6CLc59JmOsK6SrtowOO487
 t3eCHNth9A5VKJA=
X-Google-Smtp-Source: AGHT+IE1AuIEYHupLeeT9Nxbe+qdld3vOkKKKz82MsP6O3GVbjl5NUVtbZU3jbI1vKhF91kVaT9XZA==
X-Received: by 2002:a5d:6908:0:b0:38d:db8b:f505 with SMTP id
 ffacd0b85a97d-38dea262832mr1371554f8f.17.1739354039252; 
 Wed, 12 Feb 2025 01:53:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:521c:13af:4882:344c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38ec2d9b299sm842935f8f.56.2025.02.12.01.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 01:53:58 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Wentao Liang <vulab@iscas.ac.cn>
Date: Wed, 12 Feb 2025 10:53:57 +0100
Message-ID: <173935403447.13404.4893974637827879328.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250212021849.275-1-vulab@iscas.ac.cn>
References: <20250212021849.275-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] gpio: stmpe: Check return value of
	stmpe_reg_read in stmpe_gpio_irq_sync_unlock
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


On Wed, 12 Feb 2025 10:18:49 +0800, Wentao Liang wrote:
> The stmpe_reg_read function can fail, but its return value is not checked
> in stmpe_gpio_irq_sync_unlock. This can lead to silent failures and
> incorrect behavior if the hardware access fails.
> 
> This patch adds checks for the return value of stmpe_reg_read. If the
> function fails, an error message is logged and the function returns
> early to avoid further issues.
> 
> [...]

Applied, thanks!

[1/1] gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock
      commit: b9644fbfbcab13da7f8b37bef7c51e5b8407d031

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
