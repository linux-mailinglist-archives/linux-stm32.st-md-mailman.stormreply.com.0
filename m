Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D937744AC
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 20:26:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 580D8C6B45C;
	Tue,  8 Aug 2023 18:26:36 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 865CAC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 18:26:34 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-4474c7fce20so2203676137.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Aug 2023 11:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691519193; x=1692123993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbSuxAH1dmgDI1cFhSw3+FjHgNgeooTpwVKeZW63XUA=;
 b=omX3M6W7HI4CkdKEejiKetClW4YUWnvCPUq8gKc/AoVUAnqTLGguQDDx/Sp7R778JN
 J9TSo32CN6hMaWQKcsB0qNqnAfUmpGbESPtgNucK5ozybmP7dGop+fVUtC7USzhv0x20
 JypPvqhLY7OCKJtBcfnX+96fYG5NsovjpKeVeQyTpMIw8hCNkqz97Nj5+31R97GKArfx
 FvTCBQ21Dt/3FRicqjABaU4W4VS+jqKz5MgCjjWoW7/8fz5NgBnX8wQtxRvChUJ90vs8
 M6mrEFvM5V+hgB099+64rLexf3D68SYLB6togDUSjQ9USqOosVkxu49B4wTl+yHLi33a
 3Kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691519193; x=1692123993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NbSuxAH1dmgDI1cFhSw3+FjHgNgeooTpwVKeZW63XUA=;
 b=di3rTvTobhLiteGjF2VddFjcL9b1vLsvQ0D8Qm5IYOgQ2PiUCLs+Ve/TkDtkuZocFW
 s67cdnDWNIPTTmAnJL4/GblpLAdyFep/npa+5V1CKhb2crz77V1dIQk+6OnNX3afqxrT
 W5q9eZO1R8gREq9VKM5dnKX+A0uBVx+kZVx+3o8w24G7gk94aKzm8QVuCxgXc/sVkjeg
 KWLa3edX9KL631vyJNL1lSGG2WVHb0R8ysqgwnpgTMX0RpP7fx0LaEog8MEmqVh5vHgv
 6JaonlnRQ2NO9FuLkn2g6KIDSBc7TCZPcXr2i9HEFGxoUSQU2vVqXoZx3m3EK4U5S73+
 KqIA==
X-Gm-Message-State: AOJu0YwM7ZbbQwMQymbF1VQaqDsMMgVscJ5zpwSJAc8X93rIs0Wr0Moi
 C/8XR57fqGMOSjNUAJyMM0WZYVLtoirXoWFIYzDYCw==
X-Google-Smtp-Source: AGHT+IG8ilz+lyyZPz/QTN9yYwu4PQ8UFXiUmVfIAYHkY7cO5/Ehx+F7e2EvG0Tpci9f03MzRW/uy/lDk0h8r21yu9I=
X-Received: by 2002:a67:f905:0:b0:443:677e:246e with SMTP id
 t5-20020a67f905000000b00443677e246emr716156vsq.5.1691519193393; Tue, 08 Aug
 2023 11:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230807193102.6374-1-brgl@bgdev.pl>
 <54421791-75fa-4ed3-8432-e21184556cde@lunn.ch>
 <CAMRc=Mc6COaxM6GExHF2M+=v2TBpz87RciAv=9kHr41HkjQhCg@mail.gmail.com>
 <ZNJChfKPkAuhzDCO@shell.armlinux.org.uk>
 <CAMRc=MczKgBFvuEanKu=mERYX-6qf7oUO2S4B53sPc+hrkYqxg@mail.gmail.com>
 <65b53003-23cf-40fa-b9d7-f0dbb45a4cb2@lunn.ch>
 <CAMRc=MecYHi=rPaT44kuX_XMog=uwB9imVZknSjnmTBW+fb5WQ@mail.gmail.com>
 <xfme5pgj4eqlgao3vmyg6vazaqk6qz2wq6kitgujtorouogjty@cklyof3xz2zm>
 <d021b8ae-a6a3-4697-a683-c9bd45e6c74b@lunn.ch>
In-Reply-To: <d021b8ae-a6a3-4697-a683-c9bd45e6c74b@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Aug 2023 20:26:22 +0200
Message-ID: <CAMRc=MegMdB0LZNRRrCfqFGZQWMFdBhd8o+_NBxwLk0xS99M_w@mail.gmail.com>
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCA1OjE14oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+ID4gSSdsbCBtYWtlIHRoZSB3YXRlciBtdWRkaWVyIChob3BlZnVsbHkg
Y2xlYXJlcj8pLiBJIGhhdmUgYWNjZXNzIHRvIHRoZQo+ID4gYm9hcmQgc2NoZW1hdGljIChub3Qg
U0lQL1NPTSBzdHVmZiB0aG91Z2gpLCBidXQgdGhhdCBzaG91bGQgaGVscCBoZXJlLgo+ID4KPiA+
IE1BQzAgb3ducyBpdHMgb3duIE1ESU8gYnVzICh3ZSdsbCBjYWxsIGl0IE1ESU8wKS4gSXQgaXMg
cGlubXV4ZWQgdG8KPiA+IGdwaW84L2dwaW85IGZvciBtZGMvbWRpby4gTUFDMSBvd25zIGl0cyBv
d24gYnVzIChNRElPMSkgd2hpY2ggaXMKPiA+IHBpbm11eGVkIHRvIGdwaW8yMS8yMi4KPiA+Cj4g
PiBPbiBNRElPMCB0aGVyZSBhcmUgdHdvIFNHTUlJIGV0aGVybmV0IHBoeXMuIE9uZSBpcyBjb25u
ZWN0ZWQgdG8gTUFDMCwKPiA+IG9uZSBpcyBjb25uZWN0ZWQgdG8gTUFDMS4KPiA+Cj4gPiBNRElP
MSBpcyBub3QgY29ubmVjdGVkIHRvIGFueXRoaW5nIG9uIHRoZSBib2FyZC4gU28gdGhlcmUgaXMg
b25seSBvbmUKPiA+IE1ESU8gbWFzdGVyLCBNQUMwIG9uIE1ESU8wLCBhbmQgaXQgbWFuYWdlcyB0
aGUgZXRoZXJuZXQgcGh5IGZvciBib3RoCj4gPiBNQUMwL01BQzEuCj4gPgo+ID4gRG9lcyB0aGF0
IG1ha2Ugc2Vuc2U/IEkgZG9uJ3QgdGhpbmsgZnJvbSBhIGhhcmR3YXJlIGRlc2lnbiBzdGFuZHBv
aW50Cj4gPiB0aGlzIGlzIHZpb2xhdGluZyBhbnl0aGluZywgaXQgaXNuJ3QgYSBtdWx0aW1hc3Rl
ciBzZXR1cCBvbiBNRElPLgo+Cj4gVGhhbmtzIGZvciB0YWtpbmcgYSBkZXRhaWxlZCBsb29rIGF0
IHRoZSBzY2hlbWF0aWNzLiBUaGlzIGlzIGhvdyBpCj4gd291bGQgZXhwZWN0IGl0IHRvIGJlLgo+
Cj4gPiA+ID4gPiBHb29kIHBvaW50LCBidXQgaXQncyB3b3JzZSB0aGFuIHRoYXQ6IHdoZW4gTUFD
MCBpcyB1bmJvdW5kLCBpdCB3aWxsCj4gPiA+ID4gPiB1bnJlZ2lzdGVyIHRoZSBNRElPIGJ1cyBh
bmQgZGVzdHJveSBhbGwgUEhZIGRldmljZXMuIFRoZXNlIGFyZSBub3QKPiA+ID4gPiA+IHJlZmNv
dW50ZWQgc28gdGhleSB3aWxsIGxpdGVyYWxseSBnbyBmcm9tIHVuZGVyIE1BQzEuIE5vdCBzdXJl
IGhvdwo+ID4gPiA+ID4gdGhpcyBjYW4gYmUgZGVhbHQgd2l0aD8KPiA+ID4gPgo+ID4gPiA+IHVu
YmluZGluZyBpcyBub3QgYSBub3JtYWwgb3BlcmF0aW9uLiBTbyBpIHdvdWxkIGp1c3QgbGl2ZSB3
aXRoIGl0LCBhbmQKPiA+ID4gPiBpZiByb290IGRlY2lkZXMgdG8gc2hvb3QgaGVyc2VsZiBpbiB0
aGUgZm9vdCwgdGhhdCBpcyBoZXIgY2hvaWNlLgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IEkgZGlzYWdy
ZWUuIFVuYmluZGluZyBpcyB2ZXJ5IG11Y2ggYSBub3JtYWwgb3BlcmF0aW9uLgo+Cj4gV2hhdCBk
byB5b3UgdXNlIGl0IGZvcj8KPgo+IEkgZG9uJ3QgdGhpbmsgaSd2ZSBldmVyIG1hbnVhbGx5IGRv
bmUgaXQuIE1heWJlIGFzIHBhcnQgb2YgYSBzY3JpcHQgdG8KPiB1bmJpbmQgdGhlIEZUREkgZHJp
dmVyIGZyb20gYW4gRlRESSBkZXZpY2UgaW4gb3JkZXIgdG8gdXNlIHVzZXIgc3BhY2UKPiB0b29s
cyB0byBwcm9ncmFtIHRoZSBFRVBST00/IEJ1dCB0aGF0IGlzIGFib3V0IGl0Lgo+Cj4gSSBhY3R1
YWxseSBleHBlY3QgbWFueSB1bmJpbmQgb3BlcmF0aW9ucyBhcmUgYnJva2VuIGJlY2F1c2UgaXQg
aXMgdmVyeQo+IHJhcmVseSB1c2VkLgo+CgpXaGVuIEkgc2F5ICJkZXZpY2UgdW5iaW5kIiwgSSBk
b24ndCBqdXN0IG1lYW4gbWFudWFsIHVuYmluZGluZyB1c2luZwpzeXNmcy4gSSBtZWFuIGFueSBj
b2RlIHBhdGggKHJtbW9kLCB1bnBsdWdnaW5nIHRoZSBVU0IsIGV0Yy4pIHRoYXQKbGVhZHMgdG8g
dGhlIGRldmljZSBiZWluZyBkZXRhY2hlZCBmcm9tIGl0cyBkcml2ZXIuIFRoaXMgaXMgYQpwZXJm
ZWN0bHkgbm9ybWFsIHNpdHVhdGlvbiBhbmQgc2hvdWxkIHdvcmsgY29ycmVjdGx5LgoKSSB3b24n
dCBiZSBmaXhpbmcgaXQgZm9yIHRoaXMgc2VyaWVzIGJ1dCBtYXkgZW5kIHVwIGxvb2tpbmcgaW50
bwplc3RhYmxpc2hpbmcgc29tZSBraW5kIG9mIGRldmljZSBsaW5rcyBiZXR3ZWVuIE1BQ3MgYW5k
IHRoZWlyICJyZW1vdGUiClBIWXMgdGhhdCB3b3VsZCBhbGxvdyB0byBzYWZlbHkgdW5iaW5kIHRo
ZW0uCgpCYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
