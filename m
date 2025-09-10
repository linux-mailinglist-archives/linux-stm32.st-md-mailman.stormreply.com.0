Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 819CCB51147
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 10:31:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10CECC35E00;
	Wed, 10 Sep 2025 08:31:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28A82C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 08:31:35 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45dd7b15a64so3531075e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757493094; x=1758097894;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PZiUguKRHSjLNl8qev2KvUrL6xayZ/2jdKMeAroqeQk=;
 b=iV1HwukZkNgmIjxBd3oRE3dbDfbSdqYOdwNIzaF4ajGMoakRGtRH89djxGS2tSsLT8
 AWgBu3iQfVxaBiY74T2SLDLlIT22/o/6xWkNSUDc1y5Bm/tyPdLTJDaMZWRAsv/TJK3s
 XXxWotD3rNWpeSjAPck7hOhfyVu5/P5dJc+tzrS1KdX2FlbecbH/wwfemO/ONVaKuN38
 FCKVfht++WUpRGk2Kc+rjgVhgRKUKjSTg8c4qgsTF7RdFUGGT0l8Vbil95tdg1oZQ0xy
 1ZS8jYokREDXjSJ25EYPl+1ubxWvtPMSA1cBoC3LJnBGjYbz1jGVDx8z1EvxoHQ3f2E0
 ezRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757493094; x=1758097894;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PZiUguKRHSjLNl8qev2KvUrL6xayZ/2jdKMeAroqeQk=;
 b=NS7/JcQDiOm03DDS5UgPvNIRv41z6SgS59xnGPSC6snNAMnutGsaeOCTdyGQu4HSgP
 EDzdH66GFOWr47jsJ71MeAI5akT0G/kAo+DueeXi8Tnjj/dQ4SrUcLVew1rpsD2KMUcw
 0hkbid2k/zlSV3dBtrE84DKootJP2KR6dj/EZ9QmI6cxEkzTe734+mzvXsQ99TvnpEBN
 23GUP93P8atWg/HipwxmL8JUs0JaU7/yFibr6+ZpDzfOT20qwlnoM7t39v840AeqahoH
 +cmHULaMiGQbwLE3l5tTCPYmt3lenTx2A5UNWkw3MHS+ERb1G2iZ2k9TOM10Qyq4wtOD
 fZKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7KHpOBWUBDHWHDsLKt7rU02zUsf9iEkJsuSCwpciP81dJaTMJEhKlFYx7ZupqVXabI+sVsw5nDziuvA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy/ZyxX23pWB8+Ur7AOg8Yo4L4P/hRRh99djX5ibh5HhrXG44UU
 OcZIvg6+wuF+y9K2dGQ4RpIWFT6SXfN0/o+9tBoPvnBXwHSpiNcK+yqSCUoZLHWEHIQ=
X-Gm-Gg: ASbGnctsUoJEDQdJ0YK+X+RQLIqGi8qx6d4gRcKOohgm8rh/oz/cUi7c9jLrELcbB2v
 IZi1UPHOsFJEFbmokaJErYgbgWa85Qv2oe81N32AIDptBoykYGUP0BQ07vN6QfOPYHO/9fpZ8j9
 +jHxT5HWHPrKjQUjdkWbOhtBnFx0m3eK5/GP7GtwnlV30xKrU84sErkAVxHiq8n4J9WaASqjs1G
 h+e32tV4+MHu+QpLa8YIOJj7ebNdYAHbJ/+SLEXiJwkpPQ3JTh5asvPz0fyzBXk0IuOV3amFb/r
 FsEV5jyEjIlCYQQasreEMCfpESZQAZFvZfRtELha50k4N4hrH3QgEnUx+DpT3mAYdtoYNFG+vR4
 7xnnm8MTGRz3IwE20Vef8XotrrXoVI7UZTiLBjekGYQjWYYYg8K4vgcMOt4Jsap4sHN9apPojOU
 3d69kU5+qLd6LBBcoCBsVmU8YJT4iYa9VJKDiGYMtK/a5Ds20Se1clciRYSRUMfHzlwuzTzKslm
 Q==
X-Google-Smtp-Source: AGHT+IHtxpNnwR+OSaL4WHAtvZm3SZwKKJRshnL76nqSRl+ub9r1kz9W9fnbmNI59d2V+S62gNIBxA==
X-Received: by 2002:a05:600c:1907:b0:458:b8b0:6338 with SMTP id
 5b1f17b1804b1-45dde1b15b7mr140442595e9.6.1757493094104; 
 Wed, 10 Sep 2025 01:31:34 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:9000:7072:695b:3ef?
 (2a02-8440-7135-4f4c-9000-7072-695b-03ef.rev.sfr.net.
 [2a02:8440:7135:4f4c:9000:7072:695b:3ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e75224bc2csm5817574f8f.54.2025.09.10.01.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 01:31:33 -0700 (PDT)
Message-ID: <4066608d-af1e-41b7-ac7a-6c0aa3791c2f@gmail.com>
Date: Wed, 10 Sep 2025 10:31:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-5-ce082cc801b5@gmail.com>
 <20250910-flat-raptor-of-temperance-5e8c7c@kuoka>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250910-flat-raptor-of-temperance-5e8c7c@kuoka>
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
Subject: Re: [Linux-stm32] [PATCH v6 05/20] dt-bindings: memory: factorise
 LPDDR props into SDRAM props
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

T24gMTAvMDkvMjAyNSAwOTo1NCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiBUdWUs
IFNlcCAwOSwgMjAyNSBhdCAxMjoxMjoxMlBNICswMjAwLCBDbMOpbWVudCBMZSBHb2ZmaWMgd3Jv
dGU6Cj4+IEZyb206IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0
LmNvbT4KPj4KPj4gTFBERFIgYW5kIEREUiBiaW5kaW5ncyBhcmUgU0RSQU0gdHlwZXMgYW5kIGFy
ZSBsaWtlbHkgdG8gc2hhcmUgdGhlIHNhbWUKPj4gcHJvcGVydGllcyAoYXQgbGVhc3QgZm9yIGRl
bnNpdHksIGlvLXdpZHRoIGFuZCByZWcpLgo+PiBUbyBhdm9pZCBiaW5kaW5ncyBkdXBsaWNhdGlv
biwgZmFjdG9yaXNlIHRoZSBwcm9wZXJ0aWVzLgo+Pgo+PiBUaGUgY29tcGF0aWJsZSBkZXNjcmlw
dGlvbiBoYXMgYmVlbiB1cGRhdGVkIGJlY2F1c2UgdGhlIE1SIChNb2RlCj4+IHJlZ2lzdGVycykg
dXNlZCB0byBnZXQgbWFudWZhY3R1cmVyIElEIGFuZCByZXZpc2lvbiBJRCBhcmUgbm90IHByZXNl
bnQKPj4gaW4gY2FzZSBvZiBERFIuCj4+IFRob3NlIGluZm9ybWF0aW9uIHNob3VsZCBiZSBpbiBh
IFNQRCAoU2VyaWFsIFByZXNlbmNlIERldGVjdCkgRUVQUk9NIGluCj4+IGNhc2Ugb2YgRElNTSBt
b2R1bGUgb3IgYXJlIGtub3duIGluIGNhc2Ugb2Ygc29sZGVyZWQgbWVtb3J5IGNoaXBzIGFzCj4+
IHRoZXkgYXJlIGluIHRoZSBkYXRhc2hlZXQgb2YgdGhlIG1lbW9yeSBjaGlwcy4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgo+IAo+IElzIHRoaXMgZW1haWwgZGVmdW5jdCBub3csIHRoYXQgeW91IGFkZCBzZWNvbmQg
U29CPwo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNs
ZW1lbnRAZ21haWwuY29tPgoKSGkgS3J6eXN6dG9mLAo+IAo+IEkgc3RpbGwgc2VlIGluIHRoaXMg
cGF0Y2hzZXQgYXJvdW5kIDUgZGlmZmVyZW50IHN1YnN5c3RlbXMuIE5vdGhpbmcgaW4KPiB0aGUg
Y292ZXIgbGV0dGVyIGV4cGxhaW5zIHRoZSBkZXBlbmRlbmNpZXMsIHNvIGdyb3VwaW5nIGxvb2tz
IGxpa2UKPiBjb2luY2lkZW5jZSBhbmQgeW91IGp1c3QgbWFrZSBpdCBkaWZmaWN1bHQgZm9yIG1h
aW50YWluZXJzIGZvciBubwo+IHJlYXNvbi4KPiAKPiBQbGVhc2Ugb3JnYW5pemUgeW91ciBwYXRj
aHNldHMgcGVyIHN1YnN5c3RlbXMsIHNlZSBzdWJtaXR0aW5nIHBhdGNoZXMKPiBkb2MgZm9yIG1v
cmUgZGV0YWlscy4KClllcyBJIGFncmVlIGl0IGlzIGEgYmlnIHNlcmllcy4KSSdsbCBzcGxpdCBp
dCBhY2NvcmRpbmcgdG8gZWFjaCBzdWJzeXN0ZW0gaXQgdGFyZ2V0cy4KCkJlc3QgcmVnYXJkcywK
Q2zDqW1lbnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
