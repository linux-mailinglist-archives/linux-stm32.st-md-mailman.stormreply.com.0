Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A91F6A88AD6
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 20:15:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EFABC7803D;
	Mon, 14 Apr 2025 18:15:11 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 139E3C7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 18:15:09 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-523de538206so1678336e0c.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744654509; x=1745259309;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ab8qgY0wYeMeF9f8GAqkiU/85dkzWksm0Y+DavzpAGg=;
 b=P4aBcbbipIcSfgOzounwuxbOdMIE/u3W1j/FdllLjq15Q1PkadUthqqodXxiVE6kBK
 X/ifjUuVmgpFmfaSf9MeYOJdEaeCvVs0dxWC3+SUGFXnKDB0PNKK28ABji1ROxPJViTV
 qYxpE3ZDZHGSzgo9jhJURsPIe5mRGGw0pkEUZ+UcLOyluPNjKqFzGymNjNZLl84UU35N
 6Aq/O7iHKayuekzchVsVbfK5kprJ+uGRjB4ZnrCXXGgFTkS0UXG2bBBcjyUTtC7Bvvfr
 zHHvCXzbKLBsdV3mkqIEdAvFhjsJRDzm4S9wtGNx3CuSYi/H4iwiKKNTdXrSnWPHMG6m
 XJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744654509; x=1745259309;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ab8qgY0wYeMeF9f8GAqkiU/85dkzWksm0Y+DavzpAGg=;
 b=Xs51GW7ZO1P9EiJqsDTEtqJJTQ+mt7lvFayNMoZUmffZ/DSQshc7vSrs5kH6kThzcK
 AjdajCsFP4BdhGpCn++nAur69Wq6k9icitA/KVQQeLaI/A+v9QIg0NjBWjRtyfHFOAiz
 pa3otkmxkn56XfAgLk25xHCfCn/Js5wGJiGBRGGEG6MVvSiO2Y+MLyKvOju4IjBsd/MZ
 u10BGdNEvg0ebuMaxWSrYpfHdUTDf6P6gUB8f0NMcqa2cNQyc+1AO54QAYMBAbQsFCdB
 Gisl6e9WH6zXWC2wmjv1BDFgNyQYM9TYuoDzr2dJNYT7+rHTqtQKSG4tEdXS6tLiWdNy
 LAYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWETXBVs1KV168bjnE0rITs0Ba1duLDBkMT4eGoW+6tmkbsMurLhFTqaUCoM5y5IH5+AJMpy7Q7CDZYbw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdKLrjTSkal+643CSfN2a47LoBqpJ5dDlLnD8fpzgYZzBvuBRq
 VU+mv4F9VP0zx+oCUYpXPLzRT4M8kxim4Ek+3qcKBkwH2Dex5Z4jgErgyY/mAVGb2oPSVQRg7SO
 37/th6T6OTHpc7XtGl4m48MxRhyw=
X-Gm-Gg: ASbGncsWxblFPT2e7WIFIiwlj3QyxPS1Ws9IXElewMlwTvO5Q+ZwnLJlnfGsZFBXf7E
 QnJcclsAbtCg1BaUjeEpIIq6UbPCcarhr2Fz62CAFY0far22sE0257u/9t9uy6JJnsVNedF53T9
 ek3ijuk4AAifiXxzNI/lTx96oFBGlnv/EwUQeyR5KgnM0+29yQ0n94NQ==
X-Google-Smtp-Source: AGHT+IGQY2h60f8WJYp88UGsGy+zjKZoZ77MuV/wdekbtzAvVIiA03PukMvok77iK0iUI19EfMYr3Th7THvYja4ZcDE=
X-Received: by 2002:a05:6122:7d0:b0:527:67db:9cb2 with SMTP id
 71dfb90a1353d-527c34d1d3cmr9206320e0c.4.1744654508673; Mon, 14 Apr 2025
 11:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
In-Reply-To: <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 19:14:42 +0100
X-Gm-Features: ATxdqUEl2MkISqtCUulKnIjkTEEvAI8jUFwXWbR4ZrlJPw4rcSyDREbiYNsOOl0
Message-ID: <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
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

SGkgUnVzc2VsbCwKCk9uIE1vbiwgQXByIDE0LCAyMDI1IGF0IDU6NTfigK9QTSBSdXNzZWxsIEtp
bmcgKE9yYWNsZSkKPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBNb24sIEFw
ciAwNywgMjAyNSBhdCAwMTowMzoxN1BNICswMTAwLCBQcmFiaGFrYXIgd3JvdGU6Cj4gPiArICAg
ICBnYmV0aC0+cnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKGRldiwgTlVM
TCk7Cj4gPiArICAgICBpZiAoSVNfRVJSKGdiZXRoLT5yc3RjKSkKPiA+ICsgICAgICAgICAgICAg
cmV0dXJuIFBUUl9FUlIoZ2JldGgtPnJzdGMpOwo+ID4gKwo+ID4gKyAgICAgZ2JldGgtPmRldiA9
IGRldjsKPiA+ICsgICAgIGdiZXRoLT5yZWdzID0gc3RtbWFjX3Jlcy5hZGRyOwo+ID4gKyAgICAg
Z2JldGgtPnBsYXRfZGF0ID0gcGxhdF9kYXQ7Cj4gPiArICAgICBwbGF0X2RhdC0+YnNwX3ByaXYg
PSBnYmV0aDsKPiA+ICsgICAgIHBsYXRfZGF0LT5zZXRfY2xrX3R4X3JhdGUgPSBzdG1tYWNfc2V0
X2Nsa190eF9yYXRlOwo+ID4gKyAgICAgcGxhdF9kYXQtPmNsa3NfY29uZmlnID0gcmVuZXNhc19n
YmV0aF9jbGtzX2NvbmZpZzsKPiA+ICsgICAgIHBsYXRfZGF0LT5mbGFncyB8PSBTVE1NQUNfRkxB
R19IV1RTVEFNUF9DT1JSRUNUX0xBVEVOQ1kgfAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
IFNUTU1BQ19GTEFHX0VOX1RYX0xQSV9DTEtfUEhZX0NBUCB8Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgU1RNTUFDX0ZMQUdfU1BIX0RJU0FCTEU7Cj4gPiArCj4gPiArICAgICBlcnIgPSBy
ZW5lc2FzX2diZXRoX2Nsa3NfY29uZmlnKGdiZXRoLCB0cnVlKTsKPiA+ICsgICAgIGlmIChlcnIp
Cj4gPiArICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gPiArCj4gPiArICAgICBlcnIgPSBzdG1t
YWNfZHZyX3Byb2JlKGRldiwgcGxhdF9kYXQsICZzdG1tYWNfcmVzKTsKPiA+ICsgICAgIGlmIChl
cnIpCj4gPiArICAgICAgICAgICAgIHJlbmVzYXNfZ2JldGhfY2xrc19jb25maWcoZ2JldGgsIGZh
bHNlKTsKPiA+ICsKPiA+ICsgICAgIHJldHVybiBlcnI7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRp
YyB2b2lkIHJlbmVzYXNfZ2JldGhfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gPiArewo+ID4gKyAgICAgc3RtbWFjX2R2cl9yZW1vdmUoJnBkZXYtPmRldik7Cj4gPiArCj4g
PiArICAgICByZW5lc2FzX2diZXRoX2Nsa3NfY29uZmlnKGdldF9zdG1tYWNfYnNwX3ByaXYoJnBk
ZXYtPmRldiksIGZhbHNlKTsKPiA+ICt9Cj4KPiBXb3VsZCBjYWxsaW5nIHJlbmVzYXNfZ2JldGhf
Y2xrc19jb25maWcoKSBpbiB0aGUgc3VzcGVuZC9yZXN1bWUgcGF0aHMKPiBjYXVzZSBwcm9ibGVt
cz8KPgo+IElmIG5vdCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nIHBsYXRfZGF0LT5pbml0KCkgYW5k
IHBsYXRfZGF0LT5leGl0KCkKPiB0byBjb250cm9sIHRoZXNlIGNsb2NrcywgYW5kIHRoZW4gdXNl
IGRldm1fc3RtbWFjX3BsdGZyX3Byb2JlKCkKPiB3aGljaCB3aWxsIGNhbGwgdGhlIC0+aW5pdCBh
bmQgLT5leGl0IGZ1bmN0aW9ucyBhcm91bmQgdGhlIHByb2JlCj4gYXMgbmVjZXNzYXJ5IGFuZCBh
dCByZW1vdmFsIHRpbWUgKGFuZCB5b3Ugd29uJ3QgbmVlZCB0aGUgcmVtb3ZlCj4gbWV0aG9kLikK
PgpJJ2xsIHRlc3QgdGhpcyBvbiB0aGUgcGxhdGZvcm0gd2hpY2ggY2FuIHN1cHBvcnQgc3VzcGVu
ZC9yZXN1bWUgYW5kCnVwZGF0ZSBhY2NvcmRpbmdseS4KCkNoZWVycywKUHJhYmhha2FyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
