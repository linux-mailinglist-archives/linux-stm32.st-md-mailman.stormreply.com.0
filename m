Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C85AB661B
	for <lists+linux-stm32@lfdr.de>; Wed, 14 May 2025 10:35:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24694C7A842;
	Wed, 14 May 2025 08:35:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65019C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 May 2025 08:35:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E7w1Jx022967;
 Wed, 14 May 2025 10:35:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zTYcnTgzrTSARrdRyGgDqevHWfgdqMFkurpjm2teTzU=; b=dz80wl+vuCkp60ij
 7FaCb6Y6rODPhEpIjDoGI+ijqilMSRtvYWm7EnQx9GskOVNIsUs1uVfmNsv+G5Ay
 cRSz2iiBT5+l55aIFj3fJr7kRNWkgkQ6RZTQpTRwMb7D5OIhDBOrxfd0O/ry0klN
 3Mt8OA2itjnWurK3iiNcG5oq/w8l+I+4J7E/hI4RhD0v38DQ/pTJrvE1ppDKxczQ
 VOzgCkLMnebXGBJnI7fdiqdSUm+jWCaGP/DRZENCfrUbqLpFuo8yNS96tbUAzTCE
 s5R9cyuwQKvkhwUI4wPqL7TMC6IEwiyx+sY4DtQdnp0IzufcwdAa3Al16bjuR/O2
 pdndOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbds2h27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 May 2025 10:35:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8AEA64004D;
 Wed, 14 May 2025 10:34:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D13E2B3CFAB;
 Wed, 14 May 2025 10:33:33 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 10:33:33 +0200
Message-ID: <8e25c2e3-fbc6-4d60-8362-2b0fb3066821@foss.st.com>
Date: Wed, 14 May 2025 10:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?=
 <boerge.struempfel@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20250508143818.2574558-1-goran.radni@gmail.com>
 <20250508143818.2574558-5-goran.radni@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250508143818.2574558-5-goran.radni@gmail.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 4/4] ARM: dts: stm32: add initial
 support for stm32mp157-ultra-fly-sbc board
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

SGkgR29yYW4KCk9uIDUvOC8yNSAxNjozOCwgR29yYW4gUmHEkWVub3ZpxIcgd3JvdGU6Cj4gQWRk
IHN1cHBvcnQgZm9yIFVsdHJhdHJvbmlrJ3Mgc3RtMzJtcDE1N2MgZmx5IGJvYXJkLiBUaGlzIGJv
YXJkIGVtYmVkcwo+IGEgU1RNMzJNUDE1N2MgU09DIGFuZCAxR0Igb2YgRERSMy4gU2V2ZXJhbCBj
b25uZWN0aW9ucyBhcmUgYXZhaWxhYmxlIG9uCj4gdGhpcyBib2FyZHM6IDIqVVNCMi4wLCAxKlVT
QjIuMCBNaW5pVVNCLCBEZWJ1ZyBVQVJULCAxKlVBUlQsIDEqVVNBUlQsCj4gU0RjYXJkLCBSSjQ1
LCAuLi4KPiAKPiBUaGlzIHBhdGNoIGVuYWJsZXMgYmFzaWMgc3VwcG9ydCBmb3IgYSBrZXJuZWwg
Ym9vdCAtIFNELWNhcmQgb3IgZU1NQy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHb3JhbiBSYcSRZW5v
dmnEhyA8Z29yYW4ucmFkbmlAZ21haWwuY29tPgo+IAoKU2VyaWVzIGFwcGxpZWQgb24gc3RtMzIt
bmV4dC4KCnJlZ2FyZHMKYWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
