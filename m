Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B15545A4
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jun 2022 13:14:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5F9FC57B6C;
	Wed, 22 Jun 2022 11:14:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EA13C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jun 2022 11:14:45 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id e25so19033935wrc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jun 2022 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PUdU9WfpnqAsGBFkVc2KUHImdcpkKUBXRwogLKDyHSY=;
 b=z/ocsiUElwq2Ol2fF5l1HRqMMaNGMSC1/+8oQHLpQWLu429YrVBR/tnvq7KNWtwIO1
 vKJqA7rgUAiiGOKNdlwMjFurZAQLeqniaiGR74ASbDLlSriMOOzxItVhWE0QSvWSDF1z
 wnPR/hU6q/nU74KNLjXg2X84SJR1U2jxSqWO8a/x7jRbPZXjDqGeLFevtBezqUe56R1a
 7f0rlv+IRmpyGwRbiZXR3FrVvja2Yq3MOLg0mNs6za1kfz0V4uxdyGWKXZaA8ELytILx
 BDkiRFg7pp2SBYMObq/aoJYfogEZJWR+YhfycgXRStqMXxha87O37ft3cnQe33+/4mvE
 LISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PUdU9WfpnqAsGBFkVc2KUHImdcpkKUBXRwogLKDyHSY=;
 b=nFUso4wcJxBr8AEKxMRjVbOHNgD1gPoCqhN7NjyJsK50fjyLQmbX/yMIe8sW5ZzdAn
 lCq71VBHwH3Z9D6ToTXiU3FuyFKbkU9Askd+bs61kln4TbUn99HO28EhxkIiAW/D4kWm
 JAhgh6vPoBYYo61+mZHfVszUA9ErEn6SkzgFehnAjk6QyaX7DiYG+DLKJWUsSDeScGNC
 BsFi5hj3+M2VtxZE44eRsowgJY7CMElWosWJu3pkMkYoynjGEQU/n29o+TGgvFZvoCaq
 5xkVitPHP40gR7+c0N5j2CstX31SzFlhuqt5X0LI1ss9bK3qcPiXl16AhnIRIgnemg+h
 rnzw==
X-Gm-Message-State: AJIora8nMM/t2E/Nfsaf5YATH2JthC5GbQW2lcRBGApSmqxYd74r/fDv
 xemEysw/wU8ncfzxNm3juUjQuQ==
X-Google-Smtp-Source: AGRyM1v8ZhY0hH8c8n7TvnmAfbU48Dyk1bFg4uJSDokafOQgQ79E0o3w+OeeG5ifCToe2pBEDS6Ykw==
X-Received: by 2002:adf:fe81:0:b0:21a:3574:ec8e with SMTP id
 l1-20020adffe81000000b0021a3574ec8emr2726909wrr.410.1655896484628; 
 Wed, 22 Jun 2022 04:14:44 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1a3a:95bd:5b55:a798?
 ([2001:861:44c0:66c0:1a3a:95bd:5b55:a798])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfdbd0000000b0021b91ec8f6esm7841714wrj.67.2022.06.22.04.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 04:14:43 -0700 (PDT)
Message-ID: <d57a6c52-a9e1-5660-cd47-6f9ba2389d86@baylibre.com>
Date: Wed, 22 Jun 2022 13:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
 <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
 <20220621204914.byokkrxiznvod7vq@pengutronix.de>
 <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@linux.ie>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomislav Denis <tomislav.denis@avl.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Oleksij Rempel <linux@rempel-privat.de>, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?Q?Andr=c3=a9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjIvMDYvMjAyMiAxMjozNiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIFR1ZSwgSnVu
IDIxLCAyMDIyIGF0IDExOjAxIFBNIFV3ZSBLbGVpbmUtS8O2bmlnCj4gPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4+IE9uIFR1ZSwgSnVuIDIxLCAyMDIyIGF0IDA4OjU3
OjAwUE0gKzAxMDAsIEpvbiBIdW50ZXIgd3JvdGU6Cj4gCj4gLi4uCj4gCj4+IChQcm8gdGlwcDog
VGhlIGNvbW1pdCBpbiBuZXh0IGhhcyBhIExpbms6IGZvb3Rlci4gSWYgeW91IGZvbGxvdyB0aGUK
Pj4gbGluaywgeW91IGZpbmQgdGhlIHRocmVhZCB0aGF0IHdhcyBhY3R1YWxseSBhcHBsaWVkIChp
LmUuIHY5KSBhbmQgd2hlcmUKPj4gdGhlIGZpeCBpcyBhbHNvIGNvbnRhaW5lZC4pCj4gCj4gRXZl
biBlYXNpZXIsIHlvdSBtYXkgdGFrZSBhIG1lc3NhZ2UtaWQgZnJvbSB0aGUgTGluayBhbmQgc3Vw
cGx5IHRvIGBiNGA6Cj4gCj4gICAgYjQgbWJveCAke21lc3NhZ2UtaWR9Cj4gICAgbXV0dCAtZiAk
e21lc3NhZ2UtaWR9Lm1ieCAjIG9yIHdoYXRldmVyIE1VQSB0aGF0IGhhbmRsZXMgbWJveGVzCj4g
Cj4gCj4gRHVubm8gaWYgYGI0YCBoYXMgY2FwYWJpbGl0eSB0byBwYXJzZSBMaW5rIGluc3RlYWQg
b2YgbWVzc2FnZS1pZC4KPiAKCkl0IGRvZXM6CgoKJCBiNCBtYm94IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyMjA2MTYxNDQ5MTUuMzk4ODA3MS0xLXdpbmRobEAxMjYuY29tCkxvb2tpbmcg
dXAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIyMDYxNjE0NDkxNS4zOTg4MDcxLTEtd2lu
ZGhsJTQwMTI2LmNvbQpHcmFiYmluZyB0aHJlYWQgZnJvbSBsb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjIwNjE2MTQ0OTE1LjM5ODgwNzEtMS13aW5kaGwlNDAxMjYuY29tL3QubWJveC5nego1IG1lc3Nh
Z2VzIGluIHRoZSB0aHJlYWQKU2F2ZWQgLi8yMDIyMDYxNjE0NDkxNS4zOTg4MDcxLTEtd2luZGhs
QDEyNi5jb20ubWJ4CgpOZWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
