Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F283FB97BF0
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Sep 2025 00:42:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D25EC3F930;
	Tue, 23 Sep 2025 22:42:00 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EBCAC3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 22:41:58 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-57a292a3a4bso1652197e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 15:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758667318; x=1759272118;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SWHpC7XT0boWgdfna8gc+pG3x0qlvgKa0qIbsC+iC4=;
 b=RmTU9eEIGh1/cQZuiXk3btXZqFUhG6UjmBrmKWFDdUoq3KBVhnGtr3kcfSdV6uNfMw
 Dbza3OQsH8HLqAAdMwkiTXWJrcvtQ3zz+UnJE5x7kof2Pi7Zg5bTquBHMOIoOO4GLj/X
 34Jpei2jfDs2cwDcpBICOfw6t5pi6ZMXy37bEY5l/xrfKiE66dPWDlAPvieYmkoE8VLR
 413IUNJCQrn35/z17JpHU9Fx5FIGbqtOVUvPAo+5/lVrYsSHmujpNIYNQvimhFgMjlcm
 dGRCgZSmRBUSBJyJ+ckPWF3AwwDSOrq+94/BrZdMPswIw+A+6y1jGFZMiurXbt9eK05j
 ebpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758667318; x=1759272118;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6SWHpC7XT0boWgdfna8gc+pG3x0qlvgKa0qIbsC+iC4=;
 b=g92+dcvfiZ5rLUC5+eFUWqQSqifUpjLWsk6v+TDldnxylRhfzmDRJTop/rggpbVu0x
 L8v54189EA6OmWVHvrtRYYxcVWmxg4PknMjWVooGcEPd2Lwku5V4EVPgS4lUVadCMsiM
 00TNO0pCgslfFkEfi+ytj2EXHF3CMOmc2B2ecM11RblQ+FarJYikX2FwTe2ovOXK938K
 xkgXQJmM69TZL9/DWEg9Kn1oRWCwLgHAVt/VWwIZ9uKpjEkVWfEYwidthEnQU1LJdwaf
 6ICETCLNMsSV0I8AmoQSai0Gbwjg1scT1gWb5o075z/jsDhzYtMfaH/JR8L1nIJ51fak
 AvvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUywGOsU5a2nCs1imv8VqBiDww0v5TSbexCDViugALJJZp9Szy0Qcxs+ckI1BsimBEIWiqJNSD+T475/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxYz0Py5z/Cgh+oYD4DybbPTodUW4WwFrY2R9x2u5CF/zIfRFsr
 0Ul7MBKPBgtZnLxbGd/1RDH7jaj3wwTHxkxsCXYslDRemA//gCuteCwYRpFbhR5fmbpSIzX8al0
 LwAl42TKkewn1I/lv3GLVQjKFThYUotN8OB2xbUf0tQ==
X-Gm-Gg: ASbGnctcYNFOn8b5Qtn8SBcLnTcGp7i5gV8QcVMKZaiFok0PcQycZWfSso6sFagpH/X
 +UB2ScDOc50t8j5TJ1bTqqteYWceZFLiW/l10TJjq8tWrpng96CTGGr8ZcHmO31BhODSjHzOVLi
 OFpeS6o3F9IrhMY2lZZSv+f5UsAItJWFtS9oycItztBgovPuHUw1E7mmkcCF5zU+nDF4pl1euT3
 fXLTU8=
X-Google-Smtp-Source: AGHT+IG99GeGJ6EJmRFtaCX57MxbFFNDKEJDSpjz4IOp4Xv1ApJ9GNzknCU6gn3AgKwY56E7tlVN9VixGw0iGQWzSiA=
X-Received: by 2002:a05:6512:4007:b0:57a:7be2:21e4 with SMTP id
 2adb3069b0e04-5807051c520mr1245993e87.9.1758667317970; Tue, 23 Sep 2025
 15:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Sep 2025 00:41:46 +0200
X-Gm-Features: AS18NWA87kQOtTQ-6Uw89hDflE_WXMd3ykrYMsrH2sWDsx3-k27OaCZ6EKQ1YIY
Message-ID: <CACRpkdY8AN5vRQEt=3QzdFdPkvx0FLiv7QmwZ=eqZBSn9sUtng@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, imx@lists.linux.dev,
 Tomer Maimon <tmaimon77@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 James Cowgill <james.cowgill@blaize.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, openbmc@lists.ozlabs.org,
 Lee Jones <lee@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Matt Redfearn <matt.redfearn@blaize.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-gpio@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>,
 Benjamin Fair <benjaminfair@google.com>, Yang Shen <shenyang39@huawei.com>,
 Scott Branden <sbranden@broadcom.com>, Neil Jones <neil.jones@blaize.com>,
 linux-unisoc@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Imre Kaloz <kaloz@openwrt.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/3] pinctrl: use more common syntax for
	compound literals
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgOToyNeKAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4KPiBUaGUgKHR5cGVvZihmb28pKSBjb25zdHJ1Y3Qg
aXMgdW51c3VhbCBpbiB0aGUga2VybmVsLCB1c2UgYSBtb3JlIHR5cGljYWwKPiBzeW50YXggYnkg
ZXhwbGljaXRseSBzcGVsbGluZyBvdXQgdGhlIHR5cGUuCj4KPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNTA5MDktZ3Bpby1tbWlvLWdwaW8tY29udi1wYXJ0NC12MS0xMy05
ZjcyM2RjMzUyNGFAbGluYXJvLm9yZy8KPiBTdWdnZXN0ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8
YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29s
YXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KClBhdGNoIGFwcGxpZWQu
CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
