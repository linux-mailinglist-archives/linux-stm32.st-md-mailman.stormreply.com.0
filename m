Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 933D754E1AD
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 15:16:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 553C3C56630;
	Thu, 16 Jun 2022 13:16:47 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D80BC03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 13:16:46 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id k2so2153525ybj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
 b=hfe7mj1KZcI8jwu/+nrNcYUQkpbisjdMGB5MdUDVHZURXKTI0fpPSwYzVJTSQIvUQj
 mQ+FkQDUQOvueZPXCdzZ+WEb9CVEmydueaKmiNl4EduEP7G5KldCbqyuT6DrH619ltMs
 SiQd+lbSkJ/2ztzapTtqInm6GdRXCWf5M7sFxt2WgQ72hgoUmjnoNNk2kM6AO8hHEKNE
 9YK5KNalKb6+DMnwTXh0W8DordCVtz41PW0ZjsKXzkeRiewzu8ZSaBVNIEHFdWdQ6ziQ
 lQIpZXEuEWineyu9YQb+gIhoNcGOJyB0hu2Lyui1EO16WO1/xuKLHNgfFYiihKSzkXkW
 MS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
 b=Nceta/UmyK5vx0gjMEPDh8V5PbSgkzjkvCKjQzhgi2hIq6Y+d4RL87hckxULmpJdxk
 zk9DYhae9hczBatAPPS4ePv1FhVTZS2mIi4cwo3Eqrni8FK2MeBRyr/VcZl8qUirSzd/
 8bhZSKg4EYRSLd584+xujvgnYVLQQrtVyj7Wbdqc07is6kw2H3yeNTK5GXMM+Y8jBV6q
 3IZqEMW1842pwAwh3u/IdA3e4TVHWzMO+kt/UlsaE9FcwBgRXEFPp96iAz9QEOPJr3F3
 btUOP+E29+UHqKFBM0yrmaJO+Df3Oni0goUl1ePUYrq20I9eZMas2OlnDWrZZ0eahwgX
 FwWw==
X-Gm-Message-State: AJIora8tEEUMkUtFCgkO/HuIUfhUuRm/2f+WuFfOM7k7hBacgKSNzX7+
 99kgHhgbZOGSHU4CIT1cpAEkn2qtkNishwWgz8UlgA==
X-Google-Smtp-Source: AGRyM1uSi6CDKxBHFMyZRQ8/7cL0ndy869mFvAGFrCTYZ+gYNuQVO0PO7I97kA8jFrTxg7Fugxfs5Adf3pgP5atidCY=
X-Received: by 2002:a25:2642:0:b0:664:c89e:b059 with SMTP id
 m63-20020a252642000000b00664c89eb059mr5336121ybm.369.1655385405187; Thu, 16
 Jun 2022 06:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-32-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-32-nuno.sa@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jun 2022 15:16:34 +0200
Message-ID: <CACRpkdY4DMPwkxTGdyj31YsS=xCv7vv7Zwp5Awy3aNRgUMZcfw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 31/34] iio: adc: qcom-spmi-adc5: convert
	to device properties
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDkgQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
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
