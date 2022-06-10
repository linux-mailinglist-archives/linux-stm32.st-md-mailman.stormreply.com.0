Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEED547F60
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 08:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06930C60466;
	Mon, 13 Jun 2022 06:10:56 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E0D1C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 19:42:36 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x62so201364ede.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 12:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Y54GLtlH6LdYaPPW/vT7zN8oinpgFewT/Kozy6U1sr8=;
 b=iWSpr/Kt7gr1R9ypw8jSjj+iOo2ix1stq9TO7FQZo6FT8oajeYFmxMX5790+z+QVIw
 C7Ph+qzRUt7nF1vNHdfJ0/2YZ2pZ+XOQ62dOWxjQJtnhLEBN5faftDizO1QR7VcaY1th
 B2gMlUAyrnpPEnSuXIjg0v7ebGj0D7jFND7r5/1yIqLtNPorMEV563M1TGbB6y5QzIzb
 69uRffN14fsfXA3NOeVWJp0NxUn7g4a5ccquY7moBAfqWHgcOt7DGfcfretFbABXDM7C
 mJOIUP9o2bGzA7CZMkUvUUHb0Oaw59fP1sckcKbdvg0t/ddeKFE7FxUbxOVDoWa0tvSp
 3ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Y54GLtlH6LdYaPPW/vT7zN8oinpgFewT/Kozy6U1sr8=;
 b=79q2MvxqTq2MKe5CB5ZV2r1DxLBcuGhz47aClQoNTqqvlVhSjPnWJGFaGSJzZdEbzX
 0iaw+a0R6QDGBJftfs4DUc/b0KRePyCib/HXkaTxkk8G5GoYR/ZKBlkmW4TP7iaEFg2U
 WYOCugtUIt179Lw0zC3D4vBDTIXV5RnKHrKOSiwRaAL/RbsVdO4KE7FyuReWUaIKrqV7
 8jNi1lTQRKRDQNQEPl3VjCz3WB+WDcQCNktx19FzHnh6uaTmHeLxbEFSVOIVg0/Ue4bh
 bY+9mkt1qU9/KOChksPjtbUjhsWhyVC4X9Ly0rWzQwZTm02mhOq1FhA2LnjoW4Wav/yV
 f/Dg==
X-Gm-Message-State: AOAM531+ApaLqh0nCvnCaKUAUSO9hk3NNUvbGYqemszUgOkjrZiy+yNA
 JC9z0fjJIk13JCwB8R0ks7Q=
X-Google-Smtp-Source: ABdhPJzmp7JEbyf5YC9B40GJWfUYSStWlZjAXDQjdn7K/oR4H50lmJrnbL72tBcPT/obo+EANAlJ1A==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id
 n9-20020a05640205c900b00420aac6257bmr52750712edx.128.1654890155771; 
 Fri, 10 Jun 2022 12:42:35 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861?
 ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
 by smtp.gmail.com with ESMTPSA id
 nd28-20020a170907629c00b00706c50870a0sm4261637ejc.194.2022.06.10.12.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 12:42:35 -0700 (PDT)
Message-ID: <b2260504dce967f3ce8b0bee190ab81464b01f3f.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>
Date: Fri, 10 Jun 2022 21:42:33 +0200
In-Reply-To: <CAHp75VdYsPAS_1KZCrWvK5=By020Xxtw_FtogZwJQ=Srajdjbg@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-26-nuno.sa@analog.com>
 <CAHp75VdYsPAS_1KZCrWvK5=By020Xxtw_FtogZwJQ=Srajdjbg@mail.gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Jun 2022 06:10:54 +0000
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
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
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

T24gRnJpLCAyMDIyLTA2LTEwIGF0IDE3OjIwICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5h
bG9nLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IE1ha2UgdXNhZ2Ugb2YgdGhlIG5ldyBmaXJtd2FyZSBh
Z25vc3RpYyBBUEkKPiA+ICdkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCknIHRvIGdl
dCB0aGUgSUlPIGNoYW5uZWwuCj4gCj4gX29mXyA/IQo+IAoKQ2xlYXJseSBub3QgOikuLi4gV2ls
bCBmaXggaXQgb24gdjIKCi0gTnVubyBTw6EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
