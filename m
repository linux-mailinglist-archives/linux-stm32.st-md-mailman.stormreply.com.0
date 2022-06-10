Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92084546909
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 17:07:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50725C5F1D7;
	Fri, 10 Jun 2022 15:07:41 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16C5DC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 15:07:40 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id c2so35653558edf.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kUO2ibunC7H0XDsaHRR1RaXa5+TAT1P54T7nymM8aoY=;
 b=Km/6uG4N0I1v3nCHQDOVYyGXyKL6LrNTIbysl2MklDB9UNEDZqbo8NqSGO5sAbe1x3
 1cNbRBqVAX7iALT4cPuZPV2Gy0svte0/yscfFN+g1Ogb2RIQjl6DgOizWWO5fd4eNFOS
 cFHB/CShwbXerNRbAbMaZARMBkStUWNdpK4AI4NeBMKj0sDM63KFgdNX9P/+Dhd1uRNk
 FLcTygnXnEYbzwm+r9bTo4ZY2iUckj/9fDrW+Io2qRDuYMft54iHj9QNjGfcRYMVRQ12
 wfKGJOKpPYgf+b/ciNPTOWTHRSnMg76WfJK7EXdcaCmTVdopl5R4fFUp7H4JdCySKPj5
 iqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kUO2ibunC7H0XDsaHRR1RaXa5+TAT1P54T7nymM8aoY=;
 b=bk3ZjWfuvRFbz6zZUEqrNbjZn0UbStB0I6kKCEaK8jXez5zV5oXkUCjjJ9+VfL5b42
 mS498QPFrNk4P0un/bvBoE0kj9ZyzDj4iOQ9uakxEVycAT7Kq27wKGhwhCyNf3KDkr/g
 OzrVTFq2zZc/KNzKJ1uXaW/gH3OPr55E0JzX2BbVBb/Dy4c9XFDrfrM5vpNWwFvb+dMC
 p/RTbT4xKDlAJBjQTh2K6xratyOaRqPA82IlRE3vCli9ppIlwv/UOuY1Nlv5Tu6B+XIG
 xwXu1YtFdtGnBcNOcGLz0oI8wEyUmxOh51kABaIMpGeGORoAL16kyYADAtA4dpShyCPC
 cA6Q==
X-Gm-Message-State: AOAM531e0QyOSGKqM4TfqeyZvRJiZJ5cDYR7n1heiRVhipI0BZFn92nP
 pGARo08JpUdLIGHKbIYuRvdsKf+fD2FMSRIvNkM=
X-Google-Smtp-Source: ABdhPJxWp2gvN4Nfk2r+vYkXDxxpanl8SYkus08bByYas8UdfPjxgCPUYO0Y8DTxN4CocSeDaFKMLBbwWkQqK48L8Co=
X-Received: by 2002:aa7:d481:0:b0:42d:d5fd:f963 with SMTP id
 b1-20020aa7d481000000b0042dd5fdf963mr51786214edr.209.1654873659584; Fri, 10
 Jun 2022 08:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-24-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-24-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 17:07:03 +0200
Message-ID: <CAHp75VcxZrMM7nHyOYdNMkepbP51Wf4z5botU9ma8+gmn_Lz-w@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 23/34] iio: inkern: split
	of_iio_channel_get_by_name()
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
LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGNoYW5nZSBzcGxpdHMgb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5
X25hbWUoKSBzbyB0aGF0IGl0IGRlY291cGxlcwo+IGxvb2tpbmcgZm9yIGNoYW5uZWxzIGluIHRo
ZSBjdXJyZW50IG5vZGUgZnJvbSBsb29raW5nIGluIGl0J3MgcGFyZW50cwo+IG5vZGVzLiBUaGlz
IHdpbGwgYmUgaGVscGZ1bCB3aGVuIG1vdmluZyB0byBmd25vZGUgcHJvcGVydGllcyB3aGVyZSB3
ZQo+IG5lZWQgdG8gcmVsZWFzZSB0aGUgaGFuZGxlcyB3aGVuIGxvb2tpbmcgZm9yIGNoYW5uZWxz
IGluIHBhcmVudCdzIG5vZGVzLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuLi4K
ClJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+
Cgo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvaWlvL2lua2Vybi5jIHwgNjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDI1IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2lua2Vybi5jIGIvZHJpdmVy
cy9paW8vaW5rZXJuLmMKPiBpbmRleCAzMWQ5YzEyMjE5OWEuLmRkZTQ3MzI0YjgyNiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2lpby9pbmtlcm4uYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2lua2Vybi5j
Cj4gQEAgLTIxMSw0NCArMjExLDYzIEBAIHN0YXRpYyBzdHJ1Y3QgaWlvX2NoYW5uZWwgKm9mX2lp
b19jaGFubmVsX2dldChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBpbnQgaW5kZXgpCj4gICAgICAg
ICByZXR1cm4gRVJSX1BUUihlcnIpOwo+ICB9Cj4KPiArc3RydWN0IGlpb19jaGFubmVsICpfX29m
X2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5h
bWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJv
b2wgKnBhcmVudF9sb29rdXApCj4gK3sKPiArICAgICAgIHN0cnVjdCBpaW9fY2hhbm5lbCAqY2hh
bjsKPiArICAgICAgIGludCBpbmRleCA9IDA7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IEZvciBuYW1lZCBpaW8gY2hhbm5lbHMsIGZpcnN0IGxvb2sgdXAgdGhlIG5hbWUgaW4gdGhlCj4g
KyAgICAgICAgKiAiaW8tY2hhbm5lbC1uYW1lcyIgcHJvcGVydHkuICBJZiBpdCBjYW5ub3QgYmUg
Zm91bmQsIHRoZQo+ICsgICAgICAgICogaW5kZXggd2lsbCBiZSBhbiBlcnJvciBjb2RlLCBhbmQg
b2ZfaWlvX2NoYW5uZWxfZ2V0KCkKPiArICAgICAgICAqIHdpbGwgZmFpbC4KPiArICAgICAgICAq
Lwo+ICsgICAgICAgaWYgKG5hbWUpCj4gKyAgICAgICAgICAgICAgIGluZGV4ID0gb2ZfcHJvcGVy
dHlfbWF0Y2hfc3RyaW5nKG5wLCAiaW8tY2hhbm5lbC1uYW1lcyIsIG5hbWUpOwo+ICsKPiArICAg
ICAgIGNoYW4gPSBvZl9paW9fY2hhbm5lbF9nZXQobnAsIGluZGV4KTsKPiArICAgICAgIGlmICgh
SVNfRVJSKGNoYW4pIHx8IFBUUl9FUlIoY2hhbikgPT0gLUVQUk9CRV9ERUZFUikgewo+ICsgICAg
ICAgICAgICAgICAqcGFyZW50X2xvb2t1cCA9IGZhbHNlOwo+ICsgICAgICAgfSBlbHNlIGlmIChu
YW1lICYmIGluZGV4ID49IDApIHsKPiArICAgICAgICAgICAgICAgcHJfZXJyKCJFUlJPUjogY291
bGQgbm90IGdldCBJSU8gY2hhbm5lbCAlcE9GOiVzKCVpKVxuIiwKPiArICAgICAgICAgICAgICAg
ICAgICAgIG5wLCBuYW1lID8gbmFtZSA6ICIiLCBpbmRleCk7Cj4gKyAgICAgICAgICAgICAgICpw
YXJlbnRfbG9va3VwID0gZmFsc2U7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIGNo
YW47Cj4gK30KPiArCj4gIHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5
X25hbWUoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCj4gIHsKPiAgICAgICAgIHN0
cnVjdCBpaW9fY2hhbm5lbCAqY2hhbjsKPiArICAgICAgIGJvb2wgcGFyZW50X2xvb2t1cCA9IHRy
dWU7Cj4KPiAgICAgICAgIC8qIFdhbGsgdXAgdGhlIHRyZWUgb2YgZGV2aWNlcyBsb29raW5nIGZv
ciBhIG1hdGNoaW5nIGlpbyBjaGFubmVsICovCj4gKyAgICAgICBjaGFuID0gX19vZl9paW9fY2hh
bm5lbF9nZXRfYnlfbmFtZShucCwgbmFtZSwgJnBhcmVudF9sb29rdXApOwo+ICsgICAgICAgaWYg
KCFwYXJlbnRfbG9va3VwKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gY2hhbjsKPiArCj4gKyAg
ICAgICAvKgo+ICsgICAgICAgICogTm8gbWF0Y2hpbmcgSUlPIGNoYW5uZWwgZm91bmQgb24gdGhp
cyBub2RlLgo+ICsgICAgICAgICogSWYgdGhlIHBhcmVudCBub2RlIGhhcyBhICJpby1jaGFubmVs
LXJhbmdlcyIgcHJvcGVydHksCj4gKyAgICAgICAgKiB0aGVuIHdlIGNhbiB0cnkgb25lIG9mIGl0
cyBjaGFubmVscy4KPiArICAgICAgICAqLwo+ICsgICAgICAgbnAgPSBucC0+cGFyZW50Owo+ICAg
ICAgICAgd2hpbGUgKG5wKSB7Cj4gLSAgICAgICAgICAgICAgIGludCBpbmRleCA9IDA7Cj4gLQo+
IC0gICAgICAgICAgICAgICAvKgo+IC0gICAgICAgICAgICAgICAgKiBGb3IgbmFtZWQgaWlvIGNo
YW5uZWxzLCBmaXJzdCBsb29rIHVwIHRoZSBuYW1lIGluIHRoZQo+IC0gICAgICAgICAgICAgICAg
KiAiaW8tY2hhbm5lbC1uYW1lcyIgcHJvcGVydHkuICBJZiBpdCBjYW5ub3QgYmUgZm91bmQsIHRo
ZQo+IC0gICAgICAgICAgICAgICAgKiBpbmRleCB3aWxsIGJlIGFuIGVycm9yIGNvZGUsIGFuZCBv
Zl9paW9fY2hhbm5lbF9nZXQoKQo+IC0gICAgICAgICAgICAgICAgKiB3aWxsIGZhaWwuCj4gLSAg
ICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICBpZiAobmFtZSkKPiAtICAgICAgICAg
ICAgICAgICAgICAgICBpbmRleCA9IG9mX3Byb3BlcnR5X21hdGNoX3N0cmluZyhucCwgImlvLWNo
YW5uZWwtbmFtZXMiLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG5hbWUpOwo+IC0gICAgICAgICAgICAgICBjaGFuID0gb2ZfaWlvX2No
YW5uZWxfZ2V0KG5wLCBpbmRleCk7Cj4gLSAgICAgICAgICAgICAgIGlmICghSVNfRVJSKGNoYW4p
IHx8IFBUUl9FUlIoY2hhbikgPT0gLUVQUk9CRV9ERUZFUikKPiArICAgICAgICAgICAgICAgaWYg
KCFvZl9nZXRfcHJvcGVydHkobnAsICJpby1jaGFubmVsLXJhbmdlcyIsIE5VTEwpKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBjaGFuOwo+IC0gICAgICAgICAgICAgICBpZiAobmFt
ZSAmJiBpbmRleCA+PSAwKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCJFUlJP
UjogY291bGQgbm90IGdldCBJSU8gY2hhbm5lbCAlcE9GOiVzKCVpKVxuIiwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG5wLCBuYW1lID8gbmFtZSA6ICIiLCBpbmRleCk7Cj4gKwo+
ICsgICAgICAgICAgICAgICBjaGFuID0gX19vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShucCwg
bmFtZSwgJnBhcmVudF9sb29rdXApOwo+ICsgICAgICAgICAgICAgICBpZiAoIXBhcmVudF9sb29r
dXApCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGNoYW47Cj4gLSAgICAgICAgICAg
ICAgIH0KPgo+IC0gICAgICAgICAgICAgICAvKgo+IC0gICAgICAgICAgICAgICAgKiBObyBtYXRj
aGluZyBJSU8gY2hhbm5lbCBmb3VuZCBvbiB0aGlzIG5vZGUuCj4gLSAgICAgICAgICAgICAgICAq
IElmIHRoZSBwYXJlbnQgbm9kZSBoYXMgYSAiaW8tY2hhbm5lbC1yYW5nZXMiIHByb3BlcnR5LAo+
IC0gICAgICAgICAgICAgICAgKiB0aGVuIHdlIGNhbiB0cnkgb25lIG9mIGl0cyBjaGFubmVscy4K
PiAtICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgIG5wID0gbnAtPnBhcmVudDsK
PiAtICAgICAgICAgICAgICAgaWYgKG5wICYmICFvZl9nZXRfcHJvcGVydHkobnAsICJpby1jaGFu
bmVsLXJhbmdlcyIsIE5VTEwpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBjaGFu
Owo+ICAgICAgICAgfQo+Cj4gLSAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPiArICAg
ICAgIHJldHVybiBjaGFuOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKG9mX2lpb19jaGFubmVs
X2dldF9ieV9uYW1lKTsKPgo+IC0tCj4gMi4zNi4xCj4KCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMs
CkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
