Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 448E8774609
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 20:51:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1376C6B45C;
	Tue,  8 Aug 2023 18:51:14 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8775BC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 18:51:13 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-4476f713e15so2093782137.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Aug 2023 11:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691520672; x=1692125472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A7dpQqp3igR4lqKwjP6w0osFBZ3PZiFfViS04CWVCyo=;
 b=Dae7k/MTdvWO8tc8PGMalRBZD7+LodSwirAQ0ikfwqi2jzx1bUTwlYQqX8bEyFnghK
 yfSOiT23O+GAkmFXdGmZ0Z6jDMErp3R7PJKSwguXcGUsoFXTFUC9kGw8ONL6j2BYDNtw
 /Ss9VZ3UW2K6FC8fYBnbFwkKhf44tqzracC0wrwL9MadR15RmrnkdO23W4mO6hnI29uh
 VAKd17wxMUWrQ622YtVvLVgIyUz88kFFW6GZYwTFCbHApZIbg8AOR4KB151RZi07b5Xf
 y6ATNEYRIvfFevZN83CTpsymKBcjlQWGJh0fqijT0XcSpvYGtPgxWhX5GnK8aSv0jfIo
 pMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691520672; x=1692125472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A7dpQqp3igR4lqKwjP6w0osFBZ3PZiFfViS04CWVCyo=;
 b=e4j/QicY7UrfkmFuSMOBmReujV7F/X6IlH/tY8jgDU3ayMHxdxO/NZLW0hBzu8OAx6
 GBltjp09tIFCd326eO0w5lDZdJ7b/Ojb8aAlRTgJ9/DaiLCP7gBLVYNUFNqsEZHUBqib
 dLGDz0jzifapNvAzTqshNzR04A3nZttDX0z18m9+IyT7mMiBr23wfJXNaWLJPN+y6Gnc
 i3tw8zQ67xqDVKoL/WvegsYOBQzObL+ohU3zyMrpoV4KDgAU7sjFsgkiPf0D4D28NXBk
 YqgJwbZNbsWrO8WcbpZA29qX1padRajTtwkcM2xu48h0V+djMKCIubNhKJkLGMu8jx5F
 0kUQ==
X-Gm-Message-State: AOJu0Ywevq1rF3ohsz1xKQJ/IecGUgZ79Dyb/DUCRWwRLm9JEBaaB7Xk
 nnuVqLjW322OLlMPPWON/xAe/QrsBiC9ppH0cwfNlQ==
X-Google-Smtp-Source: AGHT+IEo9vua2y2D8pNsCaUFO3D6FDvMRdlptQj5UA2pUH1+fSZOWabaRNMUZxr1m1TOnki80MoL1YQq6NhTaYYzsMA=
X-Received: by 2002:a67:d085:0:b0:447:4b52:5c8 with SMTP id
 s5-20020a67d085000000b004474b5205c8mr798787vsi.26.1691520672390; Tue, 08 Aug
 2023 11:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230808120254.11653-1-brgl@bgdev.pl>
 <82cd26a3-e63d-4251-9d43-d1d7443b9cce@lunn.ch>
In-Reply-To: <82cd26a3-e63d-4251-9d43-d1d7443b9cce@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Aug 2023 20:51:01 +0200
Message-ID: <CAMRc=MfDtCj0ML-FQH8-Cm23YupOnmScBqKDrLExqSjqeHhOSg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alex Elder <elder@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: don't create the
 MDIO bus if there's no mdio node on DT
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCA4OjQ24oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDA4LCAyMDIzIGF0IDAyOjAyOjU0UE0gKzAyMDAs
IEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPgo+ID4gVGhlIHN0bW1hY19kdF9w
aHkoKSBmdW5jdGlvbiB0aGF0IHBhcnNlcyB0aGUgZGV2aWNlLXRyZWUgbm9kZSBvZiB0aGUgTUFD
Cj4gPiBhbmQgYWxsb2NhdGVzIHRoZSBNRElPIGFuZCBQSFkgcmVzb3VyY2VzIG1pc3NlcyBvbmUg
dXNlLWNhc2U6IHdoZW4gdGhlCj4gPiBNQUMgZG9lc24ndCBoYXZlIGEgZml4ZWQgbGluayBidXQg
YWxzbyBkb2Vzbid0IGRlZmluZSBpdHMgb3duIG1kaW8gYnVzCj4gPiBvbiB0aGUgZGV2aWNlIHRy
ZWUgYW5kIGluc3RlYWQgc2hhcmVzIHRoZSBNRElPIGxpbmVzIHdpdGggYSBkaWZmZXJlbnQKPiA+
IE1BQyB3aXRoIGl0cyBQSFkgcGhhbmRsZSByZWFjaGluZyBvdmVyIGludG8gYSBkaWZmZXJlbnQg
bm9kZS4KPgo+IEl0IGRvZXMgbm90IHNoYXJlIHRoZSBNRElPIGxpbmVzLiBUaGUgb3RoZXIgTURJ
TyBidXMgbWFzdGVyIGhhcHBlbnMgdG8KPiBoYXZlIHR3byBQSFlzIGFuZCB0aGVyZSBhcmUgbm8g
UEhZcyBvbiB0aGlzIE1ESU8gYnVzLCBzbyBubyBwb2ludAo+IGluc3RhbnRpYXRpbmcgaXQuCgpZ
ZXMsIEkgc2VudCBpdCBiZWZvcmUgd2UgZXN0YWJsaXNoZWQgdGhhdCB0aGFua3MgdG8gQW5kcmV3
J3MgaW5wdXQuCgo+Cj4gPiAgc3RhdGljIGludCBzdG1tYWNfZHRfcGh5KHN0cnVjdCBwbGF0X3N0
bW1hY2VuZXRfZGF0YSAqcGxhdCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRl
dmljZV9ub2RlICpucCwgc3RydWN0IGRldmljZSAqZGV2KQo+ID4gIHsKPiA+IC0gICAgIGJvb2wg
bWRpbyA9ICFvZl9waHlfaXNfZml4ZWRfbGluayhucCk7Cj4gPiAgICAgICBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBuZWVkX21kaW9faWRzW10gPSB7Cj4gPiAgICAgICAgICAgICAg
IHsgLmNvbXBhdGlibGUgPSAic25wcyxkd2MtcW9zLWV0aGVybmV0LTQuMTAiIH0sCj4gPiAgICAg
ICAgICAgICAgIHt9LAo+ID4gICAgICAgfTsKPiA+Cj4gPiArICAgICBpZiAob2ZfcGh5X2lzX2Zp
eGVkX2xpbmsobnApKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsKPgo+ICAgICAg
ICAgICAgICAgICAvKioKPiAgICAgICAgICAgICAgICAgICogSWYgc25wcyxkd21hYy1tZGlvIGlz
IHBhc3NlZCBmcm9tIERULCBhbHdheXMgcmVnaXN0ZXIKPiAgICAgICAgICAgICAgICAgICogdGhl
IE1ESU8KPiAgICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgIGZvcl9lYWNoX2No
aWxkX29mX25vZGUobnAsIHBsYXQtPm1kaW9fbm9kZSkgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShwbGF0LT5tZGlvX25vZGUsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzbnBzLGR3bWFj
LW1kaW8iKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAg
ICAgICAgICAgICB9Cj4KPiBUaGUgY29tbWVudCBzdWdnZXN0cyBpdCBzaG91bGQgYWx3YXlzIGJl
IHJlZ2lzdGVyZWQuIFRoaXMgTUFDIG1pZ2h0Cj4gaGF2ZSBhIGZpeGVkLXBoeSwgYnV0IHRoYXQg
ZG9lcyBub3QgbWVhbiB0aGVyZSBpcyBub3QgYW4gRXRoZXJuZXQKPiBzd2l0Y2ggb24gdGhlIGJ1
cywgb3IgYSBQSFkgZm9yIHNvbWUgb3RoZXIgTUFDIGV0Yy4gTURJTyBidXNzZXMKPiBtYXN0ZXJz
IHNob3VsZCBiZSBjb25zaWRlcmVkIGZ1bGx5IGluZGVwZW5kZW50IGRldmljZXMuCj4KPiBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni41LXJjNS9zb3VyY2UvYXJjaC9hcm0vYm9v
dC9kdHMvbnhwL3ZmL3ZmNjEwLXppaS1zc21iLWR0dS5kdHMKPgo+ICZmZWMxIHsKPiAgICAgICAg
IHBoeS1tb2RlID0gInJtaWkiOwo+ICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsK
PiAgICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF9mZWMxPjsKPiAgICAgICAgIHN0YXR1cyA9
ICJva2F5IjsKPgo+ICAgICAgICAgZml4ZWQtbGluayB7Cj4gICAgICAgICAgICAgICAgIHNwZWVk
ID0gPDEwMD47Cj4gICAgICAgICAgICAgICAgIGZ1bGwtZHVwbGV4Owo+ICAgICAgICAgfTsKPgo+
ICAgICAgICAgbWRpbzE6IG1kaW8gewo+ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwxPjsKPiAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gICAgICAgICAgICAg
ICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwxMjUwMDAwMD47Cj4gICAgICAgICAgICAgICAgIHN1cHBy
ZXNzLXByZWFtYmxlOwo+ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4KPiAgICAg
ICAgICAgICAgICAgc3dpdGNoMDogc3dpdGNoMEAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gIm1hcnZlbGwsbXY4OGU2MTkwIjsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfZ3Bpb19zd2l0Y2gwPjsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlZyA9IDwwPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBlZXByb20tbGVuZ3Ro
ID0gPDY1NTM2PjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0g
PCZncGlvMz47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwyIElSUV9U
WVBFX0xFVkVMX0xPVz47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LWNvbnRy
b2xsZXI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwyPjsK
Pgo+IEJvdGggYSBmaXhlZCBsaW5rLCBhbmQgc29tZXRoaW5nIG9uIHRoZSBNRElPIGJ1cy4uLi4K
Pgo+ICAgICAgQW5kcmV3CgpNYWtlcyBzZW5zZSwgd2UgY2FuIGRyb3AgYWxsIG15IHN0bW1hYyBw
YXRjaGVzIGZyb20gdG9kYXksIEkgbmVlZCB0bwpyZXRoaW5rIGl0IGluIGRldGFpbC4KCkJhcnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
