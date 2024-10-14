Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C6399CA6E
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 14:42:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0856C78013;
	Mon, 14 Oct 2024 12:42:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 667B8C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2024 12:42:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EA1LYb021364;
 Mon, 14 Oct 2024 14:41:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 meVxP/72UxtTH816mMUL0SiTexlDHbve/hY9rxQg5uA=; b=S1L6QIFMEQcaz9px
 3ku77xK3UU2Y7DIxrJZFE4j/dQGFBDrlNZItWy6CSRTht823n520KH2PspoWzSHv
 I2vmI50o1j8yuiD73MYRitb1LmGdvaoJM2qQMCA73twaXkdklcR8P6KhfJQKt7Xe
 pT+lZs830jyeGjO6J7YgRLaaiIjB2WBrdsO6LvkDx9XGrQc2M9w5d1heKpYIU4/A
 nrO2aegzI6J/b3LLpnBQPkzFJLVZDkrgsXVeO3628JeSKypiR/BjQhnzAqW43JJ/
 ub7GHFYhZIuMEHw+KQiDGb/6LzzjENxun5ZV6/VUn1ErSvZ8bF0UvydBh7zkVx3d
 nY6O2w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 427g0bg2pt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2024 14:41:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 468D24004F;
 Mon, 14 Oct 2024 14:40:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7066526B65F;
 Mon, 14 Oct 2024 14:36:51 +0200 (CEST)
Received: from [10.252.25.66] (10.252.25.66) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 14 Oct
 2024 14:36:50 +0200
Message-ID: <d862765e-e396-4f7c-97ff-76df9aa03216@foss.st.com>
Date: Mon, 14 Oct 2024 14:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, Olivia Mackall <olivia@selenic.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Lionel Debieve <lionel.debieve@foss.st.com>
References: <20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com>
 <20241011-rng-mp25-v2-v2-2-76fd6170280c@foss.st.com>
 <318dbd5e-f547-4d78-b42e-4dcacc08d328@denx.de>
 <f191d034-4116-4169-8c05-201450412bbd@foss.st.com>
 <8c13b0aa-7fb1-493c-9abc-5e5cfd982855@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <8c13b0aa-7fb1-493c-9abc-5e5cfd982855@denx.de>
X-Originating-IP: [10.252.25.66]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/4] hwrng: stm32 - implement support
 for STM32MP25x platforms
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

CgpPbiAxMC8xNC8yNCAxMDo1MiwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMTAvMTQvMjQgMTA6
MzggQU0sIEdhdGllbiBDSEVWQUxMSUVSIHdyb3RlOgo+Pgo+Pgo+PiBPbiAxMC8xMS8yNCAxODox
NywgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBPbiAxMC8xMS8yNCA1OjQxIFBNLCBHYXRpZW4gQ2hl
dmFsbGllciB3cm90ZToKPj4+Cj4+PiBbLi4uXQo+Pj4KPj4+PiBAQCAtNTUxLDYgKzU2NSw0MSBA
QCBzdGF0aWMgaW50IHN0bTMyX3JuZ19wcm9iZShzdHJ1Y3QgCj4+Pj4gcGxhdGZvcm1fZGV2aWNl
ICpvZmRldikKPj4+PiDCoMKgwqDCoMKgIHByaXYtPnJuZy5yZWFkID0gc3RtMzJfcm5nX3JlYWQ7
Cj4+Pj4gwqDCoMKgwqDCoCBwcml2LT5ybmcucXVhbGl0eSA9IDkwMDsKPj4+PiArwqDCoMKgIGlm
ICghcHJpdi0+ZGF0YS0+bmJfY2xvY2sgfHwgcHJpdi0+ZGF0YS0+bmJfY2xvY2sgPiAyKQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+PiArCj4+Pj4gK8KgwqDCoCBwcml2
LT5jbGtfYnVsayA9IGRldm1fa3phbGxvYyhkZXYsIHByaXYtPmRhdGEtPm5iX2Nsb2NrICogCj4+
Pj4gc2l6ZW9mKCpwcml2LT5jbGtfYnVsayksCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPj4+PiArwqDCoMKgIGlmICghcHJpdi0+
Y2xrX2J1bGspCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+Pj4KPj4+IFRy
eSB0aGlzOgo+Pj4KPj4+IHJldCA9IGRldm1fY2xrX2J1bGtfZ2V0KGRldiwgcHJpdi0+ZGF0YS0+
bmJfY2xvY2ssIHByaXYtPmNsa19idWxrKTsKPj4+IC4uLgo+Pj4gLy8gU3dhcCB0aGUgY2xvY2sg
aWYgdGhleSBhcmUgbm90IGluIHRoZSByaWdodCBvcmRlcjoKPj4+IGlmIChwcml2LT5kYXRhLT5u
Yl9jbG9jayA9PSAyICYmCj4+PiDCoMKgwqDCoCBzdHJjbXAoX19jbGtfZ2V0X25hbWUocHJpdi0+
Y2xrX2J1bGtbMF0uY2xrKSwgImNvcmUiKSkKPj4+IHsKPj4+IMKgwqBjb25zdCBjaGFyICppZCA9
IHByaXYtPmNsa19idWxrWzFdLmlkOwo+Pj4gwqDCoHN0cnVjdCBjbGsgKmNsayA9IHByaXYtPmNs
a19idWxrWzFdLmNsazsKPj4+IMKgwqBwcml2LT5jbGtfYnVsa1sxXS5pZCA9IHByaXYtPmNsa19i
dWxrWzBdLmlkOwo+Pj4gwqDCoHByaXYtPmNsa19idWxrWzFdLmNsayA9IHByaXYtPmNsa19idWxr
WzBdLmNsazsKPj4+IMKgwqBwcml2LT5jbGtfYnVsa1swXS5pZCA9IGlkOwo+Pj4gwqDCoHByaXYt
PmNsa19idWxrWzBdLmNsayA9IGNsazsKPj4+IH0KPj4+Cj4+Cj4+IEhpIE1hcmVrLAo+Pgo+PiBU
aGlzIHdvbid0IHdvcmsgYXMgdGhlIG5hbWUgcmV0dXJuZWQgYnkgdGhpcyBBUEkgaXMgY2xrLT5j
b3JlLT5uYW1lLgo+PiBBRkFJQ1QsIGl0IGRvZXNuJ3QgY29ycmVzcG9uZCB0byB0aGUgbmFtZXMg
cHJlc2VudCBpbiB0aGUgZGV2aWNlIHRyZWUKPj4gdW5kZXIgdGhlICJjbG9jay1uYW1lcyIgcHJv
cGVydHkuCj4+IEFueSBvdGhlciBpZGVhIG9yIGFyZSB5b3UgZmluZSB3aXRoIHdoYXQncyBiZWxv
dz8KPiBIbW1tLCBpdCBpcyBub3QgZ3JlYXQsIGJ1dCBhdCBsZWFzdCBpdCByZWR1Y2VzIHRoZSBj
aGFuZ2VzIHRocm91Z2hvdXQgCj4gdGhlIGRyaXZlciwgc28gdGhhdCBpcyBhbiBpbXByb3ZlbWVu
dC4KPiAKPiBJIGd1ZXNzIG9uZSBjb3VsZCBkbyBzb21lIG9mX2Nsa19nZXQoKSBhbmQgY2xrX2lz
X21hdGNoKCkgaW4gcHJvYmUgdG8gCj4gbG9vayB1cCB0aGUgY2xvY2sgaW4gT0YgYnkgbmFtZSBh
bmQgdGhlbiBjb21wYXJlIHdoaWNoIGNsb2NrIGlzIHdoaWNoIAo+IGJlZm9yZSBzd2FwcGluZyB0
aGVtIGluIGNsa19idWxrW10gYXJyYXksIGJ1dCB0aGF0IG1pZ2h0IGJlIHRvbyBjb252b2x1dGVk
PwoKWWVzLCBwcm9iYWJseSB0b28gbXVjaC4gV2hhdCdzIHByZXNlbnQgaW4gdGhlIHBhdGNoIGlz
IG5vdCBjbG9zZSB0bwpwZXJmZWN0aW9uIGJ1dCBoYXMgdGhlIGFkdmFudGFnZSBvZiBiZWluZyBz
dHJhaWdodGZvcndhcmQuIElmIHdlIGFncmVlCm9uIHRoYXQsIEknbGwgc2VuZCBhIFYzIGNvbnRh
aW5pbmcgdGhlIG1vZGlmaWNhdGlvbnMgaW4gdGhlIGJpbmRpbmdzCmZpbGUuCgpUaGFua3MgZm9y
IHJldmlld2luZywKR2F0aWVuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
