Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B17987D30AA
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Oct 2023 13:01:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F040C6C857;
	Mon, 23 Oct 2023 11:01:06 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08940C6B47C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Oct 2023 11:01:04 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-d852b28ec3bso3021570276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Oct 2023 04:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698058864; x=1698663664;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQnyw3MjdCXKTfyQSa/jGUuKdoEycBcWTe0sh3zaKAg=;
 b=g1tn8NfGXQRAyLl8Ezi6houtHWf1qecITufVRXBza3XLI7ZUn4y54dTYnj85XoyPIE
 YC+zxlcp9xjCAKKsnlrmeLGkymFK1MMgqh+gYYSz1a3uRXO2URwR2UbQgEFU5KxGd3K5
 9MW7BM7SeSKyIGxO9LEhGfYKwzblFL2JqYfZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698058864; x=1698663664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CQnyw3MjdCXKTfyQSa/jGUuKdoEycBcWTe0sh3zaKAg=;
 b=tqyy/AjIFXAtzWtNNnrpyWDeA+6P4pSrh7MW+G9M3amVS9wDWWkSlr/RiGA7QF319F
 spZdAMXCnt7MGstEUo+hRphhM8S0ItUShUWEREYrreu+6Z6N0nlUrkRd+BoQr4vnhCFL
 8KqrUGs7JEdrBIHS7EYxadb2bD4PAOKpUUdLj/LbCuKaofrT/f2jkIbUiZHh8An+lfPM
 Ku1KUaci3fizv97gayEytjY7Ds14bRAYpD3r9PAzQ1MFXcYvR+tmLmz4NFKko7f5/0Ik
 jLuewXDzKSscvdfhbiuaNrdtvs7ytgAXjQ7TTUTLZQ9hNjfzEU9aIe/dCZXpeuvPLWAY
 q8vQ==
X-Gm-Message-State: AOJu0YwWy7kGkRXyHpYx+afDPWk/LClpE3wNgvtjfBZywvZsdyXTwslq
 NI64aGa/K+v1ni5rS7QBjOmahAbGk79xE0MtztUSRg==
X-Google-Smtp-Source: AGHT+IHsgGGa2skrDGr96nwbMOiC55O2cCdp4sM8NTs6qixH/wFcZIQVI1iSePRLMK2nXAYF5AkwHSE0OOXJHQbWoxA=
X-Received: by 2002:a25:4217:0:b0:d9b:3b3e:5a07 with SMTP id
 p23-20020a254217000000b00d9b3b3e5a07mr7276609yba.5.1698058863818; Mon, 23 Oct
 2023 04:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230904180635.923506-1-dario.binacchi@amarulasolutions.com>
 <5e75b5fd-c351-1f42-94ed-b6dc1d3f030e@foss.st.com>
In-Reply-To: <5e75b5fd-c351-1f42-94ed-b6dc1d3f030e@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 23 Oct 2023 13:00:48 +0200
Message-ID: <CABGWkvquib1WEKGR-DFiNN62gLcYF3Y==K29_w-=9pV0gnjEqg@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH] ARM: dts: stm32f469-disco: use the
 same 3v3 for SD and DSI nodes
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

SGVsbG8gQWxleGFuZHJlLAoKT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTA6NTfigK9BTSBBbGV4
YW5kcmUgVE9SR1VFCjxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPiB3cm90ZToKPgo+IE9u
IDkvNC8yMyAyMDowNiwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gPiBJbiB0aGUgYm9hcmQgc2No
ZW1hdGljLCB0aGUgcG93ZXIgc3VwcGx5IGZvciB0aGUgU0QgY2FyZCBpcyB0aGUgc2FtZSAzLjMK
PiA+IHZvbHRzIHVzZWQgdG8gcG93ZXIgdGhlIExDRCBwYW5lbCBhbmQgb3RoZXIgcGVyaXBoZXJh
bHMuIEJ5IGdlbmVyYWxpemluZwo+ID4gdGhlIG5hbWUgb2YgdGhlIHZvbHRhZ2UgcmVndWxhdG9y
LCBpdCBzaW1wbGlmaWVzIHRoZSBkZXZpY2UgdHJlZSBhbmQgbWFrZXMKPiA+IGl0IG1vcmUgcmVh
ZGFibGUuCj4gPgo+Cj4gSXQgbWFrZXMgc2VucyBhcyBpdCBpcyB0aGUgc2FtZSBkaXNjcmV0IHJl
Z3VsYXRvciAobm8gcG1pYyBpbnZvbHZlZCkuCj4KCkkgZG9uJ3Qgc2VlIGl0IGFwcGxpZWQgdG8g
bGludXgtc3RtMzIvbmV4dC4gSXMgc29tZXRoaW5nIG1pc3Npbmc/CgpUaGFua3MgYW5kIHJlZ2Fy
ZHMsCkRhcmlvCgo+IHJlZ2FyZHMKPiBBbGV4Cj4KPiA+IExpbms6IGh0dHBzOi8vd3d3LnN0LmNv
bS9lbi9ldmFsdWF0aW9uLXRvb2xzLzMyZjQ2OWlkaXNjb3ZlcnkuaHRtbCNjYWQtcmVzb3VyY2Vz
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVs
YXNvbHV0aW9ucy5jb20+Cj4gPgo+ID4gLS0tCj4gPgo+ID4gICBhcmNoL2FybS9ib290L2R0cy9z
dC9zdG0zMmY0NjktZGlzY28uZHRzIHwgMTUgKysrKy0tLS0tLS0tLS0tCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY0NjktZGlzY28uZHRzIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3Qvc3RtMzJmNDY5LWRpc2NvLmR0cwo+ID4gaW5kZXggY2JiZDUyMWJmMDEwLi44
YTRmOGRkZDA4M2QgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY0
NjktZGlzY28uZHRzCj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY0NjktZGlz
Y28uZHRzCj4gPiBAQCAtNjksMTYgKzY5LDkgQEAgYWxpYXNlcyB7Cj4gPiAgICAgICAgICAgICAg
IHNlcmlhbDAgPSAmdXNhcnQzOwo+ID4gICAgICAgfTsKPiA+Cj4gPiAtICAgICBtbWNfdmNhcmQ6
IG1tY192Y2FyZCB7Cj4gPiArICAgICB2Y2NfM3YzOiB2Y2MtM3YzIHsKPiA+ICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+ID4gLSAgICAgICAgICAgICByZWd1
bGF0b3ItbmFtZSA9ICJtbWNfdmNhcmQiOwo+ID4gLSAgICAgICAgICAgICByZWd1bGF0b3ItbWlu
LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPiA+IC0gICAgICAgICAgICAgcmVndWxhdG9yLW1heC1t
aWNyb3ZvbHQgPSA8MzMwMDAwMD47Cj4gPiAtICAgICB9Owo+ID4gLQo+ID4gLSAgICAgdmRkX2Rz
aTogdmRkLWRzaSB7Cj4gPiAtICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZp
eGVkIjsKPiA+IC0gICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAidmRkX2RzaSI7Cj4gPiAr
ICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gInZjY18zdjMiOwo+ID4gICAgICAgICAgICAg
ICByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPiA+ICAgICAgICAgICAgICAg
cmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47Cj4gPiAgICAgICB9Owo+ID4gQEAg
LTE2NCw3ICsxNTcsNyBAQCBwYW5lbEAwIHsKPiA+ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJvcmlzZXRlY2gsb3RtODAwOWEiOwo+ID4gICAgICAgICAgICAgICByZWcgPSA8MD47IC8qIGRz
aSB2aXJ0dWFsIGNoYW5uZWwgKDAuLjMpICovCj4gPiAgICAgICAgICAgICAgIHJlc2V0LWdwaW9z
ID0gPCZncGlvaCA3IEdQSU9fQUNUSVZFX0xPVz47Cj4gPiAtICAgICAgICAgICAgIHBvd2VyLXN1
cHBseSA9IDwmdmRkX2RzaT47Cj4gPiArICAgICAgICAgICAgIHBvd2VyLXN1cHBseSA9IDwmdmNj
XzN2Mz47Cj4gPiAgICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+Cj4gPiAgICAgICAg
ICAgICAgIHBvcnQgewo+ID4gQEAgLTIxOSw3ICsyMTIsNyBAQCB0aW1lckAyIHsKPiA+Cj4gPiAg
ICZzZGlvIHsKPiA+ICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+IC0gICAgIHZtbWMtc3VwcGx5
ID0gPCZtbWNfdmNhcmQ+Owo+ID4gKyAgICAgdm1tYy1zdXBwbHkgPSA8JnZjY18zdjM+Owo+ID4g
ICAgICAgY2QtZ3Bpb3MgPSA8JmdwaW9nIDIgR1BJT19BQ1RJVkVfTE9XPjsKPiA+ICAgICAgIGJy
b2tlbi1jZDsKPiA+ICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJvcGVuZHJhaW4i
Owo+CgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3Bl
cgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFy
ZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZv
QGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
