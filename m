Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B58547F63
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 08:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C29BC60490;
	Mon, 13 Jun 2022 06:10:56 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6996C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 19:49:25 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id c21so4697665wrb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=u9muj2CCpJ3bi2OBicnt3vUuhr/462OKXXDNMSoOjkA=;
 b=nJO3QDlMK8Oo8cC2rEDrsS8zHoFWKSvz9V9tp5Slqj6XFK8gGsnauvl4/5a9Zlujsw
 CorVf5dfKaQH6teMfzW+hEHcOqhkKmK+dqKhgaSLIk2OjK2OrHpiPiYlnLwU4fkOG5Z5
 4PmGHwSchAW9lf+n6mIfhoGZyeWAKEIX9r6hS5AcDvGRjX5QHRl7KdZO9iqyazhYBNgz
 7pfLKuBvFnE/1MuQV2//JtuGP6S3TUo035W5eNVrysQCBRxAgc/0GKH+7gd2XMdw+zE2
 BOR2sXaNMk/Pkqsivac6peQf8L0kcC+Xa3RD9v9FKZpipTo6kRu9/aVYFutE3X708T/B
 a27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=u9muj2CCpJ3bi2OBicnt3vUuhr/462OKXXDNMSoOjkA=;
 b=AyGFb5cVDIa7GjS4HSwYwNXeHxkuPpwJYs5FzDvJYkGJjHr4VwTKySVCvdU+fU5bDl
 iqKzJGVj+QEOzQCOxDC8VUbiOWNTa50bOQ41SRGNnmffdz5iYqzNTf8IgzqUEQQ0QGRg
 PNQFYuA985s11chiCf9AsMKPjFBEKWuWYDorLK9MV9tfg2TBTv7VbKwCjAZyuvupZ9SH
 7jKqfMttAstJkRRmpM7dLkzVmb9pEKgC9xZmHPyV+jvv9QrWY0eTZbobC0unA/IuJ/J+
 sgRAfYN/qnbAcCj7DC+IXI5rMijBLk3MsgbDYhjnZT3eVbC2TFxn8p/shVLvQG9zqJFL
 Splg==
X-Gm-Message-State: AOAM532UV963jhcskT8aFJAy2wq5Iyr3Dm84lLblv/wgKDyZMXURdXmN
 y3m0/DSZgD0oTGw7BhKfN5o=
X-Google-Smtp-Source: ABdhPJw1wyN/M1WFaQFuP+jX/NGTq2GqnLXXrOE71+r/B9uelliduc7dUH3CHihgz35kd6pD213QmQ==
X-Received: by 2002:adf:d1c6:0:b0:218:51ae:8812 with SMTP id
 b6-20020adfd1c6000000b0021851ae8812mr21038542wrd.178.1654890565371; 
 Fri, 10 Jun 2022 12:49:25 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861?
 ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a05600c4ecf00b0039c4945c753sm4278743wmq.39.2022.06.10.12.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 12:49:25 -0700 (PDT)
Message-ID: <a67d3d01824db6376c2f15949021db4f2b6173cb.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>
Date: Fri, 10 Jun 2022 21:49:22 +0200
In-Reply-To: <CAHp75VcU-oV4is_y9=oaOx2ugvTEOy53h2wvbd3-Z9_gv5Y=zA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-7-nuno.sa@analog.com>
 <CAHp75VcU-oV4is_y9=oaOx2ugvTEOy53h2wvbd3-Z9_gv5Y=zA@mail.gmail.com>
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

T24gRnJpLCAyMDIyLTA2LTEwIGF0IDE2OjQ1ICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDYgQU0gTnVubyBTw6EgPG51bm8uc2FAYW5h
bG9nLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IERvIG5vdCB0cnVzdCB0aGUgZmFjdCB0aGF0IGlpby5o
IGluY2x1ZGVzIG9mLmggd2hpY2ggaW4gdHVybgo+ID4gaW5jbHVkZXMKPiA+IGFsbCB0aGUgaGVh
ZGVycyB3ZSBhcmUgcmVseWluZyBvbi4KPiA+IAo+ID4gVGhlIHVsdGltYXRlIGdvYWwgaXMgdG8g
YWN0dWFsbHkgZHJvcCBvZi5oIGZyb20gaWlvLmguCj4gCj4gLi4uCj4gCj4gPiDCoCNpbmNsdWRl
IDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+
Cj4gPiDCoCNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICsjaW5jbHVkZSA8
bGludXgvcHJvcGVydHkuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4KPiAKPiBPcmRlcmlu
ZyAoZnJvbSB0aGUgY29udGV4dCBJIGRvbid0IHNlZSBpdCdzIG1lc3NlZCB1cCBhbHJlYWR5KQo+
IAoKV2lsbCBkb3VibGUgY2hlY2sgb24gdjIuLi4KCi0gTnVubyBTw6EKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
