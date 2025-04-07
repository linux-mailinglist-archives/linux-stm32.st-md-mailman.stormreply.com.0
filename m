Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1530BA7E963
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 20:08:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0418C7128A;
	Mon,  7 Apr 2025 18:08:17 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76913C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 18:08:16 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-52617ceae0dso1510381e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744049295; x=1744654095;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUuYsrCNZuom26Ku72dSBPeeyC8punlJl9ufLVLiqm4=;
 b=bfpNIuX1JWmXVvGfjnX2VCR2iA6GeQ/8Lu/VEAO3tGvdrU9FdVRiSmCRWZbToZqtIK
 t4i3ScokEtP6vhmVT0FkjIu0MHIiINaMEk0jTFG8Jfq80faKIs2Z8WjXjGbdojW4xj6T
 DsAput9lIoDUKsQc2YE3C4VqK7E3h+W7rLgXFMfNok3t/QYDo9cHZQ5cHlTVGUaUC7Sa
 jhiyNwdeedcJK2fr/Y8tlAsgMrnDB1kXOHerMBW42IZP1Xtza1q6n79wN143gQJK8jO1
 xap7wPVVClHT56kA9M79u21I71CZHzYrjo/k9E0+pDHzPtYsERbU6r+xHQa8JMjVTD+Q
 YnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744049295; x=1744654095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jUuYsrCNZuom26Ku72dSBPeeyC8punlJl9ufLVLiqm4=;
 b=mNHu7kQ4Ni3RG9rxntRSjDFiVl4aDaKNDLbzpNwJ5N5W96kqj/WRFo5zvjlCQ9FlTJ
 wfn4a6NeBqSI9nHfSc3/5jCtLd+sQ/B3UN9nzyehvRK6R0eRL1OYr+cYmiCU7aPAhK33
 0yjDCDZEi+G4ECatjF0RzBUcj79ibIyZh93ACWiZjAATm9ekzTg8o1fNxD8p6iAxhj6n
 yUTtCVoX3ATdBsIFuWAS6b06/qXKfdvSgNKX/tX//KhDTj5/x6+a2yv2Z7b8SyJolRtk
 oJQmfo01s9uhZE6M3/OUG+/sejVtvsu2YznnS6BL9MF0Bh0Y0KKKp9mIeD/9wLaVQ9U3
 8FKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+Ze5rLVDqGTejNr28Ck9a6Yzn7FX4X8oHXKQCTCTn/oyFUU0umlDhb8aWL+zfrY3dL/L8xVYZkllzLw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwYlrynDezuWSAEHBXLINtfSNkgFA+fb2sUTvh1i+/oC2riIV6R
 FIRrBgKEiDZ21bKD1F5GdKMFa6/2pwNhC8jz5mHZd2zrpVNqVX/dszgs/qowU9jqq/VdIMw7AdD
 Jk6rduY/mhgH19eSxCs9bY/T41kk=
X-Gm-Gg: ASbGncuPmMie94stT2islKm/cHQRq9iEqFamdI4BJerJH/3LnDwG+1XoE3MDXBm63yY
 onqfKWaRxBKHTu1s3kknYm1ut+QjoqgIZdqDIwPduGrJUHCTFK+fRBgebITs1jAjDUrXPU0p3Nd
 gzG33OE8rrwOl9jeLZiOV9PaUDtgzU8z+ShQZf9wTWTI95LEKOGhHEkmBYEwY=
X-Google-Smtp-Source: AGHT+IEN6rDHodvyUoowo8BFuQsI+M3qkHprXMun6ue2nFvUns/xZBc98c1/xylp9Sz4+dM00gUNYRdzmCwmGkE0JHw=
X-Received: by 2002:a05:6122:16a6:b0:526:1ddd:8953 with SMTP id
 71dfb90a1353d-527642e498emr8513099e0c.0.1744049295202; Mon, 07 Apr 2025
 11:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
In-Reply-To: <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Apr 2025 19:07:49 +0100
X-Gm-Features: ATxdqUGJm_OgZHRFfu9Amyd2UVOtmAsyuknbI3Y7Xd-HEEICL3GbzjhydkDONtY
Message-ID: <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
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

T24gTW9uLCBBcHIgNywgMjAyNSBhdCA2OjU44oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxs
aW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gT24gTW9uLCBBcHIgMDcsIDIwMjUgYXQg
MDE6MDM6MTdQTSArMDEwMCwgUHJhYmhha2FyIHdyb3RlOgo+ID4gK3N0YXRpYyBzdHJ1Y3QgY2xr
ICpyZW5lc2FzX2diZXRoX2ZpbmRfY2xrKHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxh
dF9kYXQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
Y2hhciAqbmFtZSkKPiA+ICt7Cj4gPiArICAgICBmb3IgKHVuc2lnbmVkIGludCBpID0gMDsgaSA8
IHBsYXRfZGF0LT5udW1fY2xrczsgaSsrKQo+ID4gKyAgICAgICAgICAgICBpZiAoIXN0cmNtcChw
bGF0X2RhdC0+Y2xrc1tpXS5pZCwgbmFtZSkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIHBsYXRfZGF0LT5jbGtzW2ldLmNsazsKPiA+ICsKPiA+ICsgICAgIHJldHVybiBOVUxMOwo+
ID4gK30KPgo+IEluIGFkZGl0aW9uIHRvIEpha3ViJ3MgcmVxdWVzdCwgSSdsbCBhc2sgdGhhdCB5
b3UgaG9sZCBvZmYgZm9yIGEgd2Vlawo+IGJlY2F1c2UgSSBoYXZlIHRoZSBmb2xsb3dpbmcgdGhh
dCBJJ2QgbGlrZSB0byBzdWJtaXQ6Cj4KQWNrLCBwbGVhc2UgYWRkIG1lIGluIENjIHdoaWxlIHlv
dSBwb3N0IHRoaXMgcGF0Y2guCgpDaGVlcnMsClByYWJoYWthcgoKPiBiYmM3M2I4YjZkZmQgbmV0
OiBzdG1tYWM6IHByb3ZpZGUgc3RtbWFjX3BsdGZyX2ZpbmRfY2xrKCkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcGxhdGZvcm0uYyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wbGF0Zm9ybS5jCj4g
aW5kZXggYzczZWZmNmE1NmI4Li40M2M4NjlmNjRjMzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3JtLmMKPiArKysgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcGxhdGZvcm0uYwo+IEBAIC03
MDksNiArNzA5LDE3IEBAIGRldm1fc3RtbWFjX3Byb2JlX2NvbmZpZ19kdChzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2LCB1OCAqbWFjKQo+ICAjZW5kaWYgLyogQ09ORklHX09GICovCj4gIEVY
UE9SVF9TWU1CT0xfR1BMKGRldm1fc3RtbWFjX3Byb2JlX2NvbmZpZ19kdCk7Cj4KPiArc3RydWN0
IGNsayAqc3RtbWFjX3BsdGZyX2ZpbmRfY2xrKHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAq
cGxhdF9kYXQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIg
Km5hbWUpCj4gK3sKPiArICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgcGxhdF9kYXQtPm51bV9j
bGtzOyBpKyspCj4gKyAgICAgICAgICAgICAgIGlmIChzdHJjbXAocGxhdF9kYXQtPmNsa3NbaV0u
aWQsIG5hbWUpID09IDApCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHBsYXRfZGF0
LT5jbGtzW2ldLmNsazsKPiArCj4gKyAgICAgICByZXR1cm4gTlVMTDsKPiArfQo+ICtFWFBPUlRf
U1lNQk9MX0dQTChzdG1tYWNfcGx0ZnJfZmluZF9jbGspOwo+ICsKPiAuLi4KPgo+IHdoaWNoIHdp
bGwgYXZvaWQgZ2x1ZSBkcml2ZXJzIGR1cGxpY2F0aW5nIHRoaXMgZnVuY3Rpb25hbGl0eS4gVGhp
cyB3aWxsCj4gYmUgcGFydCBvZiB0aGUgZmlyc3Qgc2V0cyBvZiBwYXRjaGVzIEknbSBnb2luZyB0
byBiZSBzdWJtaXR0aW5nLgo+Cj4gVGhhbmtzLgo+Cj4gLS0KPiBSTUsncyBQYXRjaCBzeXN0ZW06
IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KPiBGVFRQIGlz
IGhlcmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0
IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
