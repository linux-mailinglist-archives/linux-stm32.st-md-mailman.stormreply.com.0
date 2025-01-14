Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB46A10547
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 12:25:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07B63C7802D;
	Tue, 14 Jan 2025 11:25:34 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F08CC7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 11:25:26 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e3c9ec344efso8336151276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 03:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736853925; x=1737458725;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DNeWxGrE8uIS0WDqmIGcYolBV0o+ZDhi6egQ4fiiws8=;
 b=OuvsGk0fOa1dfKnXpJrdAqOeZ8ZuF4avO96DZ6t8lBfjg0/YAjD3efStLzkNRgmrkG
 Z5AaaWpqfwGXfpLgcpkVqY8HewA0Qz1xF0wmIeS/ef97eD3OfVnaav/Yqfz2JlDAL/gJ
 0ZO25fv+OB+w8CNmA0S6GHTvlxnoZ5EfPt8WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736853925; x=1737458725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DNeWxGrE8uIS0WDqmIGcYolBV0o+ZDhi6egQ4fiiws8=;
 b=F131B0+BreCcDG7oIedlyOYgxxN8md/Klt2HT+5xowb0clmv+nXsB7ZEIRa//LmWnY
 WOdDiurQzLDZzovBXcw46xdCFCT9Boq/PZkZklRtljp+rjblx+BBbIxPKhXwlRBzxOEM
 ow+184t1Op/1JHiQnW5fSMO7n4Qc5hy99D3lgnYTmc6pIbiccryLbDksRrt6qGgIpxc5
 swO/ytWzQtPzBQ50n1NLwJBF4CS32G02QwDqE45bmsaIEutUoEjYABnNF0dgFB/hjPLJ
 ciHLK6APnHvDufqTFqod3gpueeoVM32nlFAnRZBqft04BkCgOUzI1z6T4F27YjLJEE05
 Ahwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtspyPxy+vQlIzenjMbaF84VMZ2UkjQKXNp7sbzVoGx9WlvXu9Tx0OOho7/48JAegjkf8MoEcd1IYaVg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxpSPAND7N/z1n4zTkC4pbaHJkWMUD2aJ0gwx+VEqCuFpdPLMnB
 SCKk9hA35mECdJFyxL/rEPZ/UR3YbxAUqC5RI4CvKIY6rt29ER1xuSiuidlKQoDhPfYNkpuLrwI
 dzt4tJGWhiHxKYteED6Q7IctGErBuGBAC0FBl4A==
X-Gm-Gg: ASbGncsZsdpbuw39AVwNIvJmbvpl0d76DOFc1aXlX4UCDXW1bRSfMM2veVoS27kPbWu
 5w0zzyiMtkV3X4PnODCRd7NKdvharkyob+Sdh
X-Google-Smtp-Source: AGHT+IE5ADFy4Rcdxdx8eIWS6qutMEezXMUhyeb5SIbQjo2wdqwdsiAVueYpuLW3T5twpKf4mq41MGduOKyevWn0ZOQ=
X-Received: by 2002:a05:6902:988:b0:e57:3a77:99b6 with SMTP id
 3f1490d57ef6-e573a779d1bmr8361818276.19.1736853925209; Tue, 14 Jan 2025
 03:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com>
 <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
 <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
 <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org>
 <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
 <581275bf-11f3-4a8a-8e58-75b00c515c79@linaro.org>
In-Reply-To: <581275bf-11f3-4a8a-8e58-75b00c515c79@linaro.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 12:25:14 +0100
X-Gm-Features: AbW1kvaNobnTd2MQAHzRF4uGLRR152GowylzO20cIOWKbfYsbQamDcVMjctIi7w
Message-ID: <CABGWkvpGGdjJVTHppOohGPq3yi_Y20t9b0WWkPOriFU9=CHQMg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
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

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMTE6MTPigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gMTQvMDEvMjAyNSAx
MTowMCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gPiBPbiBUdWUsIEphbiAxNCwgMjAyNSBhdCAx
MDo0OOKAr0FNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pj4KPiA+PiBPbiAxNC8wMS8yMDI1IDEwOjM2LCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiA+Pj4+
IE5vdGhpbmcgaW1wcm92ZWQgaGVyZS4KPiA+Pj4KPiA+Pj4gSW4gbXkgaHVtYmxlIG9waW5pb24s
IHRoZXJlIGlzIG5vdGhpbmcgdG8gaW1wcm92ZS4gQW55IG1vZGlmaWNhdGlvbgo+ID4+PiBtYWRl
IGNhdXNlcyB0aGUgdGVzdHMgdG8gZmFpbC4KPiA+Pj4KPiA+Pj4gJCBnaXQgZ3JlcCBzdCxzdG0z
MmY3NDYtcmNjIGFyY2gvCj4gPj4+IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni5kdHNp
OiAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9Cj4gPj4+ICJzdCxzdG0zMmY3NDYtcmNj
IiwgInN0LHN0bTMyLXJjYyI7Cj4gPj4+IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc2OS1k
aXNjby5kdHM6ICAgICAgIGNvbXBhdGlibGUgPQo+ID4+PiAic3Qsc3RtMzJmNzY5LXJjYyIsICJz
dCxzdG0zMmY3NDYtcmNjIiwgInN0LHN0bTMyLXJjYyI7Cj4gPj4+Cj4gPj4+IE9yIGFtIEkgbWlz
c2luZyBzb21ldGhpbmc/Cj4gPj4KPiA+PiBIb3cgY2FuIEkga25vdyB3aGF0IHlvdSBhcmUgbWlz
c2luZyBpZiB5b3UgZG8gbm90IHNob3cgdGhlIGNvZGU/Cj4gPgo+ID4gU29ycnksIGJ1dCBJIHN0
aWxsIGNhbid0IHVuZGVyc3RhbmQuIEkgcnVuIG11bHRpcGxlIHRlc3RzLCB0cnlpbmcgdG8KPgo+
IFlvdSBkb24ndCB1bmRlcnN0YW5kIHRoYXQgSSBjYW5ub3QgaW1wcm92ZSB5b3VyIGNvZGUgaWYg
SSBkbyBub3Qgc2VlIHRoZQo+IGNvZGU/IFNvIGxldCBtZSByZXBocmFzZTogSW4gb3JkZXIgdG8g
dGVsbCB3aGF0IGlzIHdyb25nIHdpdGggc29tZSBzb3J0Cj4gb2YgY29kZSwgSSBuZWVkIHRvIHNl
ZSBpdC4gSSBjYW5ub3QgdGVsbCB3aGF0IGlzIHdyb25nIHdpdGggY29kZSB3aXRob3V0Cj4gc2Vl
aW5nIGl0LgoKWW91IHRvbGQgbWUgdGhhdCB0aGlzIGNvZGUgd2FzIG5vdCBleGFjdGx5IGNvcnJl
Y3QgZm9yIHRoZSBwYXJ0cwptYXJrZWQgd2l0aCAqKioqKioqKio6Cgpwcm9wZXJ0aWVzOgogIGNv
bXBhdGlibGU6CiAgICBvbmVPZjoKICAgICAgLSBpdGVtczoKICAgICAgICAgIC0gY29uc3Q6IHN0
LHN0bTMyZjQyeHgtcmNjCiAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMi1yY2MKICAgICAgLSBp
dGVtczoKICAgICAgICAgIC0gZW51bToKICAgICAgICAgICAgICAtIHN0LHN0bTMyZjQ2OS1yY2MK
ICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMyZjQyeHgtcmNjCiAgICAgICAgICAtIGNvbnN0OiBz
dCxzdG0zMi1yY2MKICAgICAgLSBpdGVtczoKICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMyZjc0
Ni1yY2MgKioqKioqKioKICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMyLXJjYwogICAgICAtIGl0
ZW1zOgogICAgICAgICAgLSBlbnVtOgogICAgICAgICAgICAgIC0gc3Qsc3RtMzJmNzY5LXJjYwog
ICAgICAgICAgLSBjb25zdDogc3Qsc3RtMzJmNzQ2LXJjYwogICAgICAgICAgLSBjb25zdDogc3Qs
c3RtMzItcmNjCiAgICAgIC0gaXRlbXM6CiAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMmg3NDMt
cmNjICoqKioqKioqKgogICAgICAgICAgLSBjb25zdDogc3Qsc3RtMzItcmNjCgpJIGhhdmVuJ3Qg
Zm91bmQgYSB3YXkgdG8gbWFrZSBjaGFuZ2VzIHRvIHRob3NlIGVsZW1lbnRzIHdpdGhvdXQgY2F1
c2luZyB0aGUKdGVzdHMgdG8gZmFpbC4gQ291bGQgeW91IGtpbmRseSBwcm92aWRlIG1vcmUgZXhw
bGljaXQgZ3VpZGFuY2Ugb24gdGhlIGtpbmQgb2YKbW9kaWZpY2F0aW9uIHlvdSdyZSBleHBlY3Rp
bmc/CgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCgo+Cj4gPiBtb2RpZnkgdGhpbmdzCj4gPiBi
YXNlZCBvbiB3aGF0IEkgdW5kZXJzdG9vZCBvZiB5b3VyIHN1Z2dlc3Rpb25zLCBidXQgdGhlIHRl
c3RzIGZhaWxlZAo+ID4gZXZlcnkgdGltZS4KPiA+Cj4gPiBDb3VsZCB5b3Uga2luZGx5IHByb3Zp
ZGUgYW4gZXhhbXBsZSBvZiB3aGF0IHlvdSdkIGxpa2UgbWUgdG8gZG8/Cj4gQW55IHFjb20gYmlu
ZGluZz8gQW55IG90aGVyIFNvQyBiaW5kaW5nIHdpdGggbXVsdGlwbGUgZGV2aWNlcz8KPgo+IEJl
c3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKLS0KCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRk
ZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNS
TAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkg
MDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRp
b25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
