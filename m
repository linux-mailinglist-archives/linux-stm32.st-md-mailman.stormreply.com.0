Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F9B543D3
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Sep 2025 09:27:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F540C32E93;
	Fri, 12 Sep 2025 07:27:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFBE2C349C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Sep 2025 07:27:01 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45b9853e630so13758555e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Sep 2025 00:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662021; x=1758266821;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=;
 b=tY1DT2JiWzaShhGzy4Gz/dgZ042V+yN9/Ze4NLFnUwmwSG2RIOkWZuLi2q2ixhyfnW
 iiZ7m2+irYtSPjl2dSTn0rFZ1vfC/eCdVFpyOh2SE0EtSdrN5KxTzT0UkXjs3Q5/rEwk
 ULUfpRYdD/0x7DHTnTe0X8M7mWYmaerttZRD3iRBI0XvCT7yUgFwAyJiruZzjxxiuxQG
 ZEpsaz6xlwAZbIkVLo/wjHgLvdJ5hM/0EVnE3yEOeAw1B5bBLH08D8BxnKec3SDJ162f
 45YrvsrE2Lt0lLo+rTZw2v3aOx6NebzYfQtY+Mli9KWS1i1QtJaM1f+ND66r7v96BKWA
 X/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757662021; x=1758266821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=;
 b=FTNcCluys1NpnC8DOBo8WNAcMStaKiN7jT61MLHeJ3ay8mjH5doL7ZFc5J1J37GeZC
 aKkweY74+7cWSyiOjrLyfeesbFgecZt0Tqi5w+btiknq830ZfJkGBzdeEnyQSy37q8d8
 ksCdAj09Ssvfa9dT+1rS9wgg5TnndSVALsW4w2r+11OxuNWVMCKcnP8mCg5z+ZFLAsS3
 eBS4YulRcPJ0/HDObwoeULNyIJdvQwPjwu7jzuliJSFwCHe6lxYXqGboglwn4yUcHiRi
 tm0vBwjOc83sxN/yrOtHkXjvnvtuvgj2vHkmDsSyumnE0uewk87wAuJ3H1rHN2U6A7bt
 QqZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3J3ULV2sAC4xhLUT4h383atSwQF4brhjiXwF8ZZWSL2WED+HvNVPDGw/b9/RMAXSJf7nSyQA4FcDq2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxLTkiTl5Upo+csJaYpmEEUVcGgTorLuR4H1DMnP/cAYXgjC6xg
 7vo9G2XZtGk87TnioMkhKRrPfAvWiXU3lwvi4AxfYDydsAlRD1bSc7uFFiorTEc4G8M=
X-Gm-Gg: ASbGncujSdzsVcJmRt9LNPvYEeS/SRHRIYCftqsnCiv9cGPZWelenKK5ikdQi6N4jrl
 ZYd8T9v1YnujzKxLb+RPXwdQaNPSUZ3fcPcLlxVcEN+KylCbfLDTcqNo6RsdlUAyR4YccLY8fR4
 2qfuwgPnH4I9JyfzjbEMDsy56wuxCiW5rRIP5v8aSZ0WNJ0iyc32B740jgZ2lG1UDVHsGvvkdPi
 254TrGhvZj5Uy0dFXSV6UzBJZaK2XGWAueDtdpWj++P1jDD2l4DyCcIweRGa9Mx8qVygL5az5bU
 bgfFaqr6/QqWpVMCuvl15LS/IjKPs7aT0v1dw1eUEB+Qo+KsFMeoL2cQOPEplbYgUwLo+hfxnjz
 ptJgoyYLDj8hwNTDGXu448tA=
X-Google-Smtp-Source: AGHT+IGXpoEAuIYw6/UluyUVnBbgfJgpGf6NHBYCv+YqFkoz5Fkn4jAGq9fRMx7AKxy66hsY9dDhlg==
X-Received: by 2002:a7b:c04b:0:b0:45b:81b4:1917 with SMTP id
 5b1f17b1804b1-45f211d5d6fmr14759865e9.10.1757662020614; 
 Fri, 12 Sep 2025 00:27:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b6ab:4211:ebab:762])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e774a3fb5bsm730202f8f.58.2025.09.12.00.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 00:27:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 James Cowgill <james.cowgill@blaize.com>,
 Matt Redfearn <matt.redfearn@blaize.com>,
 Neil Jones <neil.jones@blaize.com>,
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>,
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Sep 2025 09:26:54 +0200
Message-ID: <175766186357.9646.17039178132060352918.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH 0/3] gpio/pinctrl/mfd: use more
	common syntax for compound literals
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


On Wed, 10 Sep 2025 09:25:44 +0200, Bartosz Golaszewski wrote:
> As discussed[1] with Andy: it's probably better to use a more common
> syntax for compound literals so fix the commits that converted GPIO
> chips to using the new generic GPIO chip API and make them explicitly
> spell out the type they're initializing.
> 
> Each commit in this series can go directly into its respective tree:
> MFD, pinctrl and GPIO.
> 
> [...]

Applied, thanks!

[3/3] gpio: use more common syntax for compound literals
      https://git.kernel.org/brgl/linux/c/7eee64e8be51f9ff0393b5bd0752a6e8f9252bf9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
