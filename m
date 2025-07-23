Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C89B0ECF6
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 10:18:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D4D4C36B36;
	Wed, 23 Jul 2025 08:18:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12E19C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 08:18:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N86QWh016187;
 Wed, 23 Jul 2025 10:16:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +MKQXarGCwBm0S142kCJOF3CcZkaaOJ02owWJnuaHs8=; b=7LyBg3mnPfT2VgiA
 fHngcWAXD8G0Wco2vdmSMTzSLd10TPCwYv18jwdscGMMgxKC+/s7uK3iYYZjQqpk
 0UPFaSNoKoB84PbHn2zJ0hlOV2MlmCC4cwJeJrFX127acHlfdiZXG1W1amLW7ZUp
 tqqROpCJnJOvmG08d1eYB030RFRoXyB82Zc8J7A2z0W5YtlRZs/6HsY5Viiz9xzm
 NsY8BwyljR/gDzhkN/dDY3QWXlNISV3Mjhr+oRwBpz2ZAZ0mea12oO0h6g4CMJGc
 Z5f7n+7AHjlbpa9HMHGevkbZAuY4hE1C9gwFuXOZNL6fjchG/Fa8PvezbB697Ltj
 327TEw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800sm35kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 10:16:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0333040052;
 Wed, 23 Jul 2025 10:15:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4550876DBF4;
 Wed, 23 Jul 2025 10:14:14 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 10:14:13 +0200
Message-ID: <608d03ef-1017-4f82-b7b0-a461c35b59a2@foss.st.com>
Date: Wed, 23 Jul 2025 10:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
 <20250723-zealous-turtle-of-perfection-e67aee@kuoka>
 <5ca3ba94-27b3-4cda-aba4-e2935acbe55c@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <5ca3ba94-27b3-4cda-aba4-e2935acbe55c@kernel.org>
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
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
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

SGksCgpPbiA3LzIzLzI1IDA5OjA2LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDIz
LzA3LzIwMjUgMDg6NTcsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIFR1ZSwgSnVs
IDIyLCAyMDI1IGF0IDA0OjAzOjI0UE0gKzAyMDAsIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToK
Pj4+IExQRERSIGFuZCBERFIgY2hhbm5lbHMgZXhpc3QgYW5kIHNoYXJlIHRoZSBzYW1lIHByb3Bl
cnRpZXMsIHRoZXkgaGF2ZSBhCj4+PiBjb21wYXRpYmxlLCByYW5rcywgYW5kIGFuIGlvLXdpZHRo
Lgo+Pgo+PiBNYXliZSBpdCBpcyB0cnVlIGZvciBhbGwgdHlwZXMgb2YgU0RSQU0sIGxpa2UgUkRS
QU0gYW5kIGVEUkFNLCBidXQgSQo+IAo+IAo+IEFsdGhvdWdoIHRoZXNlIHdlcmUgbm90IEpFREVD
IHByb2JhYmx5Li4uCgpIbW0gc28gbm8gInNkcmFtLWNoYW5uZWwiID8KSSBkb24ndCBnZXQgeW91
ciBwb2ludCBoZXJlLgoKPiAKPj4gZG9uJ3QgdGhpbmsgYWxsIG1lbW9yeSB0eXBlcyBkby4KPj4K
Pj4gSSB0aGluayB0aGlzIHNob3VsZCBiZSByZW5hbWVkIHRvIHNkcmFtLWNoYW5uZWwuCj4gLi4u
IHlldCBzdGlsbCBKRURFQyBhbHNvIGhhcyBzb21lIHN0YW5kYXJkcyBmb3IgU1JBTSwgRVBST00s
IEhCTSBhbmQKPiBTR1JBTSAoZ3JhcGhpY3MpLCBzZWU6Cj4gaHR0cHM6Ly93d3cuamVkZWMub3Jn
L2NhdGVnb3J5L3RlY2hub2xvZ3ktZm9jdXMtYXJlYS9tZW1vcnktY29uZmlndXJhdGlvbnMtamVz
ZDIxLWMKCkluIGEgbW9yZSBnZW5lcmljIHBvaW50IG9mIHZpZXcgd2UgY2FuIHRoaW5rIGNvbXBh
dGlibGUsIGRlbnNpdHkgYW5kIGlvLSAKd2lkdGggYXMgY29tbW9uIGZvciBhbGwgc29ydCBvZiBt
ZW1vcnkgbm8gPwoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
