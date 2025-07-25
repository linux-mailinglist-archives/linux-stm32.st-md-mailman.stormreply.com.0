Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29277B118FE
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 09:13:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1078C3089D;
	Fri, 25 Jul 2025 07:13:47 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F9A8C30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 07:13:46 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-32e14ce168eso20136321fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 00:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753427625; x=1754032425;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ceB1qf+gLasT0iKM4trjiwxebZfTYB6IsMaryh73jIo=;
 b=BN2jr3B9Uwd58SVFyLT2kd3PAcP6OE2BzZtszzZ6mt6HVOBuG89AGi0GcChIrCP50N
 +GWhM0Xushkqi4hkqGH5BdXBNjAORXkfiGRXdOYHlxzbtPUWljE7MKpv6eWySs0uCX5c
 1JK65DlL3+COtITBxn8cAVIpFWdtp7uUiYxEwzR4+aJA9gmUqsd1XsoM0NmpPQCfsCAL
 2JiI30/dwGFtcHXdHfXYIni0Y/bHN5aso5b31HIn2cBkv2+xSYutJlx20mLIQY2FhcJ3
 1UmH9+1ehe59ZNskT5v9fJnT4v33BzrZ2xQSxCSC0KWgGogfusCtWgAUQWvXYso227kM
 S4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753427625; x=1754032425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ceB1qf+gLasT0iKM4trjiwxebZfTYB6IsMaryh73jIo=;
 b=jMRPEFPMLRIPrxczH6Hkz6uwHF9hRvE0s89c/elJ6ue+tpaXCLstwGI0C/bVO6nw9h
 T09a6AXSdbDS/1sRmiqQMFtSFFrXazdFvMJ6oJaRBvYN8DZofYrWwrtQtCF523hGrC3n
 /IoqILIm48fEV04NXhY1RUNx3iuSA7G8NjfaYpmtjv1g94+0GOqsMz5ZV1gZnVSrwo27
 qCBqauDWqo6yoZI14rM83dDIEAspWk46O6s1ECd4GvKhIJ5X+LzocL7ajds0aBwrQhRl
 axvgaW3Ne+Mrb33tenYB1Ws3WIO59qGFPF7W7StNgrkDf6MWM6qpLT3jJAiWGDSxzPGJ
 mPQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx3gMy1LURJs4CpPnsx4B0X7ONRKXaYx+YwUGkVYTwIQPA09amnbqcdt/+vJihTufxNxLGmAP6uvpm3Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLxjW+j1Ag5VxxgJwTZgVJOAJ2mHGVBZtLH7iCO4jcrBEotsmL
 hVEzthrjarPnrCozmhtUY3DADazdQpSh8RfmJuTHIYeVv7/TkiBo8DfBGE0tL3X9GvgA655XGo+
 zz3DsaP9VYcgXUR12d70opA6FkjhnvN/kcvUJ7k4g8g==
X-Gm-Gg: ASbGncsdsfquZGxwC7LRkKyvyJvRrMHt/D+t0cJvGK5l88Iex/8lLlCAeSNagn1htgE
 goWt6O/ooT1VN6IM5e+MAbn0y5naZo4dzhzDCPdp3kLoRFPVqNZ9QnhQPwiU0eYEIE8fo+J0W+/
 zu47uD4Saf8Jqc1miap2lhJZ2do3oWVCsL3xFzGSZmsbpxGnvrDKNu7tjG2hQZP2aOfcu2zFMG8
 cA46NNiYVNWDxD6o9afew44l40xzPOQI4O1ixM8WPxZbRSHag==
X-Google-Smtp-Source: AGHT+IGZ6IpSoNGJljT1FXr2JWFQwLBJcl/zkngQEk6KemDtXvzc434wLZBIztSCj044zT6GZ+DEkjAHeT2KYoDAfi0=
X-Received: by 2002:a05:6512:4003:b0:553:a4cf:2106 with SMTP id
 2adb3069b0e04-55b5f4ea71bmr197629e87.57.1753427625388; Fri, 25 Jul 2025
 00:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250725055221.258501-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250725055221.258501-1-alexander.stein@ew.tq-group.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Jul 2025 09:13:34 +0200
X-Gm-Features: Ac12FXxdj3cPCvNBd3Lm4-GvXKqLYsKZr59Agf2YhP9X2Y28_xXRSYG4_XGAoZY
Message-ID: <CAMRc=Mew_F9ngFSNSyPL8ecm9ZgivYkbJg-jYghnWPGuy4pwVA@mail.gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] gpio: stmpe: Allow to compile as a
	module
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

T24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgNzo1MuKAr0FNIEFsZXhhbmRlciBTdGVpbgo8YWxleGFu
ZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4gd3JvdGU6Cj4KPiBBZGQgdGhlIG5lY2Vzc2FyeSBi
b2lsZXJwbGF0ZSB0byBhbHNvIG1ha2UgdGhpcyBkcml2ZXIgbW9kdWxhci4KPiBUaGlzIGZvbGxv
d3MgY29tbWl0IGEyYjgxOTFhYjY5NWEgKCJwd206IHN0bXBlOiBBbGxvdyB0byBjb21waWxlIGFz
IGEKPiBtb2R1bGUiKSB3aGljaCBkb2VzIHRoZSBzYW1lIGZvciBwd20uIEFsc28gYWRkIE9GIG1h
dGNoIHRhYmxlIGZvciBtb2R1bGUKPiBhdXRvbG9hZGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBTdGVpbiA8YWxleGFuZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncGlvL0tjb25maWcgICAgICB8ICAyICstCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLXN0
bXBlLmMgfCAxOSArKysrKysrKysrKy0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8v
S2NvbmZpZyBiL2RyaXZlcnMvZ3Bpby9LY29uZmlnCj4gaW5kZXggNTAwZDgzOWY2NWVlOC4uMDYy
MTgzMmQwNDVmYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwaW8vS2NvbmZpZwo+ICsrKyBiL2Ry
aXZlcnMvZ3Bpby9LY29uZmlnCj4gQEAgLTE1NTksNyArMTU1OSw3IEBAIGNvbmZpZyBHUElPX1NM
MjhDUExECj4gICAgICAgICAgIGNhbGxlZCBncGlvLXNsMjhjcGxkLgo+Cj4gIGNvbmZpZyBHUElP
X1NUTVBFCj4gLSAgICAgICBib29sICJTVE1QRSBHUElPcyIKPiArICAgICAgIHRyaXN0YXRlICJT
VE1QRSBHUElPcyIKPiAgICAgICAgIGRlcGVuZHMgb24gTUZEX1NUTVBFCj4gICAgICAgICBkZXBl
bmRzIG9uIE9GX0dQSU8KPiAgICAgICAgIHNlbGVjdCBHUElPTElCX0lSUUNISVAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tc3RtcGUuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXN0bXBl
LmMKPiBpbmRleCAwYTI3MDE1NmUwYmVhLi5kYjlmNGNkMWU4NjE1IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3Bpby9ncGlvLXN0bXBlLmMKPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1zdG1wZS5j
Cj4gQEAgLTUzNCwxNiArNTM0LDE5IEBAIHN0YXRpYyBpbnQgc3RtcGVfZ3Bpb19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgcmV0dXJuIGRldm1fZ3Bpb2NoaXBf
YWRkX2RhdGEoZGV2LCAmc3RtcGVfZ3Bpby0+Y2hpcCwgc3RtcGVfZ3Bpbyk7Cj4gIH0KPgo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG1wZV9ncGlvX29mX21hdGNoZXNbXSA9
IHsKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAic3Qsc3RtcGUtZ3BpbyIsIH0sCj4gKyAgICAg
ICB7IC8qIHNlbnRpbmVsICovIH0KPiArfTsKPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3Rt
cGVfZ3Bpb19vZl9tYXRjaGVzKTsKPiArCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IHN0bXBlX2dwaW9fZHJpdmVyID0gewo+ICAgICAgICAgLmRyaXZlciA9IHsKPiAtICAgICAgICAg
ICAgICAgLnN1cHByZXNzX2JpbmRfYXR0cnMgICAgPSB0cnVlLAo+IC0gICAgICAgICAgICAgICAu
bmFtZSAgICAgICAgICAgICAgICAgICA9ICJzdG1wZS1ncGlvIiwKPiArICAgICAgICAgICAgICAg
Lm5hbWUgPSAic3RtcGUtZ3BpbyIsCj4gKyAgICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9
IHN0bXBlX2dwaW9fb2ZfbWF0Y2hlcywKPiAgICAgICAgIH0sCj4gLSAgICAgICAucHJvYmUgICAg
ICAgICAgPSBzdG1wZV9ncGlvX3Byb2JlLAo+ICB9Owo+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVy
X3Byb2JlKHN0bXBlX2dwaW9fZHJpdmVyLCBzdG1wZV9ncGlvX3Byb2JlKTsKPgo+IC1zdGF0aWMg
aW50IF9faW5pdCBzdG1wZV9ncGlvX2luaXQodm9pZCkKPiAtewo+IC0gICAgICAgcmV0dXJuIHBs
YXRmb3JtX2RyaXZlcl9yZWdpc3Rlcigmc3RtcGVfZ3Bpb19kcml2ZXIpOwo+IC19Cj4gLXN1YnN5
c19pbml0Y2FsbChzdG1wZV9ncGlvX2luaXQpOwoKUGxlYXNlIGRvbid0IHJlb3JkZXIgdGhlIHJl
Z2lzdHJhdGlvbiBmb3IgYnVpbHQtaW4gbW9kZS4KCkJhcnQKCj4gK01PRFVMRV9ERVNDUklQVElP
TigiU1RNUEUgZXhwYW5kZXIgR1BJTyIpOwo+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7Cj4gLS0K
PiAyLjQzLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
