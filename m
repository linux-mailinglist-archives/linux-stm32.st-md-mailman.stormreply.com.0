Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB48CA10318
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 10:37:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B858C7802D;
	Tue, 14 Jan 2025 09:37:16 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AA46C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 09:37:09 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e5372a2fbddso8447773276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 01:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736847428; x=1737452228;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l89tcIhQpLFA95BmF/dtjUV+SmX9AcHiGhoZt2rDB4Y=;
 b=XyTOe88RduEd9lF+vDaJP/6a91ne9qrsPp9wzoEwyQH0OU757GHGJ0n2nVcXSqXei/
 17IqY3QTOlDh8bh78KREM9VJ+lYd7/XnItX8XOAosncRO9v4gP9i7SX7vdkfY1zuB5ny
 ZRUBaKrgOuLVZLRh2ot/baSGeTE1hp9ZNfE1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736847428; x=1737452228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l89tcIhQpLFA95BmF/dtjUV+SmX9AcHiGhoZt2rDB4Y=;
 b=SpOmTG9ITnQyPacrtajmhF/6g2hbWnkPcYpCKLts5SiemfnZ1AHRG6+Pie7BhTmQ/0
 YnakO9gBXo57GpfmGNHgTXa+B/oylup0h51p0QOEO46UDap0A9Vl56pvD1STj/9w3HC/
 AiLGAN+B82//bFOkwEZNl/EOd1t7ixYTf++1Q/5OxKlQohCP6VT/MI5jKuQoQ+Ilr8k1
 gIMGG02sa86aMSyN2FnpIx7IWnS3GgNyQxjLP3asltPAbaBsMypLT3WnRQ2ZAsnD6f1W
 FKI2FpOuSgifC3leFFphLo32XjS8364ATxaAETN1n4eo0BaGUoEtmuK0JGQ40SOclGj4
 1Omw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzRRpy4blFARnswZzq5SGPdFqiYOk2a91AW6HG4FRi6itHRiIMBEHwS8WxzPSU8N9IWrW7aaLf5Azz7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyrl44/PKdvtdj/oKm13EtDMdwchWrWG/jk/D61tCIEbKcd9tDE
 6yC5I3VgzKYGWKXHI2SN/BLUzbeYNFtj0OSq5VRWpDZPCBaBCSBiSSDZTNtEDpjTUM6vtu+axfD
 6meI1uGD5DV3yCZ10WlVLzMxcVSCeN06qrhTPUw==
X-Gm-Gg: ASbGncsCCEeQb8ru3K/YwG5AQMLlXUKZvimOhkA/u81UtmEvicflQWY0zOTkNpE+E3Q
 4HiM1Vc6YSX9xkIMKnOASKY48I1bH2c8o5lAf
X-Google-Smtp-Source: AGHT+IF6e2gulZmmKMZM/9qfdCNmIYsXwgatFmybYBzO3L6nSNvtxPxQhBPTkQU3rmXIGx0U/IzVq/5dxO9CIKDtZus=
X-Received: by 2002:a05:6902:12cd:b0:e57:2a07:a97b with SMTP id
 3f1490d57ef6-e572a07ab0bmr10989327276.19.1736847428039; Tue, 14 Jan 2025
 01:37:08 -0800 (PST)
MIME-Version: 1.0
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com>
 <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
In-Reply-To: <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 10:36:57 +0100
X-Gm-Features: AbW1kvbHaMA7-gPSLKl8JCA0np6oyUkVl3x_8EI0Z9Yf3VmqaAgjofQDW5nCXfo
Message-ID: <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-bindings: clock: convert stm32
	rcc bindings to json-schema
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

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMTA6MjnigK9BTSBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMTQvMDEvMjAyNSAxMDoxMSwgRGFyaW8gQmlu
YWNjaGkgd3JvdGU6Cj4gPiBUaGUgcGF0Y2ggY29udmVydHMgc3Qsc3RtMzItcmNjLnR4dCB0byB0
aGUgSlNPTiBzY2hlbWEsIGJ1dCBpdCBkb2VzIG1vcmUKPiA+IHRoYW4gdGhhdC4gVGhlIG9sZCBi
aW5kaW5ncywgaW4gZmFjdCwgb25seSBjb3ZlcmVkIHRoZSBzdG0zMmZ7NCw3fQo+ID4gcGxhdGZv
cm1zIGFuZCBub3QgdGhlIHN0bTMyaDcuIFRoZXJlZm9yZSwgdG8gYXZvaWQgcGF0Y2ggc3VibWlz
c2lvbiB0ZXN0cwo+ID4gZmFpbGluZywgaXQgd2FzIG5lY2Vzc2FyeSB0byBhZGQgdGhlIGNvcnJl
c3BvbmRpbmcgY29tcGF0aWJsZSAoaS4gZS4KPiA+IHN0LHN0bTMyaDc0My1yY2MpIGFuZCBzcGVj
aWZ5IHRoYXQsIGluIHRoaXMgY2FzZSwgMyBhcmUgdGhlIGNsb2NrcyBpbnN0ZWFkCj4gPiBvZiB0
aGUgMiByZXF1aXJlZCBmb3IgdGhlIHN0bTMyZns0LDd9IHBsYXRmb3Jtcy4KPiA+IEFkZGl0aW9u
YWxseSwgdGhlIG9sZCBiaW5kaW5ncyBtYWRlIG5vIG1lbnRpb24gb2YgdGhlIHN0LHN5c2NmZyBw
cm9wZXJ0eSwKPiA+IHdoaWNoIGlzIHVzZWQgYnkgYm90aCB0aGUgc3RtMzJmezQsN30gYW5kIHRo
ZSBzdG0zMmg3IHBsYXRmb3Jtcy4KPiA+Cj4gPiBUaGUgcGF0Y2ggYWxzbyBmaXhlcyB0aGUgZmls
ZXMgcmVmZXJlbmNpbmcgdG8gdGhlIG9sZCBzdCxzdG0zMi1yY2MudHh0Lgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25z
LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+Cj4KPgo+IERyb3AgdGhlIHRhZy4gSXQgd2FzIGNvbmRpdGlvbmFs
Lgo+Cj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIG9u
ZU9mOgo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMy
ZjQyeHgtcmNjCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMyLXJjYwo+ID4gKyAgICAg
IC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0gZW51bToKPiA+ICsgICAgICAgICAgICAgIC0gc3Qs
c3RtMzJmNDY5LXJjYwo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMmY0Mnh4LXJjYwo+
ID4gKyAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMi1yY2MKPiA+ICsgICAgICAtIGl0ZW1zOgo+
ID4gKyAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMmY3NDYtcmNjCj4gPiArICAgICAgICAgIC0g
Y29uc3Q6IHN0LHN0bTMyLXJjYwo+Cj4gTm90aGluZyBpbXByb3ZlZCBoZXJlLgoKSW4gbXkgaHVt
YmxlIG9waW5pb24sIHRoZXJlIGlzIG5vdGhpbmcgdG8gaW1wcm92ZS4gQW55IG1vZGlmaWNhdGlv
bgptYWRlIGNhdXNlcyB0aGUgdGVzdHMgdG8gZmFpbC4KCiQgZ2l0IGdyZXAgc3Qsc3RtMzJmNzQ2
LXJjYyBhcmNoLwphcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3NDYuZHRzaTogICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPQoic3Qsc3RtMzJmNzQ2LXJjYyIsICJzdCxzdG0zMi1yY2Mi
OwphcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3NjktZGlzY28uZHRzOiAgICAgICBjb21wYXRp
YmxlID0KInN0LHN0bTMyZjc2OS1yY2MiLCAic3Qsc3RtMzJmNzQ2LXJjYyIsICJzdCxzdG0zMi1y
Y2MiOwoKT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFy
aW8KPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoK
U2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxh
IFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRv
LCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cu
YW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
