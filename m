Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF457738ED
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 10:13:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D92CDC6B469;
	Tue,  8 Aug 2023 08:13:23 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 900CDC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 08:13:21 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-48719fc6b18so1385318e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Aug 2023 01:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691482400; x=1692087200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFaCPHe174CVGEE8zH9Ahbm1V8fDZn/hHt9ByI29bII=;
 b=b7lNGIIZXd/EFcjJpVW2E2P+l1aIKz+lwDeFSEb3JHyGWqEhy+Jg7sXhU+qOh/XChH
 Hq7KgGXXyxOLwrEI6NLq8l0Trd19uJoS4OYJqLwW/Qr4pvJBWohWe63suIWIM9OMLSPw
 Af7bWf8Xxm9MdiE0oo2eqQk7XlQVjqHDhG1Elr3XHN4YbWYVjHhi/Dn4UVaFsSsmMEU8
 lpsc7JhaS0Ceg7bWIwa9m5PVUtC7AFvm9ycUrufUgj/P+XHn4mF1RoceXIvby/8Xu1pC
 enxahs77UGgCRjCFQIis8W6Zj3yu92v3FLmqIq+ts6MhdeEXjNp6Ia2lpXTeHsv6gooL
 cWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691482400; x=1692087200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFaCPHe174CVGEE8zH9Ahbm1V8fDZn/hHt9ByI29bII=;
 b=gCAxB729cnAS01UUpWEVk/x+njQur4maotb/U5VZ9X52E/DtGGTU1U9SIpFWd2n9g7
 oG3zdeGpLYMlE5Z1vrDCbitw1M6seWmRrWLQGtVzZi0VKyLYp72yf0pN7X/i31eVOoXc
 DkyeTeHsqmQhpJ8MqoKELGMjwOXDmARYbiI2WyUsGLh0pxMUbEyNlCpYJmk1tX14L44b
 uuW+eWkAuUHgAo6Nx6BPXML+MTHWoMU2AvQ91gEsnJBkxYzE+hzaB28315AA8u4j2klv
 FjCCcyDaOxZeoD6jQrZ8J7EBhyT+xxONjBibYXHGSUzpr66W0jhfjnGrk+/legBbneWj
 3JBQ==
X-Gm-Message-State: AOJu0Yzmc/39WY9gHiNULBci+iQ5Nlte32sxyMuTVhuAnFlHBDPIJoT7
 CwYIV5SY3dVOMfcqc+uiPOG1O2ZCsiSH/lbzcnWpNA==
X-Google-Smtp-Source: AGHT+IHJBjMCQdov9YPeDDL3pj/hzheBYljv6pXkkWjpc+VqMX3zeR6MAG9XffwSYmTvNmQRvGVPCfEVk5oblz/k9hQ=
X-Received: by 2002:a67:d095:0:b0:444:e9a0:13f7 with SMTP id
 s21-20020a67d095000000b00444e9a013f7mr5544633vsi.5.1691482400513; Tue, 08 Aug
 2023 01:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230807193102.6374-1-brgl@bgdev.pl>
 <54421791-75fa-4ed3-8432-e21184556cde@lunn.ch>
In-Reply-To: <54421791-75fa-4ed3-8432-e21184556cde@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Aug 2023 10:13:09 +0200
Message-ID: <CAMRc=Mc6COaxM6GExHF2M+=v2TBpz87RciAv=9kHr41HkjQhCg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alex Elder <elder@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH 0/2] net: stmmac: allow sharing MDIO lines
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

T24gTW9uLCBBdWcgNywgMjAyMyBhdCA5OjUw4oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDA3LCAyMDIzIGF0IDA5OjMxOjAwUE0gKzAyMDAs
IEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPgo+ID4gVHdvIE1BQ3MgbWF5IHNo
YXJlIE1ESU8gbGluZXMgdG8gdGhlIFBIWXMuIExldCdzIGFsbG93IHRoYXQgaW4gdGhlCj4gPiBz
dG1tYWMgZHJpdmVyIGJ5IHByb3ZpZGluZyBhIG5ldyBkZXZpY2UtdHJlZSBwcm9wZXJ0eSBhbGxv
d2luZyBvbmUgTUFDCj4gPiBub2RlIHRvIHJlZmVyZW5jZSB0aGUgTURJTyBidXMgZGVmaW5lZCBv
biBhIHNlY29uZCBNQUMgbm9kZS4KPgo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhpcyBpcyBu
ZWVkZWQuIHBoeS1oYW5kbGUgY2FuIHBvaW50IHRvIGEgcGh5Cj4gb24gYW55IE1ESU8gYnVzLiBT
byBpdCBpcyBubyBwcm9ibGVtIGZvciBvbmUgTUFDIHRvIHBvaW50IHRvIHRoZSBvdGhlcgo+IE1B
Q3MgTURJTyBidXMgYXMgaXMuCj4KPiBZb3UgZG8gc29tZXRpbWVzIGdldCBpbnRvIG9yZGVyaW5n
IHByb2JsZW1zLCBlc3BlY2lhbGx5IGlmIE1BQzAgaXMKPiBwb2ludGluZyB0byBhIFBIWSBvbiBN
QUMxIE1ESU8gYnVzLiBCdXQgTUFDMCBzaG91bGQgZ2V0IGEKPiAtRVBST0JFX0RFRkVSLCBNQUMx
IHRoZW4gcHJvYmVzLCBjcmVhdGluZyBpdHMgTURJTyBidXMgYW5kIHRoZSB0d28KPiBQSFlzIG9u
IGl0LCBhbmQgdGhlbiBsYXRlciBNQUMwIGlzIHByb2JlcyBhZ2FpbiBhbmQgaXMgc3VjY2Vzc2Z1
bC4KPgo+ICAgICAgQW5kcmV3CgpPayBzbyB1cG9uIHNvbWUgZnVydGhlciBpbnZlc3RpZ2F0aW9u
LCB0aGUgYWN0dWFsIGN1bHByaXQgaXMgaW4gc3RtbWFjCnBsYXRmb3JtIGNvZGUgLSBpdCBhbHdh
eXMgdHJpZXMgdG8gcmVnaXN0ZXIgYW4gTURJTyBidXMgLSBpbmRlcGVuZGVudApvZiB3aGV0aGVy
IHRoZXJlIGlzIGFuIGFjdHVhbCBtZGlvIGNoaWxkIG5vZGUgLSB1bmxlc3MgdGhlIE1BQyBpcwpt
YXJrZWQgZXhwbGljaXRseSBhcyBoYXZpbmcgYSBmaXhlZC1saW5rLgoKV2hlbiBJIGZpeGVkIHRo
YXQsIE1BQzEncyBwcm9iZSBpcyBjb3JyZWN0bHkgZGVmZXJyZWQgdW50aWwgTUFDMCBoYXMKY3Jl
YXRlZCB0aGUgTURJTyBidXMuCgpFdmVuIHNvLCBpc24ndCBpdCB1c2VmdWwgdG8gYWN0dWFsbHkg
cmVmZXJlbmNlIHRoZSBzaGFyZWQgTURJTyBidXMgaW4gc29tZSB3YXk/CgpJZiB0aGUgc2NoZW1h
dGljcyBsb29rIHNvbWV0aGluZyBsaWtlIHRoaXM6CgotLS0tLS0tLSAgICAgICAgICAgLS0tLS0t
LQp8IE1BQzAgfC0tTURJTy0tLS0tfCBQSFkgfAotLS0tLS0tLSB8ICAgICB8ICAgLS0tLS0tLQog
ICAgICAgICB8ICAgICB8Ci0tLS0tLS0tIHwgICAgIHwgICAtLS0tLS0tCnwgTUFDMSB8LS0gICAg
IC0tLS18IFBIWSB8Ci0tLS0tLS0tICAgICAgICAgICAtLS0tLS0tCgpUaGVuIGl0IHdvdWxkIG1h
a2Ugc2Vuc2UgdG8gbW9kZWwgaXQgb24gdGhlIGRldmljZSB0cmVlPwoKQW55d2F5LCB0aGlzIGNh
biBiZSBkaXNjdXNzZWQgbGF0ZXIsIEkgd2lsbCBkcm9wIHRoaXMgZm9yIG5vdyBhbmQgc2VuZAph
IGZpeCBmb3Igc3RtbWFjIG1kaW8gY29kZSBpbnN0ZWFkIHRvIGdldCB0aGlzIHVwc3RyZWFtLgoK
QmFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
