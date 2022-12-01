Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D680C63E701
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Dec 2022 02:17:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 891ABC65073;
	Thu,  1 Dec 2022 01:17:38 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6411C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Dec 2022 01:17:36 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R251e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=57; SR=0;
 TI=SMTPD_---0VW5-8b9_1669857445; 
Received: from 30.97.48.64(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VW5-8b9_1669857445) by smtp.aliyun-inc.com;
 Thu, 01 Dec 2022 09:17:29 +0800
Message-ID: <a7e61ce5-b5e6-384a-3c89-ebde63340678@linux.alibaba.com>
Date: Thu, 1 Dec 2022 09:17:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
 Guenter Roeck <groeck@chromium.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 01/11] pwm: Make .get_state() callback
 return an error code
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMS8zMC8yMDIyIDExOjIxIFBNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNwcmQuYyBiL2RyaXZlcnMvcHdtL3B3bS1zcHJkLmMK
PiBpbmRleCA3MDA0ZjU1YmJmMTEuLmJkYThiYzVhZjk3NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3B3bS9wd20tc3ByZC5jCj4gKysrIGIvZHJpdmVycy9wd20vcHdtLXNwcmQuYwo+IEBAIC02NSw4
ICs2NSw4IEBAIHN0YXRpYyB2b2lkIHNwcmRfcHdtX3dyaXRlKHN0cnVjdCBzcHJkX3B3bV9jaGlw
ICpzcGMsIHUzMiBod2lkLAo+ICAgCXdyaXRlbF9yZWxheGVkKHZhbCwgc3BjLT5iYXNlICsgb2Zm
c2V0KTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgdm9pZCBzcHJkX3B3bV9nZXRfc3RhdGUoc3RydWN0
IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAo+IC0JCQkgICAgICAgc3Ry
dWN0IHB3bV9zdGF0ZSAqc3RhdGUpCj4gK3N0YXRpYyBpbnQgc3ByZF9wd21fZ2V0X3N0YXRlKHN0
cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiArCQkJICAgICAg
c3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpCj4gICB7Cj4gICAJc3RydWN0IHNwcmRfcHdtX2NoaXAg
KnNwYyA9Cj4gICAJCWNvbnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3Qgc3ByZF9wd21fY2hpcCwgY2hp
cCk7Cj4gQEAgLTgzLDcgKzgzLDcgQEAgc3RhdGljIHZvaWQgc3ByZF9wd21fZ2V0X3N0YXRlKHN0
cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiAgIAlpZiAocmV0
KSB7Cj4gICAJCWRldl9lcnIoc3BjLT5kZXYsICJmYWlsZWQgdG8gZW5hYmxlIHB3bSV1IGNsb2Nr
c1xuIiwKPiAgIAkJCXB3bS0+aHdwd20pOwo+IC0JCXJldHVybjsKPiArCQlyZXR1cm4gMDsKPiAg
IAl9Cj4gICAKPiAgIAl2YWwgPSBzcHJkX3B3bV9yZWFkKHNwYywgcHdtLT5od3B3bSwgU1BSRF9Q
V01fRU5BQkxFKTsKPiBAQCAtMTEzLDYgKzExMyw4IEBAIHN0YXRpYyB2b2lkIHNwcmRfcHdtX2dl
dF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4g
ICAJLyogRGlzYWJsZSBQV00gY2xvY2tzIGlmIHRoZSBQV00gY2hhbm5lbCBpcyBub3QgaW4gZW5h
YmxlIHN0YXRlLiAqLwo+ICAgCWlmICghc3RhdGUtPmVuYWJsZWQpCj4gICAJCWNsa19idWxrX2Rp
c2FibGVfdW5wcmVwYXJlKFNQUkRfUFdNX0NITl9DTEtTX05VTSwgY2huLT5jbGtzKTsKPiArCj4g
KwlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGludCBzcHJkX3B3bV9jb25maWcoc3Ry
dWN0IHNwcmRfcHdtX2NoaXAgKnNwYywgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKCkZvciBzcHJk
IHB3bSBwYXJ0czoKUmV2aWV3ZWQtYnk6IEJhb2xpbiBXYW5nIDxiYW9saW4ud2FuZ0BsaW51eC5h
bGliYWJhLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
