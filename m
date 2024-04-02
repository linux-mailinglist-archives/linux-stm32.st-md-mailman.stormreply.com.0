Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A0389559E
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 15:43:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55CD2C6B46B;
	Tue,  2 Apr 2024 13:43:18 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2827EC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 13:43:16 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-61149e50602so35429117b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Apr 2024 06:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712065393; x=1712670193;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UtPJLQoZZ3Deaa6exFS7kU96LFRYdL8NjqNyc0/RmVs=;
 b=trHRJ2tJ9cI7+/ragNmN/FKoiuXi8RrjWnQeh2DYnrWUzB/xMKlYMskxgV4FNxKMZC
 4E9mQnb5RSV+uQteNyT2LhpbauPlTxzNiYn5B9suIbb87MwHbaepuIF0DIjpksyfPfp7
 kAfUgrtyLWVy00oZi2TtMFgOrzAOl9OA5fFhDAr4TLoW7OcV0Djau8nEK8kOgw+AKZ8t
 dID/ZI8CwSuC9Xt/329U1AMfqCD876J9iOmjcAHfrf6SMVeWTZoew5aDnP45K1bhWbR3
 AqvOG+a8nb8Za3/VGbECQymwBMLVKkK5VOQJE73J6fHResF3U8sxoRRSr55un3jbUmq9
 CorQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrD7xepKOrj0W2NGW4H/bHkic9qIjxjl2lIEPjDO7gg4PIp+brEegsZmSFFsqrNmrK7jptdSRUBgXPNwoKmadbB0oyJ9t+kg550/wfDO/JGSiLCnV9mFaG
X-Gm-Message-State: AOJu0YxMErtkv3NC7KSfAIIXlushTnqbABHhY4BcNyC7S4/tvQH6zWss
 7mk/yO8psXRtHmjYa5xSFWQJR6waRF3ClRtwxrUg88LacDXodDubXl3lj4bvFCM=
X-Google-Smtp-Source: AGHT+IE3+7jJSuZcjO55iiHEo8Al730Y1se7uD6wxgOV4Tim1QX1C2PUyq+HNFFeJE0U/9qFXe7CKw==
X-Received: by 2002:a0d:d992:0:b0:615:ba5:824f with SMTP id
 b140-20020a0dd992000000b006150ba5824fmr2282883ywe.25.1712065393582; 
 Tue, 02 Apr 2024 06:43:13 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 x8-20020a81d208000000b00610e32312f6sm2779024ywi.43.2024.04.02.06.43.12
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 06:43:12 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-614769887e6so19384747b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Apr 2024 06:43:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVIYOo26cA8ITY0Skfwr09Gc6NnozXqCMCOA4nk98sttFhs9obZ0pJh5mfcc+SDPAIVzGlvvBUBYPvknKneSR0zx0a6Y5mr1AnJnfbf6aj7TI5j4QhUA7nu
X-Received: by 2002:a25:f912:0:b0:dc7:494e:ff33 with SMTP id
 q18-20020a25f912000000b00dc7494eff33mr7752167ybe.7.1712065392498; Tue, 02 Apr
 2024 06:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240402-rzn1-gmac1-v1-0-5be2b2894d8c@bootlin.com>
 <20240402-rzn1-gmac1-v1-1-5be2b2894d8c@bootlin.com>
In-Reply-To: <20240402-rzn1-gmac1-v1-1-5be2b2894d8c@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Apr 2024 15:43:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=Hbv8Qiyf=Ot_kHTbfPo0yk+NkutS80uC6cuAWYMsyg@mail.gmail.com>
Message-ID: <CAMuHMdW=Hbv8Qiyf=Ot_kHTbfPo0yk+NkutS80uC6cuAWYMsyg@mail.gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] dt-bindings: net: renesas,
 rzn1-gmac: Document RZ/N1 GMAC support
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

SGkgUm9tYWluLAoKT24gVHVlLCBBcHIgMiwgMjAyNCBhdCAyOjM24oCvUE0gUm9tYWluIEdhbnRv
aXMKPHJvbWFpbi5nYW50b2lzQGJvb3RsaW4uY29tPiB3cm90ZToKPiBGcm9tOiBDbMOpbWVudCBM
w6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Cj4KPiBUaGUgUlovTjEgc2VyaWVzIG9m
IE1QVXMgZmVhdHVyZSB1cCB0byB0d28gR2lnYWJpdCBFdGhlcm5ldCBjb250cm9sbGVycy4KPiBU
aGVzZSBjb250cm9sbGVycyBhcmUgYmFzZWQgb24gU3lub3BzeXMgSVBzLiBUaGV5IGNhbiBiZSBj
b25uZWN0ZWQgdG8KPiBSWi9OMSBSR01JSS9STUlJIGNvbnZlcnRlcnMuCj4KPiBBZGQgYSBiaW5k
aW5nIHRoYXQgZGVzY3JpYmVzIHRoZXNlIEdNQUMgZGV2aWNlcy4KPgo+IFNpZ25lZC1vZmYtYnk6
ICJDbMOpbWVudCBMw6lnZXIiIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+IFtyZ2FudG9p
czogY29tbWl0IGxvZ10KPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gR2FudG9pcyA8cm9tYWluLmdh
bnRvaXNAYm9vdGxpbi5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMs
cnpuMS1nbWFjLnlhbWwKCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2Nsb2NrL3I5YTA2ZzAzMi1zeXNjdHJsLmg+Cj4gKyAgICAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+ICsKPiArICAgIGV0aGVy
bmV0QDQ0MDAwMDAwIHsKPiArICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA2ZzAzMi1n
bWFjIiwgInJlbmVzYXMscnpuMS1nbWFjIiwgInNucHMsZHdtYWMiOwo+ICsgICAgICByZWcgPSA8
MHg0NDAwMDAwMCAweDIwMDA+Owo+ICsgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+OwoK
VGhlcmUgaXMgbm8gbmVlZCB0byB1c2UgaW50ZXJydXB0LXBhcmVudCBpbiBleGFtcGxlcy4KCj4g
KyAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzNCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiAr
ICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDM2IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsg
ICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMzUgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKyAg
ICAgIGludGVycnVwdC1uYW1lcyA9ICJtYWNpcnEiLCAiZXRoX3dha2VfaXJxIiwgImV0aF9scGki
Owo+ICsgICAgICBjbG9jay1uYW1lcyA9ICJzdG1tYWNldGgiOwo+ICsgICAgICBjbG9ja3MgPSA8
JnN5c2N0cmwgUjlBMDZHMDMyX0hDTEtfR01BQzA+OwoKSWYgeW91IHdhbnQgdGhpcyB0byBiZSBh
IHJlYWwgZXhhbXBsZSwgeW91IHNob3VsZCBhZGQgcG93ZXItZG9tYWlucy4KCj4gKyAgICAgIHNu
cHMsbXVsdGljYXN0LWZpbHRlci1iaW5zID0gPDI1Nj47Cj4gKyAgICAgIHNucHMscGVyZmVjdC1m
aWx0ZXItZW50cmllcyA9IDwxMjg+Owo+ICsgICAgICB0eC1maWZvLWRlcHRoID0gPDIwNDg+Owo+
ICsgICAgICByeC1maWZvLWRlcHRoID0gPDQwOTY+Owo+ICsgICAgICBwY3MtaGFuZGxlID0gPCZt
aWlfY29udjE+Owo+ICsgICAgICBwaHktbW9kZSA9ICJtaWkiOwo+ICsgICAgfTsKCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
