Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A21B118E3
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 09:09:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DD08C3089D;
	Fri, 25 Jul 2025 07:09:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30647C30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 07:09:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P61XZi009176;
 Fri, 25 Jul 2025 09:09:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 LzqH02+hJ/0E8n+RTM+yEwFitfKa/gSQdkGVRRTXJhc=; b=vEY7oeG+pNnop6/X
 Y9urlffHn9wPzkQ2Is/FDs6FmFPNXT3zTb3jyMz3lmY7QPMwpHHlMXBmXHaer/PU
 0K0P0ulWgakiEqWGw1l11dPWR/0Is+mSEQnefGwkZ3l/7cXUl6SA3HJ2CRdoyG1I
 FdmL8tUHYqCtB98XPDPWNBGYyLXEwDmWXM7P+PtbfkAkPayNHbYAgdZ3XfNJ2Zbc
 CmgC/QaDxklOmCvKhJ7nMI4NpBlPKOB2X2y39VEgc7AEaz1kO+m3wWAhQP0OsPLr
 FY38beWUv0pV94PWCAt8crCejpNCdBfw4cLvaHFaeaNLHLfxgTQP0XVsBJXJZTO6
 L/feBQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w5rsn0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jul 2025 09:09:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4812F40044;
 Fri, 25 Jul 2025 09:07:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B10578175F;
 Fri, 25 Jul 2025 09:06:35 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 09:06:34 +0200
Message-ID: <ce0cb3ba-2373-479f-a8f3-3a89ffb0a1b1@foss.st.com>
Date: Fri, 25 Jul 2025 09:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julius Werner <jwerner@chromium.org>
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
 <20250723-ddrperfm-upstream-v4-5-1aa53ca319f4@foss.st.com>
 <CAODwPW_kex5Agqxg_i-XC308scEpUJU0me55G7iZ8nB9LC0acg@mail.gmail.com>
 <204401b4-b483-47e2-ae73-0994b39bd30c@foss.st.com>
 <CAODwPW9drKEAMfQvQHV8eMTyf5KCHB4SN400JiUs0pgjoXy=sw@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CAODwPW9drKEAMfQvQHV8eMTyf5KCHB4SN400JiUs0pgjoXy=sw@mail.gmail.com>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
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
Subject: Re: [Linux-stm32] [PATCH v4 05/20] dt-bindings: memory: factorise
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

SGkgSnVsaXVzLAoKT24gNy8yNS8yNSAwMDozMywgSnVsaXVzIFdlcm5lciB3cm90ZToKPj4+IEkg
ZG9uJ3QgdGhpbmsgdGhpcyB3aWxsIGlkZW50aWZ5IGEgcGFydCB1bmFtYmlndW91c2x5LCBJIHdv
dWxkIGV4cGVjdAo+Pj4gdGhlIEREUiByZXZpc2lvbiBJRCB0byBiZSBzcGVjaWZpYyB0byB0aGUg
cGFydCBudW1iZXIuIChJbiBmYWN0LCB3ZSdyZQo+Pj4gYWxzbyBub3Qgc3VyZSB3aGV0aGVyIG1h
bnVmYWN0dXJlcityZXZpc2lvbiBpZGVudGlmaWVzIExQRERSIHBhcnRzCj4+PiB1bmFtYmlndW91
c2x5IGZvciBldmVyeSB2ZW5kb3IsIHdlIGp1c3QgZGlkbid0IGhhdmUgYW55dGhpbmcgbW9yZSB0
bwo+Pj4gd29yayB3aXRoIHRoZXJlLikgSSB3b3VsZCBzdWdnZXN0IHRvIHVzZSBlaXRoZXIgYGRk
clgtWVlZWSxBQUEuLi4sWlpgCj4+PiBvciBgZGRyWC1ZWVlZLFpaLEFBQS4uLmAgKHdoZXJlIEFB
QS4uLiBpcyB0aGUgcGFydCBudW1iZXIgc3RyaW5nIGZyb20KPj4+IFNQRCAzMjktMzQ4IHdpdGhv
dXQgdGhlIHRyYWlsaW5nIHNwYWNlcykuIFRoZSBmaXJzdCB2ZXJzaW9uIGxvb2tzIGEKPj4+IGJp
dCBtb3JlIG5hdHVyYWwgYnV0IGl0IG1pZ2h0IGdldCBjb25mdXNpbmcgb24gdGhlIG9mZiBjaGFu
Y2UgdGhhdAo+Pj4gc29tZW9uZSB1c2VzIGEgY29tbWEgaW4gYSBwYXJ0IG51bWJlciBzdHJpbmcu
Cj4+Cj4+IFRoZSBmaXJzdCBvbmUgc2VlbXMgYmV0dGVyIGluZGVlZC4KPj4gSWYgdGhlIG1hbnVm
YWN0dXJlciBwdXQgYSBjb21tYSBpbiB0aGUgcGFydCBudW1iZXIgd2Ugc2hvdWxkIGhhbmRsZSBp
dAo+PiBhdCBhIHNvZnR3YXJlIGxldmVsIHRvIG1lIGFuZCBpZiBpdCBpcyBhIGRldmljZXRyZWUg
ZXJyb3IgaXQgaXMgdXAgdG8KPj4gdGhlIGRldmljZXRyZWUgd3JpdGVyIHRvIGZpeCBpdC4KPj4g
V2hhdCBkbyB5b3UgdGhpbmsgPwoKSSBtZWFudCBleGFjdGx5IHdoYXQgeW91IGFyZSBzdGF0aW5n
IGJlbG93IDotKQoKPiAKPiBOb3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5ICJoYW5kbGUgaXQgYXQg
YSBzb2Z0d2FyZSBsZXZlbCI/IFVzaW5nIGNvbW1hCj4gY2hhcmFjdGVycyBpbiB0aGUgcGFydCBu
dW1iZXIgaXMgbm90IGlsbGVnYWwgYWNjb3JkaW5nIHRvIHRoZSBTUEQKPiBzcGVjLCBhcyBmYXIg
YXMgSSBjYW4gdGVsbC4KPiAKPiBUaGF0IHNhaWQsIGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIGRp
c2FtYmlndWF0ZSB0aGlzIGFzIGxvbmcgYXMgdGhlCj4gcmV2aXNpb24gbnVtYmVyIGlzIGFsd2F5
cyB0aGVyZSwgeW91IGp1c3QgaGF2ZSB0byBsb29rIGZvciB0aGUgbGFzdAo+IGNvbW1hIGZyb20g
dGhlIGVuZCAoc28gZS5nLiB0aGUgc3RyaW5nIGBkZHI0LTEyMzQsc29tZSxwYXJ0LDU2Nyw4OWAK
PiBjb3VsZCBiZSB1bmFtYmlndW91c2x5IHBhcnNlZCBhcyBtYW51ZmFjdHVyZXIgSUQgMHgxMjM0
LCBwYXJ0IG51bWJlcgo+IGBzb21lLHBhcnQsNTY3YCBhbmQgcmV2aXNpb24gSUQgMHg4OSwgdGhl
IHBhcnNpbmcgY29kZSBqdXN0IG5lZWRzIHRvCj4gYmUgYSBiaXQgY2FyZWZ1bCkuIFNvIG1heWJl
IHRoaXMgaXMgbm90IGFjdHVhbGx5IGEgcHJvYmxlbS4KCkJlc3QgcmVnYXJkcywKQ2zDqW1lbnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
