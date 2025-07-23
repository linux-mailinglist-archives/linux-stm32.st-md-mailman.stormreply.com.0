Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1781B0EBD7
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 09:25:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52E86C36B36;
	Wed, 23 Jul 2025 07:25:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98614C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 07:24:59 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N7Lt6M024254;
 Wed, 23 Jul 2025 09:24:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 CPs0IDy2C8RbyiHKvygcSXpjPFxvYiEDTH1nW4mKVEI=; b=HcPpDs/RqqNEnyOk
 5RCeB6v128EWGD/ngG1JxcypFqNCxc18ZO0OUB+A1cwEZG3hSGrKmMoVeUs73VZb
 aksAstgDKVKCW90MYILB316mB8JYMB0+DlISSo+I2EEkr2fQupAfE7H722SwGO6A
 IfM4S5mNjG4yybMgfnrw3HkqLwt9fEVdjIHSc/IBaF2Cv+ervlDdg2D7BGV5DYxm
 Zxf5yFncpHhviCdLasEsOhB899EbZrORd2UW36ADw0ESPATsh7ippPW2g6U1KsUi
 mSMI5zsfv2ssxeO/iJE6iO7g6CBiMu0qO4FwlVyhTYnoYZttRGIIRk67viTfxkFI
 qb+/Rw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q2acb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 09:24:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 205A440052;
 Wed, 23 Jul 2025 09:23:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60781768AAF;
 Wed, 23 Jul 2025 09:21:50 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 09:21:49 +0200
Message-ID: <822bd852-2cbc-4a89-a077-d05a8327e149@foss.st.com>
Date: Wed, 23 Jul 2025 09:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julius Werner <jwerner@chromium.org>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-5-7b7a4f3dc8a0@foss.st.com>
 <CAODwPW_fDPY78bmwvLmLkt1yWpVdG=VC8h2NSdWtoiEknajhNw@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CAODwPW_fDPY78bmwvLmLkt1yWpVdG=VC8h2NSdWtoiEknajhNw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 05/19] dt-bindings: memory: factorise
 LPDDR props into memory props
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

SGkgSnVsaXVzLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKT24gNy8yMi8yNSAyMzo1NywgSnVs
aXVzIFdlcm5lciB3cm90ZToKPj4gICAgICAgICBDb21wYXRpYmxlIHN0cmluZ3MgY2FuIGJlIGVp
dGhlciBleHBsaWNpdCB2ZW5kb3IgbmFtZXMgYW5kIHBhcnQgbnVtYmVycwo+PiAgICAgICAgIChl
LmcuIGVscGlkYSxFQ0IyNDBBQkFDTiksIG9yIGdlbmVyYXRlZCBzdHJpbmdzIG9mIHRoZSBmb3Jt
Cj4+ICAgICAgICAgbHBkZHJYLVlZLFpaWlogd2hlcmUgWCBpcyB0aGUgTFBERFIgdmVyc2lvbiwg
WVkgaXMgdGhlIG1hbnVmYWN0dXJlciBJRAo+IAo+IFdoZW4geW91IHNheSAiaW4gY2FzZSBvZiBM
UEREUiIgYmVsb3csIHlvdSBzaG91bGQgYWxzbyBjaGFuZ2UgdGhpcwo+IGxpbmUgdG8gdGFrZSBv
dGhlciBjYXNlcyBpbnRvIGFjY291bnQuIE1heWJlIHRoZSBiZXN0IHdheSB0byB3cml0ZQo+IHRo
aXMgd291bGQgYmUgc29tZXRoaW5nIGxpa2U6Cj4gCj4gLi4ub3IgZ2VuZXJhdGVkIHN0cmluZ3Mg
b2YgYSBtZW1vcnkgdHlwZSBkZXBlbmRlbnQgZm9ybS4gRm9yIExQRERSCj4gdHlwZXMsIHRoYXQg
Zm9ybSBpcyBscGRkclgtWVksWlpaWiB3aGVyZSBYIGlzIFsuLi5zYW1lIHRleHQuLi5dLiBGb3IK
PiBERFIgdHlwZXMsIHRoYXQgZm9ybSBpcyBkZHJYLVlZLFpaWlpaLi4uIHdoZXJlIFggaXMgWy4u
Lm5ldyBkZWZpbml0aW9uCj4gZm9yIEREUiB0eXBlcywgYmFzZWQgb24gd2hhdCdzIGF2YWlsYWJs
ZSBpbiBTUEQuLi5dLgoKWWVzIEkgYWdyZWUgYW5kIGlmIHRoZXJlIGlzIG5vIFNQRCBJJ2xsIG1l
bnRpb24gdGhlIGRhdGFzaGVldCBvZiB0aGUgCm1lbW9yeSBjaGlwLgoKPiAKPj4gICAgIHJldmlz
aW9uLWlkOgo+PiAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91
aW50MzItYXJyYXkKPj4gICAgICAgZGVzY3JpcHRpb246Cj4+IC0gICAgICBSZXZpc2lvbiBJRHMg
cmVhZCBmcm9tIE1vZGUgUmVnaXN0ZXIgNiBhbmQgNy4gT25lIGJ5dGUgcGVyIHVpbnQzMiBjZWxs
IChpLmUuIDxNUjYgTVI3PikuCj4+ICsgICAgICBSZXZpc2lvbiBJRHMgcmVhZCBmcm9tIE1vZGUg
UmVnaXN0ZXIgNiBhbmQgNyBpbiBjYXNlIG9mIExQRERSLgo+PiArICAgICAgT25lIGJ5dGUgcGVy
IHVpbnQzMiBjZWxsIChpLmUuIDxNUjYgTVI3PikuCj4gCj4gSWYgdGhpcyBkb2Vzbid0IGV4aXN0
IGZvciBERFIsIHRoZW4gcmF0aGVyIHRoYW4gImluIGNhc2Ugb2YgTFBERFIiCj4gdGhpcyBzaG91
bGQgcHJvYmFibHkgc2F5IHNvbWV0aGluZyBsaWtlICJMUEREUiBvbmx5Ij8KCkl0IGV4aXN0cyBp
biBjYXNlIG9mIEREUiwgYnV0IGl0IGlzIGVpdGhlciBpbiB0aGUgU1BEIGlmIHRoZSBtZW1vcnkg
aXMgCkRJTU0gbGlrZSBvciBpbiB0aGUgZGF0YXNoZWV0IGZvciBzb2xkZXJlZCBtZW1vcnkgY2hp
cC4KCj4gCj4+ICAgICBkZW5zaXR5Ogo+PiAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy91aW50MzIKPj4gICAgICAgZGVzY3JpcHRpb246Cj4+IC0gICAgICBEZW5z
aXR5IGluIG1lZ2FiaXRzIG9mIFNEUkFNIGNoaXAuIERlY29kZWQgZnJvbSBNb2RlIFJlZ2lzdGVy
IDguCj4+ICsgICAgICBEZW5zaXR5IGluIG1lZ2FiaXRzIG9mIFNEUkFNIGNoaXAuIERlY29kZWQg
ZnJvbSBNb2RlIFJlZ2lzdGVyIDggaW4gY2FzZSBvZgo+PiArICAgICAgTFBERFIuCj4gCj4gQ2Fu
IHlvdSBsaXN0IGhlcmUgd2hlcmUgaW4gU1BEIGRlbnNpdHkgYW5kIEkvTyB3aWR0aCBhcmUgc3Rv
cmVkIGZvcgo+IHRoZSB2YXJpb3VzIEREUiB0eXBlcz8KCkknbGwgdHJ5IHRvIGZpbmQgdGhlIGlu
Zm8gYW5kIHllcy4KCkJlc3QgcmVnYXJkcywKQ2zDqW1lbnQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
