Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2A05468F9
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 17:06:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FA72C5F1D7;
	Fri, 10 Jun 2022 15:06:24 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 884A0C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 15:06:23 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id u12so54054242eja.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rmSZhFt+L2EkdTfA4PhCKlZgd+Ko2Rb6WSrQZb1cOCI=;
 b=qCr8IJLDkZnLtvz4aw+Xn5xelUdctRwoMbU2miyXWPJSzLZTJK2NeLG1JzUB9nU2nE
 5/RMCchvqx1ozjmNfNiBY4sJPZPjH7Ea5MpV7IYxt94+qFzIQuzmrr/zYYAP+dIEnmfQ
 0fNqjCzWxWfSnGY9kbiR2idz19Ic+Z0cFo4bKxJeyYNHmLilyZVs6SAOptiXPyxSMutY
 Q7ONB7ISiyNGWXXWBalOU8nD+18nZBZ9WdCwlSDCAAdrCEX08bVOGzs/5dUYND/pccgd
 ragBkS8mjJZY0gn+bjB5N+tuF1Ez2mGm8CSLoHNzEXhhSe1/Zmu/grPIAqadHgCBJWvt
 dswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rmSZhFt+L2EkdTfA4PhCKlZgd+Ko2Rb6WSrQZb1cOCI=;
 b=Wya3CkkVBq0Y53CDjD33g4L47USSpwX7Kst9eHjTfTn/kBUZCnIcfgogHFcRByUafl
 ke1vvHOBoAeeCNHDzCuEKv8sgJDfRQysiAmfbPxvsHqcU3QlvoS/jzEc+JJG07QGCFs0
 E1yrG4HF26agNdqeAX2iQk9r5bDqsGMai5dnu1uAcLdcT8GgQO6Q7Vy3OWx0jEE4bBDH
 7/BbaWE0D1Z8dO5PpeNyi+/x0DXj0Ui1S8ZeejRLnq9tUrOoHo2UYY1kM/kxki4RPJFZ
 oRVoyh/hLa71/6fz/iP4XyeYJE/mckE5DELpjIteMisT/X1EP4DhJPdm5yoD3lekCM9K
 ufHg==
X-Gm-Message-State: AOAM532vHr1EAaD6GZg/+UcQFxnMfv0EOGloHUXX0Rl5flbS9Hmoq6hd
 HyZRl6b1VPLjtU+IynnBKDi/LZZiRfFAxIAPDdk=
X-Google-Smtp-Source: ABdhPJxLQGYHGj7gcyVcctXCwCgpnEr2cRyaoQ3/TTAEPMeK3HCToHy6/n79bgCvIjvr7StG2KRTs/e28PmBV+zKUAU=
X-Received: by 2002:a17:906:c7c1:b0:711:d2e9:99d0 with SMTP id
 dc1-20020a170906c7c100b00711d2e999d0mr23093435ejb.639.1654873582571; Fri, 10
 Jun 2022 08:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-23-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-23-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 17:05:45 +0200
Message-ID: <CAHp75VcPoZ4FKTwDN_F76EZAcWYzAe1CHmuRuaP0wg3BgmPtfA@mail.gmail.com>
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Gross <agross@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 22/34] iio: inkern: only return error
 codes in iio_channel_get_*() APIs
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4gd3JvdGU6Cj4KPiBBUElzIGxpa2Ugb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKSBh
bmQgb2ZfaWlvX2NoYW5uZWxfZ2V0X2FsbCgpIHdlcmUKPiByZXR1cm5pbmcgYSBtaXggb2YgTlVM
TCBhbmQgZXJyb3IgcG9pbnRlcnMgYmVpbmcgTlVMTCB0aGUgd2F5IHRvCj4gIm5vdGlmeSIgdGhh
dCB3ZSBzaG91bGQgZG8gYSAic3lzdGVtIiBsb29rdXAgZm9yIGNoYW5uZWxzLiBUaGlzIG1ha2UK
PiBpdCB2ZXJ5IGNvbmZ1c2luZyBhbmQgcHJvbmUgdG8gZXJyb3JzIGFzIGNvbW1pdCBkYmJjY2Y3
YzIwYmYKPiAoImlpbzogaW5rZXJuOiBmaXggcmV0dXJuIHZhbHVlIGluIGRldm1fb2ZfaWlvX2No
YW5uZWxfZ2V0X2J5X25hbWUoKSIpCj4gcHJvdmVzLiBPbiB0b3Agb2YgdGhpcywgcGF0dGVybnMg
bGlrZSAnaWYgKGNoYW5uZWwgIT0gTlVMTCkgcmV0dXJuIGNoYW5uZWwnCj4gd2VyZSBiZWluZyB1
c2VkIHdoZXJlIGNoYW5uZWwgY291bGQgYWN0dWFsbHkgYmUgYW4gZXJyb3IgY29kZSB3aGljaAo+
IG1ha2VzIHRoZSBjb2RlIGhhcmQgdG8gcmVhZC4KCi4uLgoKPiAgICAgICAgICAgICAgICAgbnAg
PSBucC0+cGFyZW50Owo+ICAgICAgICAgICAgICAgICBpZiAobnAgJiYgIW9mX2dldF9wcm9wZXJ0
eShucCwgImlvLWNoYW5uZWwtcmFuZ2VzIiwgTlVMTCkpCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIE5VTEw7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGNoYW47CgpT
aG91bGRuJ3QgaXQgcmV0dXJuIGEgZGVkaWNhdGVkIGVycm9yIGNvZGUgYW5kIG5vdCBzb21lIGFy
Yml0cmFyeSBvbmU/Ckl0IG1heSBiZSBJIG1pc3NlZCBzb21ldGhpbmcgYW5kIGNoYW4gaGFzIGEg
Y29ycmVjdCBlcnJvciBjb2RlIGluIHRoaXMKY2FzZS4uLgoKLi4uCgo+ICsgICAgICAgaWYgKG51
bW1hcHMgPT0gMCkgICAgICAgLyogcmV0dXJuIC1FTk9ERVYgdG8gc2VhcmNoIG1hcCB0YWJsZSAq
LwoKQ29tbWVudCBpcyBzdXBlcmZsdW91cywgdGhlIG5leHQgbGluZSBpcyBzZWxmLWV4cGxhaW5p
bmcuCgo+ICsgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKCi4uLgoKPiAt
ICAgICAgICAgICAgICAgaWYgKGNoYW5uZWwgIT0gTlVMTCkKPiArICAgICAgICAgICAgICAgaWYg
KCFJU19FUlIoY2hhbm5lbCkgfHwgUFRSX0VSUihjaGFubmVsKSA9PSAtRVBST0JFX0RFRkVSKQoK
QnR3LCBpbiB0aGUgR1BJTyBsaWJyYXJ5IHdlIGhhdmUgYSBtYWNybyBvciBpbmxpbmVyIChkb24n
dCByZW1lbWJlcikKdGhhdCByZXByZXNlbnRzIHN1Y2ggYSBjb25kaXRpb25hbC4KUGVyaGFwcyBt
YWtlIGl0IChpZiBpdCdzIGEgbWFjcm8pIGdsb2JhbCwgb3IgaW50cm9kdWNlIGFuIGlubGluZSBp
biBJSU8/CgpPa2F5LCBpdCdzIGhlcmU6Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y1LjE5LXJjMS9zb3VyY2UvZHJpdmVycy9ncGlvL2dwaW9saWIuaCNMMTc5CgpJdCdzIHNpbWls
YXIsIGJ1dCBub3QgdGhlIHNhbWUsIHNvIGp1c3QgcGxheSB3aXRoIGFuIGlkZWEgdG8gaW50cm9k
dWNlCnNvbWV0aGluZyBpbiB0aGlzIGZpbGUsIG1heWJlIGl0J3Mgd29ydGggZG9pbmcgdGhpcywg
bWF5YmUgbm90LgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
