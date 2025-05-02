Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD1DAA76BE
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 18:10:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBF3FC78F7D;
	Fri,  2 May 2025 16:10:19 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F5E4C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 16:10:17 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39ee651e419so1032682f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746202217; x=1746807017;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ggn4Te8iAQAPapgsDrGJ7UYxvxj7+JoOGyy8tQVU2ws=;
 b=KnLJD2B6gIcGeRmljS8PdaKDhpH5n7ZzfFw3x2UnBG4RNYVUFdwbhCgycann9C3wIQ
 bCagmr+IbHEIocmCiSEpPLrrI0rKMHnMs6AZsGzuGJ/FjlFlt+cn4RCdZeEz1ZwiR4Lx
 c8ue6krHNWCfkk5YNYAtR7UtiJV2FWUWJw6P60vskOcv55BnRlD+x63VwhtNwYhA8lIw
 TRdr1JiDwUSZonybf6g+iYidug5EhQXnXX74K14BJxk8wggKdLBDWtuX+6CT2BQvIC+6
 KdsZAcB8fb8IqfH0ZH00/lF4ddFFjEQnJiyFgMUvLI52UMxdZDwoYmtqso49tNd1As4q
 jH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746202217; x=1746807017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ggn4Te8iAQAPapgsDrGJ7UYxvxj7+JoOGyy8tQVU2ws=;
 b=jKVzozzQlgjTAGHgeWGa5xzivU97SW0sIgfjHM3PddaVoOzyNmQinhy7aaoX9f0moD
 ms+HMbd01CILFgQutKUyIBRgUhHjIlM6597Kx3cyhbft6iV/KrWDhGYwW1j1wsORMStc
 a9fJDiTnV7tbd0EcxNr7KTgOpl+vy0OjUP1cc8OGQlBT7yv0Bt/vSlbW4PT5cpsXZkxR
 UdJTmpbf5w8lItMZPWkEX9Sh5PTr3Tg21dY9oD/m4SfcWJsdgrK6OZ6uAkHp2rCr+c6d
 apGmVjczPhP1NlWmLWgFKK2lgnUw/Ogxi/c14eLGTnYWAq6tvTM4oes4BCp0npQHjjYh
 O5HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlfc1KImRdGwsYyVNHYodEJDfwWD8IIHJPwK+auF9AY/YSKQIB/5F9yf7cl0vHSOO0IO3h4hEKMUVSLw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwKpa5cSYAvI+LDonbM1R7rjRnDZV1YaUBdg59+UWrwS3oyqIGd
 efuRaKr/uHb3q7mK7e18ncGSCvURELZlSA2uGCxLGL25/YRYJBMYUnqTMzd6NtVWWG/e7xAHGfc
 tZ0h1GzjsJDYitbAAJyah4g6hlBg=
X-Gm-Gg: ASbGnctBj58/NJ/KVbAibCeXlteWSZXYvHSmUnF7/D+Xwit6Ukvum+Q/vVHE2a2TvJi
 RaQ7hekJmNSCRuIyqiv/F8gI9p4yr/bL6WIygiUm+vBdijPrunAAgL8ri7sGu8bR0ZWlRDkcDwF
 uDAL12Uu2zrFsPLLRGironplgWB7soKcFJ6f0=
X-Google-Smtp-Source: AGHT+IGVezP+3T30En3pYmcMFWwOdEcdSVzIy5+rzYKoypmb6ZyPfJHRenADSTshAQ6cPwOLymhczd+ONEyDbXDFLLw=
X-Received: by 2002:a05:6000:184e:b0:3a0:9050:cd03 with SMTP id
 ffacd0b85a97d-3a099ae91a2mr2919909f8f.47.1746202217130; Fri, 02 May 2025
 09:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
In-Reply-To: <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 17:09:51 +0100
X-Gm-Features: ATxdqUGhCj9n_7XiK5shDvDJ2filmwcJeQUHGkzDLBKjTowp5A8Gn9P4TEI7_vQ
Message-ID: <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] clocksource/drivers/renesas-ostm:
 Enable reprobe for all ARM64 SoCs
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

SGkgR2VlcnQsCgpPbiBGcmksIE1heSAyLCAyMDI1IGF0IDM6MzfigK9QTSBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IEhpIFByYWJoYWthciwKPgo+
IE9uIEZyaSwgMiBNYXkgMjAyNSBhdCAxNDo0NywgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3Nlbmdn
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPgo+ID4gQ2hhbmdlIHRoZSBPU1RNIGRyaXZl
cidzIHByb2JlIGNvbmRpdGlvbiB0byBgQ09ORklHX0FSTTY0YCBzbyB0aGF0IHRoZQo+ID4gcGxh
dGZvcm0gZHJpdmVyIHdpbGwgZGVmZXIgYW5kIHJlcHJvYmUgb24gYW55IEFSTTY0IFJlbmVzYXMg
U29DIG9uY2UgaXRzCj4gPiByZXNldCBjb250cm9sbGVyIGlzIGF2YWlsYWJsZS4gUHJldmlvdXNs
eSwgb25seSBSWi9HMkwgYW5kIFJaL1YySChQKQo+ID4gd2VyZSBjb3ZlcmVkLgo+ID4KPiA+IEJ5
IG1hdGNoaW5nIG9uIGBDT05GSUdfQVJNNjRgLCB0aGlzIGF2b2lkcyBhZGRpbmcgYSBuZXcgY29u
ZmlnIGVudHJ5Cj4gPiBmb3IgZWFjaCBmdXR1cmUgQVJNNjQgUmVuZXNhcyBTb0Mgd2l0aCBPU1RN
IElQLiBSWi9BMSBhbmQgUlovQTIgKEFSTTMyKQo+ID4gYXJlIHVuYWZmZWN0ZWQtdGhleSBzdGls
bCB1c2UgT1NUTSBidXQgZG8gbm90IGRlZmluZSBhIHJlc2V0cyBwcm9wZXJ0eSwKPiA+IHNvIHRo
ZSBkZWZlcnJlZCByZXByb2JlIG1lY2hhbmlzbSBpcyB1bm5lY2Vzc2FyeS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+Cj4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4KPiA+IC0tLQo+ID4gSGkgR2VlcnQsCj4gPiBJJ3ZlIHJlc3RvcmVkIHRo
ZSBSZXZpZXdlZC1ieSB0YWcgZnJvbSB2MSB3aXRoIHlvdXIgc3VnZ2VzdGlvbnMgYXBwbGllZC4K
PiA+IEkgaG9wZSB5b3UncmUgb2theSB3aXRoIHRoaXMuCj4gPiBDaGVlcnMsIFByYWJoYWthcgo+
ID4KPiA+IHYxLT52MjoKPiA+IC0gSW5zdGVhZCBvZiBhZGRpbmcgY29uZmlnIGZvciBuZXcgU29D
LCBjaGFuZ2VkIHRoZSBwcm9iZSBjb25kaXRpb24gdG8KPiA+ICAgYENPTkZJR19BUk02NGAuCj4g
PiAtIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UKPiA+IC0gQWRkZWQgYSBSZXZpZXdlZC1ieSB0YWcg
ZnJvbSBHZWVydC4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3Rt
LmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3Rt
LmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3JlbmVzYXMtb3N0bS5jCj4gPiBpbmRleCAzZmNiZDAy
YjI0ODMuLjZhNTc4NWY5YzljMSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2Uv
cmVuZXNhcy1vc3RtLmMKPiA+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3Rt
LmMKPiA+IEBAIC0yMjUsNyArMjI1LDcgQEAgc3RhdGljIGludCBfX2luaXQgb3N0bV9pbml0KHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gPgo+ID4gIFRJTUVSX09GX0RFQ0xBUkUob3N0bSwgInJl
bmVzYXMsb3N0bSIsIG9zdG1faW5pdCk7Cj4gPgo+ID4gLSNpZiBkZWZpbmVkKENPTkZJR19BUkNI
X1JaRzJMKSB8fCBkZWZpbmVkKENPTkZJR19BUkNIX1I5QTA5RzA1NykKPiA+ICsjaWYgZGVmaW5l
ZChDT05GSUdfQVJNNjQpCj4KPiBTb3JyeSwgSSd2ZSBqdXN0IHJlYWxpemVkIFJaL0ZpdmUgYWxz
byB3YW50cyB0aGlzLgo+Ck91Y2gsIEkgbWlzc2VkIHRoYXQgdG9vLgoKPiAiI2lmbmRlZiBDT05G
SUdfQVJNIj8KPgpJbSB3b25kZXJpbmcgd2lsbCBpdCBoYXJtIGlmIHdlIGhhdmUgaXQgZW5hYmxl
ZCBmb3IgQVJNIHRvbyAoSSBkb250CmhhdmUgUlovQXggdG8gdGVzdCBpdCk/CgpDaGVlcnMsClBy
YWJoYWthcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
