Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45F570401
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 15:16:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4560CC0C921;
	Mon, 11 Jul 2022 13:16:34 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4ECBC03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 13:16:32 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-31c9b70c382so48375307b3.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 06:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ECHKwgZspv8UJP39cVbtbsQnGobQ6/Wz0Usn92hQ97A=;
 b=ZCLmgeg2tag0WI6PMv2dX5P6iXXKcdTl5Rjn3td1aaWFfg1rfbsiHVRsa4MA7RVDPi
 yZda18xMSj7gVReNgpkVS3IYfW2y4Yq9wBa4dHtxiS4ukAsi/+lbDWOqaRNhryL27qRN
 M8fdWOoG7e31my6wi3XYydpQ2QFFja+qmUq57YGYfq84IG56VWa8Y58yfZEvxGNmkdeS
 ROcmY65fp6mPo55MlG8kVk6cUjR/y+GmDOpFEWJ/AXDhnsAinq1CBLWopeF8ovwQO9wL
 pbNewu1TdO3bS8ZUkDr6fOjwRalFcjVymsMPQXeHZi+UiTUoMir4hJJt3YfEmkDseAno
 V+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ECHKwgZspv8UJP39cVbtbsQnGobQ6/Wz0Usn92hQ97A=;
 b=neyDf0TX0N9ECmWoVzGbWFRp7g3ThnVvcVG9HZoAmrT54mArRLU6uSmnnCjOmw1oSt
 ED8RJKU4z5f4oW54MtuhjlbIM4JJeH39eKpPW0KfKkF0S/+zklm8+kRG6+ot7Z/W1Vv8
 ir8S7kOLjyq+DXx8GQrNvhJ5hkEZYc/Im4dxx6tLaVw2uObSCgj08zSFX6/NxzNlIOnM
 0s0vloEwX75/d+Yuks11T9/bx4dXqAQFqBeD0Uv9xEWa5dTg7U91U9Bar7dvOh2sR3le
 ATAA0jQYvcdYR8I2Ehzt7WLEwgtPQNbAVe07D1xHYtpDR28kUsyejXp6eEy0TDITLrSR
 IjBg==
X-Gm-Message-State: AJIora/Ihsg6Z8omgJk6kwKW3pNz2fLY9Ooxm7M4T8Q9rPXdahcSEr9R
 tvauuc6jkz52ws64LkHamQGm96PLJAd7XEMwYNk=
X-Google-Smtp-Source: AGRyM1s4R+hHsfAdGALiyefnWI51ka7x2bN1wgGP0eXwiLSnuO4ulGqtLU/InSVBkkY/IMtwOpEFg5YKLeC9E1Jy29w=
X-Received: by 2002:a81:108f:0:b0:31c:d7ae:9ff1 with SMTP id
 137-20020a81108f000000b0031cd7ae9ff1mr18792069ywq.18.1657545391770; Mon, 11
 Jul 2022 06:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220711123835.811358-1-nuno.sa@analog.com>
 <20220711123835.811358-16-nuno.sa@analog.com>
In-Reply-To: <20220711123835.811358-16-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Jul 2022 15:15:55 +0200
Message-ID: <CAHp75VcnuAtc+n+nhQ16yP9S-veX2c6ruquSewtPJdcqQwpyAQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 15/15] iio: inkern: fix coding style
	warnings
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

T24gTW9uLCBKdWwgMTEsIDIwMjIgYXQgMjo0MCBQTSBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cu
Y29tPiB3cm90ZToKPgo+IEp1c3QgY29zbWV0aWNzLiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRl
bmRlZC4uLgoKLi4uCgo+IC0gICAgICAgaWYgKG5hbWUgPT0gTlVMTCAmJiBjaGFubmVsX25hbWUg
PT0gTlVMTCkKPiArICAgICAgIGlmICghbmFtZSAmJiAhY2hhbm5lbF9uYW1lKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKCkFmdGVyIHRoaXMgY2hhbmdlIGluIHBs
YWNlLCBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIGNvbnZlcnQgaXQgdG8KCiAgaWYgKCEobmFtZSB8
fCBjaGFubmVsX25hbWUpKQoKd2hpY2ggc2hvd3MgaW50ZW50aW9ucyBjbGVhcmVyLgoKLS0gCldp
dGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
