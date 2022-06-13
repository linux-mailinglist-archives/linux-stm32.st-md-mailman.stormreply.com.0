Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB14548007
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 09:06:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ED10C5F1F9;
	Mon, 13 Jun 2022 07:06:04 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CE09C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 07:06:02 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id l3so1978205qtp.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 00:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=yv1ygT3I3cNrjiki9LWaI9usnmiwYkji5v0xZWzW+js=;
 b=BeUQU7At5w8QXnQumv31sTGFNuryglGKvde6SoIxLoHOJ5t/WGMn1AXz3Eknm6h5AI
 kNL4PEd0uMir3gUr1z6XGSGK1rVD3INLVDD+LZJQYc8d9+62lYvyaguTm78kNak/rSak
 T3okK5/4ndABoNywbeazmrsJmzecZtZstWGrOW2kSrrZPWoL+4bF34YazBYZMgWZX4Tb
 Bt9W4HzigonIOzfvWB+W869hPSh+dfOJ4Kquh0y9Dsp8gm71SNYKkMAx9kDUk/JCp9Zv
 0D3K88QtgS+P4vXBJD6FFG3yQbdUH3SbzIbxx14i72EO5NKMHtU9uCEpi/JGyYCXjqA1
 +OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=yv1ygT3I3cNrjiki9LWaI9usnmiwYkji5v0xZWzW+js=;
 b=IUe4k43j0SAJrpvJ+is0pDDorD2aBMESIptvck2VC2AWn0I47r218aQTG3SCLwkg9a
 DcL2tMyR1ip/hVRBgtPGdpnGpKxTvQMHANjMpAqxV5+2ORB3K8WTioK1JzKoKDRVCWzT
 pkMfZsZZF4yqFVwwvR427x1lLRgJxY2CCzA75qQt37ZSUJ/d13MbbNV3wraLtQzloQd1
 BFnOg90BzGq987oEYXy2DyGjJBsZSZS89NmgEgoNLFdpz4zgE1dJp6yOJ+af1r3hy7VA
 vYwU6dpUnUhB/YOKtz4nN9Wi6Ce39+z3JCqlVBJTONTBpVhm+8aCwtdwZnuDs8VH7wZ8
 UKCQ==
X-Gm-Message-State: AOAM5314TEKRYNHW5IgvjVC+qsNMZiACaLwcEajy4R2n18cqQsHuDG9M
 gPJxKCbohSHJikhr6w3PPJc=
X-Google-Smtp-Source: ABdhPJx1ATSZFfuRWjaAT70y9WnEKuNuBqF1XmR5jBeGYYoq9SJ4nRAMyKQM1AWqPTp0l7HO6v7YKg==
X-Received: by 2002:a05:622a:311:b0:2f3:ddb0:4ae6 with SMTP id
 q17-20020a05622a031100b002f3ddb04ae6mr46319206qtw.140.1655103961023; 
 Mon, 13 Jun 2022 00:06:01 -0700 (PDT)
Received: from p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de
 (p200300f6ef062c0090c03b551078f99d.dip0.t-ipconnect.de.
 [2003:f6:ef06:2c00:90c0:3b55:1078:f99d])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a05620a240300b006a6a1e4aec2sm6086602qkn.49.2022.06.13.00.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 00:06:00 -0700 (PDT)
Message-ID: <35e7c36c9ecbdc67698b413cf867cf19442ccfa9.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>
Date: Mon, 13 Jun 2022 09:06:49 +0200
In-Reply-To: <20220611161701.46a68837@jic23-huawei>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-23-nuno.sa@analog.com>
 <20220611161701.46a68837@jic23-huawei>
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
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
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 22/34] iio: inkern: only return error
 codes in iio_channel_get_*() APIs
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

T24gU2F0LCAyMDIyLTA2LTExIGF0IDE2OjE3ICswMTAwLCBKb25hdGhhbiBDYW1lcm9uIHdyb3Rl
Ogo+IE9uIEZyaSwgMTAgSnVuIDIwMjIgMTA6NDU6MzMgKzAyMDAKPiBOdW5vIFPDoSA8bnVuby5z
YUBhbmFsb2cuY29tPiB3cm90ZToKPiAKPiA+IEFQSXMgbGlrZSBvZl9paW9fY2hhbm5lbF9nZXRf
YnlfbmFtZSgpIGFuZCBvZl9paW9fY2hhbm5lbF9nZXRfYWxsKCkKPiA+IHdlcmUKPiA+IHJldHVy
bmluZyBhIG1peCBvZiBOVUxMIGFuZCBlcnJvciBwb2ludGVycyBiZWluZyBOVUxMIHRoZSB3YXkg
dG8KPiAKPiBwb2ludGVycyB3aXRoIE5VTEwgYmVpbmcgdGhlIHdheSB0by4uLgo+IAo+ID4gIm5v
dGlmeSIgdGhhdCB3ZSBzaG91bGQgZG8gYSAic3lzdGVtIiBsb29rdXAgZm9yIGNoYW5uZWxzLiBU
aGlzCj4gPiBtYWtlCj4gPiBpdCB2ZXJ5IGNvbmZ1c2luZyBhbmQgcHJvbmUgdG8gZXJyb3JzIGFz
IGNvbW1pdCBkYmJjY2Y3YzIwYmYKPiA+ICgiaWlvOiBpbmtlcm46IGZpeCByZXR1cm4gdmFsdWUg
aW4KPiA+IGRldm1fb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKSIpCj4gPiBwcm92ZXMuIE9u
IHRvcCBvZiB0aGlzLCBwYXR0ZXJucyBsaWtlICdpZiAoY2hhbm5lbCAhPSBOVUxMKSByZXR1cm4K
PiA+IGNoYW5uZWwnCj4gPiB3ZXJlIGJlaW5nIHVzZWQgd2hlcmUgY2hhbm5lbCBjb3VsZCBhY3R1
YWxseSBiZSBhbiBlcnJvciBjb2RlIHdoaWNoCj4gPiBtYWtlcyB0aGUgY29kZSBoYXJkIHRvIHJl
YWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+
Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9paW8vaW5rZXJuLmMgfCAyNCArKysrKysrKysrKy0tLS0t
LS0tLS0tLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vaW5rZXJuLmMgYi9kcml2
ZXJzL2lpby9pbmtlcm4uYwo+ID4gaW5kZXggODdmZDJhMGQ0NGYyLi4zMWQ5YzEyMjE5OWEgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lpby9pbmtlcm4uYwo+ID4gKysrIGIvZHJpdmVycy9paW8v
aW5rZXJuLmMKPiA+IEBAIC0yMTQsNyArMjE0LDcgQEAgc3RhdGljIHN0cnVjdCBpaW9fY2hhbm5l
bAo+ID4gKm9mX2lpb19jaGFubmVsX2dldChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBpbnQgaW5k
ZXgpCj4gPiDCoHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUo
c3RydWN0IGRldmljZV9ub2RlCj4gPiAqbnAsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb25zdCBjaGFyICpuYW1lKQo+ID4gwqB7Cj4gPiAtwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgaWlvX2NoYW5uZWwgKmNoYW4gPSBOVUxMOwo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0
IGlpb19jaGFubmVsICpjaGFuOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqAvKiBXYWxrIHVw
IHRoZSB0cmVlIG9mIGRldmljZXMgbG9va2luZyBmb3IgYSBtYXRjaGluZyBpaW8KPiA+IGNoYW5u
ZWwgKi8KPiA+IMKgwqDCoMKgwqDCoMKgwqB3aGlsZSAobnApIHsKPiA+IEBAIC0yMzEsMTEgKzIz
MSwxMSBAQCBzdHJ1Y3QgaWlvX2NoYW5uZWwKPiA+ICpvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFt
ZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuYW1lKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgY2hhbiA9IG9mX2lpb19jaGFubmVsX2dldChucCwgaW5kZXgpOwo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIUlTX0VSUihjaGFuKSB8fCBQVFJf
RVJSKGNoYW4pID09IC0KPiA+IEVQUk9CRV9ERUZFUikKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gCj4gVGhpcyBvcmlnaW5hbCBiZWhh
dmlvdXIgaXMgJ2ludGVyZXN0aW5nJy4gSWYgd2UgZ2V0IGEgZXJyb3IgbGlrZSAtCj4gRU5PTUVN
Cj4gd2Ugc2hvdWxkIHJldHVybiBpdCByYXRoZXIgdGhhbiBjYXJyeSBvbi7CoCBEbyB3ZSBoYXZl
IGVub3VnaAo+IGtub3dsZWRnZQo+IG9mIHBvc3NpYmxlIGVycm9ycyBoZXJlIHRvIGJlIG1vcmUg
ZXhwbGljaXQgb24gd2hlbiB3ZSBrZWVwIGxvb2tpbmcKPiB1cAo+IHRoZSB0cmVlP8KgIEkgdGhp
bmsgd2UgY2FuIGdldCAtRU5PRU5UIGZyb20KPiBvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygp
Cj4gCj4gVGhhdCByYWlzZXMgYW4gaW50ZXJlc3RpbmcgcXVlc3Rpb24gb24gd2hldGhlciAtRU5P
REVWIGlzIHRoZSByaWdodAo+IHJlc3BvbnNlCj4gZm9yIHRoZSBwcmV2aW91c2x5IE5VTEwgY2Fz
ZSBvciBpcyAtRU5PRU5UIG1vcmUgY29uc2lzdGVudCB3aXRoIG90aGVyCj4gb2ZfIGZ1bmN0aW9u
cz/CoCBObyBkZXZpY2UgY291bGQgYmUgdGhvdWdodCBvZiBhcyBiZWluZyB0aGUgY2FzZSB0aGF0
Cj4gbmVlZHMKPiB0byBkZWZlciAoaW4gaG9wZSBpdCB0dXJucyB1cCBsYXRlcikgd2hlcmVhcyBu
byBlbnRyeSBtZWFucyBpdCB3aWxsCj4gbmV2ZXIKPiBzdWNjZWVkLgoKRnJvbSB3aGF0IEkgY291
bGQgc2VlLCBvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygpIGVpdGhlciByZXR1cm5zwqAKLUVJ
TlZBTCBvciAtRU5PRU5ULiBXZSBhbHNvIGhhdmUgdGhlIGludGVybmFsIG9mX2lpb19jaGFubmVs
X2dldCgpCndoaWNoIGNhbiByZXR1cm4gLUVOT01FTS4gU28gSSBndWVzcyB3ZSBzaG91bGQgb25s
eSBjb250aW51ZSBsb29raW5nIGlmCndlIGdldCAtRU5PRU5UPwoKVG8gYmUgY2xlYXIsIGRvIHlv
dSBzdGlsbCBwcmVmZXIgdG8gZXhwbGljaXRseSByZXR1cm4gLUVOT0RFViBpbiB0aGUKcHJldmlv
dXMgTlVMTCBjYXNlcyBvciBzaG91bGQgd2UgaG9ub3IgdGhlIHJldHVybiBjb2RlIGZyb20gCm9m
X3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKCkgYW5kIGp1c3QgcmV0dXJuIGNoYW5zIChhbmQgdGh1
cyBFTk9FTlQpPwoKLSBOdW5vIFPDoQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
