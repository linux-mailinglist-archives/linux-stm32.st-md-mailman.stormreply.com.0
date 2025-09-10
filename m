Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 919BDB5115F
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 10:33:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 497EDC3FACF;
	Wed, 10 Sep 2025 08:33:43 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E799C3FACE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 08:33:42 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-45dde353b47so18954935e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 01:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757493222; x=1758098022;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EHfbo0BKomkvlXOhBVfB/0eAcoO1X0ualN2+zvtl7Uc=;
 b=IbyK6IIaQ03uqbH/HbrurKUdi7+0s1kV+/qwYUkxTnqHTYpXcA13CJooZ9rC2eDLb1
 oeGHvNbD6glWBV7Hn/tU2u5Yd2044XuYAMug63SfsDCvloF9DjE+STglsetssKfOOpNe
 SOZ04Bt6TvgNscCbyQrlYQOZ+sJXH16hp6ofDOU+ezKX7nuF6txVUk7mRrNnYdkctAHq
 2Gh0/HZsC9W2tc2pK1MqZ82brsGBqQUQ4JvuMV3MiWcDIWvXikZ11+ZppmRH7rcaWvTJ
 W3H0tVrEQDh47NKeTgM2PYGBmHBAdaorfq72Zk4M4AsyYMNEnfvtXcqQmtM+P0XMrs3m
 6XyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757493222; x=1758098022;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EHfbo0BKomkvlXOhBVfB/0eAcoO1X0ualN2+zvtl7Uc=;
 b=oKL5Bp00CFRuBrbC2o4eSMHHzgqI/toeOoKiF/FjxlKYWkG098eqtHvMr06KKdsNuB
 pULxg54uQHZIwVhP8bOwJNhS8baHUzpLov7/wuh9lkQir1Xz3KqrL5P+PsO9M4fhKBJV
 5f9ejeJbmz3x8LwIkXkjXZuIPzzk+ktfSotAk9Tnj+ZcslK7DlRdFQ3NvnoaZTLaEc6e
 M2QayEErbiGF9fui5kXf4aPBb4nKVBpMZiTNclDtyfwlQ/ItIO/fA1SuCh//Xc0lBTuu
 i2SDf7UfA45i5IUsK08Os5rsee/+w7Er1d5j7Zr9OPXrhtoZfq5lg7VSeMm4RZkl2sot
 GYJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCNCSQ2XKbRk/Gjw/hIML3FtZ+ynyahKQCLafEk+AawTq7aj2X+1EQ9p9Igao7xGRNuTCs9wfXcgKmqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy328e1241EdAUPIr8SHw7HdvXWbyxBDfjU8sUJ7bSXQ5LP2lvB
 QK6UTBnGYnkCxwONtL/KAR1aXZ+dubapnzECfbWOU5xhWDi6K1hR/2E1
X-Gm-Gg: ASbGncuegOiarmCUo78b41L9LL+XzN9zFcd0c9g+EgEgO2v6zVHyWdiitUvrKhLvwTI
 Xs8pdRR/pT3kCVaa2JZ37iarbGjUMrQ19BH2hM6iCD8DCGgS0fk4E0JTEIrj4tibjRn2rfbsW+x
 QGurQnNBhVRa4rEWhnt7csguE+fD86N4dt2oPlVnE7Ps8P20j9PtzQS/MYFQI1HmYnSdH0OQEAr
 3ogM4RY5XKD0oqyCPZ1fyOm+zd9dfSLX1aFHrcwDuJX5DgCZLLTXkEhQjsde7lGGjlSkzQqRii3
 aU2a1OQg9nFZNpIGAc4cQZGnJu+hqQDXoZE17FWNz6MbqvgnJIAfKaiS9gZja2tdlI75MXGAe6S
 KwyapN4Zy24tUwXN4rz1ttTvwdTgKCD9k3JjTjqldvAOl7IdCyzyKvb9pU4GD7A8Bvyh13Qqitx
 KlYFGJG3sC+AJKK1mVkTtZNwO9QS79uIDI20YsVsQC7Bbh2KV2mQls7HNSL0qUIgU=
X-Google-Smtp-Source: AGHT+IERWBLoDJYJTftiCvvL8rJvicVn7K1El1ceydxmfro3VBEiw0JoaM94eFug5LOT1WRGb+/cOg==
X-Received: by 2002:a05:600c:a05:b0:45d:d5c6:97b4 with SMTP id
 5b1f17b1804b1-45ded2fb475mr46947715e9.9.1757493221488; 
 Wed, 10 Sep 2025 01:33:41 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:9000:7072:695b:3ef?
 (2a02-8440-7135-4f4c-9000-7072-695b-03ef.rev.sfr.net.
 [2a02:8440:7135:4f4c:9000:7072:695b:3ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7521c9a2esm6376513f8f.14.2025.09.10.01.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 01:33:41 -0700 (PDT)
Message-ID: <7c9eadf3-6b71-48ba-99ad-bca5b8bc40e6@gmail.com>
Date: Wed, 10 Sep 2025 10:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
 <20250910-adamant-hospitable-firefly-ae30c5@kuoka>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250910-adamant-hospitable-firefly-ae30c5@kuoka>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Julius Werner <jwerner@chromium.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v6 12/20] dt-bindings: perf: stm32:
 introduce DDRPERFM dt-bindings
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTAvMDkvMjAyNSAwOTo1NywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiBUdWUs
IFNlcCAwOSwgMjAyNSBhdCAxMjoxMjoxOVBNICswMjAwLCBDbMOpbWVudCBMZSBHb2ZmaWMgd3Jv
dGU6Cj4+IEZyb206IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0
LmNvbT4KPj4KPj4gRERSUEVSRk0gaXMgdGhlIEREUiBQZXJmb3JtYW5jZSBNb25pdG9yIGVtYmVk
ZGVkIGluIFNUTTMyTVBVIFNvQy4KPj4gSXQgYWxsb3dzIHRvIG1vbml0b3IgRERSIGV2ZW50cyB0
aGF0IGNvbWUgZnJvbSB0aGUgRERSIENvbnRyb2xsZXIKPj4gc3VjaCBhcyByZWFkIG9yIHdyaXRl
IGV2ZW50cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50
LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2Zm
aWMgPGxlZ29mZmljLmNsZW1lbnRAZ21haWwuY29tPgo+PiAtLS0KPj4gICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wZXJmL3N0LHN0bTMyLWRkci1wbXUueWFtbCB8IDk0ICsrKysrKysrKysrKysr
KysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgOTQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qsc3RtMzIt
ZGRyLXBtdS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qs
c3RtMzItZGRyLXBtdS55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAw
MDAwMDAwMC4uMWQ5Nzg2MWUzZDQ0Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCj4+IEBA
IC0wLDAgKzEsOTQgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9u
bHkgT1IgQlNELTItQ2xhdXNlKQo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGVyZi9zdCxzdG0zMi1kZHItcG11LnlhbWwjCj4+ICsk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4g
Kwo+PiArbWFpbnRhaW5lcnM6Cj4+ICsgIC0gQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5j
bGVtZW50QGdtYWlsLmNvbT4KPj4gKwo+PiArdGl0bGU6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0z
MiBERFIgUGVyZm9ybWFuY2UgTW9uaXRvciAoRERSUEVSRk0pCj4+ICsKPj4gK3Byb3BlcnRpZXM6
Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgb25lT2Y6Cj4+ICsgICAgICAtIGl0ZW1zOgo+PiAr
ICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMybXAxMzEtZGRyLXBtdQo+PiArICAgICAgLSBpdGVt
czoKPj4gKyAgICAgICAgICAtIGVudW06Cj4+ICsgICAgICAgICAgICAgIC0gc3Qsc3RtMzJtcDE1
MS1kZHItcG11Cj4+ICsgICAgICAgICAgLSBjb25zdDogc3Qsc3RtMzJtcDEzMS1kZHItcG11Cj4+
ICsgICAgICAtIGl0ZW1zOgo+PiArICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMybXAyNTEtZGRy
LXBtdQo+IAo+IFlvdSBkaWQgbm90IGltcGxlbWVudCBSb2IncyBjb21tZW50LgoKSW5kZWVkIEkg
bWlzcyBpdC4gV2lsbCBmaXggaXQgZm9yIHRoZSBuZXh0IHZlcnNpb24uCgpCZXN0IHJlZ2FyZHMs
CkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
