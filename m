Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD48AA102BB
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 10:11:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74C7BC7802D;
	Tue, 14 Jan 2025 09:11:09 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCDBBC7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 09:11:02 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so9332541276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 01:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736845861; x=1737450661;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=laOni/3pZswCtnZWqEbh9/nDgLWlbXlzzIl5mtJ7ij0=;
 b=kGBOWFt6RwXNqnVX6P7h6NAKwX2AJasj2YDLrLSJ+OHL2/s8mAOWF+UJCN3gofEy6R
 QgiczvrUMOHl6goGoEaIV507PeCcFQMH7EDYme3wZ/V2ciGtio2ijRZyylCMzxydHa6w
 In4cpP5YalMSskLckI3gB2pljNEm90duvcvlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736845861; x=1737450661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=laOni/3pZswCtnZWqEbh9/nDgLWlbXlzzIl5mtJ7ij0=;
 b=qzUyIxvUmH46ldfRpEc6QG26HtPHefRJvClb/1jGNV9XbumGF+U7+C6BTsE2e9Rgqq
 Yrwpi/p9O1eQV1wlYa91s6J2u0KoNpBJO2s782F3JVLEXvL399GpGMt9KGDuZk85tLko
 JrzGYE0ykNIQQC1vzfRKEOBEeDqZ8kRUEdMakLL1mSW5VKBYno+mcpDqG2VEkESihKek
 MhsdU17EqX1UNIeAsHAKXPOWEjG5VQdaXcV4mW75hZ44qjahSKil1F0ukkxdaN8aTzee
 gDTMCsGkLEEgdCM0NyAB//m5lxgORI0ghWcwwCPppcc7d1LbZr+/+QD/gHJKfWGZkc/3
 W/gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZpS4+aQFflj3pi9UFb1A7fnl4nxIqAgaNmMBQQ9GPqQPeemhBhEL17xnkkeFfCNpdRV3fenfXW7b1BQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzd6j32zQqmHt0i/ZyQhS3NRBnEebCXADL93IX0MhpAhZy8ton0
 pO1PSV8llxEbRa+iSbGf5ajs5RciHFMQBZDCQEWtf+HB9/4WTBZS7+qUG4YU0QkO13ikQ/0prSu
 WdLOseqiuKhd33SyN3ASZfF+1LYKVnjFrF7o/yQ==
X-Gm-Gg: ASbGnctTRvzErCkLlpkm/2bE7dmsMaq7/RIQAA5kuF4y6woqvVQeLscww7lUHT+oVU7
 9uWhCWeu/m0ALISWF6rLobAhS1lKnMEuxaSbP
X-Google-Smtp-Source: AGHT+IE9CA2Xfhzw3GHaovQ1IHfqCWAXv4doOMw3356PJ8sdDTE1sLuY9FIcA5CUBN/UDJxnGUnMXzDsrursJPWiJDo=
X-Received: by 2002:a05:6902:72a:b0:e38:af38:de3c with SMTP id
 3f1490d57ef6-e54ee138757mr17712009276.17.1736845861696; Tue, 14 Jan 2025
 01:11:01 -0800 (PST)
MIME-Version: 1.0
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
 <20250109211908.1553072-2-dario.binacchi@amarulasolutions.com>
 <bfxyod5l2s6g3j47be7mjh6i7wgjapka2q5b6f2mleipiai6gm@hfvclvkzrtyd>
In-Reply-To: <bfxyod5l2s6g3j47be7mjh6i7wgjapka2q5b6f2mleipiai6gm@hfvclvkzrtyd>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 10:10:51 +0100
X-Gm-Features: AbW1kvak2sUesICzzkmsj5TX2inw2Pxvk9l2RhEMwr_4GvlhnKKbrVqsFXF8zsk
Message-ID: <CABGWkvqu10dyW6y5S7qvY4G7uh0OaUgr6k-F7BA1AU0H9bA9GQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] dt-bindings: clock: convert stm32
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

T24gU2F0LCBKYW4gMTEsIDIwMjUgYXQgMTA6MjXigK9BTSBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBKYW4gMDksIDIwMjUgYXQgMTA6MTg6
MjhQTSArMDEwMCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gPiArbWFpbnRhaW5lcnM6Cj4gPiAr
ICAtIERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4K
PiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gKyAgVGhlIFJDQyBJUCBpcyBib3RoIGEgcmVz
ZXQgYW5kIGEgY2xvY2sgY29udHJvbGxlci4KPiA+ICsgIFRoZSByZXNldCBwaGFuZGxlIGFyZ3Vt
ZW50IGlzIHRoZSBiaXQgbnVtYmVyIHdpdGhpbiB0aGUgUkNDIHJlZ2lzdGVycyBiYW5rLAo+ID4g
KyAgc3RhcnRpbmcgZnJvbSBSQ0MgYmFzZSBhZGRyZXNzLgo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6
Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBvbmVPZjoKPiA+ICsgICAgICAtIGl0ZW1zOgo+
ID4gKyAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMmY0Mnh4LXJjYwo+ID4gKyAgICAgICAgICAt
IGNvbnN0OiBzdCxzdG0zMi1yY2MKPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgICAt
IGVudW06Cj4gPiArICAgICAgICAgICAgICAtIHN0LHN0bTMyZjQ2OS1yY2MKPiA+ICsgICAgICAg
ICAgLSBjb25zdDogc3Qsc3RtMzJmNDJ4eC1yY2MKPiA+ICsgICAgICAgICAgLSBjb25zdDogc3Qs
c3RtMzItcmNjCj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBjb25zdDogc3Qs
c3RtMzJmNzQ2LXJjYwo+Cj4gV2h5IHRoaXMgaXNuJ3QganVzdCBwYXJ0IG9mIGVudW0gd2l0aCBm
aXJzdCBncm91cC9saXN0PyBEaWZmZXJlbnQKPiBncm91cHMvbGlzdHMgYXJlIGZvciBkaWZmZXJl
bnQgZmFsbGJhY2tzIGFuZCBJIGFtIHByZXR0eSBzdXJlIGZhbGxiYWNrCj4gaXMgdGhlIHNhbWUu
CgpJIHRyaWVkIHJ1bm5pbmcgdGVzdHMgYWZ0ZXIgYXBwbHlpbmcgdGhlIGNoYW5nZXMgeW91IHN1
Z2dlc3RlZCwgYnV0CnRoZSB0ZXN0cyBhcmUgZmFpbGluZy4KVGhhbmtzIGFuZCByZWdhcmRzLApE
YXJpbwoKPgo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMi1yY2MKPiA+ICsgICAgICAt
IGl0ZW1zOgo+ID4gKyAgICAgICAgICAtIGVudW06Cj4gPiArICAgICAgICAgICAgICAtIHN0LHN0
bTMyZjc2OS1yY2MKPiA+ICsgICAgICAgICAgLSBjb25zdDogc3Qsc3RtMzJmNzQ2LXJjYwo+ID4g
KyAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMi1yY2MKPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4g
KyAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMmg3NDMtcmNjCj4KPiBTYW1lIGhlcmUuCj4KPiBS
ZXN0IGxvb2tzIGdvb2QsIHNvIHdpdGggY29tYmluaW5nIGVudHJpZXMgYWJvdmU6Cj4KPiBSZXZp
ZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+CgoKLS0gCgpEYXJpbyBCaW5hY2No
aQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVs
YXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFy
dWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVu
ZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3
d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
