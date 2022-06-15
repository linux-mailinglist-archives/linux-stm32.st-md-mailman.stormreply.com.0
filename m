Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E554CB4C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jun 2022 16:27:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98C1CC5E2C6;
	Wed, 15 Jun 2022 14:27:45 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 634BCC03FDD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 14:27:44 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id p13so20855331ybm.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
 b=M0lG3b8vfMcZ/7Ka36O1ZxSsUemkOvvlFAQXkpVQ4QpCs+1BTt67QSw4HKiQD5WOcb
 52snuFlKH/21oU1OKHImIEHhsr/qfhoQOlanFV+m4TeEl8ICjJe2Sd491tUIQIDSw5Bq
 xHExXe7XqUhLlIhXKD4i9kKCqB5PLrMMw5aIrSuv673UinrPE2m5a9fMdvB5OZ6CYFIq
 /u1FbiRcfzMPM33M1qWbZlUZBeX0dAiMnD8nksss+jrH8U5wAD3bdbqxbououS4Wce5+
 si5vaEILsaJTJRlA5Tvc5IU5RHPyGLfiWb4X0xjPRiEJMgOmZeod+1F/8J2LCdxK/urt
 bp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
 b=ngJdhTquxMRrtBY2OpH1VOVvoVJS1x7CFieNAYWqnUHW8NgZQQlK8j2ETFrtmyLjBC
 fNApg3vsSPwb9ggr3+4UtgnW50/NTMk4YA/6mQqE4NM8LKslfvxPor+AlvmCOkBpHdY8
 RjrWedT5CIbXi2AS7wQoxvNrGVXpVrKbz97kTRVXqqBBrHf1CDbIv+2skfHl05B2fSNF
 X2mlC+PiCN2ZHbcdVRUazO7Fv/7j0z2A8rqokjV/U7KIQ9US861OYRWqbD4AwM+1Y6Dw
 fGGA7cjJ/hhy/2NJgwDjkIW4DLxgpViQpdhCkt5UnJEQw4DhuXvLlEw7WMID8uZr6Zah
 au6Q==
X-Gm-Message-State: AJIora/PbKUWzlU98GrmYCPI8Y3XPbrkZCNk1sSGOhDV7H2neFZ1Mmwn
 k+vHsbTcl0QbVweZy/YYZK1bfF86MR9DwS+dZIwQzA==
X-Google-Smtp-Source: AGRyM1t0twq2NH5TwVMffJ95BCvjUqTPe1/bY9PSUuCjeVYRJKVWPPGecH5Bnr87yp5uioRcTcWI/9qkOUV49rzlV5c=
X-Received: by 2002:a25:8387:0:b0:664:7589:27b9 with SMTP id
 t7-20020a258387000000b00664758927b9mr86691ybk.291.1655303263361; Wed, 15 Jun
 2022 07:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-30-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-30-nuno.sa@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jun 2022 16:27:32 +0200
Message-ID: <CACRpkdYtBY9bWevrWNL+mXz8LbsdDEFmGvrmPQ85Mn=yZ=FyHg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 29/34] iio: adc: qcom-pm8xxx-xoadc:
	convert to device properties
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
