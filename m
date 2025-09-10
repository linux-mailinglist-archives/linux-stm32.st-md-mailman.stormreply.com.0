Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 642AAB50F32
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 09:25:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14F33C3FACE;
	Wed, 10 Sep 2025 07:25:54 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD757C35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 07:25:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45dd5e24d16so46660545e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 00:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489151; x=1758093951;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QAOVD/NXoo6Qinrlhcnn2ltKwFLoKauBP77YUEELpDE=;
 b=VwKLHKKYvcHwZ3pPWdJlJmyPXbWE70jt2/o3myh18Ans4s3+45vbV4SILbqXhb2+oQ
 KojIHVD8riXAe6QwAOD/OLUBowCE4gDc1SsOVyJaMnA15EDLUGAf+wzg0fDUtA8iPjru
 uwOwLNy6N17OSCR9AFvIbelZecZCx06p28jpW0kCmM4nPpgh6TXYwGUcZ/fvKBvfEXEt
 ouOzH+1W1IRXEYKFiR/Bkqsx7T1xhgpyY7yQ5BMe2S2ODEDlr0H7NaZMmVtvAE8qqSPw
 QW8Ij5gSK4bBg/1ppTPvW1g0mwqvPFNI/Nn7f+0WS6Ua/8Cbnq3tuXaeJvQusTfikNIa
 Ofnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757489151; x=1758093951;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QAOVD/NXoo6Qinrlhcnn2ltKwFLoKauBP77YUEELpDE=;
 b=rLIJkDyBEJx/GYlrMMmgiQJDncXSBEAgn4Yp5Oq2hrtQUwVG2TOZMoVPaplojc+T4D
 pLBQ0x7GrJZJhLCMttNlMXrUxkmNVOsQxrGvXgCJQqxO9IsoCtU5QNQjTKlNztG0xui0
 WnY+yWit/54BMzgrpVG/9ULnLyZm/Xnkt6Ha6NvS5A9LOZh9PXi/eeELrel378889TBF
 oUmNSdyTSXIna8oc8CgzkoJNV9Sr8EozWLz0UidovxgpXXDYsE5x2X7KniGHopkn21Qv
 SiaqApy0Kk90DtAvgB1QM0E7juH0VBYOWba74Op1vao8sP9yWhIOguVCWabTl+iOq8MI
 aDJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEWJkJNXdkBVrwY3knPvboRIPs9vv7CAuewcLoxm7tPBqK8c1yFwzfyOmg9IipCkqFxoHavS36HmAhTg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw7wmkCT+fITzQSK7VMTQL4E6KvTeOSc0R5xYHdfKgjf1wwR9q5
 wbMRrMSGnGKdx24gfc5QxO0nutAX0Lfrh0fN+5l4U0Bj+1cDe+gT/5C6bHrJwcUkRZY=
X-Gm-Gg: ASbGncsgkt7OqA99yfgSyuPGkZCy3jih/TvWsUHmL+YlTyVWsBfNighvVXMC2AO2zOP
 uClFeIs3w/v+uVERpjzdgxhqoAMk/9UvEx530hgTgvRBNn2fNSWsks0tWUcj6bwrN/9+BmFElc7
 O8zh7FANoKLqxO3H0fwa94gQx9ixyCHZEAh4wZq29pcGe50oC3Cvd45Nbgq/sUJw5qeoUfNAZi7
 eTX18CaeGbZ2rgCxsh3yTRv0+TBTJV/bJ4jfOJyaZ7kpNyOd4h47mJzxVD8TB72QG2Kl+w7q7d5
 JHA1uR84LFKvyO/COcxDqLxPQhGiuMFaN8pV1/P2WkbaIN2xkdAb5dN+EViKFuUkUvnhXo2NqAQ
 rTtbTymAHwCs1G8DAt52EWKO4cSGF
X-Google-Smtp-Source: AGHT+IHGcMRUmLBYK4SgC+8FxVXfL1XsZk92Y0HumCVsdD0bP05sNhcUQfhnESNzNcG8GqNwFSRO+g==
X-Received: by 2002:a05:600c:1393:b0:45b:7b00:c129 with SMTP id
 5b1f17b1804b1-45dddf021a4mr111254435e9.35.1757489150984; 
 Wed, 10 Sep 2025 00:25:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df8236428sm16729825e9.24.2025.09.10.00.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 00:25:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:25:44 +0200
Message-Id: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPgnwWgC/x3NTQrCMBBA4auUWTuQ/kiJVxEX03Ssg8mkTKoUS
 u9ucPlt3jugsAkXuDUHGH+lSNaK9tJAeJEujDJXQ+e6q/POY6I3Y8hpzR+dMcrGRrGgZksUkRY
 SxbZ3Yx/COEx+gFpajZ+y/y/3x3n+AJ5+BqB1AAAA
X-Change-ID: 20250909-make-compound-literals-normal-again-13073cc74b94
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mbaKzHcgj41PgNucTuXNTRRDYpWfb/AcMMrNDA/c0O8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSf8fAuHxdMgXnxNQ6BJ55Q2hyWr1ftxMskiL
 dcle+ZX0s+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEn/AAKCRARpy6gFHHX
 cr6ND/99HqQnU9BaJ0rG9nmyHWz9UVNShxsHcidnTQYDpvGwd2PHnJcJdwpjGZC1msq3r+GB/ga
 /zA5bR2ZsRzfO/XKfM2IjjN6BaSGRl3qj9qX5cxH5gT86+KMQWrzjOYsJhcIldkm+B/vxqqMHom
 MFHfiq0n0NhdzWqe4O3C1X7fVIpRgGSXVSYfka6cg3On8jzmA6PyhkaYa706xoCHPHckqJaKRk1
 P+NLmTJxoupn2H21plGDEESji9GS0g3dXUS7H/uHSv5ILsR67EA6A21k4utyvCfQNrL/27uhiSm
 hxO4JygFgiZBOLGyX7WXgmTyFKtFZ9mnl5Y10vpz7itfuPUJWQk0GJ594d7f3ZIDJqZueax0J1e
 Z9CFk6U3ZT1jZ/oMIJAydNph0r1xH5OHAbczLcvLOoR5GkxxP5NePvsyr7k0t2+6Xw2Nukz4n05
 aQ1qzE7sNjWX4cxaqeRfInnYZHQy89Qf+mTyJKVrx3MAz+sXZHhtN5Q74xMDTydQMOhKX/iaZic
 YfBgTRRt9OWEIaiGrlyxYGj1whz5lTrSdziP3ZNQQRyBqFA1bYzMOGHlTHK2/1DSVLM6EOMheNZ
 QVH65EM200UB4DiHwbgDAcSSaAhQ2UUoYc/mi5fX28HetdMG3CdC40i4ZKPvnCNmCf7Ld3NAZoi
 Tx4rK9U0Rc28ZCA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: imx@lists.linux.dev, linux-unisoc@lists.infradead.org,
 openbmc@lists.ozlabs.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] gpio/pinctrl/mfd: use more common syntax
 for compound literals
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

As discussed[1] with Andy: it's probably better to use a more common
syntax for compound literals so fix the commits that converted GPIO
chips to using the new generic GPIO chip API and make them explicitly
spell out the type they're initializing.

Each commit in this series can go directly into its respective tree:
MFD, pinctrl and GPIO.

[1] https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      mfd: vexpress-sysreg: use more common syntax for compound literals
      pinctrl: use more common syntax for compound literals
      gpio: use more common syntax for compound literals

 drivers/gpio/gpio-amdpt.c                 | 2 +-
 drivers/gpio/gpio-blzp1600.c              | 2 +-
 drivers/gpio/gpio-dwapb.c                 | 2 +-
 drivers/gpio/gpio-ep93xx.c                | 2 +-
 drivers/gpio/gpio-ftgpio010.c             | 2 +-
 drivers/gpio/gpio-ge.c                    | 2 +-
 drivers/gpio/gpio-grgpio.c                | 2 +-
 drivers/gpio/gpio-hisi.c                  | 2 +-
 drivers/gpio/gpio-idt3243x.c              | 2 +-
 drivers/gpio/gpio-ixp4xx.c                | 2 +-
 drivers/gpio/gpio-loongson-64bit.c        | 2 +-
 drivers/gpio/gpio-mlxbf.c                 | 2 +-
 drivers/gpio/gpio-mlxbf2.c                | 2 +-
 drivers/gpio/gpio-mlxbf3.c                | 2 +-
 drivers/gpio/gpio-mpc8xxx.c               | 2 +-
 drivers/gpio/gpio-mxs.c                   | 2 +-
 drivers/gpio/gpio-rda.c                   | 2 +-
 drivers/gpio/gpio-realtek-otto.c          | 2 +-
 drivers/gpio/gpio-tb10x.c                 | 2 +-
 drivers/gpio/gpio-ts4800.c                | 2 +-
 drivers/gpio/gpio-vf610.c                 | 2 +-
 drivers/gpio/gpio-visconti.c              | 2 +-
 drivers/gpio/gpio-xgene-sb.c              | 2 +-
 drivers/gpio/gpio-xgs-iproc.c             | 2 +-
 drivers/mfd/vexpress-sysreg.c             | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 drivers/pinctrl/pinctrl-equilibrium.c     | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250909-make-compound-literals-normal-again-13073cc74b94

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
