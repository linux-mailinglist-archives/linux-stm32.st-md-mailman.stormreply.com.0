Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC554CB46
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jun 2022 16:27:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B210C5E2C6;
	Wed, 15 Jun 2022 14:27:01 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFF1BC03FDD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 14:26:59 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-30c143c41e5so63098307b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xMSeDjVBl8Op1MiME+3ol3t5KwHqA10J2T41KnFjWVI=;
 b=qz4+2/j3HuKLbz8sDkEIpH8ZLP9Jo8DhJ+Q2ht5CP+YvOT59Zf+re5Tujl0ZB6ZFPL
 6eIRF/MkMH9d8XYNP4+51SwLnjpzBos7nFmTYB8Ul+O4d2U6PeoLZ7QjQijKEZ8jLm95
 SELWUDdWwSs1Mh2zeOOA3+M0iUdmkybKKFT7IjVpsD5/9ncX5E7fGGraLMKtF7YFOE15
 3ZsziFepyBJtS+OHCqnLHN05xHlLU+0K7/YCV5W8FlGwHDwuOBWTMVvTFAoqv5pVaZxz
 Rpqrs1a41xszHea5Bvl2plED3iCFlGdMsfyTuDfKIA63BBNAp8s43G582spKqlDGmWXf
 4qPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xMSeDjVBl8Op1MiME+3ol3t5KwHqA10J2T41KnFjWVI=;
 b=14gCBmfwpdJuC3vBhY6g1/vdV8ayXuPdfV7VgkBYqqNk10fwV6VysZIfURLh7TV5kr
 2W0q62K0BDrL+mHkygR7rKjr7xH3ioxLkxj3cJ5I6WWzoC2e90s3v/2t95seBrR/uryC
 3+IAlbbPJKAS9wDC10HTllaMltbHk20/8prwSpxirkGREvaMEuVvaWEz9u2zmGE/so/W
 NacbX72lVzqotMd/vY5lj8/JuK7sotNOGkVXwf0gZUzai/0J2ABB1C6tS/ryE7VdcbVT
 lzYD4GlaM/zGRdrff9YDYuU+S/JAVT/R6YSZajy0vUyGUxG4bb5z9VHkdNFjvDSvanXo
 ii9A==
X-Gm-Message-State: AJIora/F6T7aeD0WNfDuWplfTnblPXLcioNOmieDkwScAu/yQ2XYW8X/
 nPM4jROhzy76XjGYhREs63pbjDLDfMhtgHKAfmAu+g==
X-Google-Smtp-Source: AGRyM1uf8yFhBnEUo8jDPf5ukxxTZvvQvwcMTtNGMVxYlbJA7mSO+23X9N9/rXSOE+V75SpZAwzwan4QnL+Hc3y01yY=
X-Received: by 2002:a0d:e246:0:b0:30c:5e77:7104 with SMTP id
 l67-20020a0de246000000b0030c5e777104mr12571722ywe.448.1655303218482; Wed, 15
 Jun 2022 07:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-28-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-28-nuno.sa@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jun 2022 16:26:47 +0200
Message-ID: <CACRpkdYVqsEdDDHLSkfJzMDPbPgkVihxa+ukLg1XnoyGghcdoA@mail.gmail.com>
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, linux-imx@nxp.com,
 Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>,
 linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 27/34] iio: adc: ab8500-gpadc: convert to
	device properties
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
LmNvbT4gd3JvdGU6Cgo+IE1ha2UgdGhlIGNvbnZlcnNpb24gdG8gZmlybXdhcmUgYWdub3N0aWMg
ZGV2aWNlIHByb3BlcnRpZXMuIEFzIHBhcnQgb2YKPiB0aGUgY29udmVyc2lvbiB0aGUgSUlPIGlu
a2VybiBpbnRlcmZhY2UgJ29mX3hsYXRlKCknIGlzIGFsc28gY29udmVydGVkIHRvCj4gJ2Z3bm9k
ZV94bGF0ZSgpJy4gVGhlIGdvYWwgaXMgdG8gY29tcGxldGVseSBkcm9wICdvZl94bGF0ZScgYW5k
IGhlbmNlIE9GCj4gZGVwZW5kZW5jaWVzIGZyb20gSUlPLgo+Cj4gU2lnbmVkLW9mZi1ieTogTnVu
byBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KCkFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
