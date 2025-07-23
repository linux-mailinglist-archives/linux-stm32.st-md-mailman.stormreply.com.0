Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6C0B0EC81
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 09:57:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47010C36B36;
	Wed, 23 Jul 2025 07:57:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17AACC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 07:57:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N7qgYZ031584;
 Wed, 23 Jul 2025 09:57:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 B9CGQSY2Py+TZMZxIwRcfvLPf3wajH5A3vCs0pp3i9Q=; b=di8j4sub3XTf9LsH
 X3dV4EP7HD0tF4hOkMzn7by90Vv+bnZ5O/eS2q7mX0dzb+5Z+3EI9uKK417Nvut0
 HAut6dDHExdJRkhXw/hVUHj1nPUY0vSgbcIX/Tv8aB6IIy4jsAturVe4pFr8jJam
 QJR6cRH7YRTfk0rZDL74wL1QYCCYPfMZ7LbftKm9bS/BVIg3YtAUjv1mewRUQoox
 M5Ls81AP09y/0lwCpD6kIrOJbbUtCBcwHTFRTuhywhxRNyQBzyMueaqDtwxh48g+
 oVJvJg2Dq5WRioKvQaUVZ/x/ybQmwrQxFlfx5sazxaBcOUpMAEl1izE6Fwm55F5O
 OLZfXA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8tc0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 09:57:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3848D40048;
 Wed, 23 Jul 2025 09:55:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5064A6BAAD0;
 Wed, 23 Jul 2025 09:54:33 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 09:54:32 +0200
Message-ID: <d9432ec2-7075-4fef-ab39-aa93f4e91eb9@foss.st.com>
Date: Wed, 23 Jul 2025 09:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julius Werner <jwerner@chromium.org>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
 <CAODwPW-kVcnVtVakXs7aBcwb_nv0bLTaK5PKNo4zmJaJ=VC8Wg@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CAODwPW-kVcnVtVakXs7aBcwb_nv0bLTaK5PKNo4zmJaJ=VC8Wg@mail.gmail.com>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 07/19] dt-bindings: memory: factorise
 LPDDR channel binding into memory channel
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

T24gNy8yMi8yNSAyMzo1OCwgSnVsaXVzIFdlcm5lciB3cm90ZToKPj4gKyAgcHVycG9zZSBvZiB0
aGlzIG5vZGUgaXMgdG8gb3ZlcmFsbCBtZW1vcnkgdG9wb2xvZ3kgb2YgdGhlIHN5c3RlbSwgaW5j
bHVkaW5nIHRoZQo+IAo+IG5pdDogTWlnaHQgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gZml4IHRo
ZSB0eXBvIGhlcmUgKG1pc3Npbmcgd29yZHM6Cj4gImlzIHRvIGRlc2NyaWJlIHRoZSBvdmVyYWxs
IG1lbW9yeSB0b3BvbG9neSIpLgoKWWVzIHRydWUuCgo+IAo+PiAgICAgLSBKdWxpdXMgV2VybmVy
IDxqd2VybmVyQGNocm9taXVtLm9yZz4KPiAKPiBXaHkgcmVtb3ZlIG1lPyAoQWx0aG91Z2ggSSdt
IGFsc28gbm90IHJlYWxseSBzdXJlIHdoeSBJJ20gbWFpbnRhaW5lcgo+IGZvciB0aGlzIGZpbGUg
YW5kIEtyenlzenRvZiBmb3IgYWxsIHRoZSBvdGhlcnMsIHRiaC4pCgpJIGRpZG4ndCByZW1vdmUg
eW91LiBJdCBpcyBqdXN0IHRoZSBtaW51cyBvZiB0aGUgbWFpbnRhaW5lciBsaXN0IDotKQoKPiAK
Pj4gICBleGFtcGxlczoKPj4gICAgIC0gfAo+IAo+IEkgdGhpbmsgdGhhdCdzIGEgbG9hZC1iZWFy
aW5nIHBpcGUgY2hhcmFjdGVyIHlvdSdyZSByZW1vdmluZyBoZXJlPwoKRGlkbid0IHJlbW92ZSBl
aXRoZXIuIFRoZXJlIGFyZSBzcGFjZXMgYmVmb3JlIHNvIGl0IGl0IGlzIG5vdCB0aGUgZ2l0IApt
aW51cyBjaGFyLgoKPiAKPj4gLSAgICBscGRkci1jaGFubmVsMCB7Cj4+ICsgICAgbWVtb3J5LWNo
YW5uZWwwIHsKPiAKPiBKdXN0IHRvIGRvdWJsZS1jaGVjaywgdGhlIG5hbWUgb2YgdGhpcyBub2Rl
IGRvZXNuJ3QgcmVhbGx5IG1lYW4KPiBhbnl0aGluZyBhbmQgaXNuJ3QgZGlyZWN0bHkgaW50ZXJw
cmV0ZWQgYnkgdGhlIGtlcm5lbCwgcmlnaHQ/IEknbSBmaW5lCj4gd2l0aCBjaGFuZ2luZyB0aGUg
ZXhhbXBsZSBoZXJlIHRvIGZpdCBiZXR0ZXIgd2l0aCB0aGUgbmV3IGV4cGFuZGVkCj4gc2NvcGUg
b2YgdGhlIHNjaGVtYSwgYnV0IHdlIGhhdmUgZXhpc3RpbmcgZmlybXdhcmUgdGhhdCBnZW5lcmF0
ZXMKPiBub2RlcyB3aXRoIHRoZSBgbHBkZHItY2hhbm5lbDBgIG5hbWUsIEkgd2FudCB0byBtYWtl
IHN1cmUgdGhhdCBpdAo+IHdvbid0IGJyZWFrIGZyb20gbWFraW5nIGNoYW5nZXMgaGVyZS4KCk9o
IG9rIGRpZG4ndCBrbm93IGFib3V0IHRoYXQgYW5kIGRpZG4ndCBmaW5kIGl0IHRob3VnaC4KRm9y
IG5vdyBubyBwYXR0ZXJuIGhhcyBiZWVuIGRlZmluZWQgZm9yIHRoZSBub2RlIG5hbWUgc28gaXQg
c2hvdWxkbid0IApicmVhayBhbnl0aGluZy4KCkJlc3QgcmVnYXJkcywKQ2zDqW1lbnQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
