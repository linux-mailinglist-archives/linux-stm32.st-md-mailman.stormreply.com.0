Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 938CCAA7124
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 14:05:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57665C78025;
	Fri,  2 May 2025 12:05:02 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 306D2C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 12:05:01 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso1211059f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746187500; x=1746792300;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yUHgqJ+LWoH5VY4W/85GH/C6KSeka4dwhIk1e2DuRQc=;
 b=iiCCY6AmhhlDb2X2XWgX20+ZdNLIXBINKWnydZDjCLZOq7OLzgeEKvRLozlL3bocjE
 L9BoqO56LjOATMfXL5Sj9A+vWlXDwXFE/D7FVvJBlRAKZFCUDiWR5m0YJrMPFKaEtye4
 l0I5R0d1DrvFGzbfmqqrJL2s4Ja/2TlAxEjv64mNF7FzsO10EajDcY91fLnCI0UbG0QM
 uUUr95o8yCDjvirCf6ZOUIMq74tSsuKMicDYILA80izxdKvSW2boGWpo71jR1hlN/KXm
 9wDy354KFUv7mzhKhzQx3HqoIpRF+SYZJDnp5O39vpgbuCS9qbSPdbQpfxFIlo/TNNWw
 QeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746187500; x=1746792300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yUHgqJ+LWoH5VY4W/85GH/C6KSeka4dwhIk1e2DuRQc=;
 b=Cc08f5IXA5EQij8gk0tfA2Mlr3/D4hoOlDt3Uhyz20bV6ALR8Ud4aPS8+SAEV3cdTA
 pNc6pOjXA93if9HegNFW5JcdHhhYScktvs4PWuBcmMcngqyHVjg+teLclgxkfAgRNQ+S
 2081mB/PwQuY4LFNYHB7xgvJ4pH4jOSwsUCKPLzFuokgc2zkVQa5sCTvfRT/vup8OG4c
 DfFcRCNfTML3SyW2thsfWeH5duiZIXnwQGN7xQne9xjqhunNQZAxSh9LyBOvGRAkxi4A
 U8RODeYqAcUJWptFjL5rWTnyEQXDA7vLX6f2cxWrEkdrGJk+Evf0+XrqMTHQdD35XdRf
 eLfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKtsCebaXapQsoBYFnY9wVqKiwDimEzePxwxvg/5iVvLiAOtj+6rg/tLMBV0pU5rO09CfBYYojUwqZhQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxDI0Bdlsz9YGcmpQemk4t5nzZh5Diap6Z5DuMLds2Q5g3qTYiv
 ibcW6Z4y9LqfPaUhbOYgVN+uNXw0Lo2evMPNdiCsluNmvm89bRSI3NEmuOgWlGZv4p9P5D8ETm7
 r5WgoxryHICy+TlLQJJdhy2tyLHk=
X-Gm-Gg: ASbGncv7ThElID/EJIUEApWy0K8gbP6rx0sR6d0kY9GUtLWI9UMI6UJisKsqer9kB8n
 l6HTIHkaHZJ677Pofn8FwddPOUt9FUalhe6MKHKDek3sV8QMVqNAkehMRebCsMHUSijoGrlWIJz
 5//a819d/+DujsxUC359FS8h4=
X-Google-Smtp-Source: AGHT+IE2auQ0A0KtW0kC0aKhecu39LBRzglwU/tszC76jWTDR1QoRecH0YXD3lt5QVn7PkCmCVH0kYqvGLkyQT+mm2U=
X-Received: by 2002:a05:6000:40db:b0:39f:efb:c2f6 with SMTP id
 ffacd0b85a97d-3a099adcb13mr1822546f8f.33.1746187500433; Fri, 02 May 2025
 05:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 13:04:34 +0100
X-Gm-Features: ATxdqUH_j2VzsE9tT_fM4FFgrG85qJiCrbTtjzlXZqZhUf9hahZQD7LXclNR2aQ
Message-ID: <CA+V-a8s-+x1-OAJCbizOdW1ygtTYON6AybPg=e-x7M-AL+4F0A@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: timer: renesas,
 ostm: Document RZ/V2N (R9A09G056) support
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBGcmksIE1heSAyLCAyMDI1
IGF0IDEyOjUz4oCvUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4g
d3JvdGU6Cj4KPiBPbiBUaHUsIDEgTWF5IDIwMjUgYXQgMTQ6MzcsIFByYWJoYWthciA8cHJhYmhh
a2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4KPiA+IERvY3VtZW50IHN1
cHBvcnQgZm9yIHRoZSBSZW5lc2FzIE9TIFRpbWVyIChPU1RNKSBmb3VuZCBvbiB0aGUgUmVuZXNh
cwo+ID4gUlovVjJOIChSOUEwOUcwNTYpIFNvQy4gVGhlIE9TVE0gSVAgb24gUlovVjJOIGlzIGlk
ZW50aWNhbCB0byB0aGF0IG9uCj4gPiBvdGhlciBSWiBmYW1pbGllcywgc28gbm8gZHJpdmVyIGNo
YW5nZXMgYXJlIHJlcXVpcmVkIGFzIGByZW5lc2FzLG9zdG1gCj4gPiB3aWxsIGJlIHVzZWQgYXMg
ZmFsbGJhY2sgY29tcGF0aWJsZS4KPiA+Cj4gPiBBbHNvIGluY2x1ZGUgUlovVjJOIGluIHRoZSBs
aXN0IG9mIGNvbXBhdGlibGVzIGZvciB3aGljaCB0aGUgYHJlc2V0c2AKPiA+IHByb3BlcnR5IGlz
IHJlcXVpcmVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+Cj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVuZXNhcyxvc3RtLnlhbWwKPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZW5lc2FzLG9zdG0u
eWFtbAo+ID4gQEAgLTI2LDYgKzI2LDcgQEAgcHJvcGVydGllczoKPiA+ICAgICAgICAgICAgLSBy
ZW5lc2FzLHI5YTA3ZzA0My1vc3RtICMgUlovRzJVTCBhbmQgUlovRml2ZQo+ID4gICAgICAgICAg
ICAtIHJlbmVzYXMscjlhMDdnMDQ0LW9zdG0gIyBSWi9HMntMLExDfQo+ID4gICAgICAgICAgICAt
IHJlbmVzYXMscjlhMDdnMDU0LW9zdG0gIyBSWi9WMkwKPiA+ICsgICAgICAgICAgLSByZW5lc2Fz
LHI5YTA5ZzA1Ni1vc3RtICMgUlovVjJOCj4gPiAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwOWcw
NTctb3N0bSAjIFJaL1YySChQKQo+ID4gICAgICAgIC0gY29uc3Q6IHJlbmVzYXMsb3N0bSAgICAg
ICAgIyBHZW5lcmljCj4gPgo+ID4gQEAgLTU5LDYgKzYwLDcgQEAgaWY6Cj4gPiAgICAgICAgICAg
IC0gcmVuZXNhcyxyOWEwN2cwNDMtb3N0bQo+ID4gICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdn
MDQ0LW9zdG0KPiA+ICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA1NC1vc3RtCj4gPiArICAg
ICAgICAgIC0gcmVuZXNhcyxyOWEwOWcwNTYtb3N0bQo+ID4gICAgICAgICAgICAtIHJlbmVzYXMs
cjlhMDlnMDU3LW9zdG0KPgo+IExvb2tzIGxpa2Ugd2UgaGF2ZSByZWFjaGVkIGNyaXRpY2FsIG1h
c3MgdG8gaW52ZXJ0IHRoZSBsb2dpYz8KPgpBZ3JlZWQuCgo+ICAgICBub3Q6Cj4gICAgICAgY29u
dGFpbnM6Cj4gICAgICAgICAtIHJlbmVzYXMscjdzNzIxMDAtb3N0bQo+ICAgICAgICAgLSByZW5l
c2FzLHI3czkyMTAtb3N0bQo+Cj4gPwo+Ck9LLCBJIHdpbGwgdXBkYXRlIGl0IGFzIGFib3ZlIGFu
ZCBzZW5kIGEgdjIuCgpDaGVlcnMsClByYWJoYWthcgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
