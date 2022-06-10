Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCAF5468A8
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 16:45:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1BA1C5F1D7;
	Fri, 10 Jun 2022 14:45:56 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55D46C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 14:45:55 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id kq6so40885246ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 07:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KoDE34zocTcx3MPzWCnR4QwZS2ytF1uI72CoiLyAcyQ=;
 b=cPMR1qwhgBciQ4QuFRIqiyeHmWI4Ln4CHN421omnkh7YH9MB7rz/jhyXlDcjROB6tT
 JiSpoNNM1qEgfFc/7U9Bzbww3hRJhk8lPntDxUJBZ89txLcz/l4eIrftQGXd/SjihNQ3
 DYhEWO3cPHerQ6tMoyNMwIS+iCRH+4RQ3UEZLVQEmS5QOfbNGv833fIl2ncEf4jXl14U
 yi4+tL0c+r7c5GU8P4oAYYhsdlfSHRZE9gQECvEhxRs3N2lDYwzDcaqkKjAEBpHjgt9p
 K0sdA/V/R/iXE5p8XbseNASd66P628xRR1EgKSZHtqMGGV6sRCzr4iT7MWyT+gB6Znn7
 cYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KoDE34zocTcx3MPzWCnR4QwZS2ytF1uI72CoiLyAcyQ=;
 b=doDATu+Zdtq/bkPxR1lv9ubmSUCNGPMjaTwDuYq6UmCGvYP97Fzznmx1Hbou+JW+6r
 9uKTtFgbDL7GvCH4ZPyTL5KZ+BW9q/V848Hekruc1+tzZ5HjLSCd46Heko+htR7uuzXI
 w9fyVoN1vAu17k788+QQjiaQpQ6ASwbb9I+Fqaqe88DiBhm3TacHpnVZVE2l+ydKKgop
 FuQ3FuUBoVWa5ivv1r5Fwi4kSPC085bUSfLOQDtd0rEgkq9PYuTQs5lkxfZbsjzJHxW7
 WDQ9MTomoJj11QRqhgUzwbFfAaqbWXYiaj3lWh7jXvAT9lz1wP6Gh8BRvp6cKlryWBYb
 V1Qw==
X-Gm-Message-State: AOAM531rQIWIudkaVKFc7p1UkFr44O0vkaf8u1ZYMq+4Rg3T89n0yy8x
 6rcI/ODmtONZjuoqpjBxZ9h76Q7x07KgY6HQvpQ=
X-Google-Smtp-Source: ABdhPJxizt9m4eKBTNu+PJtwHNsl6LS2ZuZ/AzA8lc7FGXQyzDHIdcU8VIdIbeQpqLpHnNiy07ZL4b6rgaPhYce2N3E=
X-Received: by 2002:a17:906:1193:b0:70d:cf39:a4db with SMTP id
 n19-20020a170906119300b0070dcf39a4dbmr35595214eja.44.1654872354568; Fri, 10
 Jun 2022 07:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-7-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-7-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 16:45:07 +0200
Message-ID: <CAHp75VcU-oV4is_y9=oaOx2ugvTEOy53h2wvbd3-Z9_gv5Y=zA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 06/34] iio: adc: ingenic-adc: explicitly
	add proper header files
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDYgQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4gd3JvdGU6Cj4KPiBEbyBub3QgdHJ1c3QgdGhlIGZhY3QgdGhhdCBpaW8uaCBpbmNsdWRl
cyBvZi5oIHdoaWNoIGluIHR1cm4gaW5jbHVkZXMKPiBhbGwgdGhlIGhlYWRlcnMgd2UgYXJlIHJl
bHlpbmcgb24uCj4KPiBUaGUgdWx0aW1hdGUgZ29hbCBpcyB0byBhY3R1YWxseSBkcm9wIG9mLmgg
ZnJvbSBpaW8uaC4KCi4uLgoKPiAgI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgo+
ICAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rl
dmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L29mLmg+CgpPcmRlcmluZyAoZnJvbSB0aGUgY29udGV4dCBJIGRvbid0IHNlZSBpdCdzIG1lc3Nl
ZCB1cCBhbHJlYWR5KQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
