Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BCA8397A9
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jan 2024 19:27:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C9FCC6DD6D;
	Tue, 23 Jan 2024 18:27:36 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36E8CC6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 18:27:35 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dbe344a6cf4so4038814276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 10:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706034454; x=1706639254;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4iXjdB14EGx1ap8/L42aOnqGTQ+/kTUhw6/TZGOMWuQ=;
 b=fz92wY+4AKx+5XMJx53KZcm+g10PBNzx4LORmXEzYuyE1bjwqPfe3KJzB7jh+IhX/J
 6cbBPpDFNWHfBESi+WPUnDkoKq04mWqbXfPBSZ1UWEWurzFMxz8oVWmdJMn4mCqfSJa8
 uItKToS3GtpKeSclWOaJY/iS/J6Wbvn0wHAaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706034454; x=1706639254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4iXjdB14EGx1ap8/L42aOnqGTQ+/kTUhw6/TZGOMWuQ=;
 b=wOOd4U5XONj2JE4P4UFX2M1qoi8vVqRxA5O0Kz4fCkW2KE7EAkemM6zTKz2RJDutft
 aLIr3N+eeDth8YjFwZSLKPe72Vxti2YqfaG9qX9/ZMqgHh28GYCLH7SnCRE92nW10+eB
 X/UymR8EBSJJRngPFatPUCHZ+Lc0Q7cAXKREVdd7nYFPCBOB3jIRprqfxvUQ6P8jJJ8/
 dMCE+pVVpUBGqlft3GGgeXmfF3ObPUMUmks80tFNLLyjcfUNAzvW7RUHPJw2484vANeb
 PSOhxW+I4rvw+Ka+t8EB+fLdRVQqZDxvr/JNQ2SdIAQ2Hx+qSH3HNZGpYH3iaJfvTCQx
 cPJg==
X-Gm-Message-State: AOJu0YzJ5bRKNGQlpi1Fd3Z48Zfd+Y9bWQu6YjK5PjvxRcfsRCwtT6Xd
 YwSVqY/5ip65R7jhqvmAXF27ctBV8ngxYL6svGuXR3hdMtUdEAPWylhAHg/9Ba0sTU+uWJaUv/X
 YHA+iuCcYcFsVK8rOMduzYoSGuPygE4apxknX4A==
X-Google-Smtp-Source: AGHT+IHVZHeolBjGG9wXw9cp0ut6R99LTCUcJAQ6AtSieMrLx8ZzLA1bcIxY8fAXn9j9l84z0oW21VurCWKLFClNa8s=
X-Received: by 2002:a5b:844:0:b0:dc3:4f94:19d3 with SMTP id
 v4-20020a5b0844000000b00dc34f9419d3mr2559715ybq.61.1706034454031; Tue, 23 Jan
 2024 10:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20240112144902.40044-1-dario.binacchi@amarulasolutions.com>
 <20240112144902.40044-4-dario.binacchi@amarulasolutions.com>
 <f38e8afb-bf08-401e-a747-612a68b96414@foss.st.com>
In-Reply-To: <f38e8afb-bf08-401e-a747-612a68b96414@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 23 Jan 2024 19:27:23 +0100
Message-ID: <CABGWkvqDX5czR+2zsH0aStPt5nbDLU_45rDDjGawKFH23e4FQg@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 3/5] ARM: dts: stm32: rename mmc_vcard
	to vcc-3v3 on stm32f769-disco
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

SGkgQWxleGFuZHJlLAoKT24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgNTozMeKAr1BNIEFsZXhhbmRy
ZSBUT1JHVUUKPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gSGkgRGFy
aW8KPgo+IE9uIDEvMTIvMjQgMTU6NDgsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+ID4gSW4gdGhl
IHNjaGVtYXRpY3Mgb2YgZG9jdW1lbnQgVU0yMDMzLCB0aGUgcG93ZXIgc3VwcGx5IGZvciB0aGUg
bWljcm8gU0QKPiA+IGNhcmQgaXMgdGhlIHNhbWUgM3YzIHZvbHRhZ2UgdGhhdCBpcyB1c2VkIHRv
IHBvd2VyIG90aGVyIGRldmljZXMgb24gdGhlCj4gPiBib2FyZC4gQnkgZ2VuZXJhbGl6aW5nIHRo
ZSBuYW1lIG9mIHRoZSB2b2x0YWdlIHJlZ3VsYXRvciwgaXQgY2FuIGJlCj4gPiByZWZlcmVuY2Vk
IGJ5IG90aGVyIG5vZGVzIGluIHRoZSBkZXZpY2UgdHJlZSB3aXRob3V0IGNyZWF0aW5nCj4gPiBt
aXN1bmRlcnN0YW5kaW5ncy4KPiA+Cj4gPiBUaGlzIHBhdGNoIGlzIHByZXBhcmF0b3J5IGZvciBm
dXR1cmUgZGV2ZWxvcG1lbnRzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hp
IDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBS
YXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+ID4K
PiA+IC0tLQo+ID4KPiA+IENoYW5nZXMgaW4gdjg6Cj4gPiAtIEFkZCBSZXZpZXdlZC1ieSB0YWcg
b2YgUmFwaGFlbCBHYWxsYWlzLVBvdQo+ID4KPiA+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJmNzY5LWRpc2NvLmR0cyB8IDYgKysrLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMyZjc2OS1kaXNjby5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
MmY3NjktZGlzY28uZHRzCj4gPiBpbmRleCA1ZDEyYWUyNWIzMjcuLjg2MzJiZDg2NjI3MiAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc2OS1kaXNjby5kdHMKPiA+
ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc2OS1kaXNjby5kdHMKPiA+IEBAIC05
Miw5ICs5Miw5IEBAIHVzYm90Z19oc19waHk6IHVzYi1waHkgewo+ID4gICAgICAgICAgICAgICBj
bG9jay1uYW1lcyA9ICJtYWluX2NsayI7Cj4gPiAgICAgICB9Owo+ID4KPiA+IC0gICAgIG1tY192
Y2FyZDogbW1jX3ZjYXJkIHsKPiA+ICsgICAgIHZjY18zdjM6IHZjY18zdjMgewo+Cj4gUmVwbGFj
ZSBub2RlIG5hbWUgYnkgdmNjLTN2My4gSWYgbm8gdjkgc2VudCwgSSdsbCBkbyBpdCBkaXJlY3Rs
eS4KCkknbGwgZG8gaXQKClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4KPiA+ICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+ID4gLSAgICAgICAgICAgICBy
ZWd1bGF0b3ItbmFtZSA9ICJtbWNfdmNhcmQiOwo+ID4gKyAgICAgICAgICAgICByZWd1bGF0b3It
bmFtZSA9ICJ2Y2NfM3YzIjsKPiA+ICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3Zv
bHQgPSA8MzMwMDAwMD47Cj4gPiAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0
ID0gPDMzMDAwMDA+Owo+ID4gICAgICAgfTsKPiA+IEBAIC0xMjgsNyArMTI4LDcgQEAgJnJ0YyB7
Cj4gPgo+ID4gICAmc2RpbzIgewo+ID4gICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gLSAgICAg
dm1tYy1zdXBwbHkgPSA8Jm1tY192Y2FyZD47Cj4gPiArICAgICB2bW1jLXN1cHBseSA9IDwmdmNj
XzN2Mz47Cj4gPiAgICAgICBjZC1ncGlvcyA9IDwmZ3Bpb2kgMTUgR1BJT19BQ1RJVkVfTE9XPjsK
PiA+ICAgICAgIGJyb2tlbi1jZDsKPiA+ICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIs
ICJvcGVuZHJhaW4iLCAic2xlZXAiOwoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1i
ZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNv
bQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25z
IFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiAr
MzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29s
dXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
