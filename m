Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F40F5468BD
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 16:47:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9903C5F1D7;
	Fri, 10 Jun 2022 14:47:55 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A32DC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 14:47:55 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id h19so35648370edj.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=++QT23Kd+FIQRCrQZQe7WTN4LUSOZ4DgBVw4lFAkbv8=;
 b=YwdpHX6f3Yq7XH6KVuJEH9ag++zBILZ6r8FsafNlXSwCgT0Dl8CqFiXT7KHM8bkxLF
 Nf3apV6d4L93j7uQRUCQhfPnmHha/4rR3cl4CH0wTu2qP9AubKK84Y1/5SrnrJXh4Ahn
 IHWXMQweEAe4L6rRNL8hyvGDC+tXkCijuh7kwaC6b4zb2Fi95twp90585Rpk40WBFx5Q
 muSamB7AY2Fu4ZNvlMLB4lydiKJ0aoWk0nyFA1KImb/1g5oZTCP5Wbi/kMK06kNHl63V
 +yQuuhfrlNx/YA3zsGLwtnf8allQ3v1lUsyKJ5ydnTMsCuw9LiMm1xrT9pUSobmkyPxj
 gU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=++QT23Kd+FIQRCrQZQe7WTN4LUSOZ4DgBVw4lFAkbv8=;
 b=gneQRiA9iufiKdL7Hx0RyWReHpigAJIicx5hn045e57dmtMI52qBhHQCXDRfXEWrJS
 R1UslOuaH98femrEHpCkpjmS58C7YiTW6npJu5XsZvZXyadcK8ELG5YDOsQkUUhV59Yh
 qMaXlv18MZsw/TwI99SRDOOYBGLjiNTP+A3d0pFRVnp41Y5Y6DtVq2sZl+i1TEtj/JNb
 Vu79KyE5rqHXdErIXouhko/8MOgVTMXqlieOk33DKtLcMApoNDUeD5B2K8aT97AGfV66
 CGzTy3/e8DmOQFtSnAiXRKNOl+QNa+y0fB7RkaYSFYvYrpbv9suO6M5v0czlh507GerW
 +s8Q==
X-Gm-Message-State: AOAM53242H/d8JpoUQ7eS1bM8zuBxV3/sWpRAKuAbG0D+HEllWAw83po
 oiQRScNrLLf8fixLP3yuApowEEEyqRrEQIzncrw=
X-Google-Smtp-Source: ABdhPJxUxO59q0a4JvFZDrd7A8E4K6/eK/ZjPOa7JqgennKhOjFwPSMHvPp7iEiz3gXgkjUbucymQNwJhKdm75HJnyM=
X-Received: by 2002:a05:6402:4390:b0:42e:b7e:e9ac with SMTP id
 o16-20020a056402439000b0042e0b7ee9acmr50565604edc.97.1654872475078; Fri, 10
 Jun 2022 07:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-16-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-16-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 16:47:16 +0200
Message-ID: <CAHp75VdCrFa67_k3TJSznT0fzEK3h3+fk0MHpuwM6NBpTQODEw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 15/34] iio: humidity: hts221_buffer:
 explicitly add proper header files
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDcgQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4gd3JvdGU6Cj4KPiBEbyBub3QgdHJ1c3QgdGhlIGZhY3QgdGhhdCBpaW8uaCBpbmNsdWRl
cyBvZi5oIHdoaWNoIGluIHR1cm4gaW5jbHVkZXMKPiBhbGwgdGhlIGhlYWRlcnMgd2UgYXJlIHJl
bHlpbmcgb24uCj4KPiBUaGUgdWx0aW1hdGUgZ29hbCBpcyB0byBhY3R1YWxseSBkcm9wIG9mLmgg
ZnJvbSBpaW8uaC4KCi4uLgoKPiAgI2luY2x1ZGUgPGxpbnV4L2lycXJldHVybi5oPgo+ICAjaW5j
bHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgo+ICsj
aW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4KClllcywgSSBzZWUsIGJ1dCB5b3UgY2FuIG1ha2Ug
bGlmZSBlYXNpZXIgaWYgeW91IHRyeSB0byBzcXVlZXplIHRvIHRoZQptb3N0IHNvcnRlZCBwYXJ0
LiBJIGRvIG5vdCBzZWUgZnVsbCBjb250ZXh0LCBidXQgaGVyZSBJIHdvdWxkIHB1dCBpdApiZWZv
cmUgcmVnbWFwLmguCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
