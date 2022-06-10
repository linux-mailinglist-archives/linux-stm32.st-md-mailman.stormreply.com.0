Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E275B5468E0
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 16:56:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70C74C5F1D7;
	Fri, 10 Jun 2022 14:56:40 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DEDFC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 14:56:39 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id v19so35629602edd.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=27H3ValQb+HBvUPzRu8Xf/glxEPwy0TQVzU1GqPnVOU=;
 b=eoLQQvbaXDJR95EC5g5LJ5CxHbAJV47MdiWWQDebUGy9Q4ljUChinzTC65zAyx9+cu
 P1TKzxsUNIbMO6DgJKWLF02va3yYhlizG8M969o8ytL6wp0eioeV35oB2ovGhpg0HL2J
 AtE27v900JQInLKWLqxjz95V4dBqhK4TH2d+FpSxvJHnaV2+W4R07LunLSpcHXFduZip
 CtWpeygUURiujmqCRQx07U09RQlXGX3kfWPB66KuMLyPm04qs+bAtSY+koRjNgs1IcDR
 1X5UPyx91NZwB8hqYfnf3lsrVd7c+3ZPhRnd7kjLUGHQEmxcvRwvNYyB/XfwXQBjPuch
 iMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=27H3ValQb+HBvUPzRu8Xf/glxEPwy0TQVzU1GqPnVOU=;
 b=jbSmNU+CbdnAZl3YKRG+f/DRQ2kXB2sll7iTInqpXxbTJJitBZ9U9QI1dsxLqlJQ4y
 s/8hNCKG27x+EZ6w5Q0Xz8CIGZGfNHVxTBRM0V8tnLQriWonZFdxLceaB2YEASlr40f2
 WXsQI4cPxijrLCGkIQquaAgJnAs9ujRC2zqFihTeQvjA9rVQ5A65XMlqQ9+tHM+bG86a
 uK+dc3SDqCU3Rhg2NQQsKwLY4EnsQUbPIBzJ2OaZZ85KqPpYd6I/MQcKIPN+kMSPySRO
 58Xiux+0G/noLT0ZeDvtYJ7FWRCO9kMh5TVK9OmYoBKotM6+nJ6Rb6Nr0iMhf0AD6uE1
 V6QQ==
X-Gm-Message-State: AOAM532PfRcWnwwh8pLe+yvu7Hmgk1ms4fFgYwuSeDLIYGQyH+bgxjMZ
 F6S0KHlCMkl6+nWVbWGJ6KKJAvSBNT/gLNzYTdw=
X-Google-Smtp-Source: ABdhPJy+4W6TzW/Fih8FB8596xZDMbGHtv+y8KFgg0s5ncZshszK0PY5LIku4jQLDiOJ5W3CjVR22n6jku9zOiOB+lo=
X-Received: by 2002:aa7:d303:0:b0:42d:d192:4c41 with SMTP id
 p3-20020aa7d303000000b0042dd1924c41mr52267347edq.178.1654872998983; Fri, 10
 Jun 2022 07:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-21-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-21-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 16:56:02 +0200
Message-ID: <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 20/34] iio: inkern: only relase the device
 node when done with it
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
LmNvbT4gd3JvdGU6Cj4KPiAnb2Zfbm9kZV9wdXQoKScgY2FuIHBvdGVudGlhbGx5IHJlbGVhc2Ug
dGhlIG1lbW9yeSBwb2ludGVkIHRvIGJ5Cj4gJ2lpb3NwZWMubnAnIHdoaWNoIHdvdWxkIGxlYXZl
IHVzIHdpdGggYW4gaW52YWxpZCBwb2ludGVyIChhbmQgd2Ugd291bGQKPiBzdGlsbCBwYXNzIGl0
IGluICdvZl94bGF0ZSgpJykuIEFzIHN1Y2gsIHdlIGNhbiBvbmx5IHJlbGVhc2UgdGhlIG5vZGUK
PiBhZnRlciB3ZSBhcmUgZG9uZSB3aXRoIGl0LgoKVGhlIHF1ZXN0aW9uIHlvdSBzaG91bGQgYW5z
d2VyIGluIHRoZSBjb21taXQgbWVzc2FnZSBpcyB0aGUgZm9sbG93aW5nOgoiQ2FuIGFuIE9GIG5v
ZGUsIGF0dGFjaGVkIHRvIGEgc3RydWN0IGRldmljZSwgYmUgZ29uZSBiZWZvcmUgdGhlCmRldmlj
ZSBpdHNlbGY/IiBJZiBpdCBzbywgdGhlbiBwYXRjaCBpcyBnb29kLCBvdGhlcndpc2UgdGhlcmUg
aXMgbm8KcG9pbnQgaW4gdGhpcyBwYXRjaCBpbiB0aGUgZmlyc3QgcGxhY2UuCgotLSAKV2l0aCBC
ZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
