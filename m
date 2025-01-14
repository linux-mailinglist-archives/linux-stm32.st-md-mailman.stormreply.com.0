Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29459A10382
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 11:00:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9431C7802D;
	Tue, 14 Jan 2025 10:00:23 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5986AC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 10:00:22 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e5372a2fbddso8476016276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 02:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736848821; x=1737453621;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qoa+TnZ+eJVmynifYlg3CNbZeNLJM90IDeQADpEz0bE=;
 b=fV77Qpd2U936AxzF8PmvnPwu0ppGnzgPp7sISHlqlFHM1gq2fX6w7ptPSlfUcM3z96
 DChuvY1MJxFIvWA4oDPNNYKMx7GeMGH4UZNiBwie6vCJH/qoXQO2/x4Zedh+8qDueBKq
 mUy/CJ0GV7Vgvd0W55cpGpWj0OGsp+B6T7rA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736848821; x=1737453621;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qoa+TnZ+eJVmynifYlg3CNbZeNLJM90IDeQADpEz0bE=;
 b=tPLTKqCTgWk919qL57ssftaaUJ+BOpZnqF19lAQXZLO6Eiur9CLP3OzxzrMC+boCJt
 8ROCoMMX/tkFNdTJatxPIfYz9pYZ7/8V0uVoH3SAkMKgL9k0D+nsJir9NKdV5+TLpJbl
 UY8vK5vSpmazq5iekvr9mWxxIBERzag2DU9D+zLbpFW8s5JBxp8B8q44Bd/Hat4l0y4s
 GQCZWTqM/cczXKNVOOqCD2Y6SaE2WftkhCjCphHleHsiS/l053NBq1uaDItrrboOPr6W
 AIJIBfuLvOSWCUHpkGwYMwsVeIhNfwXxTuNoo/gWs0Sqiw0HS+a+mpcAjNNld/pJYXvo
 GBNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwA53jfToKRqCAfTrMKD/d0BE3SVET+5YV8EJ3p0I81Edj417nx50CGxDyHr1vUdiXxd5dLHK2d++LxQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzk4GPRUd86wCt5C6hsHbP5QpANZzWv4v2PE4OhprVKSfobQYih
 dDTGSRod9lfNpFoXnbfjriMoEe5nvHwQkgTb+339ExJdc2JzLvFxJgcOOILN0YlnBt1dz0g8E4a
 XLakWO/UslkH/ynA6QoPxDwNdzucsmaza0HOZdg==
X-Gm-Gg: ASbGnctitUoLeBGc9wI5aRLNP8u7ixWEoMf/uFBLHl5JP36uFNymQSw4pQYG5Yz98mQ
 KfMxVsaLttZUp4aO6wHoiQqrVonMFcyZnVSXu
X-Google-Smtp-Source: AGHT+IHHg2Sovq+Z/vvKo0y9q781hVUrhXP9TC8xIJIu4TiqIQanvvQOUqy3tbZsmXEZ8ARVy4PjE9+PGPJyEEUoEwE=
X-Received: by 2002:a25:53c9:0:b0:e4a:fc25:30cb with SMTP id
 3f1490d57ef6-e54ee2345d5mr13391673276.46.1736848819839; Tue, 14 Jan 2025
 02:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com>
 <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
 <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
 <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org>
In-Reply-To: <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 11:00:09 +0100
X-Gm-Features: AbW1kvb-e25fGlxc4UPaUwDS8MpzQn87D6z9dSdnvOHiAHJ_tEcZc2pAxesQjxU
Message-ID: <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
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

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMTA6NDjigK9BTSBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMTQvMDEvMjAyNSAxMDozNiwgRGFyaW8gQmlu
YWNjaGkgd3JvdGU6Cj4gPj4gTm90aGluZyBpbXByb3ZlZCBoZXJlLgo+ID4KPiA+IEluIG15IGh1
bWJsZSBvcGluaW9uLCB0aGVyZSBpcyBub3RoaW5nIHRvIGltcHJvdmUuIEFueSBtb2RpZmljYXRp
b24KPiA+IG1hZGUgY2F1c2VzIHRoZSB0ZXN0cyB0byBmYWlsLgo+ID4KPiA+ICQgZ2l0IGdyZXAg
c3Qsc3RtMzJmNzQ2LXJjYyBhcmNoLwo+ID4gYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNzQ2
LmR0c2k6ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0KPiA+ICJzdCxzdG0zMmY3NDYt
cmNjIiwgInN0LHN0bTMyLXJjYyI7Cj4gPiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3Njkt
ZGlzY28uZHRzOiAgICAgICBjb21wYXRpYmxlID0KPiA+ICJzdCxzdG0zMmY3NjktcmNjIiwgInN0
LHN0bTMyZjc0Ni1yY2MiLCAic3Qsc3RtMzItcmNjIjsKPiA+Cj4gPiBPciBhbSBJIG1pc3Npbmcg
c29tZXRoaW5nPwo+Cj4gSG93IGNhbiBJIGtub3cgd2hhdCB5b3UgYXJlIG1pc3NpbmcgaWYgeW91
IGRvIG5vdCBzaG93IHRoZSBjb2RlPwoKU29ycnksIGJ1dCBJIHN0aWxsIGNhbid0IHVuZGVyc3Rh
bmQuIEkgcnVuIG11bHRpcGxlIHRlc3RzLCB0cnlpbmcgdG8KbW9kaWZ5IHRoaW5ncwpiYXNlZCBv
biB3aGF0IEkgdW5kZXJzdG9vZCBvZiB5b3VyIHN1Z2dlc3Rpb25zLCBidXQgdGhlIHRlc3RzIGZh
aWxlZApldmVyeSB0aW1lLgoKQ291bGQgeW91IGtpbmRseSBwcm92aWRlIGFuIGV4YW1wbGUgb2Yg
d2hhdCB5b3UnZCBsaWtlIG1lIHRvIGRvPwoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwo+Cj4g
QmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3Ig
RW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25z
LmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRp
b25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpU
LiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxh
c29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
