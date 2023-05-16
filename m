Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6FE7055AB
	for <lists+linux-stm32@lfdr.de>; Tue, 16 May 2023 20:09:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D85CC6A61F;
	Tue, 16 May 2023 18:09:34 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B911DC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 18:09:33 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-55a20a56a01so249010687b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 11:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684260572; x=1686852572;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HOOCBtnPBFwUcTzbyrJ0D+u8r9EEiyuqpPeng26UuJw=;
 b=qmxo71Iu51dxFxvJUFwzFuvE5d4/yYabhhGeWleeEm4S88WH1eWl0ErD0jyC4E4Yw4
 kTAlQonYg0MmNr6Lvn8vC+nHf2rA+KvFG+LWsMiS0LBHhEFghvMt8DKhK8ViUaFADlfy
 LgUNrPAHtqz0J/rOZuJLs6YHWWXNsyH5TMAwK2hQG+K+7JuqIl6X4+iOmZri0mYKJrkS
 vQfel+hfcdz3pLMvRD+0xBDdGTGaN9gCNPp4eRf3Yiy7WW9bTH+Nxd6snpjBwcr6/LXB
 F2T46T91x4YRYJakVsZrBKMVK9YMbm7l+sLh1ogMnYSjVAI8XOFtNd3Ghx0Ot/yr84ca
 nAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684260572; x=1686852572;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HOOCBtnPBFwUcTzbyrJ0D+u8r9EEiyuqpPeng26UuJw=;
 b=f5G09fZcIxLiW1wcmAuxTu6EVhhEjbOBhvhi0Vj8KTCCaA9RQoAK+TzANfXGmd8TgQ
 HB12HIieB9NJS8i2BiADgRvCkvt7Knzn0R6/G+t5qZguDe4u+JBcoG06g/M7Pg3uxAyP
 5AG7LA+b+Zcj5q4UoZ36v8W0kEKJWNo0N773ybQFVb/6+OBeaHfseGLh+WN+y9/Ppsiz
 3HnNl5TBV7iD3pGQolV33EB/ArxxlR3G6AX5RbblsETO5qHzcavAY/0Yhvvc9iHJ9DxE
 p+YMANoHZ89+TULPKwUEKG4hJpcAjIJAC303d2ANPcZmVrdJuy0ybcU9ODTTdQ0BL5YJ
 Fikg==
X-Gm-Message-State: AC+VfDxTsKvStM+QnL5Alc6fYU2zEyne/foKiT12mMbvK0qGwkAeURwS
 24xGyRCafM2tqeXBibr4jZnW9cGy3oqtA+0/8iY2Jg==
X-Google-Smtp-Source: ACHHUZ7XF6q2Bm1/49+wSfDCry1UkLwKzxIvfA8o0ztp9zAXasmfZmqYoLT5ce/cEdz0K4L4NDqNhKlG99yf44fNy44=
X-Received: by 2002:a81:6c45:0:b0:561:bae4:c377 with SMTP id
 h66-20020a816c45000000b00561bae4c377mr255712ywc.14.1684260572560; Tue, 16 May
 2023 11:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230426-stmpe-dt-bindings-v4-0-36fdd53d9919@linaro.org>
 <20230426-stmpe-dt-bindings-v4-1-36fdd53d9919@linaro.org>
 <CAMRc=MdsBiV3AvzSPtCuR58w0N9z7o+hUrBDtXUC4a++pECb8w@mail.gmail.com>
 <CACRpkdaJrB1f13LB4aHSWys63448a4NQZORgwdk8z=C8qe-BDA@mail.gmail.com>
 <CAMRc=Mf+RsU6PT7fwm=r9OLbmxNjiv9Ru8HEfpMEAqDN5-0Qig@mail.gmail.com>
In-Reply-To: <CAMRc=Mf+RsU6PT7fwm=r9OLbmxNjiv9Ru8HEfpMEAqDN5-0Qig@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 May 2023 20:09:21 +0200
Message-ID: <CACRpkdbCiEtiXkhaoUMCqeqcOaTYu0hSp0cDTy8NzzwitfQL+g@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-gpio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: gpio: Convert STMPE
	GPIO to YAML schema
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

T24gVHVlLCBNYXkgMTYsIDIwMjMgYXQgNTozNOKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgo+IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDEwOjM54oCvUE0g
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBP
biBUaHUsIE1heSAxMSwgMjAyMyBhdCA0OjU44oCvUE0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBiZ2Rldi5wbD4gd3JvdGU6Cj4gPgo+ID4gPiBBcHBsaWVkLCB0aGFua3MhCj4gPgo+ID4gVGhh
dCB3b3JrcyAuLi4gYnV0IHBhdGNoIDIvMiBkZXBlbmRzIG9uIHRoaXMgb25lLiAodXNlcyAkcmVm
KS4KPiA+IFlvdSdkIGhhdmUgdG8gZ2l2ZSBMZWUgYW4gaW1tdXRhYmxlIGJyYW5jaCB0aGF0IGhl
IGNhbiBwdWxsCj4gPiBiZWZvcmUgYXBwbHlpbmcgcGF0Y2ggMi8yIHNvIGhlIGhhcyB0aGUgZGVw
ZW5kZW5jeSwgb3IgbGV0IGhpbQo+ID4gYXBwbHkgYm90aC4KPiA+Cj4gPiBZb3VycywKPiA+IExp
bnVzIFdhbGxlaWoKPgo+IFN1cmU6Cj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IGFjOWE3ODY4MWI5MjE4Nzc1MTg3NjNiYTBlODkyMDIyNTQzNDlkMWI6Cj4KPiAgIExpbnV4
IDYuNC1yYzEgKDIwMjMtMDUtMDcgMTM6MzQ6MzUgLTA3MDApCj4KPiBhcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2JyZ2wvbGludXguZ2l0Cj4gdGFncy92Ni40LXN0bXBlLWdwaW8K
Pgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2YzE5OTc0ZDFlODNmYmEyY2NhMWNi
ZWEyZmJmMjUwZjA5M2ViNWVkOgo+Cj4gICBkdC1iaW5kaW5nczogZ3BpbzogQ29udmVydCBTVE1Q
RSBHUElPIHRvIFlBTUwgc2NoZW1hICgyMDIzLTA1LTExCj4gMTY6NTg6MDQgKzAyMDApCgpIZXkg
Y29vbCA6RAoKTGVlIGlmIHlvdSBwdWxsIHRoaXMgaW4geW91IGNhbiBhcHBseSAyLzIgb24gdG9w
IGlmIGl0IGNoZWNrcyBvdXQuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
