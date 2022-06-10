Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07D54694A
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 17:21:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3303FC5F1D7;
	Fri, 10 Jun 2022 15:21:11 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D4B4C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 15:21:09 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id a29so14855140lfk.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H+ga1sC9+ntYYTy6ffK9GjlUeE88A0FzNz+Ar82l8uE=;
 b=QuszwAyXszuHI8ReemXfLsvKVbRYP/Ciej6NodQS4f4DxB0dYCz1JKt3Z8KqRQdbVX
 Jqbo5bZLYC1v1EbQmqJbF588+MBvfJAEhBinRuB3cCDUahi9/8/q3PAe0W2Vgs45ckLW
 /hiuFN/v5rZ/itjafx60G3maggGA2cuzdXxWkUwbpLNnOq8CiWcKz0KQDvAWhjQwa/9r
 QOtElc4xrfhvBjGu9rsXtW8n9+fhA5ojdEZ/+ut9V4+pZWnRJ1pOf+C00H4egWSGhIy5
 cr1goHKSiGEFoiuomtuXSN8DfgxD+HYZKIUFs35eLE9qua0p+q3zFgLJ1Xe+CnTMsAx4
 6A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H+ga1sC9+ntYYTy6ffK9GjlUeE88A0FzNz+Ar82l8uE=;
 b=HbI3KDfoGr4dvC0kaSN0Psb18nQ8fJy7ONF8Yz8HRIV+4ar5obQlwZGTRKtSNfwXTt
 TPez/My+j+RufVPQDW6TeN7/uRg42Qy6ePTWYieJXONspNDN7l8jbUMDD44a/he5zK0j
 UV2sf0f38i0QnYAnZGDL4bUxpUu8Bfivg9exSTLQ3aqDp4EHn14clICY7LSCiwn8T9Ct
 emA23Z41HyO3y48oCiPA3opkD2yak7mXJIjZPyZP2d9N7lF6XUq1+4GenONiJ/d9FHfS
 jNhFMxgg6ZCmmyZm+aLweNjtGK03rAjuAcGVoqAp35gCBg811gbFIWi5qf6HKL+2f0uF
 1BvA==
X-Gm-Message-State: AOAM533+caYkWTmNeDDQAP/Wp6bgn7LQ8ukDSk8pWSJU+dDVtuhTOnrU
 pTNVryd4egTtyJ8YKbPZNg9g9UvdysoxKJWFvsw=
X-Google-Smtp-Source: ABdhPJy+kvE8MxchmBmksNafSpi+qANBoJkttBTTtDBUpDtpcRk/iOf7pFYhhSUgUCkmvGrvjJK5StTzheGUp//PDx4=
X-Received: by 2002:a05:6512:308c:b0:479:54c2:c91 with SMTP id
 z12-20020a056512308c00b0047954c20c91mr13940269lfd.565.1654874468712; Fri, 10
 Jun 2022 08:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-26-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-26-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 17:20:28 +0200
Message-ID: <CAHp75VdYsPAS_1KZCrWvK5=By020Xxtw_FtogZwJQ=Srajdjbg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 25/34] thermal: qcom: qcom-spmi-adc-tm5:
 convert to IIO fwnode API
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
LmNvbT4gd3JvdGU6Cj4KPiBNYWtlIHVzYWdlIG9mIHRoZSBuZXcgZmlybXdhcmUgYWdub3N0aWMg
QVBJCj4gJ2Rldm1fb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKScgdG8gZ2V0IHRoZSBJSU8g
Y2hhbm5lbC4KCl9vZl8gPyEKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtv
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
