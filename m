Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA2999C3A1
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 10:42:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C462C78013;
	Mon, 14 Oct 2024 08:42:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61E99C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2024 08:42:06 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E54nkx027926;
 Mon, 14 Oct 2024 10:41:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 5esNFNUTDUNqlWySOqU6hZQiJIQS2bs1dT2iyHYhZiQ=; b=U8LGMsmrHBNIGI+A
 yCEYAvn1pY2AklzSiwRyoXsWjgxAJfdtNwMAi6Mkc/NiEgXx0a98lxxDwOAjxdDi
 tkiMGumOlzzh9LefvAgUeb15mDpgsUKxcyuW/sCEtiCevgydE2ZfzIQ+qb+uZIlQ
 aZE+53QTmCiDFuVLXEC20q95gLgRa8o3gSuqfZikIixc3wzGEFA6CeSfuts0VjcM
 3QXWC1ccOkBfSZDqcs/bv8fB1GdG8gxSk4a/G2Unuzy/Wm9mOZb0AFyppoXwmAjH
 9N158NDDaBk5DUunG3Id0kCog9xxbalwc8MP8SQiUkuAUMGfVPpERyi6BPFJaYpj
 gAkGSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 427gewq6jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2024 10:41:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 941EC40050;
 Mon, 14 Oct 2024 10:39:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C17BF269E1E;
 Mon, 14 Oct 2024 10:38:41 +0200 (CEST)
Received: from [10.252.14.29] (10.252.14.29) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 14 Oct
 2024 10:38:40 +0200
Message-ID: <f191d034-4116-4169-8c05-201450412bbd@foss.st.com>
Date: Mon, 14 Oct 2024 10:38:36 +0200
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
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <318dbd5e-f547-4d78-b42e-4dcacc08d328@denx.de>
X-Originating-IP: [10.252.14.29]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
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

CgpPbiAxMC8xMS8yNCAxODoxNywgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMTAvMTEvMjQgNTo0
MSBQTSwgR2F0aWVuIENoZXZhbGxpZXIgd3JvdGU6Cj4gCj4gWy4uLl0KPiAKPj4gQEAgLTU1MSw2
ICs1NjUsNDEgQEAgc3RhdGljIGludCBzdG0zMl9ybmdfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAKPj4gKm9mZGV2KQo+PiDCoMKgwqDCoMKgIHByaXYtPnJuZy5yZWFkID0gc3RtMzJfcm5n
X3JlYWQ7Cj4+IMKgwqDCoMKgwqAgcHJpdi0+cm5nLnF1YWxpdHkgPSA5MDA7Cj4+ICvCoMKgwqAg
aWYgKCFwcml2LT5kYXRhLT5uYl9jbG9jayB8fCBwcml2LT5kYXRhLT5uYl9jbG9jayA+IDIpCj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gKwo+PiArwqDCoMKgIHByaXYtPmNs
a19idWxrID0gZGV2bV9remFsbG9jKGRldiwgcHJpdi0+ZGF0YS0+bmJfY2xvY2sgKiAKPj4gc2l6
ZW9mKCpwcml2LT5jbGtfYnVsayksCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4+ICvCoMKgwqAgaWYgKCFwcml2LT5jbGtfYnVsaykK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+IAo+IFRyeSB0aGlzOgo+IAo+IHJl
dCA9IGRldm1fY2xrX2J1bGtfZ2V0KGRldiwgcHJpdi0+ZGF0YS0+bmJfY2xvY2ssIHByaXYtPmNs
a19idWxrKTsKPiAuLi4KPiAvLyBTd2FwIHRoZSBjbG9jayBpZiB0aGV5IGFyZSBub3QgaW4gdGhl
IHJpZ2h0IG9yZGVyOgo+IGlmIChwcml2LT5kYXRhLT5uYl9jbG9jayA9PSAyICYmCj4gIMKgwqDC
oCBzdHJjbXAoX19jbGtfZ2V0X25hbWUocHJpdi0+Y2xrX2J1bGtbMF0uY2xrKSwgImNvcmUiKSkK
PiB7Cj4gIMKgY29uc3QgY2hhciAqaWQgPSBwcml2LT5jbGtfYnVsa1sxXS5pZDsKPiAgwqBzdHJ1
Y3QgY2xrICpjbGsgPSBwcml2LT5jbGtfYnVsa1sxXS5jbGs7Cj4gIMKgcHJpdi0+Y2xrX2J1bGtb
MV0uaWQgPSBwcml2LT5jbGtfYnVsa1swXS5pZDsKPiAgwqBwcml2LT5jbGtfYnVsa1sxXS5jbGsg
PSBwcml2LT5jbGtfYnVsa1swXS5jbGs7Cj4gIMKgcHJpdi0+Y2xrX2J1bGtbMF0uaWQgPSBpZDsK
PiAgwqBwcml2LT5jbGtfYnVsa1swXS5jbGsgPSBjbGs7Cj4gfQo+IAoKSGkgTWFyZWssCgpUaGlz
IHdvbid0IHdvcmsgYXMgdGhlIG5hbWUgcmV0dXJuZWQgYnkgdGhpcyBBUEkgaXMgY2xrLT5jb3Jl
LT5uYW1lLgpBRkFJQ1QsIGl0IGRvZXNuJ3QgY29ycmVzcG9uZCB0byB0aGUgbmFtZXMgcHJlc2Vu
dCBpbiB0aGUgZGV2aWNlIHRyZWUKdW5kZXIgdGhlICJjbG9jay1uYW1lcyIgcHJvcGVydHkuCkFu
eSBvdGhlciBpZGVhIG9yIGFyZSB5b3UgZmluZSB3aXRoIHdoYXQncyBiZWxvdz8KClRoYW5rcywK
R2F0aWVuCgo+PiArwqDCoMKgIGlmIChwcml2LT5kYXRhLT5uYl9jbG9jayA9PSAyKSB7Cj4+ICvC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgY2xrICpjbGs7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
Y2xrICpidXNfY2xrOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBjbGsgPSBkZXZtX2Nsa19nZXQo
Jm9mZGV2LT5kZXYsICJjb3JlIik7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGNsaykp
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGNsayk7Cj4+ICsKPj4g
K8KgwqDCoMKgwqDCoMKgIGJ1c19jbGsgPSBkZXZtX2Nsa19nZXQoJm9mZGV2LT5kZXYsICJidXMi
KTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoY2xrKSkKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoYnVzX2Nsayk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKg
IHByaXYtPmNsa19idWxrWzBdLmNsayA9IGNsazsKPj4gK8KgwqDCoMKgwqDCoMKgIHByaXYtPmNs
a19idWxrWzBdLmlkID0gImNvcmUiOwo+PiArwqDCoMKgwqDCoMKgwqAgcHJpdi0+Y2xrX2J1bGtb
MV0uY2xrID0gYnVzX2NsazsKPj4gK8KgwqDCoMKgwqDCoMKgIHByaXYtPmNsa19idWxrWzFdLmlk
ID0gImJ1cyI7Cj4+ICvCoMKgwqAgfSBlbHNlIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBj
bGsgKmNsazsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgY2xrID0gZGV2bV9jbGtfZ2V0KCZvZmRl
di0+ZGV2LCBOVUxMKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoY2xrKSkKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoY2xrKTsKPj4gKwo+PiArwqDCoMKg
wqDCoMKgwqAgcHJpdi0+Y2xrX2J1bGtbMF0uY2xrID0gY2xrOwo+PiArwqDCoMKgwqDCoMKgwqAg
cHJpdi0+Y2xrX2J1bGtbMF0uaWQgPSAiY29yZSI7Cj4+ICvCoMKgwqAgfQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
