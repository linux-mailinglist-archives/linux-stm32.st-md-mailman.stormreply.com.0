Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E88B4481A
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 23:11:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D031C36B2B;
	Thu,  4 Sep 2025 21:11:01 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E480C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 21:11:00 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3df2f4aedc7so889365f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Sep 2025 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757020259; x=1757625059;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jAUp29zeM6Eea+iEGcle/fQhECh+9aNVpzcpnyZ4uZ4=;
 b=WTGzMnegQbIgQDMW3asI1ElXOZarezPQ9+qE0stQdszmyWi0/z3gri7uaGG9aAzlFl
 Osiq5vizwXyWFoq64ecA3Y9bcccyYeYghYt3AaG206roG8Xd+WHp55NiJ8O08ftYd3e6
 Z2S8d+yjmrz7KiS42rwcUGQ6mJXRyfOa+6maY4eavx0px6xpWqFZs/tqPKvgPXSKpJyk
 i0zsQgDtu3rSOyM6XXtEbWmzxogyOIha617jpMTB3AqWQEjgq6P+mIYKCIGgBNeiHYm5
 FhuvO24qaoo/Zj9iIdH/8W/PeyWCI3rjcEGMwyzQe3RjsvuT0Bp9Ywf8mROkJrsfS00p
 xKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757020259; x=1757625059;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jAUp29zeM6Eea+iEGcle/fQhECh+9aNVpzcpnyZ4uZ4=;
 b=EoWoyp3pHLIRoxD2+2myOfer3IwT0PH2efF/iN5awt+Zd8wqlt0rKFcsu9XK4A/WFq
 Wr+CCFAiWwt8AKLV7uS7icb6yxvu3Ft0pZQnAGvkx5lLRL9G9N+UBiclNd2DnUP/nj/3
 Of0K0tUqAZVP/QwFFDhfuBdDpAmKfHMwMz3VyVlK7Z4sgDjjnauGvXhk5yVKCRuiQ9j3
 hD2j/kO02Qc2pn9EbKKNGzYsxBLxa8L6Qn/q388rIwJxBlA8u2KY8BtbJFYDdVSKCVTV
 gb8KQLbrRd4y07p06ELUr2r4lpN65HDwinzVy3X0LkTP1iARXRTIGtNbbYUXMmCdHgLU
 QaLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWniiTntSKPaztOftpGuhc9IjcaDIFAK2pqE6DvvOOBPMo3DPpsIIs1zhuy6LwRr5TLNv3+gJIBfOBxKg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxmQzdyM4GWITbL989gTn03yXCvK3pjYs2n9hDeXK1w9YgTk9yy
 +xSQ5BSUzD8S1dzMSY4LH8kbuDyRBjlKcruXwFEbm65P4/U+tB6h8y7Rhd37m2Xowoz5YvOJ2zx
 MMxb0ug7IodM6H/e++OoWA3LjW1mY3M8=
X-Gm-Gg: ASbGncvjvpLlNuHNIETum7jrMBdHwIqEDj6DZpyI4L1+gqKX1Fqm1Py1e1jcle748eA
 fDu4yyWjY0X0bKmMZ9XEEc8JUdPJIrPVsOOYKmPb2cwY/eev7cljQ5e1LAMVpF1xWy9ZedeZrur
 pRxRznJDHCTGvj0lFTXO06zvPTdHYcaRJsPnGUqJO4yXpvDQl4BRvOPQ39iuu61M0dP58cLp4ue
 bK/7vJmh1JFhS8zcDG/ZXGFBRnzQAxkwvj7Tskg
X-Google-Smtp-Source: AGHT+IFl5pt+oDPr0Ohssl2A7YuW3oT77c4wgZ9dmvatNAp/vfqg8+n2yH7G5lllCD1SADyzzMeQZBHdc0g8MZ6xLVk=
X-Received: by 2002:a05:6000:2889:b0:3e3:f89:ea31 with SMTP id
 ffacd0b85a97d-3e30f89f5f4mr720584f8f.61.1757020259089; Thu, 04 Sep 2025
 14:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
In-Reply-To: <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 4 Sep 2025 22:10:32 +0100
X-Gm-Features: Ac12FXzTh_QwLSBZNVL4Qmae4bCfLKKdSn-hnwmDHrHtfF7DVr842_KM4NBa2lw
Message-ID: <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac:
 dwmac-renesas-gbeth: Use OF data for configuration
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

SGkgUnVzc2VsbCwKCk9uIFRodSwgU2VwIDQsIDIwMjUgYXQgOTo0OeKAr1BNIFJ1c3NlbGwgS2lu
ZyAoT3JhY2xlKQo8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFRodSwgU2Vw
IDA0LCAyMDI1IGF0IDA5OjM5OjQ4UE0gKzAxMDAsIFByYWJoYWthciB3cm90ZToKPiA+ICAgICAg
IHBsYXRfZGF0LT5pbml0ID0gcmVuZXNhc19nYmV0aF9pbml0Owo+ID4gICAgICAgcGxhdF9kYXQt
PmV4aXQgPSByZW5lc2FzX2diZXRoX2V4aXQ7Cj4gPiAtICAgICBwbGF0X2RhdC0+ZmxhZ3MgfD0g
U1RNTUFDX0ZMQUdfSFdUU1RBTVBfQ09SUkVDVF9MQVRFTkNZIHwKPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICBTVE1NQUNfRkxBR19FTl9UWF9MUElfQ0xLX1BIWV9DQVAgfAo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgIFNUTU1BQ19GTEFHX1NQSF9ESVNBQkxFOwo+ID4gKyAgICAgcGxh
dF9kYXQtPmZsYWdzIHw9IGdiZXRoLT5vZl9kYXRhLT5zdG1tYWNfZmxhZ3M7Cj4KPiBZb3UgaW5j
bHVkZSB0aGUgZmlyc3QgdHdvIGZsYWdzIGluIHlvdXIgbmV3IGRldmljZS4gSSB3b3VsZCBsaWtl
IHRvIHNlZQo+IGF0IGxlYXN0IFNUTU1BQ19GTEFHX0VOX1RYX0xQSV9DTEtfUEhZX0NBUCBhbHdh
eXMgYmVpbmcgc2V0LiBUaGUgb25seQo+IHJlYXNvbiB3ZSBoYXZlIHRoZSBTVE1NQUNfRkxBR19F
Tl9UWF9MUElfQ0xLX1BIWV9DQVAgZmxhZyBpcyB0byBhdm9pZAo+IGNoYW5naW5nIGV4aXN0aW5n
IGJlaGF2aW91ciBhbmQgY2F1c2luZyByZWdyZXNzaW9ucy4gTmV3IHN0dWZmIHNob3VsZAo+IGFs
d2F5cyBzZXQgdGhpcy4KPgpNZSBjb25mdXNlZCwgU1RNTUFDX0ZMQUdfRU5fVFhfTFBJX0NMS19Q
SFlfQ0FQIGZsYWcgaXMgc2V0IGluIHRoZSBuZXcKZGV2aWNlIFswXS4gVGhlIHJlYXNvbiBTVE1N
QUNfRkxBR19TUEhfRElTQUJMRSBmbGFnIGJlaW5nIGRyb3BwZWQgaW4KdGhlIG5ldyBkZXZpY2Ug
aXMgU1BIRU49MSBpbiBNQUMgSFcgZmVhdHVyZSByZWcgZm9yIHRoZSBuZXcgZGV2aWNlLgoKWzBd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDkwNDIwMzk0OS4yOTIwNjYtNC1wcmFi
aGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20vCgpDaGVlcnMsClByYWJoYWthcgoK
PiBJZiB0aGVyZSBpcyBhIHJlYXNvbiBub3QgdG8gaGF2ZSB0aGlzIHNldCAoZS5nLiwgUENTIGRv
ZXNuJ3Qgc3VwcG9ydAo+IGl0KSB0aGVuIHdlIG5lZWQgdG8gbWFrZSB0aGF0IGEgUENTIHByb3Bl
cnR5IGFuZCBleHRlbmQgcGh5bGluaydzIEVFRQo+IHN1cHBvcnQuIElmIHRoZXJlJ3Mgc29tZXRo
aW5nIHdyb25nIGluIHRoZSBzZXR1cCB0aGF0IHN0bW1hYyBkb2VzIGZvcgo+IEVFRSwgdGhlbiBJ
J2QgbGlrZSB0byBoZWFyIGFib3V0IGl0IGFzIHdlbGwuCj4KPiBUaGFua3MuCj4KPiAtLQo+IFJN
SydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9w
YXRjaGVzLwo+IEZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29u
bmVjdGl2aXR5IGF0IGxhc3QhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
