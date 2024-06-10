Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 165959021F1
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 14:49:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA65BC78018;
	Mon, 10 Jun 2024 12:49:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6CC9C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 12:49:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ACUjv2011463;
 Mon, 10 Jun 2024 14:49:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 DlvjTDhAewRmsQzkTjZ5kyD/9jV9SyUh5OV0cymIvvM=; b=T19j8tbmVLhAfEEL
 LtDZjXBORaDCTSc8L8BKpVn8kvicYFTsql8dTHE0wnCOAkKpKOo+vYFqxkpeZXSU
 iqR1lBF9/Q5mS4lqDN7LffB7KBfxRlyQ8bZ8Bo8lSumCPBlpY4ePny05h5k19Jjs
 +A1iUBeE5U5Qgf14sc4dkA2/ZErzOidxl1KtOtp2BoIFxENRfISU3MVEhT6LMkIr
 nY5FhDQDy6OI/kBOHxCbLD1l3b1jBsiqyCCaYNP2hv4NumZ3nk1FNFblSWVMfA00
 SdqOgElYVE6Nujzkg6YAnyDXnfaz9nn6GVgzBj1lXzozApI9gHuDuyQys4xk8kLD
 tKNagA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yme6d6vm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 14:49:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 32E954004D;
 Mon, 10 Jun 2024 14:48:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C63D217B83;
 Mon, 10 Jun 2024 14:47:52 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 14:47:51 +0200
Message-ID: <be1e4321-2aa1-455b-a373-8c9e1f69b33f@foss.st.com>
Date: Mon, 10 Jun 2024 14:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, Christophe Roullier
 <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard
 Cochran <richardcochran@gmail.com>, Jose Abreu <joabreu@synopsys.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
 <20240607095754.265105-10-christophe.roullier@foss.st.com>
 <6d60bbc6-5ed3-4bb1-ad72-18a2be140b81@denx.de>
 <036c9f0d-681d-461d-b839-f781fa220e94@foss.st.com>
 <c5cb092d-dccd-48a4-b1da-4f057581618e@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <c5cb092d-dccd-48a4-b1da-4f057581618e@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 09/12] ARM: dts: stm32: add ethernet1
 and ethernet2 support on stm32mp13
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

CgpPbiA2LzEwLzI0IDEyOjM3LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzEwLzI0IDEwOjA2
IEFNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+PiBIaSBNYXJlawo+IAo+IEhpLAo+IAo+PiBP
biA2LzcvMjQgMTQ6NDgsIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gT24gNi83LzI0IDExOjU3IEFN
LCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+Pj4KPj4+IFsuLi5dCj4+Pgo+Pj4+IEBAIC0x
NTA1LDYgKzE1MTEsMzggQEAgc2RtbWMyOiBtbWNANTgwMDcwMDAgewo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+PiBubyBzcGFjZSBoZXJlID8KPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBldGhlcm5ldDE6IGV0aGVybmV0QDU4MDBhMDAwIHsKPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEzLWR3bWFj
IiwgInNucHMsZHdtYWMtNC4yMGEiOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVnID0gPDB4NTgwMGEwMDAgMHgyMDAwPjsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJlZy1uYW1lcyA9ICJzdG1tYWNldGgiOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmaW50YyBHSUNfU1BJIDYyIAo+
Pj4+IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmZXh0aSA2OCAxPjsKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdC1uYW1lcyA9ICJtYWNpcnEiLCAi
ZXRoX3dha2VfaXJxIjsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2Nr
LW5hbWVzID0gInN0bW1hY2V0aCIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJtYWMtY2xrLXR4IiwKPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIm1hYy1jbGstcngiLAo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZXRoc3Rw
IiwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgImV0aC1jayI7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9ja3Mg
PSA8JnJjYyBFVEgxTUFDPiwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA8JnJjYyBFVEgxVFg+LAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDwmcmNjIEVUSDFSWD4sCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPCZyY2MgRVRIMVNUUD4sCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZyY2MgRVRIMUNLX0s+Owo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Qsc3lzY29uID0gPCZzeXNjZmcgMHg0IDB4ZmYwMDAwPjsK
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNucHMsbWl4ZWQtYnVyc3Q7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbnBzLHBibCA9IDwyPjsKPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNucHMsYXhpLWNvbmZpZyA9IDwmc3RtbWFj
X2F4aV9jb25maWdfMT47Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbnBz
LHRzbzsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFjY2Vzcy1jb250cm9s
bGVycyA9IDwmZXR6cGMgNDg+Owo+Pj4KPj4+IEtlZXAgdGhlIGxpc3Qgc29ydGVkLgo+Pgo+PiBU
aGUgbGlzdCBpcyBjdXJyZW50bHkgbm90IHNvcnRlZC4gSSBhZ3JlZSB0aGF0IGl0IGlzIGJldHRl
ciB0byBoYXZlIGEgCj4+IGNvbW1vbiBydWxlIHRvIGVhc3kgdGhlIHJlYWQgYnV0IGl0IHNob3Vs
ZCBiZSBhcHBsaWVkIHRvIGFsbCB0aGUgbm9kZXMgCj4+IGZvciB0aGUgd2hvbGUgU1RNMzIgZmFt
aWx5LiBNYXliZSB0byBhZGRyZXNzIGJ5IGFub3RoZXIgc2VyaWVzLiBGb3IgCj4+IHRoZSB0aW1l
IGJlaW5nIHdlIGNhbiBrZWVwIGl0IGFzIGl0IGlzLgo+IAo+IFdoeSBpcyB0aGUgc3QsLi4uIGFu
ZCBzbnBzLC4uLiBzd2FwcGVkIGFueXdheSA/IFRoYXQgY2FuIGJlIGZpeGVkIHJpZ2h0IAo+IGhl
cmUuCgpJIGFncmVlLgoKPiAKPiBXaHkgaXMgdGhlIGFjY2Vzcy1jb250cm9sbGVycyBhdCB0aGUg
ZW5kID8gVGhhdCBjYW4gYmUgZml4ZWQgaW4gc2VwYXJhdGUgCj4gc2VyaWVzLCBzaW5jZSB0aGF0
IHNlZW1zIHRvIGhhdmUgcHJvbGlmZXJhdGVkIGNvbnNpZGVyYWJseS4KClllcyBmb3IgYWxsIG90
aGVyIG5vZGVzIHVzaW5nIHRoaXMgYnVzIGZpcmV3YWxsIGJpbmRpbmcgIGJ1dCBpbiBhIApzZXBh
cmF0ZSBzZXJpZXMKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
