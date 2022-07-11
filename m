Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B38C5703DE
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 15:10:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6D66C0C921;
	Mon, 11 Jul 2022 13:10:18 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A492EC03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 13:10:17 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-31caffa4a45so48295857b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0ZOXSRSmgwM/8CfCPUrZ7l+OIh1asVluDdyFXnWqD8E=;
 b=dJra3IJxOrzyO+7mkYfwJM+xkVjzbjwnshtKynJEY1d9HigyxWdhK/P3oXcEKtAwf2
 n0DGV/ppHdqO8+FJPsHVKM2viLcDrzrD/8N47vVpcxI8crZMoTcyG7GabZh66TgDQt5K
 vR/OejvhThCm/ej8J+wkLbdDy4W/ha21NgDgri/u9j0L83H7+q9NKgUOANZtb3iQeb5m
 p5azi6yuxgVK5tVtUrkEqXMghbb7Ofd2Wahz6HtCDfF99Vp1EADGzIX2hVaA1X+UFnUO
 Wv0TU96HYsKm2m1KnTL59Uo73M2HzpiYTf5Uqn3AdcZn42/FTSzvlq1rPQklocqPCM7c
 omEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0ZOXSRSmgwM/8CfCPUrZ7l+OIh1asVluDdyFXnWqD8E=;
 b=3Jp+dcPEMMZxLnMjd2y2qViA6Z6T/0kFK8t39zzIoDxy7AVfFbkFbcmBOEb2mmjb/h
 YQxljQ0J0fx6J/9R1fVVgAC4jsCksATV/A6RvRb+Zn6KyQvtchblCo8OVPOnnHWpPlT3
 dOXLYgjyCdZQ4mlQry1sxC1gDKkfJPGj/0dauVfUKg/bTkiYZQd5sw++KrlE0uXAczEP
 YIV6t24QNP3ObKxO9f0/56IErAatvKtBijyqVpj4ACNHyuIDGXdWMcCu0L5+SVufXrgv
 m4KUMI9MkUsVOlo0n0x39VIxJySlzqRVE7kH5/sUqSfEbczb4aJA/21WtFm7wpB/HFoy
 DnVQ==
X-Gm-Message-State: AJIora9db3qI4Ijt9S+dFQ8MxCopu+Q4xG5q1NkZrT8am79kA8Yvx9KR
 /Jh6R2NESQgpRIhVASx6TNvv4AFXwGAfx3uyt80=
X-Google-Smtp-Source: AGRyM1u1pNjRlMbjWdZEYceQFq+a842D/zBdsYQozhXo4zH7jPGpQ6tqGeQop8qO1ntORr3Ei1MkK2BI3EBjQhr2i6c=
X-Received: by 2002:a81:4bd7:0:b0:31c:91da:5a20 with SMTP id
 y206-20020a814bd7000000b0031c91da5a20mr20757632ywa.131.1657545016097; Mon, 11
 Jul 2022 06:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220711123835.811358-1-nuno.sa@analog.com>
 <20220711123835.811358-2-nuno.sa@analog.com>
In-Reply-To: <20220711123835.811358-2-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Jul 2022 15:09:39 +0200
Message-ID: <CAHp75VfUNNAEDuxMfYeg=ZkD-nrUcnc13g+zGBLufayavm-QUw@mail.gmail.com>
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Cai Huoqing <cai.huoqing@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Gross <agross@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>, Tali Perry <tali.perry1@gmail.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 01/15] iio: inkern: only release the
 device node when done with it
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

T24gTW9uLCBKdWwgMTEsIDIwMjIgYXQgMjozOCBQTSBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cu
Y29tPiB3cm90ZToKPgo+ICdvZl9ub2RlX3B1dCgpJyBjYW4gcG90ZW50aWFsbHkgcmVsZWFzZSB0
aGUgbWVtb3J5IHBvaW50ZWQgdG8gYnkKPiAnaWlvc3BlYy5ucCcgd2hpY2ggd291bGQgbGVhdmUg
dXMgd2l0aCBhbiBpbnZhbGlkIHBvaW50ZXIgKGFuZCB3ZSB3b3VsZAo+IHN0aWxsIHBhc3MgaXQg
aW4gJ29mX3hsYXRlKCknKS4gTm90ZSB0aGF0IGl0IGlzIG5vdCBndWFyYW50ZWVkIGZvciB0aGUK
PiBvZl9ub2RlIGxpZmVzcGFuIHRvIGJlIGF0dGFjaGVkIHRvIHRoZSBkZXZpY2UgKHRvIHdoaWNo
IGlzIGF0dGFjaGVkKQo+IGxpZmVzcGFuIHNvIHRoYXQgdGhlcmUgaXMgKGV2ZW4gdGhvdWdoIHZl
cnkgdW5saWtlbHkpIHRoZSBwb3NzaWJpbGl0eQo+IGZvciB0aGUgbm9kZSB0byBmcmVlZCB3aGls
ZSB0aGUgZGV2aWNlIGlzIHN0aWxsIGFyb3VuZC4gVGh1cywgYXMgdGhlcmUKCmJlIGZyZWVkCgo+
IGFyZSBpbmRlZWQgc29tZSBvZl94bGF0ZSB1c2VycyB3aGljaCBkbyBhY2Nlc3MgdGhlIG5vZGUs
IGEgcG9zc2libGUgcmFjZQo+IGlzIGluZGVlZCBwb3NzaWJsZS4KCnBvc3NpYmxlIC4uLiBwb3Nz
aWJsZS4KCihJIHdvdWxkIGRyb3AgdGhlIGZpcnN0IG9uZSkKCj4gQXMgc3VjaCwgd2UgY2FuIG9u
bHkgcmVsZWFzZSB0aGUgbm9kZSBhZnRlciB3ZSBhcmUgZG9uZSB3aXRoIGl0LgoKLS0gCldpdGgg
QmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
