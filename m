Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA879AC5B46
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 22:16:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D1E6C36B19;
	Tue, 27 May 2025 20:16:40 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77E54C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 20:16:38 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-52d9a275c27so2288567e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 13:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748376997; x=1748981797;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGqF7J9hCkWnDPN2ywa1l4c3bPKUIJ2p39BiR4jVq3s=;
 b=fM6s6B53CDXrhaoASqM/UmkUiRO/P97uG2qqsef2GX2WzKjAetp/G+7zL26X1/u54c
 Zt/IczfJSDo1YLiE1zUFY6HAkFLyFZRnSFhoEprD3q4yLuGjRU/vLQ9V90b3tcLu8MVh
 LFI3NXbmQv+caqB4UETJgUsBn48bsj/cJIqAAEvfesfkvlnPVHVQ1cfMhHgOviNnAvdo
 ub6AhtecoW2tYIZDEaVurTryYL+l2QlPHP1CnWK32ntPPLnpTzBVxznsxDImaYODXrgy
 OzsAJ5RBy0MuupT+A0KM2HzlMQZsK+PSy+wMVPXvktbA/9kz8MaY+1v+CW9CVjnje5Wk
 ouIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748376997; x=1748981797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FGqF7J9hCkWnDPN2ywa1l4c3bPKUIJ2p39BiR4jVq3s=;
 b=Qkb+kNo8SyoerIHRU9s1UIN7FnEkZwOY7sP1rBnWhDWku7A64GvhLnMcTEzM2+g9wc
 FCjX8UNJ0rsdyJBSuk4fgoWcph1EFbjb7k2FFqiFVjQYDolG2RvKc9IbNaHzX7/Polxi
 e0gHeCLz4+NUTV0eQ7pZz3hDqaN6DpsL7kgUVh0IPkGsd7dqN2YjBgxahLJwkNvXChey
 tnrzl04NDfrUxefCpa+KnbKq8ZuOiT4S6y+rCzYX0qsS0zyu5sQbvcyIQat0VrAykiDw
 Vq/xn1X0hG+gpmZiMshfM8twGtXZaEyAUmVuLUYk0ypotD0M57w4Ez6LMbz5Ff0tqKL7
 Pq8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIC8UPOXXQgTl/iNZrWu9arH1rGofrkoKviXdSM7R8t0HIeJnJstjn6Rul7VlXkC7ggy7Pdk35Hg1oKw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxeqkQl5pAFQm6/xrDZ6IAe5sVsb50l873hUw69IVEib6BoAT6E
 VBXfFOzFh3rbqqP55qmg+rwQLQ2w6JRlNOMzLWy0TuiTwP+iTBZBZYVOQMEfh2inYfUPQzAt9C6
 yTFbbRFfmREaCnizoJt4gUwgUu/7YCUo=
X-Gm-Gg: ASbGnct8NfK/JCXzbiFdcl43RThb3dVohiaZz9XAiNU3lPY2bqa2neSZmPk83q2mRxm
 iFDQU8kpFCzcijNa33yMqpUDxbrNI12wk3LwzMHIKgT8tj5v9zmG9pu0COPf/9Q0yMMWZX2JWQu
 3QJ7i5ck270cwjdcnvt/ft3vDqM49EGZrUOQ==
X-Google-Smtp-Source: AGHT+IETycDNDAJyxv3VLNHb+TIrTja35S1519qoE+Q/rK9pDA/sheHZNaSXrhFkGJah8hc3P6ff0SwCLKvwf9KpQ8o=
X-Received: by 2002:a05:6122:3d0d:b0:52f:204d:4752 with SMTP id
 71dfb90a1353d-52f2c5ca414mr12169837e0c.11.1748376997259; Tue, 27 May 2025
 13:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
In-Reply-To: <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 14:16:26 -0600
X-Gm-Features: AX0GCFv4cap4ZOGqZcta-siDQMwW0SvAemE-pnT7ig2Oyj0apu2kFeIEsXbam6w
Message-ID: <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
 explicitly select PHY device
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMjowMuKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCAwMToyMToyMVBNIC0wNjAw
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5IDI3LCAyMDI1IGF0IDE6MTTi
gK9QTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBU
dWUsIE1heSAyNywgMjAyNSBhdCAxMTo1NTo1NEFNIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCB3cm90
ZToKPiA+ID4gPiBTb21lIGRldmljZXMgbGlrZSB0aGUgQWxsd2lubmVyIEg2MTYgbmVlZCB0aGUg
YWJpbGl0eSB0byBzZWxlY3QgYSBwaHkKPiA+ID4gPiBpbiBjYXNlcyB3aGVyZSBtdWx0aXBsZSBQ
SFkncyBtYXkgYmUgcHJlc2VudCBpbiBhIGRldmljZSB0cmVlIGR1ZSB0bwo+ID4gPiA+IG5lZWRp
bmcgdGhlIGFiaWxpdHkgdG8gc3VwcG9ydCBtdWx0aXBsZSBTb0MgdmFyaWFudHMgd2l0aCBydW50
aW1lCj4gPiA+ID4gUEhZIHNlbGVjdGlvbi4KPiA+ID4KPiA+ID4gSSdtIG5vdCBjb252aW5jZWQg
YWJvdXQgdGhpcyB5ZXQuIEFzIGZhciBhcyBpIHNlZSwgaXQgaXMgZGlmZmVyZW50Cj4gPiA+IHZh
cmlhbnRzIG9mIHRoZSBINjE2LiBUaGV5IHNob3VsZCBoYXZlIGRpZmZlcmVudCBjb21wYXRpYmxl
cywgc2luY2UKPiA+ID4gdGhleSBhcmUgbm90IGFjdHVhbGx5IGNvbXBhdGlibGUsIGFuZCB5b3Ug
c2hvdWxkIGhhdmUgZGlmZmVyZW50IERUCj4gPiA+IGRlc2NyaXB0aW9ucy4gU28geW91IGRvbid0
IG5lZWQgcnVudGltZSBQSFkgc2VsZWN0aW9uLgo+ID4KPiA+IERpZmZlcmVudCBjb21wYXRpYmxl
cyBmb3Igd2hhdCBzcGVjaWZpY2FsbHk/IEkgbWVhbiB0aGUgUEhZIGNvbXBhdGlibGVzCj4gPiBh
cmUganVzdCB0aGUgZ2VuZXJpYyAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiIGNvbXBhdGli
bGVzLgo+Cj4gWW91IGF0IGxlYXN0IGhhdmUgYSBkaWZmZXJlbnQgTVREIGRldmljZXMsIGV4cG9y
dGluZyBkaWZmZXJlbnQKPiBjbG9ja3MvUFdNL1Jlc2V0IGNvbnRyb2xsZXJzLgoKSSBhc3N1bWUg
eW91IG1lYW4gTUZEIG5vdCBNVEQgZGV2aWNlcyBoZXJlLgoKPiBUaGF0IHNob3VsZCBoYXZlIGRp
ZmZlcmVudCBjb21wYXRpYmxlcywKPiBzaW5jZSB0aGV5IGFyZSBub3QgY29tcGF0aWJsZS4KCkkg
YWdyZWUgd2l0aCB0aGF0IGZvciB0aGUgTUZEIGRldmljZXMsIGJ1dCB3ZSBzdGlsbCBuZWVkIGEg
d2F5CnRvIGNob29zZSB0aGUgY29ycmVjdCBvbmUgYXQgcnVudGltZSBvdGhlcndpc2UgaW5pdGlh
bGl6YXRpb24Kd29uJ3Qgc3VjY2VlZCBBRkFJVS4KCj4gWW91IHRoZW4gbmVlZCBwaGFuZGxlcyB0
byB0aGVzZQo+IGRpZmZlcmVudCBjbG9ja3MvUFdNL1Jlc2V0IGNvbnRyb2xsZXJzLCBhbmQgZm9y
IG9uZSBvZiB0aGUgUEhZcyB5b3UKPiBuZWVkIGEgcGhhbmRsZSB0byB0aGUgSTJDIGJ1cywgc28g
dGhlIFBIWSBkcml2ZXIgY2FuIGRvIHRoZQo+IGluaXRpYWxpc2F0aW9uLgoKV2VsbCB0aGlzIHdv
dWxkIGJlIGFuIGluZGlyZWN0IHJlZmVyZW5jZSB0byB0aGUgaTJjIGJ1cyByaWdodD8KSSBtZWFu
IHRoZSBwaHkgd291bGQgcmVmZXJlbmNlIGEgcmVzZXQgY29udHJvbGxlciB3aGljaCB3b3VsZApp
biB0dXJuIHJlZmVyZW5jZSB0aGUgSTJDIGJ1cyByaWdodD8KCj4gU28gaSB0aGluayBpbiB0aGUg
ZW5kIHlvdSBrbm93IHdoYXQgUEhZIHlvdSBoYXZlIG9uCj4gdGhlIGJvYXJkLCBzbyB0aGVyZSBp
cyBubyBuZWVkIHRvIGRvIHJ1bnRpbWUgZGV0ZWN0aW9uLgoKQnV0IHdlIHN0aWxsIG5lZWQgdG8g
c29tZWhvdyBydW50aW1lIHNlbGVjdCB0aGUgY29ycmVjdCBwaHkKd2hpY2ggaW4gdHVybiByZWZl
cmVuY2VzIHRoZSBwaGFuZGxlIHRvIHRoZSBjb3JyZWN0IHJlc2V0CmNvbnRyb2xsZXIgcmlnaHQ/
Cgo+IFdoYXQgeW91IG1pZ2h0IHdhbnQgaG93ZXZlciBpcyB0byB2YWxpZGF0ZSB0aGUgTVREIGRl
dmljZSBjb21wYXRpYmxlCj4gYWdhaW5zdCB0aGUgZnVzZSBhbmQgcmV0dXJuIC1FTk9ERVYgaWYg
dGhlIGNvbXBhdGlibGUgaXMgd3JvbmcgZm9yIHRoZQo+IGZ1c2UuCgpTdXJlLCB0aGF0IG1heSBt
YWtlIHNlbnNlIHRvIGRvIGFzIHdlbGwsIGJ1dCBJIHN0aWxsIGRvbid0IHNlZQpob3cgdGhhdCBp
bXBhY3RzIHRoZSBuZWVkIHRvIHJ1bnRpbWUgc2VsZWN0IHRoZSBQSFkgd2hpY2gKaXMgY29uZmln
dXJlZCBmb3IgdGhlIGNvcnJlY3QgTUZELgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
