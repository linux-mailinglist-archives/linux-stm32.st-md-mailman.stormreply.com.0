Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED7DA89E26
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 14:33:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AB4CC78F68;
	Tue, 15 Apr 2025 12:33:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FC11CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 12:33:18 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso2741446f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 05:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744720398; x=1745325198;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISejIS0NoteW5+822XXFLOsDwPRqdqjmt0InyJ7Yj2s=;
 b=dGaBiiDK5COBAP6EexvO+Quo5PlI4ILKtXDtMlL8KnZpyVW9Txhq4IfHCf2s3MinFf
 bsmclr5QmREM9TCbutRqQnZepfNzkWAsEnOdI41Ac1OwR9eozhUOML4w1YCNCtD3I7ON
 DKiuoqeQHAX7hXUES+l+0BypWh3u8eYowrRAMfS7ApBNxcNYReMd7CMINOSNt+fiZxnO
 kLS1PdGcV1V9U8FrXM0b14G9O2ZG9CDEx3SH4RZCFIp/Ho4IVzvWYAa/Ez6bccVaOg3C
 +kA9nCm3KXMv9HOYdf/WEOyeINHwR+VIzyKa66qJCsd/r8flojJ7IFBnHV4343mxMWIE
 K24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744720398; x=1745325198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ISejIS0NoteW5+822XXFLOsDwPRqdqjmt0InyJ7Yj2s=;
 b=ZxotEW42asB6UrAo/ONbV00XpCAKR70rUXzBIcUtdHS9nOZ94udT8vLkXY28uf7VfK
 B7VNOS8wbW0zvhiL7EWGjkyhT85V6eI5TZRFHDa0VSvgz8YQxwsyAXoH+C8ntNCLh221
 nfjrWGxYFYq2oE/imvCKhmqXUR6HdgTiPexpGgfr5Y6MZx9Pe/c6/gSofzrwlMmEA8Yn
 crBNbsap1u0hfKGg4bb+5+mkUf5SCYUD74o/QnFM9FcuUEkVY8P4vcRSzV05YLxTF1Gh
 pUJ3XJYMQx7cfCzso9a5HJFCIgUyP8Gkwrm+cxCF9hT7bBaI9ITZr8PC+wYdkokxv9t9
 9DFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiDPX8ZNSsfu8/14SwcBvakY8rNdpNZAXzzBcbImsDeZUWSmc5w2EOdUQI4gZHMZWtjT+gYjfZWBVOhQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx/Q6DG8L3MOmmHYH2DlZgOBf0HF+a3Oafi8nI17+buf6l0D6xQ
 jekwTYFXewrM3y4PV1IsHhi3+3qZEEB3QzmM1Cv0OT4Jh8/8eqK6S84dvhQGGcncoEk5Z5UpviF
 jC5+e0gBdiacELkkmugKgYWM7nmg=
X-Gm-Gg: ASbGncsQAL+T6DrjzsIQoQJ3Ox/m4IGX4yvapp87fk0PAHb9YUNMAcxNkJ5hnOwzTUj
 qOciEVeqCAeQp/bKMZ6PQ2i5QKH7/RScolLj7Fx6R8+DWwjjexFOw6a9aOPuoZdAZtfbovspaej
 WzbQAUaqPf3b/b+afmXo/KBlHdTztVnfckOe9gqC27j/O4CkTWfzTexfxBRhM07ecw
X-Google-Smtp-Source: AGHT+IFwJex1FRxNns/6VHFTGeLhVt+kuVcAblH1w86U7VFm3sR6UibK49iXZpLHLruiVNnIp7i8sraSXqWjt0jcORA=
X-Received: by 2002:a05:6000:4021:b0:39c:dfa:c3de with SMTP id
 ffacd0b85a97d-39eaaebc663mr13620738f8f.47.1744720397705; Tue, 15 Apr 2025
 05:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
In-Reply-To: <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 13:32:51 +0100
X-Gm-Features: ATxdqUFXWhW8_Nw5u1OaWa5-kTdFNmMYCXvTAenRwVBKAiwpOUnqgIySUTDSG10
Message-ID: <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
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

SGkgUnVzc2VsbCwKCk9uIE1vbiwgQXByIDE0LCAyMDI1IGF0IDc6MTTigK9QTSBMYWQsIFByYWJo
YWthcgo8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgUnVzc2VsbCwK
Pgo+IE9uIE1vbiwgQXByIDE0LCAyMDI1IGF0IDU6NTfigK9QTSBSdXNzZWxsIEtpbmcgKE9yYWNs
ZSkKPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEFwciAw
NywgMjAyNSBhdCAwMTowMzoxN1BNICswMTAwLCBQcmFiaGFrYXIgd3JvdGU6Cj4gPiA+ICsgICAg
IGdiZXRoLT5yc3RjID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNpdmUoZGV2LCBOVUxM
KTsKPiA+ID4gKyAgICAgaWYgKElTX0VSUihnYmV0aC0+cnN0YykpCj4gPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIFBUUl9FUlIoZ2JldGgtPnJzdGMpOwo+ID4gPiArCj4gPiA+ICsgICAgIGdiZXRo
LT5kZXYgPSBkZXY7Cj4gPiA+ICsgICAgIGdiZXRoLT5yZWdzID0gc3RtbWFjX3Jlcy5hZGRyOwo+
ID4gPiArICAgICBnYmV0aC0+cGxhdF9kYXQgPSBwbGF0X2RhdDsKPiA+ID4gKyAgICAgcGxhdF9k
YXQtPmJzcF9wcml2ID0gZ2JldGg7Cj4gPiA+ICsgICAgIHBsYXRfZGF0LT5zZXRfY2xrX3R4X3Jh
dGUgPSBzdG1tYWNfc2V0X2Nsa190eF9yYXRlOwo+ID4gPiArICAgICBwbGF0X2RhdC0+Y2xrc19j
b25maWcgPSByZW5lc2FzX2diZXRoX2Nsa3NfY29uZmlnOwo+ID4gPiArICAgICBwbGF0X2RhdC0+
ZmxhZ3MgfD0gU1RNTUFDX0ZMQUdfSFdUU1RBTVBfQ09SUkVDVF9MQVRFTkNZIHwKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgIFNUTU1BQ19GTEFHX0VOX1RYX0xQSV9DTEtfUEhZX0NBUCB8
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBTVE1NQUNfRkxBR19TUEhfRElTQUJMRTsK
PiA+ID4gKwo+ID4gPiArICAgICBlcnIgPSByZW5lc2FzX2diZXRoX2Nsa3NfY29uZmlnKGdiZXRo
LCB0cnVlKTsKPiA+ID4gKyAgICAgaWYgKGVycikKPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4g
ZXJyOwo+ID4gPiArCj4gPiA+ICsgICAgIGVyciA9IHN0bW1hY19kdnJfcHJvYmUoZGV2LCBwbGF0
X2RhdCwgJnN0bW1hY19yZXMpOwo+ID4gPiArICAgICBpZiAoZXJyKQo+ID4gPiArICAgICAgICAg
ICAgIHJlbmVzYXNfZ2JldGhfY2xrc19jb25maWcoZ2JldGgsIGZhbHNlKTsKPiA+ID4gKwo+ID4g
PiArICAgICByZXR1cm4gZXJyOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgdm9pZCBy
ZW5lc2FzX2diZXRoX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiAr
ewo+ID4gPiArICAgICBzdG1tYWNfZHZyX3JlbW92ZSgmcGRldi0+ZGV2KTsKPiA+ID4gKwo+ID4g
PiArICAgICByZW5lc2FzX2diZXRoX2Nsa3NfY29uZmlnKGdldF9zdG1tYWNfYnNwX3ByaXYoJnBk
ZXYtPmRldiksIGZhbHNlKTsKPiA+ID4gK30KPiA+Cj4gPiBXb3VsZCBjYWxsaW5nIHJlbmVzYXNf
Z2JldGhfY2xrc19jb25maWcoKSBpbiB0aGUgc3VzcGVuZC9yZXN1bWUgcGF0aHMKPiA+IGNhdXNl
IHByb2JsZW1zPwo+ID4KPiA+IElmIG5vdCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nIHBsYXRfZGF0
LT5pbml0KCkgYW5kIHBsYXRfZGF0LT5leGl0KCkKPiA+IHRvIGNvbnRyb2wgdGhlc2UgY2xvY2tz
LCBhbmQgdGhlbiB1c2UgZGV2bV9zdG1tYWNfcGx0ZnJfcHJvYmUoKQo+ID4gd2hpY2ggd2lsbCBj
YWxsIHRoZSAtPmluaXQgYW5kIC0+ZXhpdCBmdW5jdGlvbnMgYXJvdW5kIHRoZSBwcm9iZQo+ID4g
YXMgbmVjZXNzYXJ5IGFuZCBhdCByZW1vdmFsIHRpbWUgKGFuZCB5b3Ugd29uJ3QgbmVlZCB0aGUg
cmVtb3ZlCj4gPiBtZXRob2QuKQo+ID4KT24gdGhlIFJaL0czRSwgdGhlIHVwc3RyZWFtIHN1cHBv
cnQgZm9yIHRlc3RpbmcgUzJSIGlzIG5vdCB5ZXQgaW4gYQp1c2FibGUgc3RhdGUuIFNvIGZvciBu
b3csIEknbGwgc3dpdGNoIHRvIHVzaW5nIGluaXQvZXhpdCBjYWxsYmFja3MgYW5kCmRyb3AgdGhl
IFBNIGNhbGxiYWNrLgoKQ2hlZXJzLApQcmFiaGFrYXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
