Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D49C5704EB
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 16:03:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D942C0C921;
	Mon, 11 Jul 2022 14:03:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2236BC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 14:03:35 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id a5so7140202wrx.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=/s/OGdlF8gDduadx4LnZlsIPtzs9KiJR7EJ+peqCSpc=;
 b=f7S5z3cJiEVRqzrgIcyYJ0WR48nsA/Ndj1Rkr2kt+NBRFf5eg2uWQrd/MXBzfhne0y
 iwh/biJoo/tUnIBZ59D1UJ2MZhAd0MJTzEororHJvT2kKF7rr+wcIRgEfNSE1+2a6p7G
 OTHEuRl5gLgHP31ivAK1JB/JwBHsZMpAlTnI0rp0AP169bYRyzn0Sbgo3owVHS/vUchj
 bn51mIT64xCPri2REasD0Ixtyf721cJrRYoZotxL7o5vXaQqOL0QF2Kg8IOgZvG+YLsK
 jE3UtLdrl5C2cRH0WAbkqmpFI93w/iA4Kl4QpyYBkAtSdwo2/ZUzjWYGfJgdmdkKZaYX
 wW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=/s/OGdlF8gDduadx4LnZlsIPtzs9KiJR7EJ+peqCSpc=;
 b=NRZ87BK/XT0Fo9e70fJz91iuvakullCfcCebxbh2B1/cu4L7ifoIdt7Wfe3W+XzxK3
 76SRt4ZLS69sgG0UglqCM1oNpV3UqB6LsmW9voXbyH8Jy4tuLGmvGvf1G4ZA6PJeM4fw
 8tyu4UY3tslwtIWVznSQE9EQpHHWRFHlEr+wVjEmHGuUC4GidHW7b/srf5/oTBeRH2j6
 ZbultiAPn+JxSJGf3zlEu4yXNyGy4OkV4jvHTTI9ghF6mh1DgEnPGTNcY4rsjaH5yQ3D
 Z4DjYHpmENNgIg++I5Vt00ekI8AVu+8COu8+1+Bn4lXHjMUQvApJKUeeKSu46i58wnEn
 NWaQ==
X-Gm-Message-State: AJIora/TrsVHZp5/j/+UaaTFxmlpwGfWBymNrDtd8ef4JzIEhGDDgwG5
 1/CZAOtqLMUvNe6yPIXQkaE=
X-Google-Smtp-Source: AGRyM1uVKiSNZ63xvM1SkZGg8MDD3NqDak8QVg5CmjgLLJR/63rBoop6xkxZjGyO50qafCZExu5qgw==
X-Received: by 2002:a05:6000:a0c:b0:21d:a699:d54e with SMTP id
 co12-20020a0560000a0c00b0021da699d54emr5172920wrb.605.1657548214450; 
 Mon, 11 Jul 2022 07:03:34 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de
 (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de.
 [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a5d4d4d000000b0021b91d1ddbfsm5816067wru.21.2022.07.11.07.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 07:03:34 -0700 (PDT)
Message-ID: <8417d206124ba823a907bd27f4f6ce53a9080249.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>
Date: Mon, 11 Jul 2022 16:04:35 +0200
In-Reply-To: <CAHp75VeMXP1WyQcFQU_RW-a_CSGVMF_NsgHtLEbL8hi-n8gSVw@mail.gmail.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
 <CAHp75VeMXP1WyQcFQU_RW-a_CSGVMF_NsgHtLEbL8hi-n8gSVw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 00/15] make iio inkern interface
	firmware agnostic
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

T24gTW9uLCAyMDIyLTA3LTExIGF0IDE1OjIyICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gTW9uLCBKdWwgMTEsIDIwMjIgYXQgMjozOCBQTSBOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKPiA+IAo+ID4gRmlyc3QgdmVyc2lvbiBvZiB0aGUgc2VyaWVzIGNhbiBi
ZSBmb3VuZCBoZXJlOgo+ID4gCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1paW8v
MjAyMjA2MTAwODQ1NDUuNTQ3NzAwLTEtbnVuby5zYUBhbmFsb2cuY29tLwo+IAo+IEknbSB1bmRl
ciB0aGUgaW1wcmVzc2lvbiB0aGF0IEkgZ2F2ZSB0YWdzIGZvciBzb21lIG9mIHRoZXNlIHBhdGNo
ZXMKPiB3aGVuIHRoZXkgd2VyZSB0aGUgcGFydCBvZiB0aGUgYmlnZ2VyIHNlcmllcy4gQW0gSSB3
cm9uZz8KPiBJbiBhbnkgY2FzZSBmb3IgcGF0Y2ggNi0xNCwKPiBSZXZpZXdlZC1ieTogQW5keSBT
aGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgoKWWVzLCB5b3UncmUgcmlnaHQu
IFNob3VsZCBJIGhhdmUgZHJvcHBlZCB0aGVtPwoKLSBOdW5vIFPDoQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
