Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E9A570455
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 15:33:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B04BC0C921;
	Mon, 11 Jul 2022 13:33:32 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 070AAC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 13:33:30 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-31c89111f23so49307617b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RQwilQfI/adDo9s97R0fAFu247sWntEmkcOlLUrzmwo=;
 b=e25Ptdx+BdRNZeRkxgFp/iHvgBc6IBcweUa8B2jlTvKLiVqyJQJfMGti/8p+8qB5HQ
 yPoI+6CajM35ns+P98l88f/GR+baEOdC1/8HJLLNDKp93L/MA/2iuLd7Yuwc5ut6YjEv
 JSlVxwxCvNlJCYEVCEE7VspV5kOhs7lhJmVEP0XTIzKiP6p4zljgpeNZld8mjAO17C03
 EJOoClA0+qbZPUmXPrh7GdpLSKi28HSj5rSFJ+Se4yeT/998AA0g1y7YeibrBcqb2Dkd
 FcexyLq+JlU/3YdreGmIDl9+qQr97oEzJ2pTVBs9yN4TeGJ2pvJIXMbVmgiAYE1E43XS
 1XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RQwilQfI/adDo9s97R0fAFu247sWntEmkcOlLUrzmwo=;
 b=3pzRd/wxJDmsmqRq1Tm6pX36eLkB/YQ3jFpx7fIZYeAmdI2hp/8uzNxa1ubiRIcxzm
 tajXv2ixVePheSm6I1QzNye8h4WqP3Wnb5l+MJYWHxQ0VUGbcOJrB1LmSB5WeZPM56Y5
 oDEIcpXRv2spLyywC0V+PMP1WbvfmWRi/sK1/glKXKM3hG2kmhw5AZ20J6cjdGqS+EGm
 qickfZDb1fsSlJpvXxUmrM5kBmMaUa5ytvit7s7UAbg6TMNzsI25H90+xe/5MHfatQZm
 dr7Y6c3BwbRdp5dEDzkFmFffnd3mBqu+zVK0HL9ua9S4aL9D5S72NCZE7J79e6jIGVnj
 M5/Q==
X-Gm-Message-State: AJIora9X9TsuxFPUYneHnbtd3UWZOIv/ZR45bIZ8TsCW1UhplkfFfSOb
 53IDDNAlgRtUy/5A9RaDtff2Wc8lqXFkDeWAQP8=
X-Google-Smtp-Source: AGRyM1vwFLTnD43GPFTgMLTlXqUGdlI71lJPoTCRuiV/S15q+5KKdFYTwkQcKTfOBN8LuvnS9zGKXXrKLTRdthklF8Q=
X-Received: by 2002:a81:8397:0:b0:31c:8a02:3f6d with SMTP id
 t145-20020a818397000000b0031c8a023f6dmr19617833ywf.486.1657546409819; Mon, 11
 Jul 2022 06:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220711123835.811358-1-nuno.sa@analog.com>
 <20220711123835.811358-16-nuno.sa@analog.com>
 <CAHp75VcnuAtc+n+nhQ16yP9S-veX2c6ruquSewtPJdcqQwpyAQ@mail.gmail.com>
 <OS0PR01MB592214D4F12E0636DB7B98CD86879@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592214D4F12E0636DB7B98CD86879@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Jul 2022 15:32:53 +0200
Message-ID: <CAHp75Ve1mAj9u3rVU7qseZ-MYw_PDjAAFA+69XeRv_pvEW-ZrQ@mail.gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Cai Huoqing <cai.huoqing@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Gross <agross@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Tali Perry <tali.perry1@gmail.com>, Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
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

T24gTW9uLCBKdWwgMTEsIDIwMjIgYXQgMzoyOCBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+IHdyb3RlOgo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxNS8xNV0gaWlv
OiBpbmtlcm46IGZpeCBjb2Rpbmcgc3R5bGUgd2FybmluZ3MKPiA+IE9uIE1vbiwgSnVsIDExLCAy
MDIyIGF0IDI6NDAgUE0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4gd3JvdGU6CgouLi4K
Cj4gPiA+IC0gICAgICAgaWYgKG5hbWUgPT0gTlVMTCAmJiBjaGFubmVsX25hbWUgPT0gTlVMTCkK
PiA+ID4gKyAgICAgICBpZiAoIW5hbWUgJiYgIWNoYW5uZWxfbmFtZSkKPiA+ID4gICAgICAgICAg
ICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwo+ID4KPiA+IEFmdGVyIHRoaXMgY2hhbmdl
IGluIHBsYWNlLCBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIGNvbnZlcnQgaXQgdG8KPiA+Cj4gPiAg
IGlmICghKG5hbWUgfHwgY2hhbm5lbF9uYW1lKSkKPgo+IEl0IHNob3VsZCBiZSBuYW1lICYmIGNo
YW5uZWxfbmFtZQo+Cj4gU2VlIGJlbG93Lgo+ICAoISAoIDEgfHwgMCktPiAgKCEgKDEgJiYgMSkK
CkkgZGlkbid0IGdldCB3aGF0IHlvdSBhcmUgaW1wbHlpbmcgaGVyZS4gUGxlYXNlLCBjaGVjayBh
Z2FpbiB3aGF0J3MgaW4KdGhlIG9yaWdpbmFsIGNvZGUgYW5kIHdoYXQncyBiZWluZyBzdWdnZXN0
ZWQuCgo+ID4gd2hpY2ggc2hvd3MgaW50ZW50aW9ucyBjbGVhcmVyLgoKLS0gCldpdGggQmVzdCBS
ZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
