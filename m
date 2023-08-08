Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 154FF773ABA
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 16:30:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9375C6B469;
	Tue,  8 Aug 2023 14:30:18 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE648C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 14:30:17 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-4872c3dff53so1043824e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Aug 2023 07:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691505016; x=1692109816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KmZq8plralUfhUCeO0zuZ8rV58wpzJBRG27vY2vs6cs=;
 b=YIJPT+QrwWPX5rZEBgMPITZAQZ7EHFmnZuSkWNaNXERqUdJnEjgg9SrYRWcYMnxrDO
 pg7DIz/GYsatoDdwm6GAav463G7m9QBcFrAiC9KLfLihId/31HGbV/xCKfPRinXlWRjn
 0J0tPTJ99Ad0AmyWdWKOUKJJvOJy+s9/hyLn630AZsnMPzBoeNCCFRn5gefD/kZjeO5+
 U3YgdlmQEJcfYqKWllOqPKSzMCtbL7SM0pA54F4BUuLRZjsp8Q+7wAKPgRuXIQKYho2V
 6FBFMcZG6421y+qWjX06IYMxTZyt/psfR6gSstn/jTYazQ+8pztC4twOqLY8ziHpgWVy
 kIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691505016; x=1692109816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KmZq8plralUfhUCeO0zuZ8rV58wpzJBRG27vY2vs6cs=;
 b=GpQFALBcYAzMLRB+9utDaL0a6zne1X4VGJ5KBPyJrb46nReC1Q3uf8B6W7yAYmyCHZ
 1cOiGtJtcFGBM9ooOWsvy1bt2cBEQtUWLIGGHwZly2qe3h4BcU1GzwjoestxOUYT/vJ8
 hvzBwL0KjQCP3Jwn0Gdp6yF08shc0kTbjgHxhRALwjuIPkWutu9ikIATprP+XJvzUDj6
 h7UlXJOsFaT/nnx7oBFhvDSENMEfEk4N5w52WFCvBJ7HPnCJBp9bmsfCsi9fOfkM5/pa
 YwKJFKBcpCt3GXn8UM+h3ACY6L6yovXikuNQ3k5E75TgOHhUPR8/9G2j8EZ6kQjB+Pvp
 7hdg==
X-Gm-Message-State: AOJu0Yx5r1zMvGnnBEWJHxlwspbrk7t+DdiV7uC4boC5UoafE0Wx5ggT
 vMHTSbRo/hLS1sTCPhAzJOt5i+vNkbZAd4zPC3zq8Q==
X-Google-Smtp-Source: AGHT+IGKZbzqHtAQeH+ERa/8lc1KwqmrCEauq29EtyhIWFzJmE3Z/R6hI/O84pNycisvdvGnKhmQiTpqB01gZJI0Wxg=
X-Received: by 2002:a1f:bdd1:0:b0:471:8787:2c6c with SMTP id
 n200-20020a1fbdd1000000b0047187872c6cmr4968353vkf.6.1691505016313; Tue, 08
 Aug 2023 07:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230807193102.6374-1-brgl@bgdev.pl>
 <54421791-75fa-4ed3-8432-e21184556cde@lunn.ch>
 <CAMRc=Mc6COaxM6GExHF2M+=v2TBpz87RciAv=9kHr41HkjQhCg@mail.gmail.com>
 <ZNJChfKPkAuhzDCO@shell.armlinux.org.uk>
 <CAMRc=MczKgBFvuEanKu=mERYX-6qf7oUO2S4B53sPc+hrkYqxg@mail.gmail.com>
 <65b53003-23cf-40fa-b9d7-f0dbb45a4cb2@lunn.ch>
In-Reply-To: <65b53003-23cf-40fa-b9d7-f0dbb45a4cb2@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Aug 2023 16:30:05 +0200
Message-ID: <CAMRc=MecYHi=rPaT44kuX_XMog=uwB9imVZknSjnmTBW+fb5WQ@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alex Elder <elder@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCA0OjI14oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+ID4gPiBPbiBUdWUsIEF1ZyAwOCwgMjAyMyBhdCAxMDoxMzowOUFNICsw
MjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiA+IE9rIHNvIHVwb24gc29tZSBm
dXJ0aGVyIGludmVzdGlnYXRpb24sIHRoZSBhY3R1YWwgY3VscHJpdCBpcyBpbiBzdG1tYWMKPiA+
ID4gPiBwbGF0Zm9ybSBjb2RlIC0gaXQgYWx3YXlzIHRyaWVzIHRvIHJlZ2lzdGVyIGFuIE1ESU8g
YnVzIC0gaW5kZXBlbmRlbnQKPiA+ID4gPiBvZiB3aGV0aGVyIHRoZXJlIGlzIGFuIGFjdHVhbCBt
ZGlvIGNoaWxkIG5vZGUgLSB1bmxlc3MgdGhlIE1BQyBpcwo+ID4gPiA+IG1hcmtlZCBleHBsaWNp
dGx5IGFzIGhhdmluZyBhIGZpeGVkLWxpbmsuCj4gPiA+ID4KPiA+ID4gPiBXaGVuIEkgZml4ZWQg
dGhhdCwgTUFDMSdzIHByb2JlIGlzIGNvcnJlY3RseSBkZWZlcnJlZCB1bnRpbCBNQUMwIGhhcwo+
ID4gPiA+IGNyZWF0ZWQgdGhlIE1ESU8gYnVzLgo+ID4gPiA+Cj4gPiA+ID4gRXZlbiBzbywgaXNu
J3QgaXQgdXNlZnVsIHRvIGFjdHVhbGx5IHJlZmVyZW5jZSB0aGUgc2hhcmVkIE1ESU8gYnVzIGlu
IHNvbWUgd2F5Pwo+ID4gPiA+Cj4gPiA+ID4gSWYgdGhlIHNjaGVtYXRpY3MgbG9vayBzb21ldGhp
bmcgbGlrZSB0aGlzOgo+ID4gPiA+Cj4gPiA+ID4gLS0tLS0tLS0gICAgICAgICAgIC0tLS0tLS0K
PiA+ID4gPiB8IE1BQzAgfC0tTURJTy0tLS0tfCBQSFkgfAo+ID4gPiA+IC0tLS0tLS0tIHwgICAg
IHwgICAtLS0tLS0tCj4gPiA+ID4gICAgICAgICAgfCAgICAgfAo+ID4gPiA+IC0tLS0tLS0tIHwg
ICAgIHwgICAtLS0tLS0tCj4gPiA+ID4gfCBNQUMxIHwtLSAgICAgLS0tLXwgUEhZIHwKPiA+ID4g
PiAtLS0tLS0tLSAgICAgICAgICAgLS0tLS0tLQo+ID4gPiA+Cj4gPiA+ID4gVGhlbiBpdCB3b3Vs
ZCBtYWtlIHNlbnNlIHRvIG1vZGVsIGl0IG9uIHRoZSBkZXZpY2UgdHJlZT8KPiA+ID4KPiA+ID4g
U28gSSB0aGluayB3aGF0IHlvdSdyZSBzYXlpbmcgaXMgdGhhdCBNQUMwIGFuZCBNQUMxJ3MgaGF2
ZSBNRElPIGJ1cwo+ID4gPiBtYXN0ZXJzLCBhbmQgdGhlIGhhcmR3YXJlIGRlc2lnbmVyIGRlY2lk
ZWQgdG8gdGllIGJvdGggdG9nZXRoZXIgdG8KPiA+ID4gYSBzaW5nbGUgc2V0IG9mIGNsb2NrIGFu
ZCBkYXRhIGxpbmVzLCB3aGljaCB0aGVuIGdvIHRvIHR3byBQSFlzLgo+ID4KPiA+IFRoZSBzY2hl
bWF0aWNzIEkgaGF2ZSBhcmUgbm90IHZlcnkgY2xlYXIgb24gdGhhdCwgYnV0IG5vdyB0aGF0IHlv
dQo+ID4gbWVudGlvbiB0aGlzLCBpdCdzIG1vc3QgbGlrZWx5IHRoZSBjYXNlLgo+Cj4gSSBob3Bl
IG5vdC4gVGhhdCB3b3VsZCBiZSB2ZXJ5IGJyb2tlbi4gQXMgUnVzc2VsbCBwb2ludGVkIG91dCwg
TURJTyBpcwo+IG5vdCBtdWx0aS1tYXN0ZXIuIFlvdSBuZWVkIHRvIGNoZWNrIHdpdGggdGhlIGhh
cmR3YXJlIGRlc2lnbmVyIGlmIHRoZQo+IHNjaGVtYXRpY3MgYXJlIG5vdCBjbGVhci4KClNvcnJ5
LCBpdCB3YXMgbm90IHZlcnkgY2xlYXIuIEl0J3MgdGhlIGNhc2UgdGhhdCB0d28gTURJTyBtYXN0
ZXJzCnNoYXJlIHRoZSBNREMgYW5kIGRhdGEgbGluZXMuCgo+Cj4gPiBHb29kIHBvaW50LCBidXQg
aXQncyB3b3JzZSB0aGFuIHRoYXQ6IHdoZW4gTUFDMCBpcyB1bmJvdW5kLCBpdCB3aWxsCj4gPiB1
bnJlZ2lzdGVyIHRoZSBNRElPIGJ1cyBhbmQgZGVzdHJveSBhbGwgUEhZIGRldmljZXMuIFRoZXNl
IGFyZSBub3QKPiA+IHJlZmNvdW50ZWQgc28gdGhleSB3aWxsIGxpdGVyYWxseSBnbyBmcm9tIHVu
ZGVyIE1BQzEuIE5vdCBzdXJlIGhvdwo+ID4gdGhpcyBjYW4gYmUgZGVhbHQgd2l0aD8KPgo+IHVu
YmluZGluZyBpcyBub3QgYSBub3JtYWwgb3BlcmF0aW9uLiBTbyBpIHdvdWxkIGp1c3QgbGl2ZSB3
aXRoIGl0LCBhbmQKPiBpZiByb290IGRlY2lkZXMgdG8gc2hvb3QgaGVyc2VsZiBpbiB0aGUgZm9v
dCwgdGhhdCBpcyBoZXIgY2hvaWNlLgo+CgpJIGRpc2FncmVlLiBVbmJpbmRpbmcgaXMgdmVyeSBt
dWNoIGEgbm9ybWFsIG9wZXJhdGlvbi4gTGVzcyBzbyBmb3IKcGxhdGZvcm0gZGV2aWNlcyBidXQg
c3RpbGwsIGl0IGlzIHRoZXJlIGZvciBhIHJlYXNvbiBhbmQgc2hvdWxkIGJlCmV4cGVjdGVkIHRv
IHdvcmsgY29ycmVjdGx5LiBPciBhdCB0aGUgdmVyeSBsZWFzdCBub3QgY3Jhc2ggYW5kIGJ1cm4K
dGhlIHN5c3RlbS4KCk9uIHRoZSBvdGhlciBoYW5kLCBJIGxpa2UgeW91ciBhcHByb2FjaCBiZWNh
dXNlIEkgbWF5IGdldCBhd2F5IHdpdGhvdXQKaGF2aW5nIHRvIGZpeCBpdC4gQnV0IGlmIEkgd2Vy
ZSB0byBmaXggaXQgLSBJIHdvdWxkIHJlZmVyZW5jZSB0aGUgTURJTwpidXMgZnJvbSB0aGUgc2Vj
b25kYXJ5IG1hYyBieSBwaGFuZGxlIGFuZCBjb3VudCBpdHMgcmVmZXJlbmNlcyBiZWZvcmUKZHJv
cHBpbmcgaXQuIDopCgpCYXJ0b3N6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
