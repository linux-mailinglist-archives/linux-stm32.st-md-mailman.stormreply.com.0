Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF4A88924
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 18:57:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C026C78028;
	Mon, 14 Apr 2025 16:57:50 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E50FC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 16:57:49 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-527b70bd90dso2088408e0c.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744649868; x=1745254668;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=drgJ4kvJBwLENN+wUSBbYOnp85UmFVhKGobYEXfoSwA=;
 b=FutrjF8VTEldvjqnutTwyKMzehCjOy1k2KhVuUgvBMULOEoFQ6iAMxTC//KwvnJx76
 3AnpZ2hWaPJTBOk8Qoz/SItCm5csrYBl9tLspmFxvtudwG1i8cF2Rv6pyLKCWnNjhYhU
 ScOaMpG1gtdHvID0Cc3yaCBX8LXAp+96Q1gNOZvT2ELq7QHlJVyv28GqqJLwFG2brcBS
 WIkWXB19tvxXhAd7cwVoKSb8vwK8RrX8jfGJyzhSeTrsVbFTfMtzZaFggXGyRfm8Z3iA
 Bsrf3FnT26VQiDzrWwuKeahqUbE+svz4voUFjegcUX83pK2kRvZmy7FqdMV37qWC+YwY
 17nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744649868; x=1745254668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=drgJ4kvJBwLENN+wUSBbYOnp85UmFVhKGobYEXfoSwA=;
 b=Ov0oB8DO1kwDkQwvCRc2h7n/9iYyX21KIEdLubghEZnrzbQMUgqGfbUg2HYWWy51lO
 I2tADYLUaNVBndTJUP3sAWgcUdA6TsPrHKMC3myG2Cb7AXqfqKZELTwakiTE8gTjFaNU
 cJKforYyGYEh/WYvrvU34FtIfqaaeZTxeD0LcTFAhV8Xmh68i9lTPT21J8aiUczIJGRy
 COCgxcAQeVFp/SgpVZtMPur4Qcd9RIhEGh6fLOGKyQ6pkX9ch26P63UIwJgE9+80/+mP
 gLWtMccFfrecoQSyZL3deDIQJTMBcZHB/0PVvnl17EZtKrYoJGVWIApMSBa6NdVi4cja
 20zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4XlhVEvK2A9VT+b4BEzHNxy5j4oEvcYyfhPSwODT/N7Ssr8aXg+zpkUjekVTO8dQO7CUEubme2wlKJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwF67rRovV6E7c4z3gX9dhsxDEe8l1LlXGwlODL7oSLJRSQMa6H
 f+d/jPFpLolGUT+BOWK4vXnbG8yhQEH45RgXfrGHs6yEFWtUr569I8TegtatoZ+3jfYni7kXF7G
 dtxSdWb2PpBPT44aKcIvRDIgDrYA=
X-Gm-Gg: ASbGncu9p1ZQohqjdmUq8yNEWn+gQpeBxhRLfXfhlmHd4CSPHSjr04/U1ONWJi8TbP/
 Nani37W90YpubQlyWMpY8+GdZTYCbQhTSOIxTv8mLW0RftSn+HZeeis2+7DGQRN4331+NDzMVrx
 a/qh0W49FjgeYRsgFVDehdVPsILggLaWA7x1B37vc178Ws2rzUgZIbuQ==
X-Google-Smtp-Source: AGHT+IEWyQ+qQ66o7N7+8XGJO5Ll56Mi7mVYoHXkbahGQ2VotD+EVhbg3G8216oUR9181f8bIK1PpfJpHPMEC84oVFU=
X-Received: by 2002:a05:6122:181d:b0:520:3536:feb5 with SMTP id
 71dfb90a1353d-527c3615240mr8335250e0c.11.1744649868304; Mon, 14 Apr 2025
 09:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
 <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
 <Z_0cPmY_LzI_fo4S@shell.armlinux.org.uk>
In-Reply-To: <Z_0cPmY_LzI_fo4S@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 17:57:22 +0100
X-Gm-Features: ATxdqUENKCwc-Lcqt2ec1N-RxZ-ERgWqw8teGlVULD-_8vGOd7AV27blrs1o4yg
Message-ID: <CA+V-a8t6AWzBBxmGG5J8-N0HCMpxYhUVO9m4FT0STGL9KPShVw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/3] net: stmmac: Add DWMAC
 glue layer for Renesas GBETH
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

SGkgUnVzc2VsbCwKCk9uIE1vbiwgQXByIDE0LCAyMDI1IGF0IDM6MzHigK9QTSBSdXNzZWxsIEtp
bmcgKE9yYWNsZSkKPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBNb24sIEFw
ciAwNywgMjAyNSBhdCAwNzowNzo0OVBNICswMTAwLCBMYWQsIFByYWJoYWthciB3cm90ZToKPiA+
IE9uIE1vbiwgQXByIDcsIDIwMjUgYXQgNjo1OOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+
ID4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgQXBy
IDA3LCAyMDI1IGF0IDAxOjAzOjE3UE0gKzAxMDAsIFByYWJoYWthciB3cm90ZToKPiA+ID4gPiAr
c3RhdGljIHN0cnVjdCBjbGsgKnJlbmVzYXNfZ2JldGhfZmluZF9jbGsoc3RydWN0IHBsYXRfc3Rt
bWFjZW5ldF9kYXRhICpwbGF0X2RhdCwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZSkKPiA+ID4gPiArewo+ID4gPiA+ICsgICAg
IGZvciAodW5zaWduZWQgaW50IGkgPSAwOyBpIDwgcGxhdF9kYXQtPm51bV9jbGtzOyBpKyspCj4g
PiA+ID4gKyAgICAgICAgICAgICBpZiAoIXN0cmNtcChwbGF0X2RhdC0+Y2xrc1tpXS5pZCwgbmFt
ZSkpCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiBwbGF0X2RhdC0+Y2xrc1tp
XS5jbGs7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHJldHVybiBOVUxMOwo+ID4gPiA+ICt9Cj4g
PiA+Cj4gPiA+IEluIGFkZGl0aW9uIHRvIEpha3ViJ3MgcmVxdWVzdCwgSSdsbCBhc2sgdGhhdCB5
b3UgaG9sZCBvZmYgZm9yIGEgd2Vlawo+ID4gPiBiZWNhdXNlIEkgaGF2ZSB0aGUgZm9sbG93aW5n
IHRoYXQgSSdkIGxpa2UgdG8gc3VibWl0Ogo+ID4gPgo+ID4gQWNrLCBwbGVhc2UgYWRkIG1lIGlu
IENjIHdoaWxlIHlvdSBwb3N0IHRoaXMgcGF0Y2guCj4KPiBGWUksIHRoZSBwYXRjaCB3YXMgbWVy
Z2VkIGxhc3QgVGh1cnNkYXksIHNvIHBsZWFzZSB1cGRhdGUgdG8gcmVwbGFjZQo+IHRoZSBhYm92
ZSB3aXRoIHN0bW1hY19wbHRmcl9maW5kX2NsaygpIHdoaWNoIHdpbGwgZG8gdGhpcyBmb3IgeW91
Lgo+ClRoYW5rcywgSSdsbCByZWJhc2UgbXkgY2hhbmdlcyBvbiB0b3Agb2YgaXQgYW5kIHNlbmQg
b3V0IHY2LgoKQ2hlZXJzLApQcmFiaGFrYXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
