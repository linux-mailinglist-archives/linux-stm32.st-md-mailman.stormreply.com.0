Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124C554550
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jun 2022 12:36:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A44BCC5662F;
	Wed, 22 Jun 2022 10:36:49 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4C31C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jun 2022 10:36:48 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id ej4so19314307edb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jun 2022 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YFwi1vxkzrvgsqoCKPo5AQXebahZiMS5qtbuazVoioY=;
 b=C60jruRIr3l7H20jbT6Re8q4TAOBzwgoJniFeCwP9jUCkCeFfZSyKWDXzuiR3+WsFk
 iug9mCtL5f/362puhR37XxfXjPTn+feFC8tv5f+bUCGxDr5RecoUaz5WL/iKgw40h3f5
 nRLlZkcl+Cgcr2kX9I7VZkqGcpVV39vi0d4feUx7Mg7xkPeRevq2RrFsFeI4kgEh2RbO
 1N8lkUgvGsbvP6nJ0yewhGBY+YbTQLHkQCH0wrxztTUCL3jR2tFJCgJ4iW4RmvFKBM5x
 9Wx0qhacGBBsF/oQxleSmTbsTojFMMwK1Y3Znaa7mITTI9ctZr+bJEAD7fH9uR2Py1m/
 LCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YFwi1vxkzrvgsqoCKPo5AQXebahZiMS5qtbuazVoioY=;
 b=8MsrhFns0hmTj3Wb4YJc+7rAwegwuXQKGw4gNdis/U8BHip+nW1vpjV46ZUaVRnvsL
 fXYILPOW5ZXFdiftWPafzIFxvaJ/ekArazw+biE61DLx8bWquFLlyS6pgshpwp3R8c5G
 PljEVxv5ycIv6vauqnQ44kBxUBpeeE9YPTFBRaZpg/HGmX3gpSlbk6C3lieOImSC+3Ah
 QChWnKFzBLWC7ENTW/lSzFOFoeO+wITo2xpC+y13LSDK6Vn1gSQ87wNTjk6LQM3ZLeF9
 s7EwIxcJaY9Xg5+K2za9DhRXA72QsiXVo/Q2I9R+RPWD5gGQOrII0CoH8WqWWmwXI2yd
 934g==
X-Gm-Message-State: AJIora+kM5d90iH6gIzVh9cVoPflMm/k9uzwOfLYsQUMTqiqSOYtf+zC
 M3yYxy0D26eMbctJhiiyeLyIgYzzvX8bCLVkGf8=
X-Google-Smtp-Source: AGRyM1tnnFr1LC7h/zRLo+HkB47D6IcosyajAFO4R/Wl+PPHAqyQruG56xeyLIJB7dGNj2Z8gyVtab2tS/XsOjguV9k=
X-Received: by 2002:a05:6402:5002:b0:435:1ff1:99ee with SMTP id
 p2-20020a056402500200b004351ff199eemr3312157eda.230.1655894208315; Wed, 22
 Jun 2022 03:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
 <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
 <20220621204914.byokkrxiznvod7vq@pengutronix.de>
In-Reply-To: <20220621204914.byokkrxiznvod7vq@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Jun 2022 12:36:11 +0200
Message-ID: <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Alexandru Ardelean <aardelean@deviqon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomislav Denis <tomislav.denis@avl.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Oleksij Rempel <linux@rempel-privat.de>, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?Q?Andr=C3=A9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Russell King <linux@armlinux.org.uk>, Jon Hunter <jonathanh@nvidia.com>,
 linux-iio <linux-iio@vger.kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <caihuoqing@baidu.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michal Simek <michal.simek@xilinx.com>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Lars Povlsen <lars.povlsen@microchip.com>, linux-hwmon@vger.kernel.org,
 Alessandro Zummo <a.zummo@towertech.it>,
 Keguang Zhang <keguang.zhang@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dmaengine <dmaengine@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-crypto <linux-crypto@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v8 01/16] clk: generalize devm_clk_get() a
	bit
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

T24gVHVlLCBKdW4gMjEsIDIwMjIgYXQgMTE6MDEgUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gT24gVHVlLCBKdW4gMjEsIDIwMjIg
YXQgMDg6NTc6MDBQTSArMDEwMCwgSm9uIEh1bnRlciB3cm90ZToKCi4uLgoKPiAoUHJvIHRpcHA6
IFRoZSBjb21taXQgaW4gbmV4dCBoYXMgYSBMaW5rOiBmb290ZXIuIElmIHlvdSBmb2xsb3cgdGhl
Cj4gbGluaywgeW91IGZpbmQgdGhlIHRocmVhZCB0aGF0IHdhcyBhY3R1YWxseSBhcHBsaWVkIChp
LmUuIHY5KSBhbmQgd2hlcmUKPiB0aGUgZml4IGlzIGFsc28gY29udGFpbmVkLikKCkV2ZW4gZWFz
aWVyLCB5b3UgbWF5IHRha2UgYSBtZXNzYWdlLWlkIGZyb20gdGhlIExpbmsgYW5kIHN1cHBseSB0
byBgYjRgOgoKICBiNCBtYm94ICR7bWVzc2FnZS1pZH0KICBtdXR0IC1mICR7bWVzc2FnZS1pZH0u
bWJ4ICMgb3Igd2hhdGV2ZXIgTVVBIHRoYXQgaGFuZGxlcyBtYm94ZXMKCgpEdW5ubyBpZiBgYjRg
IGhhcyBjYXBhYmlsaXR5IHRvIHBhcnNlIExpbmsgaW5zdGVhZCBvZiBtZXNzYWdlLWlkLgoKLS0g
CldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
