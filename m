Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 066298A9699
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 11:48:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC204C6DD66;
	Thu, 18 Apr 2024 09:48:46 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58D33C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 09:48:45 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-61874a5b8ecso6886057b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 02:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713433722; x=1714038522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/U/1iMAXF9+rfXboPMqFLH5Q8RXvLu8gC+6FrBKyQ0=;
 b=Cjl9oSWFV8ia6R+ffcBoyLa64P/hJzlZmuxnTP1IoLek1pLhw03/oBig89fWs5OfFy
 gEOIjpwwIUkX3RlFGjWc1iwv3VJA/mg0jMEO1gbXUZlUHy9WIdOFhu+S384O50gh4voX
 zGw3oUw3IBs0kCTXShiA0KGv4jBNpthuw06/G4xLYm16DwjJLxEJSMlrM3y23QaH5RbY
 HlN0tBZa3bZYcbeGsnMPMu8PO2jHJS1UD4PrtGF/b+mbrjEsAZvfdgrSTN+qyX+p/u9Q
 De858epvwnOLtDPMmULYVTEYoO/N3Uc8JIWt61wC71l+NdeP9qSzbgKhvEOThkfoPnUu
 r8QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJIDI3EQBUJ+4aoHrPfdP5bVKNfHozqOQsR2gGTIf4Zq21rjWL/hQtlDNoFpAyYZzOwzQsuG3sp/xronJYM9gX6dIhk0toEfA1bheFxg6rW7svzM4e22SW
X-Gm-Message-State: AOJu0YwMdfudxd602QPjbBm7GrkBD/qPScJUg64wbfr/8qBjebzuZ5uu
 +OwiUrYxew1ZfcIsy7W8Yz4IUx63+BYDCBgiw5sJPfBFPUbWv2Rmoh7AILSpeOY=
X-Google-Smtp-Source: AGHT+IGD/ibtRt4640pUoj9XHIkII9vdRBhQY3iOHHF0Z1yQ5rZlYZqCOK9keYumtJC5zv8pWuUsNw==
X-Received: by 2002:a05:690c:668d:b0:61a:bf86:9d81 with SMTP id
 hz13-20020a05690c668d00b0061abf869d81mr2237762ywb.12.1713433721984; 
 Thu, 18 Apr 2024 02:48:41 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 u190-20020a8184c7000000b0061893c5bcf0sm266767ywf.15.2024.04.18.02.48.41
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:48:41 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6181d032bf9so5788127b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 02:48:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXL6gGoUDxFvHSbffvE8ea/EnwUd90XUN1GCucFFfuKTU0JsS/KGQgLVnebBcDdI/6oWdchJ/J72uWtInyYBYrBuyDKgxafBF4QjfnmsQFDFGimLmHbqaE6
X-Received: by 2002:a05:690c:d18:b0:61a:af67:1cfd with SMTP id
 cn24-20020a05690c0d1800b0061aaf671cfdmr2156849ywb.5.1713433720901; Thu, 18
 Apr 2024 02:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
 <20240415-rzn1-gmac1-v3-5-ab12f2c4401d@bootlin.com>
In-Reply-To: <20240415-rzn1-gmac1-v3-5-ab12f2c4401d@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Apr 2024 11:48:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWEMSR6vKSPdXRbf5_dqBWsM+Z2PV46DBmwHAoBNv_5w@mail.gmail.com>
Message-ID: <CAMuHMdVWEMSR6vKSPdXRbf5_dqBWsM+Z2PV46DBmwHAoBNv_5w@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v3 5/5] ARM: dts: r9a06g032:
	describe GMAC1
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

SGkgUm9tYWluLAoKT24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgMTE6MTjigK9BTSBSb21haW4gR2Fu
dG9pcwo8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+IHdyb3RlOgo+IEZyb206IENsw6ltZW50
IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KPgo+IFRoZSByOWEwNmcwMzIgU29D
IG9mIHRoZSBSWi9OMSBmYW1pbHkgZmVhdHVyZXMgdHdvIEdNQUMgZGV2aWNlcyBuYW1lZAo+IEdN
QUMxLzIsIHRoYXQgYXJlIGJhc2VkIG9uIFN5bm9wc3lzIGNvcmVzLiBHTUFDMSBpcyBjb25uZWN0
ZWQgdG8gYQo+IFJHTUlJL1JNSUkgY29udmVydGVyIHRoYXQgaXMgYWxyZWFkeSBkZXNjcmliZWQg
aW4gdGhpcyBkZXZpY2UgdHJlZS4KPgo+IFNpZ25lZC1vZmYtYnk6ICJDbMOpbWVudCBMw6lnZXIi
IDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+IFtyZ2FudG9pczogY29tbWl0IGxvZ10KPiBT
aWduZWQtb2ZmLWJ5OiBSb21haW4gR2FudG9pcyA8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+
CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDZnMDMyLmR0c2kKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9yZW5lc2FzL3I5YTA2
ZzAzMi5kdHNpCj4gQEAgLTMxNiw2ICszMTYsMjUgQEAgZG1hMTogZG1hLWNvbnRyb2xsZXJANDAx
MDUwMDAgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEtd2lkdGggPSA8OD47Cj4gICAg
ICAgICAgICAgICAgIH07Cj4KPiArICAgICAgICAgICAgICAgZ21hYzE6IGV0aGVybmV0QDQ0MDAw
MDAwIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscjlh
MDZnMDMyLWdtYWMiLCAicmVuZXNhcyxyem4xLWdtYWMiLCAic25wcyxkd21hYyI7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NDQwMDAwMDAgMHgyMDAwPjsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+OwoKVGhlIHN1cnJvdW5kaW5n
ICJzb2MiIG5vZGUgYWxyZWFkeSBzcGVjaWZpZXMgdGhlIGludGVycnVwdCBwYXJlbnQsCnNvIHRo
ZXJlIGlzIG5vIG5lZWQgdG8gcmVwZWF0IHRoYXQuIEkgY291bGQgZml4IHRoYXQgd2hpbGUgYXBw
bHlpbmcKdG8gcmVuZXNhcy1kZXZlbCBmb3IgdjYuMTAsIGJ1dCBpdCBsb29rcyBsaWtlIHRoZXJl
IHdpbGwgYmUgYSB2NCBmb3IKdGhlIHJlc3Qgb2YgdGhlIHNlcmllcyBhbnl3YXk/CgpUaGUgcmVz
dCBMR1RNLCBzbyB3aXRoIHRoZSBhYm92ZSBmaXhlZDoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cgo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzNCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMzYgSVJRX1RZUEVfTEVW
RUxfSElHSD4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJ
IDM1IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVy
cnVwdC1uYW1lcyA9ICJtYWNpcnEiLCAiZXRoX3dha2VfaXJxIiwgImV0aF9scGkiOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmc3lzY3RybCBSOUEwNkcwMzJfSENMS19HTUFD
MD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAic3RtbWFjZXRoIjsK
PiArICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZzeXNjdHJsPjsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBzbnBzLG11bHRpY2FzdC1maWx0ZXItYmlucyA9IDwyNTY+
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNucHMscGVyZmVjdC1maWx0ZXItZW50cmllcyA9
IDwxMjg+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHR4LWZpZm8tZGVwdGggPSA8MjA0OD47
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcngtZmlmby1kZXB0aCA9IDw0MDk2PjsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBwY3MtaGFuZGxlID0gPCZtaWlfY29udjE+Owo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKyAgICAgICAgICAgICAgIH07
Cj4gKwo+ICAgICAgICAgICAgICAgICBnbWFjMjogZXRoZXJuZXRANDQwMDIwMDAgewo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwNmcwMzItZ21hYyIs
ICJyZW5lc2FzLHJ6bjEtZ21hYyIsICJzbnBzLGR3bWFjIjsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHg0NDAwMjAwMCAweDIwMDA+Owo+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoK
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
