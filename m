Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5562547B36
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jun 2022 19:39:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E68BC5F1FA;
	Sun, 12 Jun 2022 17:39:52 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13DCBC03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jun 2022 17:39:51 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id l3so1265488qtp.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jun 2022 10:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xNhFuNm1nmnzKrxqQuO4XyzP0cAuS/p9Ps9ar4/pkNA=;
 b=iv1jOdhd0XUBvYCjgg3DdEdUgNS7qZxxzoua3czhMfg6BfNZkIO0IHInjuqbOXkA3/
 xOj4M87k2HUOTGp+OeEFagz+vpi+LtrRjNTCYBxRbFvyE996Z8SYFQz8vRT1BppJxQM+
 qkRM4AanQ3KLgKCxWtIllJ/9NSHR99fRWCJXok+yCIxZj4T3FI9hO6oZhOumMDZMbzUL
 bClI0twCqwjzHGUC0fz/xSBFoo0q00ObjcxiN4nTzfjiBlzc5QL0MQnN4WEvmo63m1NK
 hw9AQ0zJuhZ89IRGyhfGrRkJtAWG6QXtYF4+xFpB2c4TiUTTkqhedue5kJ0NdVBJLpDc
 YR1Q==
X-Gm-Message-State: AOAM533gBDrlFdRbaSntC5Qe/Qfmvey/wISoclRLsljsip9hRaIr57bT
 0Q3l1Jc0RRVjC9s2zX5dsD5iST9gg7c=
X-Google-Smtp-Source: ABdhPJzwHWx2UnqaiJ867mRikjxRPMJTZTry6VC8ilbuiwXm9u01BxGWDMjrOmYxgcCTD3fexvd5cw==
X-Received: by 2002:ac8:5b51:0:b0:304:f6e3:8b36 with SMTP id
 n17-20020ac85b51000000b00304f6e38b36mr25419512qtw.522.1655055589874; 
 Sun, 12 Jun 2022 10:39:49 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 de27-20020a05620a371b00b006a758ce2ae1sm4539476qkb.104.2022.06.12.10.39.48
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jun 2022 10:39:49 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-3137c877092so31262577b3.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jun 2022 10:39:48 -0700 (PDT)
X-Received: by 2002:a81:4811:0:b0:30c:8021:4690 with SMTP id
 v17-20020a814811000000b0030c80214690mr60597100ywa.47.1655055588159; Sun, 12
 Jun 2022 10:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-35-nuno.sa@analog.com>
 <YqNo6U8r80aNFzUr@spruce>
 <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
In-Reply-To: <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 Jun 2022 19:39:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
Message-ID: <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Tali Perry <tali.perry1@gmail.com>, Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Joe Simmons-Talbott <joetalbott@gmail.com>, Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 34/34] iio: inkern: fix coding style
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

SGkgTnVubywKCk9uIEZyaSwgSnVuIDEwLCAyMDIyIGF0IDk6NTIgUE0gTnVubyBTw6EgPG5vbmFt
ZS5udW5vQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCAyMDIyLTA2LTEwIGF0IDExOjUzIC0w
NDAwLCBKb2UgU2ltbW9ucy1UYWxib3R0IHdyb3RlOgo+ID4gT24gRnJpLCBKdW4gMTAsIDIwMjIg
YXQgMTA6NDU6NDVBTSArMDIwMCwgTnVubyBTw6Egd3JvdGU6Cj4gPiA+IEp1c3QgY29zbWV0aWNz
LiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4uLgo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgoKPiA+ID4gLS0tIGEvZHJpdmVycy9p
aW8vaW5rZXJuLmMKPiA+ID4gKysrIGIvZHJpdmVycy9paW8vaW5rZXJuLmMKPiA+ID4gQEAgLTQ1
LDEzICs0NSwxMyBAQCBpbnQgaWlvX21hcF9hcnJheV9yZWdpc3RlcihzdHJ1Y3QgaWlvX2Rldgo+
ID4gPiAqaW5kaW9fZGV2LCBzdHJ1Y3QgaWlvX21hcCAqbWFwcykKPiA+ID4gICAgICAgICBpbnQg
aSA9IDAsIHJldCA9IDA7Cj4gPiA+ICAgICAgICAgc3RydWN0IGlpb19tYXBfaW50ZXJuYWwgKm1h
cGk7Cj4gPiA+Cj4gPiA+IC0gICAgICAgaWYgKG1hcHMgPT0gTlVMTCkKPiA+ID4gKyAgICAgICBp
ZiAoIW1hcHMpCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ID4KPiA+ID4gICAg
ICAgICBtdXRleF9sb2NrKCZpaW9fbWFwX2xpc3RfbG9jayk7Cj4gPiA+IC0gICAgICAgd2hpbGUg
KG1hcHNbaV0uY29uc3VtZXJfZGV2X25hbWUgIT0gTlVMTCkgewo+ID4gPiArICAgICAgIHdoaWxl
ICghbWFwc1tpXS5jb25zdW1lcl9kZXZfbmFtZSkgewo+ID4KPiA+IFNob3VsZG4ndCB0aGlzIGJl
PzoKPiA+IHdoaWxlIChtYXBzW2ldLmNvbnN1bWVyX2Rldl9uYW1lKSB7Cj4KPiBVcHMuLi4gTmlj
ZSBjYXRjaCEgSSB3YXMgcHJvYmFibHkgaW4gYm90IG1vZGUgYWxyZWFkeS4KCldoZW4gbWFraW5n
IGEgY2hhbmdlIHdpdGggbm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQsIGl0IGlzIGFsd2F5
cwphIGdvb2QgaWRlYSB0byBjb21wYXJlIHRoZSBnZW5lcmF0ZWQgYXNzZW1ibGVyIGJlZm9yZS9h
ZnRlci4gIEkuZS4KCiAgICBtYWtlIGRyaXZlcnMvaWlvL2lua2Vybi5zCiAgICBtdiBkcml2ZXJz
L2lpby9pbmtlcm4ucyBkcml2ZXJzL2lpby9pbmtlcm4ucy5vcmlnCiAgICBbbWFrZSB5b3VyIGNo
YW5nZV0KICAgIG1ha2UgZHJpdmVycy9paW8vaW5rZXJuLnMKICAgIGRpZmYgLXUgZHJpdmVycy9p
aW8vaW5rZXJuLnN7Lm9yaWcsfQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
