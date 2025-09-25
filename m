Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E101B9DEBB
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 09:52:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C45C0C36B2D;
	Thu, 25 Sep 2025 07:52:10 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E08AC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 07:52:09 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-57afc648b7dso777021e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758786728; x=1759391528;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=;
 b=pgm2OJEiV9rK9JCBhI9TbgR8+ihYGBt8cg1gGVTc9zNNRAO1FBOfWvSYXJmd4wrOQO
 vXIoBBJrR1vWLfO6cwj8vQmt7R/pr/uWEeIaz5rCZbvCh3bWCwa45OSddDtDwiPXotkI
 RklSjV6JfMAZSTHEZkdzjAjDEvcMtTNCgWkCwNuJJ561BZWWGybkVfkuwylcrv53HMWX
 dIjWxTAWdC3vrb41oR+mZ6stJXhVsBEKLBXYYcy/rk9qG9ZcfY2Cl7SfRe2SnHo3Wn9E
 B457icrvF0PG6n8rzzBYwN6m7wZj98tbGIDlfvNYr9jgWgGm9YonB8fIWwK0oiB9q5UK
 RAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758786728; x=1759391528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=;
 b=MwM/t3TvXTaoaHtamEMS63YCz2s4FzyhShrRRcxw0oXEuQWx6ULpe3Lu75EpefqGrb
 QCh962Q+/Am1N4T71mc1uFFQs2Cr25OwS4FPBUZcwAiy2eqApQpw7h7mR/H1fvHZZGTf
 hlrrC2UxQ8EngEmOYmGNPoYUFd1ZPR9VNTcYjI9zM2Es77o3ByXacrCszuf0IRpiQaFt
 n+69qqjvStNIKEF+NKcBFWhJSg2IiNS6DncpZrokgjYzsEO7+2hNwk14r3R69lTsrW4m
 ZAUu5rXb7TOIfmbDkzEftN/Qd5EgyDPUep8v9aM/u6xuE/Imq4mo4Lev/x9e5g9YUv2l
 BR1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCzcmTxSjdT3oOGBVeq+xH8k2enPBCqlxdYQQTHgPJ9nCUsGfIX4KiOwKhJ2LPGisHfxTbEmfTPGqtQw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwELlTrgcXq1ht+bWJTCnBlvC/QNzd1CiY3+Dsp1chF4vfqmTag
 29NraaeASTI/Sd2yny3zd4T507j4ha6GKRfBvFhC3zTGA4d4+aus663CFYRbbKvV5AM18Uitf4y
 Nd4WiIFhA/Njgnkq1SG4B9fjpPKJ+Q2TV4SMwoKEjVw==
X-Gm-Gg: ASbGncsdoPe8zMbk6qUIvi84ZoN4zxbZ8tTqAjOfsc0bDSu0Zk8YZiYpQiUd0j5u1jA
 UCU2NoAQoz1Mfb9WLZxzE5RrPYWrh/WDEcDOZ8C39W2+rgdhUCMMVh+a7CBMFJCbuwUn0CJXTuq
 jPROwgk6WXtzhxaMi3ki+iMKx0LsE/ejsQg9O5fxAdT7oaq7fH+23CVKraFz1KDT0XjuVoXu9vT
 YPnX5XKVw7xypifRYB0kehP/PwQosVzMwQDuw==
X-Google-Smtp-Source: AGHT+IFjDFQMappKZZFROu+v6o3bME1MjtTxrIbJ3f6pWVz6MpCD55Lk6Fra5LzFmOtZoqCjtC5vbl0PRHtSU8AsH3Q=
X-Received: by 2002:a05:6512:3a8f:b0:57e:4245:114e with SMTP id
 2adb3069b0e04-582d14effcfmr700774e87.24.1758786728179; Thu, 25 Sep 2025
 00:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Sep 2025 09:51:56 +0200
X-Gm-Features: AS18NWCh67p36-1DiEra54BRYeOZGMgpqlB-NSoS3MdBtkk6GMB-z9-7UGdMnvw
Message-ID: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-gpio@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>,
 Benjamin Fair <benjaminfair@google.com>, Yang Shen <shenyang39@huawei.com>,
 Scott Branden <sbranden@broadcom.com>, Neil Jones <neil.jones@blaize.com>,
 linux-unisoc@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matt Redfearn <matt.redfearn@blaize.com>, Imre Kaloz <kaloz@openwrt.org>,
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

T24gVGh1LCBTZXAgMjUsIDIwMjUgYXQgOTo0OOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gSGkgQmFydG9zeiwKPgo+IE9uIFRodSwgMTEg
U2VwdCAyMDI1IGF0IDEyOjAyLCBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiB3
cm90ZToKPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lA
bGluYXJvLm9yZz4KPiA+Cj4gPiBUaGUgKHR5cGVvZihmb28pKSBjb25zdHJ1Y3QgaXMgdW51c3Vh
bCBpbiB0aGUga2VybmVsLCB1c2UgYSBtb3JlIHR5cGljYWwKPiA+IHN5bnRheCBieSBleHBsaWNp
dGx5IHNwZWxsaW5nIG91dCB0aGUgdHlwZS4KPgo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwgd2hp
Y2ggaXMgbm93IGNvbW1pdCBkYTNhODhlOTY1NmMxN2EzICgicGluY3RybDoKPiB1c2UgbW9yZSBj
b21tb24gc3ludGF4IGZvciBjb21wb3VuZCBsaXRlcmFscyIpIGluIHBpbmN0cmwvZm9yLW5leHQK
Pgo+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwOTA5LWdwaW8tbW1p
by1ncGlvLWNvbnYtcGFydDQtdjEtMTMtOWY3MjNkYzM1MjRhQGxpbmFyby5vcmcvCj4KPiBMb29r
cyBsaWtlIHlvdSAoc2xpZ2h0bHkpIG1pc3NlZCB5b3VyIHRhcmdldC4gVGhlIGNvcnJlY3QgbGlu
ayBpczoKPgo+ICAgICBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hTUFQOWhBV2FyczBU
ODNyQHNtaWxlLmZpLmludGVsLmNvbQo+Cj4gPiBTdWdnZXN0ZWQtYnk6IEFuZHkgU2hldmNoZW5r
byA8YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9z
eiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+CgpIaSBHZWVy
dCwKClRoaXMgaXMgYSBsaW5rIHRvIHRoZSBkaXNjdXNzaW9uIHdpdGggQW5keSBhcyBwZXIgTGlu
dXMgVG9ydmFsZHMnCnJlY2VudCByZXF1ZXN0IHRvIHVzZSB0aGUgTGluazogdGFnIHRvIHBvaW50
IHRvIGFjdHVhbGx5IHVzZWZ1bAppbmZvcm1hdGlvbiByYXRoZXIgdGhhbiBqdXN0IHRoZSBwYXRj
aCdzIG9yaWdpbi4gTGludXMgV2FsbGVpaiBkb2Vzbid0CnVzZSBiNCBzbyB0aGUgb3JpZ2luIGxp
bmsgeW91J2Qgbm9ybWFsbHkgZXhwZWN0IHRvIGJlIGFkZGVkCmF1dG9tYXRpY2FsbHkgaXMgbm90
IHRoZXJlIGF0IGFsbC4gVGhhdCdzIHByb2JhYmx5IHdoYXQgY2F1c2VkIHRoZQpjb25mdXNpb24u
CgpCYXJ0b3N6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
