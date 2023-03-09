Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F76B28A9
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 16:22:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E398BC6A60D;
	Thu,  9 Mar 2023 15:22:32 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B70CC6A609
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 15:22:31 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id f31so1961464vsv.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 07:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678375350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wnQ1JLkorEsC0faYzxDw+JFZG2Ei/m3Pat9Daw2w3Gk=;
 b=Q4LtAtcwLUPWrpzaXeGN56IlGGfWu+kYpEOvHSLS/L4jH1ri6By3E9pqF9M2TdUYbT
 l30gkFtPBW6LwRTH9Efqo6pOwGoYv/8Jgf1ijfmXIiWOqJKGs+UxQD92eqp6kQuLKVmF
 lapgpQDEfjPQoL0LG+RQW+qABMNzbhGcOBF33XEfm0aIRsspijGgoE/xRXYMKUrqrK4s
 aLHab+Itc7i0Lt2vhCR8bSvo5Lt8cXFNzMUY9gjQqweotGH4gbTuMHU3flHb2DDCuoDj
 kT5evC8vWodEdpmrNIVfgEWgDfE8GHMGg9pv7TIKsKW0PdRCHYgx+Gjc4M4vdEeUXZNR
 Pceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678375350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnQ1JLkorEsC0faYzxDw+JFZG2Ei/m3Pat9Daw2w3Gk=;
 b=COzwL7JmmqjE1niWGfHMryRgNTk9vU2cxgdcu9AvAxIUJ3l0Gefrn7yy1y+tQ7MZS/
 Cf9+EzQkIJzR0oo5TaoiYU/DfGtIMZ8iqtlZh2VJABbdS/tReF4+sBkwQj1OYh4B7dji
 ijNvxjMp7cEltLpFaJb7ZEQqUv67zksNOaSTzbppTiAJ75NIOxcm6WwzrZYD3IhUtvvI
 GljWR9Vlb3n2QEOiddzjebVSiruHNyOQWGjqThp2Maw8S1H4mfp2DIoeMxZZPHYItcUA
 Z2vJtS/Yx5wlQAU8w9brJgJEeh+Qz+oeTjTdzoyTcjZLCEHVKE3m1KzgJFFgpAhlpbR8
 VfdA==
X-Gm-Message-State: AO0yUKWs2iGFqpV6Lr9HZVJ87Fnp3jnPbgBD4Po8HuYNz48jQPIJSSjU
 qp09Pz6fwaDmOyvN5RfksJ0Dh5buTnaIdPT18KwRmQ==
X-Google-Smtp-Source: AK7set99Wa14Cl7q41QmEjig3d5y5XriZa4QovGX0AF/AQi3FUH59Z9nsjhzY/teq5TZvqlm1Mn1bo+B5wbkcw5GyVQ=
X-Received: by 2002:a67:d48c:0:b0:402:999f:44d2 with SMTP id
 g12-20020a67d48c000000b00402999f44d2mr15314715vsj.0.1678375350449; Thu, 09
 Mar 2023 07:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 Mar 2023 16:22:19 +0100
Message-ID: <CAMRc=Me-FMZ3e=EaUA1kimEonz=HVHBp7coxCz53bJK9NYBuFg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pwm@vger.kernel.org,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Doug Berger <opendmb@gmail.com>, Nandor Han <nandor.han@ge.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Semi Malinen <semi.malinen@ge.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 00/16] gpio: Use string_choices.h
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

T24gTW9uLCBNYXIgNiwgMjAyMyBhdCA4OjU14oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gVXNlIHN0cmluZ19jaG9pY2Vz
LmggaW4gdGhlIEdQSU8gZHJpdmVycyBhbmQgbGlicmFyeS4KPiBJdCBoYXMgYmVlbiB0ZXN0ZWQg
b24geDg2XzY0IGFuZCAoc2VtaS0pY29tcGlsZSB0ZXN0ZWQKPiBvdmVyIGFsbC4KPgo+IEFuZHkg
U2hldmNoZW5rbyAoMTYpOgo+ICAgbGliL3N0cmluZ19oZWxwZXJzOiBBZGQgbWlzc2luZyBoZWFk
ZXIgZmlsZXMgdG8gTUFJTlRBSU5FUlMgZGF0YWJhc2UKPiAgIGxpYi9zdHJpbmdfaGVscGVyczog
U3BsaXQgb3V0IHN0cmluZ19jaG9pY2VzLmgKPiAgIGxpYi9zdHJpbmdfY2hvaWNlczogQWRkIHN0
cl9oaWdoX2xvdygpIGhlbHBlcgo+ICAgbGliL3N0cmluZ19jaG9pY2VzOiBBZGQgc3RyX2lucHV0
X291dHB1dCgpIGhlbHBlcgo+ICAgZ3Bpb2xpYjogVXRpbGl6ZSBoZWxwZXJzIGZyb20gc3RyaW5n
X2Nob2ljZXMuaAo+ICAgZ3BpbzogYWRucDogVXRpbGl6ZSBoZWxwZXJzIGZyb20gc3RyaW5nX2No
b2ljZXMuaAo+ICAgZ3BpbzogYnJjbXN0YjogVXRpbGl6ZSBoZWxwZXJzIGZyb20gc3RyaW5nX2No
b2ljZXMuaAo+ICAgZ3BpbzogY3J5c3RhbGNvdmU6IFV0aWxpemUgaGVscGVycyBmcm9tIHN0cmlu
Z19jaG9pY2VzLmgKPiAgIGdwaW86IGdyZ3BpbzogVXRpbGl6ZSBoZWxwZXJzIGZyb20gc3RyaW5n
X2Nob2ljZXMuaAo+ICAgZ3BpbzogbXZlYnU6IFV0aWxpemUgaGVscGVycyBmcm9tIHN0cmluZ19j
aG9pY2VzLmgKPiAgIGdwaW86IHBsMDYxOiBVdGlsaXplIGhlbHBlcnMgZnJvbSBzdHJpbmdfY2hv
aWNlcy5oCj4gICBncGlvOiBzdG1wZTogVXRpbGl6ZSBoZWxwZXJzIGZyb20gc3RyaW5nX2Nob2lj
ZXMuaAo+ICAgZ3Bpbzogd2NvdmU6IFV0aWxpemUgaGVscGVycyBmcm9tIHN0cmluZ19jaG9pY2Vz
LmgKPiAgIGdwaW86IHdtODMxeDogVXRpbGl6ZSBoZWxwZXJzIGZyb20gc3RyaW5nX2Nob2ljZXMu
aAo+ICAgZ3Bpbzogd204OTk0OiBVdGlsaXplIGhlbHBlcnMgZnJvbSBzdHJpbmdfY2hvaWNlcy5o
Cj4gICBncGlvOiB4cmExNDAzOiBVdGlsaXplIGhlbHBlcnMgZnJvbSBzdHJpbmdfY2hvaWNlcy5o
Cj4KPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICB8ICAzICsrCj4gIGRyaXZlcnMv
Z3Bpby9ncGlvLWFkbnAuYyAgICAgICAgfCAyNCArKysrLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dw
aW8vZ3Bpby1icmNtc3RiLmMgICAgIHwgIDMgKy0KPiAgZHJpdmVycy9ncGlvL2dwaW8tY3J5c3Rh
bGNvdmUuYyB8IDE3ICsrKysrLS0tLS0KPiAgZHJpdmVycy9ncGlvL2dwaW8tZ3JncGlvLmMgICAg
ICB8ICAzICstCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLW12ZWJ1LmMgICAgICAgfCAyNyArKysrKysr
LS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLXBsMDYxLmMgICAgICAgfCAgNCArLS0KPiAg
ZHJpdmVycy9ncGlvL2dwaW8tc3RtcGUuYyAgICAgICB8IDE5ICsrKysrLS0tLS0tCj4gIGRyaXZl
cnMvZ3Bpby9ncGlvLXdjb3ZlLmMgICAgICAgfCAxNSArKysrLS0tLS0KPiAgZHJpdmVycy9ncGlv
L2dwaW8td204MzF4LmMgICAgICB8ICA1ICstLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby13bTg5OTQu
YyAgICAgIHwgIDYgKystLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby14cmExNDAzLmMgICAgIHwgIDUg
Ky0tCj4gIGRyaXZlcnMvZ3Bpby9ncGlvbGliLXN5c2ZzLmMgICAgfCAgMyArLQo+ICBkcml2ZXJz
L2dwaW8vZ3Bpb2xpYi5jICAgICAgICAgIHwgMTMgKysrKy0tLS0KPiAgaW5jbHVkZS9saW51eC9z
dHJpbmdfY2hvaWNlcy5oICB8IDU2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICBpbmNsdWRlL2xpbnV4L3N0cmluZ19oZWxwZXJzLmggIHwgMjYgKy0tLS0tLS0tLS0tLS0tCj4g
IDE2IGZpbGVzIGNoYW5nZWQsIDEyNSBpbnNlcnRpb25zKCspLCAxMDQgZGVsZXRpb25zKC0pCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3N0cmluZ19jaG9pY2VzLmgKPgo+IC0t
Cj4gMi4zOS4xCj4KCkkndmUgYmVlbiB0aGlua2luZyBhYm91dCB0aGlzIGFuZCBJIG11c3Qgc2F5
IGl0IGRvZXNuJ3QgbWFrZSBtdWNoCnNlbnNlIHRvIG1lLiBOb3Qgb25seSBkb2VzIGl0IE5PVCBy
ZWR1Y2UgdGhlIGNvZGUgc2l6ZSAoZXZlbiBpZiB3ZQphc3N1bWUgdGhlIHVubGlrZWx5IGNhc2Ug
d2hlcmUgd2UnZCBidWlsZCBhbGwgdGhvc2UgbW9kdWxlcyB0aGF0IHVzZQp0aGUgaGVscGVycykg
YnV0IGFsc28gZGVjcmVhc2VzIHRoZSByZWFkYWJpbGl0eSBmb3IgYW55b25lIG5vdApmYW1pbGlh
ciB3aXRoIHRoZSBuZXcgaW50ZXJmYWNlcyAobWVhbmluZyB0aW1lIHNwZW50IGxvb2tpbmcgdXAg
dGhlCm5ldyBmdW5jdGlvbikuIFRoZSAiJXMiLCB4ID8gImlmIiA6ICJlbHNlIiBzdGF0ZW1lbnQg
aXMgY29uY2lzZSBhbmQKY2xlYXIgYWxyZWFkeSwgSSBkb24ndCBzZWUgbXVjaCBpbXByb3ZlbWVu
dCB3aXRoIHRoaXMgc2VyaWVzLiBBbmQgSSdtCnNheWluZyBpdCBmcm9tIHRoZSBwb3NpdGlvbiBv
ZiBzb21lb25lIHdobyBsb3ZlcyBmYWN0b3Jpbmcgb3V0IGNvbW1vbgpjb2RlLiA6KQoKSSdsbCB3
YWl0IHRvIGhlYXIgd2hhdCBvdGhlcnMgaGF2ZSB0byBzYXkgYnV0IGlmIGl0IHdlcmUgdXAgdG8g
bWUsIEknZApwb2xpdGVseSBzYXkgbm8uCgooSSBtZWFuOiBJIGd1ZXNzLCBpbiB0aGUgZW5kIGl0
IGlzIHVwIHRvIG1lLCBidXQgSSdtIG9wZW4gdG8gYXJndW1lbnRzLikgOikKCkJhcnQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
