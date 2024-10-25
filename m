Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D49E9AFE2C
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 11:28:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09B41C7801C;
	Fri, 25 Oct 2024 09:28:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79DC0C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 09:28:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P6oAjO006920;
 Fri, 25 Oct 2024 11:27:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 /NjitP+EsJbsLPMXwvV3a07N9NXtXF6fLkWZSKiMJ6I=; b=AN96QTd/vW0OhgK4
 QsrEbqTS3o5TTmnXPGIOIqPwbG2TzZBBcothvJKSkSiL9YU1Ztt8Ap9L2DbhZ4sJ
 tBoRoRz4i9oFbjj3IOStRJsscbpB6cb2FxpXSZ1JnWE49msWiWszL9uFJcnYcJzX
 XtW9PB74Zm1uSIhSAVxydnW5HH/F2gopfQuGescjig7qnXX8jwzWjsxmeO+7gRGa
 GwK7QFZZ9Dvy9VQT9Xar9PCN+pYnyUjzLcRN+16TqFYq8g0cl2OfN6BbO2Ygha3f
 27SMGQKN4VMGQqlTGo8VJNbUGk2nEOerMszkIbfjJp6u1snt0b2UtwkxCmJj58kY
 WJLv8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42em4cn7ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 11:27:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 344E24002D;
 Fri, 25 Oct 2024 11:25:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 136B225F1B4;
 Fri, 25 Oct 2024 11:24:35 +0200 (CEST)
Received: from [10.48.86.107] (10.48.86.107) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 25 Oct
 2024 11:24:34 +0200
Message-ID: <f3856158-10e6-4ee8-b4d5-b7f2fe6d1097@foss.st.com>
Date: Fri, 25 Oct 2024 11:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ardb@kernel.org>
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com>
 <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
 <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
X-Originating-IP: [10.48.86.107]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Mark Rutland <mark.rutland@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] ARM: ioremap: Sync PGDs for
	VMALLOC shadow
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

T24gMTAvMjQvMjQgMjM6NTgsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gSGkgQ2xlbWVudCwKPiAK
PiBJIHNhdyBJIG1pc3NlZCB0byBsb29rIGNsb3NlciBhdCB0aGUgbmV3IGJ1ZyBmb3VuZCBpbiBl
eHQ0Cj4gb24gdGhlIFNUTTMyOgo+IAo+IE9uIE1vbiwgT2N0IDIxLCAyMDI0IGF0IDI6MTLigK9Q
TSBDbGVtZW50IExFIEdPRkZJQwo+IDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPiB3cm90
ZToKPiAKPj4gUGVyaGFwcyBub3QgcmVsYXRlZCB3aXRoIHRoaXMgdG9waWMgYnV0IGFzIGluIHRo
ZSBiYWNrdHJhY2UgSSBhbSBnZXR0aW5nCj4+IHNvbWUga2V5d29yZCBmcm9tIG91ciBzdGFydCBl
eGNoYW5nZSwgSSBkdW1wIHRoZSBjcmFzaCBiZWxvdy4KPj4gSWYgdGhpcyBiYWNrdHJhY2UgaXMg
c29tZWhvdyByZWxhdGVkIHdpdGggb3VyIGlzc3VlLCBwbGVhc2UgaGF2ZSBhIGxvb2suCj4gKC4u
LikKPj4gWyAxNDM5LjM1MTk0NV0gUEMgaXMgYXQgX19yZWFkX29uY2Vfd29yZF9ub2NoZWNrKzB4
MC8weDgKPj4gWyAxNDM5LjM1Njk2NV0gTFIgaXMgYXQgdW53aW5kX2V4ZWNfaW5zbisweDM2NC8w
eDY1OAo+ICguLi4pCj4+IFsgMTQ0MC4zMzMxODNdICBfX3JlYWRfb25jZV93b3JkX25vY2hlY2sg
ZnJvbSB1bndpbmRfZXhlY19pbnNuKzB4MzY0LzB4NjU4Cj4+IFsgMTQ0MC4zMzk3MjZdICB1bndp
bmRfZXhlY19pbnNuIGZyb20gdW53aW5kX2ZyYW1lKzB4MjcwLzB4NjE4Cj4+IFsgMTQ0MC4zNDUz
NTJdICB1bndpbmRfZnJhbWUgZnJvbSBhcmNoX3N0YWNrX3dhbGsrMHg2Yy8weGUwCj4+IFsgMTQ0
MC4zNTA2NzRdICBhcmNoX3N0YWNrX3dhbGsgZnJvbSBzdGFja190cmFjZV9zYXZlKzB4OTAvMHhj
MAo+PiBbIDE0NDAuMzU2MzA4XSAgc3RhY2tfdHJhY2Vfc2F2ZSBmcm9tIGthc2FuX3NhdmVfc3Rh
Y2srMHgzMC8weDRjCj4+IFsgMTQ0MC4zNjIwNDJdICBrYXNhbl9zYXZlX3N0YWNrIGZyb20gX19r
YXNhbl9yZWNvcmRfYXV4X3N0YWNrKzB4ODQvMHg4Ywo+PiBbIDE0NDAuMzY4NDczXSAgX19rYXNh
bl9yZWNvcmRfYXV4X3N0YWNrIGZyb20gdGFza193b3JrX2FkZCsweDkwLzB4MjEwCj4+IFsgMTQ0
MC4zNzQ3MDZdICB0YXNrX3dvcmtfYWRkIGZyb20gc2NoZWR1bGVyX3RpY2srMHgxOGMvMHgyNTAK
Pj4gWyAxNDQwLjM4MDI0NV0gIHNjaGVkdWxlcl90aWNrIGZyb20gdXBkYXRlX3Byb2Nlc3NfdGlt
ZXMrMHgxMjQvMHgxNDgKPj4gWyAxNDQwLjM4NjI4N10gIHVwZGF0ZV9wcm9jZXNzX3RpbWVzIGZy
b20gdGlja19zY2hlZF9oYW5kbGUrMHg2NC8weDg4Cj4+IFsgMTQ0MC4zOTI1MjFdICB0aWNrX3Nj
aGVkX2hhbmRsZSBmcm9tIHRpY2tfc2NoZWRfdGltZXIrMHg2MC8weGNjCj4+IFsgMTQ0MC4zOTgz
NDFdICB0aWNrX3NjaGVkX3RpbWVyIGZyb20gX19ocnRpbWVyX3J1bl9xdWV1ZXMrMHgyYzQvMHg1
OWMKPj4gWyAxNDQwLjQwNDU3Ml0gIF9faHJ0aW1lcl9ydW5fcXVldWVzIGZyb20gaHJ0aW1lcl9p
bnRlcnJ1cHQrMHgxYmMvMHgzYTAKPj4gWyAxNDQwLjQxMTAwOV0gIGhydGltZXJfaW50ZXJydXB0
IGZyb20gYXJjaF90aW1lcl9oYW5kbGVyX3ZpcnQrMHgzNC8weDNjCj4+IFsgMTQ0MC40MTc0NDdd
ICBhcmNoX3RpbWVyX2hhbmRsZXJfdmlydCBmcm9tCj4+IGhhbmRsZV9wZXJjcHVfZGV2aWRfaXJx
KzB4ZjQvMHgzNjgKPj4gWyAxNDQwLjQyNDQ4MF0gIGhhbmRsZV9wZXJjcHVfZGV2aWRfaXJxIGZy
b20KPj4gZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSsweDM4LzB4NDgKPj4gWyAxNDQwLjQzMTYx
OF0gIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEgZnJvbSBnaWNfaGFuZGxlX2lycSsweDkwLzB4
YTgKPj4gWyAxNDQwLjQzNzk1M10gIGdpY19oYW5kbGVfaXJxIGZyb20gZ2VuZXJpY19oYW5kbGVf
YXJjaF9pcnErMHgzMC8weDQwCj4+IFsgMTQ0MC40NDQwOTRdICBnZW5lcmljX2hhbmRsZV9hcmNo
X2lycSBmcm9tIF9faXJxX3N2YysweDg4LzB4YzgKPj4gWyAxNDQwLjQ0OTkyMF0gRXhjZXB0aW9u
IHN0YWNrKDB4ZGU4MDNhMzAgdG8gMHhkZTgwM2E3OCkKPj4gWyAxNDQwLjQ1NDkxNF0gM2EyMDog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGU4MDNiMDAKPj4gMDAwMDAwMDAg
MDAwMDAwMDEgMDAwMDAwYzAKPj4gWyAxNDQwLjQ2MzE0MV0gM2E0MDogZTUzMzNmNDAgZGU4MDNi
YTAgZGU4MDNiZDAgMDAwMDAwMDEgZTUzMzNmNDAKPj4gZGU4MDNiMDAgYzEyNDFkOTAgYmFkMDA3
NWMKPj4gWyAxNDQwLjQ3MTI2Ml0gM2E2MDogYzIwNTg0YjggZGU4MDNhN2MgYzAxMTQxMTQgYzAx
MTM4NTAgMjAwZjAwMTMgZmZmZmZmZmYKPj4gWyAxNDQwLjQ3Nzk1OV0gIF9faXJxX3N2YyBmcm9t
IHVud2luZF9leGVjX2luc24rMHg0LzB4NjU4Cj4+IFsgMTQ0MC40ODMwNzhdICB1bndpbmRfZXhl
Y19pbnNuIGZyb20gY2FsbF93aXRoX3N0YWNrKzB4MTgvMHgyMAo+IAo+IFRoaXMgaXMgaGFyZCB0
byBhbmFseXplIHdpdGhvdXQgYmVpbmcgYWJsZSB0byByZXByb2R1Y2UgaXQsIGJ1dCBpdCB0YWxr
cwo+IGFib3V0IHRoZSBzdGFjayBhbmQgS2FzYW4gYW5kIHVud2luZGluZywgc28gY291bGQgaXQg
KGFsc28pIGJlIHJlbGF0ZWQgdG8gdGhlCj4gVk1BUDplZCBzdGFjaz8KPiAKPiBEaWQgeW91IHRy
eSB0byByZXZlcnQgKG9yIGNoZWNrIG91dCB0aGUgY29tbWl0IGJlZm9yZSBhbmQgYWZ0ZXIpCj4g
YjY1MDY5ODFmODgwIEFSTTogdW53aW5kOiBzdXBwb3J0IHVud2luZGluZyBhY3Jvc3MgbXVsdGlw
bGUgc3RhY2tzCj4gdG8gc2VlIGlmIHRoaXMgaXMgYWdhaW4gZml4aW5nIHRoZSBpc3N1ZT8KSSBM
aW51cywKClllcywgSSd2ZSB0cmllZCB0byByZXZlcnQgdGhpcyBwYXJ0aWN1bGFyIGNvbW1pdCBv
biB0b3Agb2YgeW91ciBsYXN0IApwYXRjaGVzIGJ1dCBJIGhhdmUgc29tZSBjb25mbGljdHMgaW5z
aWRlIGFyY2gvYXJtL2tlcm5lbC91bndpbmQuYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
