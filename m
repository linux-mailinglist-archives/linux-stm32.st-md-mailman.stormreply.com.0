Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BD3B50F33
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 09:25:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23E5AC3FAD0;
	Wed, 10 Sep 2025 07:25:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B63ABC35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 07:25:53 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3dae49b117bso5683351f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 00:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489153; x=1758093953;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gl5EvZZ7qePjJl2BaNjHQ+dzPz2TAyeCpTwHy9T9Wfo=;
 b=dnIgQdt53aY4yPxK2NV4ioqZXO/DAaaxj+4gaSMjim/uXjtuGXEfMAzVGIz8VuKZyP
 SQD6pl25tu2ZNpTkXvyqyWgqmMIHYrjJIeR/cJz10JGVZTbJAKQc4J+O+gkCh9TxU/9R
 TLWkdFzubJhO9HCmqLIAQtuPwrnNSh4po7aLUkj211D+xbXcry+GDxUUkmafgdi24k3y
 yMbF800O0AjB6xU26qAJpasXJwTE50yrbhanpu1b9ZndGuKq9eXB4GyY4U8fIODaqVQG
 DEiC6vL02qC2XGAIU4mdo9kJ1XpreECjmg/N9X6YQgaWvLDp+fuVOdpcRNNcV4Ud6Js6
 Yzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757489153; x=1758093953;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gl5EvZZ7qePjJl2BaNjHQ+dzPz2TAyeCpTwHy9T9Wfo=;
 b=TAitE34p+ldJYuCE9gXSep7GN70QNXUhSaaOFIeIf+yBwVU/nn0rN8TRtKWoJH4C8m
 EEYNRpjzAIrsnUEF5qCqjPnl4RVy91OI4xXrkcMMZeVpqEqaWe+xiZ9pmCcFgwVVPNLN
 kGszxCcSdzG/++w/NZUMIhYWKJT7otM5ndqwaBa++hcQZ07PdrowpISKB5ZnEwUOVmeE
 BG0L07KO6itbO1+HL04vuBvERcvqW8ce2U3RTx1C3NtG9EPHTwjokSzrL4hgdxoDYuMk
 ZIh0dgBPWfXKQ0A3FenWaSuIL300SD7NzTahpsJlHiIIhGjT+zkcoPOoS6tdqMjzcQhb
 OSrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHwjHYxwOkBZX6lT6ROq1CDvKEgcUML+JuhD58DBXiPeJh6PwsORLq75bN6zZxqPadeR6I2seUgbaE4g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyUEcOYLQzBa6081qvqb5S/5pnGzS7QOOMxe0psYT5RW7rzomCG
 9udtAPLP1luuarfgQNSvgXYcuZJ3N6puPwDK7eZCzfpD09CfD49YpS0AoB8+gdphydk=
X-Gm-Gg: ASbGncsv9+FbW3euGTKYInvRWIE3bZSK5KjMPtyCdgqo87SJyP6pdlq5K1FtlyeUKVE
 Rm5TRKNX8br3eI3rS2RKRB+3FX3BOd1ZBxIOUwCipAIqYodjROO5KLtuTKqZFNJDxg2479DhmGL
 l4QqgH+36nLEaN16gvO2sDRJfiv2ukJWQi22IaSbvWAwXIhkg638vKLeKWw0eeB8m453T/Y7sXV
 XdUkihTLtz8ONf89Jx+zlXywe0gfFTvP27DZJGo9z0dM2+YQkUvB7TrHpYaYDM2Aa7c9QGtIj5Q
 YFW4YHyfDfcjQ6JT6YqzK8g+k2R13ioBmdLvP4tQWhKRcX6AVs3ExTS9C+ZnehysSGFRk7q7qwO
 6Qj/b/eBxqfJ4m4hTm8eblJwvmGwbXcgDxrsGd9Y=
X-Google-Smtp-Source: AGHT+IFKdWd/MOTTMywYPHVw5YIDU4ZG0NZ3VmH44f3IGf1C3HlllFBC2cfty+fO45t0VoMp0fb6YA==
X-Received: by 2002:a05:6000:1a8d:b0:3e3:f332:73f6 with SMTP id
 ffacd0b85a97d-3e646257abcmr9958246f8f.31.1757489153027; 
 Wed, 10 Sep 2025 00:25:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df8236428sm16729825e9.24.2025.09.10.00.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 00:25:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:25:45 +0200
MIME-Version: 1.0
Message-Id: <20250910-make-compound-literals-normal-again-v1-1-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
To: Lee Jones <lee@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=979;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2AiYFCloD/4RAraZbO+KeVDtX8xcEqWOa6di+UP2k+Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSf8VTnO9QVF1tR30IBvEZEbYU3RFZcMzjLBO
 2ZoExM1MEWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEn/AAKCRARpy6gFHHX
 chgMEAC1UA+PKD6t6aGSJKb2WwHVdpLkaweVvLymwppdHKPAhq4e2ZXBwcfe2Xf21UCZiVRN5Pb
 sXKBL7TU2hsVJnh+nY1deWzVbeenzo8hfzM5je3+XttTa2Cd7DH6irICePcyIIAX9BlaWTAaKiP
 OzZfpmYjW0CygB3YYK5biWI3U5cbt8nLFSPKK/ST9iUNo1jaFukc6FipCfVUosMTABpdPQOqmxc
 EhVqSROfAU4VXT6X9L7y4z/srhtMFu2ufagfAW3sz0zMFPXiSOQcSirf7JyGZrRkwKN26VcH7XE
 SMpZQkhb/5/ccgPK9pObeHyNoII8VEhVuraYCkIOiW6C04U2HwPu6nfDQ0YdiITYx2gObHsjuKA
 dFyC1qARBLWkPpFha9B/WfdT4effL2+txlK5x8JKZY3ZYwbv+7kgyLjuwGt3fYKMneEXrd3GWwj
 Ob2IeaFzQUJplmbPWMbcU/LOW4JBy7aOXHImgg6G6fOJSUTexbqJflcFeQ6aqoJ+iMezbpCUVxX
 DaEUCGs/NEd4R7KcgIrmSebHGlPJot9MGekvnPntd4Xt/34GEdDUYMriQBIjB8jshF2MoPpqAbq
 MVDAbVmCWbgIP0Aljy2QDxkXCnS8MoTibWav6SmYomsrAUE1bXtWLPW/j4cOMWhP7q0xosfcc/0
 W2Qzs1Uc+uQvMHQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: imx@lists.linux.dev, linux-unisoc@lists.infradead.org,
 openbmc@lists.ozlabs.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] mfd: vexpress-sysreg: use more common
 syntax for compound literals
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

The (typeof(foo)) construct is unusual in the kernel, use a more typical
syntax by explicitly spelling out the type.

Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/vexpress-sysreg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index 9399eb850ca29b0a9d9be2173bee4bcf6888d10f..f49cee91f71cc2e6132cd3118dafd42a48821e0d 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -120,7 +120,7 @@ static int vexpress_sysreg_probe(struct platform_device *pdev)
 	if (!mmc_gpio_chip)
 		return -ENOMEM;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = &pdev->dev,
 		.sz = 4,
 		.dat = base + SYS_MCI,

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
