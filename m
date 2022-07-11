Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC415704F7
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 16:04:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58DBBC0C921;
	Mon, 11 Jul 2022 14:04:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CF6AC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 14:04:30 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id bu1so5974713wrb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=DIAFLfCCstVMeweX2Ab1siE9p1+/OUf9lkXY0wvZIus=;
 b=doyN/EGzYQwmb31Qvui4RHoImYKN2mpxrS770rB7oqfTCwtKecAYk7XK5nHAyciB9j
 nA1APLtNitFKoReEa8OSAA36uhyQeBRn5HCTYGjxKPKrruw1/RVlPVlVw2Rtyl8Tdr+h
 cQ/iXqqjSrnqPkrGbEyq3ZoVd8/03nR/nA1cD5qcH6XmGBErXPoWjWp43sDJpzR39FEp
 W0mUeX/ZlJd79U4JcII4j+dn4hWjMQHfmlsXLW5buyknCb71XUrhQGs078ea/zqNArwN
 ThisRukKDtbypj9of180SnLkYj6JucCgS0In0PztOFDgkKr/2YAXJEs11HdAV+LN89U2
 Q8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=DIAFLfCCstVMeweX2Ab1siE9p1+/OUf9lkXY0wvZIus=;
 b=sPojWDhRAuSzHMF1vbugqFyRq1AwMgnLR14vOaK6b4UC1wGQFgtzKgR4Frk99bp3Kp
 yK70XiqA0Q6/d+uqnlvMFr0/IXZzWnMLx2RvJ6SSSqVWvSbjjR+8XmscPpgji1dxcSGX
 mWa3xZh0BaR1oeYddXltJuHCHA/vyKritH47/IAQOe/kcipxMpTF4ADAfscrcffavgQP
 xn4FlpviD9iQfsMnXrPijqTtRndsnaw/mQmqZS3WF/7U05W8Cb1rR+rh0jN/NF1zEq/r
 OtIntsVKcH0PhEJDC4Np7NeEnzSzusIdUT3jcBj2y1yY5G8mJa0I+35a31lgpyE0EQOm
 v1/g==
X-Gm-Message-State: AJIora+pAh+aCz8KInz0Kylvic/iN6Qv58bRT7lDsCxb6A3jh37q0jis
 npNWn2ZLp6tun5v+IpAukVI=
X-Google-Smtp-Source: AGRyM1sfP4B2ggRzwlFtNzE5njlcJb0xyrOh+fqSIvv7emKj99E0h8HP5nFdmlvCbmam0md1QXj4iw==
X-Received: by 2002:adf:fa04:0:b0:21d:1864:3172 with SMTP id
 m4-20020adffa04000000b0021d18643172mr18334198wrr.292.1657548270179; 
 Mon, 11 Jul 2022 07:04:30 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de
 (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de.
 [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a5d4f0f000000b0021d8faf57d5sm5849112wru.74.2022.07.11.07.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 07:04:29 -0700 (PDT)
Message-ID: <d060ab80fcf8ede50466069c9021eda97e239fb6.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>
Date: Mon, 11 Jul 2022 16:05:31 +0200
In-Reply-To: <CAHp75VcnuAtc+n+nhQ16yP9S-veX2c6ruquSewtPJdcqQwpyAQ@mail.gmail.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
 <20220711123835.811358-16-nuno.sa@analog.com>
 <CAHp75VcnuAtc+n+nhQ16yP9S-veX2c6ruquSewtPJdcqQwpyAQ@mail.gmail.com>
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Cc: Cai Huoqing <cai.huoqing@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J.
 Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
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
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
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

T24gTW9uLCAyMDIyLTA3LTExIGF0IDE1OjE1ICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gTW9uLCBKdWwgMTEsIDIwMjIgYXQgMjo0MCBQTSBOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKPiA+IAo+ID4gSnVzdCBjb3NtZXRpY3MuIE5vIGZ1bmN0aW9uYWwgY2hh
bmdlIGludGVuZGVkLi4uCj4gCj4gLi4uCj4gCj4gPiAtwqDCoMKgwqDCoMKgIGlmIChuYW1lID09
IE5VTEwgJiYgY2hhbm5lbF9uYW1lID09IE5VTEwpCj4gPiArwqDCoMKgwqDCoMKgIGlmICghbmFt
ZSAmJiAhY2hhbm5lbF9uYW1lKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBFUlJfUFRSKC1FTk9ERVYpOwo+IAo+IEFmdGVyIHRoaXMgY2hhbmdlIGluIHBsYWNlLCBJ
IHRoaW5rIGl0J3MgYmV0dGVyIHRvIGNvbnZlcnQgaXQgdG8KPiAKPiDCoCBpZiAoIShuYW1lIHx8
IGNoYW5uZWxfbmFtZSkpCj4gCj4gd2hpY2ggc2hvd3MgaW50ZW50aW9ucyBjbGVhcmVyLgo+IAoK
Tm8gc3Ryb25nIGZlZWxpbmdzIGZyb20gbXkgc2lkZSBzbyBJIGNhbiBkbyB0aGF0IGlmIGEgdjMg
aXMgbmVlZGVkCih3aGljaCwgbW9zdCBsaWtlbHksIHdpbGwgYmUgbmVlZGVkKS4KCi0gTnVubyBT
w6EKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
