Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01054804F
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 09:22:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57E9FC6047C;
	Mon, 13 Jun 2022 07:22:30 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 491B0C6046A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 07:22:28 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id j2so3794752qvp.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 00:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=t8GkcF/AscIjmYX1Ft+2LOWOMCGcc3ou443uyI/gHgM=;
 b=lgYBehJwnc7p76Sp7QYODbs+eJsn9x/aAZca0AhE5KDXVc2emmsRxjtpfkhG0ym3jF
 +YmyjmCo8KwGowRdjt9uIvuUoTlmDmEhKvtAV4CSG4hTEjA91HAM5qlNsrTQS1SRX91R
 LFvp/Mktzkcb1CVjqHCgBxNr9WvYpOAxf+96MGlGzCOnNiSwu1/E0KM1WiGropKJpSPJ
 I1FGxJQBE5G5ow1BWz+8k8tlsSYxFVWF+sox/Wak2AzR/lG0tAdRt9KAZDThpdGND1Zh
 2o8Dtj8SUUB+OwaZDXw05iMGYlfFzStAu7j7cL8cCzdwPXdi8qQXd8eBti7wRpJI/O1K
 B+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=t8GkcF/AscIjmYX1Ft+2LOWOMCGcc3ou443uyI/gHgM=;
 b=kbK9B+F4AO+sykjNq82DOmPpN8Pws1vN2dcvZQuKc1RsPhJiPkApVDx6ObDzVtfGJN
 MbUiX1sm43bbesoCKMe9FZC94bjzCs5NnQ9+HJnEElyuCH4krXZto/TeJ1IEkO536uO2
 p/c/etecCuQe1pw/+2LJWtK46zPqiAiZ54w06ltvhyoCPw29kAoRn3PSyJe9FJhRJ3tt
 NgVxZFTl0WV1FaKx+qtLhE3xCLJO76lbBxVG7APOetoIqgOcopXEMdWeef6Uzo9+Jii1
 l6HBFPaDUnlhtiIiM6ZixE6Bjx93ZNqpXt5AO2LmYVpTnFL/TZNjff3x67nim/+5rwq+
 hCaQ==
X-Gm-Message-State: AOAM531WsjSw4f32WLawOuTOTNgBZUU5BsopqQ3+UBYi/BrC7lc+dmLm
 wMJiJgNayRxm/DEAVmJ+N/I=
X-Google-Smtp-Source: ABdhPJzJwQGuL0izMZeZrCmNmnxm8u/ohN3iHcmN+Ftx1/l43JyjW+szv6Fscr1wrYk++4pmje2xJg==
X-Received: by 2002:ad4:5b81:0:b0:465:ded8:780 with SMTP id
 1-20020ad45b81000000b00465ded80780mr45550533qvp.119.1655104947222; 
 Mon, 13 Jun 2022 00:22:27 -0700 (PDT)
Received: from p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de
 (p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de.
 [2003:f6:ef06:2c00:90c0:3b55:1078:f99d])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05622a004600b002f9399ccefasm4637163qtw.34.2022.06.13.00.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 00:22:26 -0700 (PDT)
Message-ID: <d1d465f2e828642f30bc8a2bdd49e89fdfed7caf.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jun 2022 09:23:16 +0200
In-Reply-To: <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-35-nuno.sa@analog.com> <YqNo6U8r80aNFzUr@spruce>
 <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
 <CAMuHMdXtLQOo2fiTHA-CBgWZE0hbPVUzv77sKrf_Qz8oHp7bkA@mail.gmail.com>
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
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

T24gU3VuLCAyMDIyLTA2LTEyIGF0IDE5OjM5ICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6Cj4gSGkgTnVubywKPiAKPiBPbiBGcmksIEp1biAxMCwgMjAyMiBhdCA5OjUyIFBNIE51bm8g
U8OhIDxub25hbWUubnVub0BnbWFpbC5jb20+Cj4gd3JvdGU6Cj4gPiBPbiBGcmksIDIwMjItMDYt
MTAgYXQgMTE6NTMgLTA0MDAsIEpvZSBTaW1tb25zLVRhbGJvdHQgd3JvdGU6Cj4gPiA+IE9uIEZy
aSwgSnVuIDEwLCAyMDIyIGF0IDEwOjQ1OjQ1QU0gKzAyMDAsIE51bm8gU8OhIHdyb3RlOgo+ID4g
PiA+IEp1c3QgY29zbWV0aWNzLiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4uLgo+ID4g
PiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+
Cj4gCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9paW8vaW5rZXJuLmMKPiA+ID4gPiArKysgYi9kcml2
ZXJzL2lpby9pbmtlcm4uYwo+ID4gPiA+IEBAIC00NSwxMyArNDUsMTMgQEAgaW50IGlpb19tYXBf
YXJyYXlfcmVnaXN0ZXIoc3RydWN0IGlpb19kZXYKPiA+ID4gPiAqaW5kaW9fZGV2LCBzdHJ1Y3Qg
aWlvX21hcCAqbWFwcykKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCBpbnQgaSA9IDAsIHJldCA9IDA7
Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IGlpb19tYXBfaW50ZXJuYWwgKm1hcGk7Cj4g
PiA+ID4gCj4gPiA+ID4gLcKgwqDCoMKgwqDCoCBpZiAobWFwcyA9PSBOVUxMKQo+ID4gPiA+ICvC
oMKgwqDCoMKgwqAgaWYgKCFtYXBzKQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gMDsKPiA+ID4gPiAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCBtdXRleF9sb2Nr
KCZpaW9fbWFwX2xpc3RfbG9jayk7Cj4gPiA+ID4gLcKgwqDCoMKgwqDCoCB3aGlsZSAobWFwc1tp
XS5jb25zdW1lcl9kZXZfbmFtZSAhPSBOVUxMKSB7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoCB3aGls
ZSAoIW1hcHNbaV0uY29uc3VtZXJfZGV2X25hbWUpIHsKPiA+ID4gCj4gPiA+IFNob3VsZG4ndCB0
aGlzIGJlPzoKPiA+ID4gd2hpbGUgKG1hcHNbaV0uY29uc3VtZXJfZGV2X25hbWUpIHsKPiA+IAo+
ID4gVXBzLi4uIE5pY2UgY2F0Y2ghIEkgd2FzIHByb2JhYmx5IGluIGJvdCBtb2RlIGFscmVhZHku
Cj4gCj4gV2hlbiBtYWtpbmcgYSBjaGFuZ2Ugd2l0aCBubyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRl
bmRlZCwgaXQgaXMgYWx3YXlzCj4gYSBnb29kIGlkZWEgdG8gY29tcGFyZSB0aGUgZ2VuZXJhdGVk
IGFzc2VtYmxlciBiZWZvcmUvYWZ0ZXIuwqAgSS5lLgo+IAo+IMKgwqDCoCBtYWtlIGRyaXZlcnMv
aWlvL2lua2Vybi5zCj4gwqDCoMKgIG12IGRyaXZlcnMvaWlvL2lua2Vybi5zIGRyaXZlcnMvaWlv
L2lua2Vybi5zLm9yaWcKPiDCoMKgwqAgW21ha2UgeW91ciBjaGFuZ2VdCj4gwqDCoMKgIG1ha2Ug
ZHJpdmVycy9paW8vaW5rZXJuLnMKPiDCoMKgwqAgZGlmZiAtdSBkcml2ZXJzL2lpby9pbmtlcm4u
c3sub3JpZyx9Cj4gCgpBaCB0aHguLi4gVGhhdCdzIGluZGVlZCBhIGdvb2QgaWRlYSEKCi0gTnVu
byBTw6EKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
