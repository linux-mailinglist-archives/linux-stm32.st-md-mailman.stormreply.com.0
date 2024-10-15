Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B05199E428
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 12:37:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BACB4C7801A;
	Tue, 15 Oct 2024 10:37:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72013C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 10:37:51 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F8KQH4007049;
 Tue, 15 Oct 2024 12:37:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 o4wujNjsyAr/oziHHMv1TomMdx6alK8Rc8OFlafH9JQ=; b=e4NJuH315dwJ8n7/
 YGY11mL7yVPKLmIsSb1pdwnVtQYZbco3vyV9t5GZt+Ye9hBMeI/v2/NnbkMfFCk1
 RCjfV7ZRYN1wx7Goysl/rR7xQPBYLfYFbM7dQNSYDf87iwrOi+k2FypEUwOTgEDe
 +RIETaAP5z3fNXT0JCo2/+LJtLGXysFema7ZlE2snL8WHlnjleYsqaSjC8V4nqWo
 qLZtslBjxn89R4lXznW/SU4Bun+XYcJgamlgjmfyZzsEI9I7pTQ+RG3toJ2i6nqL
 iRUhKn6l1VxSGdxhSVwaRIvTzyxztHGtI1VO2/3TU3aWxZPqy+K3DdCG5/eH/dQR
 tw2MUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4282p12871-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Oct 2024 12:37:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C303340051;
 Tue, 15 Oct 2024 12:36:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A489D21A689;
 Tue, 15 Oct 2024 12:35:21 +0200 (CEST)
Received: from [10.48.86.107] (10.48.86.107) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 15 Oct
 2024 12:35:18 +0200
Message-ID: <324d6a90-8f9a-4916-981b-ac1253f5057b@foss.st.com>
Date: Tue, 15 Oct 2024 12:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linus.walleij@linaro.org>
References: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
 <CACRpkdaMMsHXkgcOtw0aC=SPfJJURCyCgzDq-rEXrBGaM44Sdg@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdaMMsHXkgcOtw0aC=SPfJJURCyCgzDq-rEXrBGaM44Sdg@mail.gmail.com>
X-Originating-IP: [10.48.86.107]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Kees Cook <kees@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] Crash on armv7-a using KASAN
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

T24gMTAvMTUvMjQgMDk6NTUsIExpbnVzIFdhbGxlaWogd3JvdGU6PiBPbiBNb24sIE9jdCAxNCwg
MjAyNCBhdCAzOjIx4oCvUE0gCkNsZW1lbnQgTEUgR09GRklDCj4gPGNsZW1lbnQubGVnb2ZmaWNA
Zm9zcy5zdC5jb20+IHdyb3RlOgo+IAo+PiBJIGhhdmUgZGV0ZWN0ZWQgYSBrZXJuZWwgY3Jhc2gg
aW4gbGF0ZXN0IGtlcm5lbCBvbiBhcm12Ny1hIHdoZW4gS2FzYW4gaXMKPj4gZW5hYmxlZC4KPiAo
Li4uKQo+PiBDcmFzaCBsb2cgd2l0aCByZWNlbnQga2VybmVsICh2Ni4xMi1yYzMpIDoKPj4KPj4g
fiAjIEluc3VmZmljaWVudCBzdGFjayBzcGFjZSB0byBoYW5kbGUgZXhjZXB0aW9uIQo+IAo+IFRo
ZSBjcmFzaCBsb29rcyBwcmV0dHkgImV4cGVjdGVkIiwgYXMgeW91IHNheSB5b3Ugc3RhcnQgYSBs
b3Qgb2YKPiBwYXJhbGxlbCBwcm9jZXNzZXMKPiBhbmQgd2hvb3BzLCB5b3UgcnVuIG91dCBvZiBt
ZW1vcnkgb24gdGhlIHN0YWNrLiBObyBzb2Z0d2FyZSBjYW4gYWRkIG1vcmUKPiBtZW1vcnkgdG8g
dGhlIG1hY2hpbmUuCj4gCj4gS0FTQU4gdXNlcyBhIGxvdCBvZiBleHRyYSBtZW1vcnkgZm9yIGlu
dGVyY2VwdGluZyBhbGwgbWVtb3J5IGFjY2Vzc2VzLAo+IG5vbWluYWxseSBvbmUKPiBleHRyYSBi
eXRlIHBlciA4IGJ5dGVzLiBUaGlzIGlzIGZ1cnRoZXIgcmVzdHJpY3RlZCBieSB0aGUgY29tcGxl
eAo+IG5hdHVyZSBvZiB0aGUgdmlydHVhbAo+IG1lbW9yeSBzcGFjZSBvbiBBUk0zMi4KPiAKPiBU
aGF0IHNhaWQsIHdlIGluY3JlYXNlIHRoZSBzaXplIG9mIHBlci10aHJlYWQgc3RvcmFnZSB3aGVu
IHVzaW5nIEtBU0FOLAo+IFRIUkVBRF9TSVpFX09SREVSIGlzIDIgaW5zdGVhZCBvZiAxLiBNYXli
ZSB0aGUgaW50ZXJydXB0IHN0YWNrcyBuZWVkCj4gdG8gYmUgc2NhbGVkIHNpbWlsYXJseSB0byBt
YW5hZ2UgdGhlIGluY3JlYXNlZCBsb2FkPwoKSGkgTGludXMsCgpUaGFua3MgZm9yIHlvdXIgcmVw
bHkuCgpPbmNlIEkgZm91bmQgdGhlIGlzc3VlIGluIGxhdGVzdCBrZXJuZWwsIHdpdGggQW50b25p
byB3ZSBmaXJzdGx5IHRyaWVkIAp0byBpbmNyZWFzZSB0aGUgc3RhY2sgc2l6ZSwgYnV0IGl0IGtl
cHQgY3Jhc2hpbmcuCgpUaGVuIHdlIGlkZW50aWZpZWQgdGhlIG9mZmVuZGluZyBjb21taXQgYW5k
IHdlIG5vdGljZWQgdGhhdCBpdCBkb2VzIG5vdCAKY2hhbmdlIGF0IGFsbCB0aGUgc3RhY2sgbGF5
b3V0LgpJbiBmYWN0IEFyZCBwYXRjaCBvbmx5IG1vZGlmaWVzIHRoZSB3YXkgdG8gdW53aW5kIGZy
YW1lcyBmb3IgYmFja3RyYWNlLgoKQXMgZmFyIGFzIHdlIHVuZGVyc3RhbmQsIEtBU0FOIGVuYWJs
ZWQgY2F1c2VzIHRoZSBnZW5lcmF0aW9uIG9mIHNldmVyYWwgCmJhY2t0cmFjZXMgKGhhc2hlZCkg
b24gYWxsb2MgYW5kIGZyZWUgdG8gdHJhY2sgYWxsIHRoZSBhbGxvY2F0aW9uLgpUaGUgb2ZmZW5k
aW5nIGNvbW1pdCBzZWFtcyByZXNwb25zaWJsZSBvZiB0aGUgY3Jhc2ggZHVlIHRvIGluY29ycmVj
dCB1bndpbmQuCgpCZXN0IHJlZ2FyZHMsCgpDbMOpbWVudApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
