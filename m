Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C13B0EC00
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 09:33:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D95CBC36B36;
	Wed, 23 Jul 2025 07:33:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10156C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 07:33:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N7Wjxn025289;
 Wed, 23 Jul 2025 09:33:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 OF2g8HL4znRWs7yyAJKVV9g93H6bltIAkBEQRriY5ak=; b=QE9mJsJW+BIaT3ge
 CfuDSWegwRTrkywKHn6W0YG93ypZfNqeS7e8ZayRMnzEGT7SYFbolmtM4E8MisWR
 aCwQ4JGQJpAMXkivdfGa/SE2XG0ni4nYyoTyPjA4ZmXcx7m86K+Vu5TCWrVbfL3n
 c1dx45BTqRtDAhn0fM6nLUDojXJodArYz66bwaY6LDEybVWhCXIKdej6Ib23lFr0
 kKfIFH80LJLqFFuOjo/MUtpCcAn+R5JgJFa+FkfylcX6IxoqLlpC8Uys6X9f8Pav
 uP5j+u3SvKrYBbic8FwMTCXT5HsdGCJjpeGB75nfCM8arIn5f9H1gNpeJd5BYw2C
 PnDKcA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8t6nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 09:33:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 249E640046;
 Wed, 23 Jul 2025 09:32:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14599768F12;
 Wed, 23 Jul 2025 09:30:48 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 09:30:47 +0200
Message-ID: <3e59d670-ee96-4ff2-a6c6-99d8a030e16c@foss.st.com>
Date: Wed, 23 Jul 2025 09:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julius Werner <jwerner@chromium.org>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-6-7b7a4f3dc8a0@foss.st.com>
 <CAODwPW_7aYdEzdUJ7b2nT4-zS9bu_hbNqjc7+_wSHbedXZXJ=Q@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CAODwPW_7aYdEzdUJ7b2nT4-zS9bu_hbNqjc7+_wSHbedXZXJ=Q@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 06/19] dt-bindings: memory: introduce
	DDR4
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

SGkgSnVsaXVzLAoKT24gNy8yMi8yNSAyMzo1NywgSnVsaXVzIFdlcm5lciB3cm90ZToKPj4gKyAg
ICAgIC0gcGF0dGVybjogIl5kZHI0LVswLTlhLWZdezJ9LFswLTlhLWZdezR9JCIKPiAKPiBUaGlz
IHBhdHRlcm4gZG9lc24ndCByZWFsbHkgbWFrZSBzZW5zZSB3aGVuIEREUjQgZG9lc24ndCBoYXZl
IHRoZSBzYW1lCj4gbWFudWZhY3R1cmVyIElEIC8gcmV2aXNpb24gSUQgZm9ybWF0IGFzIExQRERS
LiBZb3UgY291bGQgZWl0aGVyIG9ubHkKPiBsZWF2ZSB0aGUgZmFsbGJhY2sgY29uc3RhbnQgZm9y
IG5vdywgb3IgZGVmaW5lIGEgbmV3IGF1dG8tZ2VuZXJhdGVkCj4gZm9ybWF0IHRoYXQgbWF0Y2hl
cyB3aGF0IEREUjQgU1BEIHByb3ZpZGVzICh3aGljaCBJIGJlbGlldmUsIGlmIEkgcmVhZAo+IFdp
a2lwZWRpYSByaWdodCwgaXMgYSB0d28gYnl0ZSBtYW51ZmFjdHVyZXIgSUQgYW5kIHRoZW4gYW4g
dXAgdG8gMjAKPiBjaGFyYWN0ZXIgQVNDSUkgcGFydCBudW1iZXIgc3RyaW5nIC0tIHNvIGl0IGNv
dWxkIGJlCj4gYF5kZHI0LVswLTlhLWZ7Mn0sWzAtOUEtWmEtel17MSwyMH0kYCkuCgpPaCBvayBJ
IGRpZG4ndCBjYXRjaCB0aGF0IGl0IHNob3VsZCBiZSBmcm9tIHRoZSBTUEQuCkknbGwgcHJvcG9z
ZSBzb21ldGhpbmcuCgpCZXN0IHJlZ2FyZHMsCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
