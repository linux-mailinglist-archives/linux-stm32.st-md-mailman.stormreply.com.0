Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A6E8FAE82
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 11:16:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21C58C71288;
	Tue,  4 Jun 2024 09:16:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE075C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 09:15:53 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45494lCn031129;
 Tue, 4 Jun 2024 11:15:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 qffrjtKMkRwftEA2tT5fwaxuwB2L0SM4mOqEx2NwZOo=; b=27LETLloblnKW1ze
 OguMztGrFKSJuOveeUHYxriGpmF2JVXJVDwEb8sXBWU9u8R0fQjb3HRfU+EUUBFb
 24RZZ8KJd5JYG7mcmrlxbS5VmJhZFGM2Y/PRTkmAahmIfwMLQYj2xHuPq01JpIUu
 Fd3pjfYyhBwZ8t0BbwkhynDsgUTfNyS+zqwPaApvO/O9kvprpvgM6gyqsUBex37s
 IeEKv6EdGHf8Yl9MR+B/glTcq4VhG0hzOb8BZhytzlnirrOprMmFPlfcujaVoPE8
 1HUHjYLDyYSmuGBIw0ZXTub9PQ73zSUegc8h2I3V0B/Feh4FITQmgo17wIYQaPb2
 HkPAkQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ygd70sd70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jun 2024 11:15:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3D29F40047;
 Tue,  4 Jun 2024 11:15:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6222216851;
 Tue,  4 Jun 2024 11:13:54 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 4 Jun
 2024 11:13:51 +0200
Message-ID: <627a2182-527c-444d-9485-817c69f57036@foss.st.com>
Date: Tue, 4 Jun 2024 11:13:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240603092757.71902-1-christophe.roullier@foss.st.com>
 <20240603092757.71902-3-christophe.roullier@foss.st.com>
 <Zl2O+eJF9vOTqFx2@shell.armlinux.org.uk>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <Zl2O+eJF9vOTqFx2@shell.armlinux.org.uk>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_03,2024-05-30_01,2024-05-17_01
Cc: Marek Vasut <marex@denx.de>, Jose Abreu <joabreu@synopsys.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 02/11] net: stmmac: dwmac-stm32:
 Separate out external clock rate validation
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

Ck9uIDYvMy8yNCAxMTozOCwgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3RlOgo+IE9uIE1vbiwg
SnVuIDAzLCAyMDI0IGF0IDExOjI3OjQ4QU0gKzAyMDAsIENocmlzdG9waGUgUm91bGxpZXIgd3Jv
dGU6Cj4+ICtzdGF0aWMgaW50IHN0bTMybXAxX3ZhbGlkYXRlX2V0aGNrX3JhdGUoc3RydWN0IHBs
YXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0X2RhdCkKPj4gK3sKPj4gKwlzdHJ1Y3Qgc3RtMzJfZHdt
YWMgKmR3bWFjID0gcGxhdF9kYXQtPmJzcF9wcml2Owo+PiArCWNvbnN0IHUzMiBjbGtfcmF0ZSA9
IGNsa19nZXRfcmF0ZShkd21hYy0+Y2xrX2V0aF9jayk7Cj4+ICsKPj4gKwlzd2l0Y2ggKHBsYXRf
ZGF0LT5tYWNfaW50ZXJmYWNlKSB7Cj4gU2hvdWxkIHRoZXNlIGJlIHBoeV9pbnRlcmZhY2U/CgpI
aSwKClRoZSBjb2RlIGlzIHZhbGlkYXRpbmcgdGhlIGNsb2NrIGZyZXF1ZW5jeSBvZiBjbG9jayB0
aGF0IGFyZSBJTlBVVCBpbnRvIAp0aGUgTUFDLiBUaGVzZSBjbG9jayBjYW4gYmUgZ2VuZXJhdGVk
IGJ5IGVpdGhlciB0aGUgUEhZLCBvciBYdGFsLCBvciAKc29tZSBvdGhlciBzb3VyY2UsIGJ1dCB0
aGV5IGFyZSBzdGlsbCB0aGUgY2xvY2sgd2hpY2ggYXJlIElOUFVUIGludG8gdGhlIApNQUMuIFRo
ZXJlZm9yZSBJIGJlbGlldmUgbWFjX2ludGVyZmFjZSBpcyBjb3JyZWN0IGhlcmUuCgo+IERvZXMg
dGhpcyBjbG9jayBkZXBlbmQgb24gdGhlIGludGVyZmFjZQo+IG1vZGUgdXNlZCB3aXRoIHRoZSBQ
SFk/Cj4KSSBkb24ndCB0aGluayB0aGUgY2xvY2sgZGVwZW5kIG9uIHRoZSBQSFkgbW9kZS4gTG9v
ayBhdCAKZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3Jt
LmMgOgoiCjQ1OMKgwqDCoMKgwqDCoMKgwqAgcGxhdC0+cGh5X2ludGVyZmFjZSA9IHBoeV9tb2Rl
Owo0NTnCoMKgwqDCoMKgwqDCoMKgIHJjID0gc3RtbWFjX29mX2dldF9tYWNfbW9kZShucCk7CjQ2
MMKgwqDCoMKgwqDCoMKgwqAgcGxhdC0+bWFjX2ludGVyZmFjZSA9IHJjIDwgMCA/IHBsYXQtPnBo
eV9pbnRlcmZhY2UgOiByYzsKIgphbmQgdGhpcyBjb21tZW50OgoiCjM4MiAvKioKMzgzwqAgKiBz
dG1tYWNfb2ZfZ2V0X21hY19tb2RlIC0gcmV0cmlldmVzIHRoZSBpbnRlcmZhY2Ugb2YgdGhlIE1B
QwozODTCoCAqIEBucDogLSBkZXZpY2UtdHJlZSBub2RlCjM4NcKgICogRGVzY3JpcHRpb246CjM4
NsKgICogU2ltaWxhciB0byBgb2ZfZ2V0X3BoeV9tb2RlKClgLCB0aGlzIGZ1bmN0aW9uIHdpbGwg
cmV0cmlldmUgKGZyb20KMzg3wqAgKiB0aGUgZGV2aWNlLXRyZWUpIHRoZSBpbnRlcmZhY2UgbW9k
ZSBvbiB0aGUgTUFDIHNpZGUuIFRoaXMgYXNzdW1lcwozODjCoCAqIHRoYXQgdGhlcmUgaXMgbW9k
ZSBjb252ZXJ0ZXIgaW4tYmV0d2VlbiB0aGUgTUFDICYgUEhZCjM4OcKgICogKGUuZy4gR01JSS10
by1SR01JSSkuCjM5MMKgICovCjM5MSBzdGF0aWMgaW50IHN0bW1hY19vZl9nZXRfbWFjX21vZGUo
c3RydWN0IGRldmljZV9ub2RlICpucCkKIgpJIHRoaW5rIGluIHRoZSB1bmxpa2VseSBjYXNlIHRo
YXQgeW91IHdvdWxkIGhhdmUgYSBtb2RlIGNvbnZlcnRlciAKYmV0d2VlbiB0aGUgTUFDIGFuZCBQ
SFksIHRoZSBjbG9jayB0aGF0IGFyZSB2YWxpZGF0ZWQgYnkgdGhpcyBjb2RlIHdvdWxkIApzdGls
bCBiZSB0aGUgY2xvY2sgdGhhdCBhcmUgSU5QVVQgaW50byB0aGUgTUFDLCBpLmUuIGNsb2NrIG9u
IHRoZSBNQUMgCnNpZGUgb2YgdGhlIG1vZGUgY29udmVydGVyIGFuZCBOT1Qgb24gdGhlIFBIWSBz
aWRlICwgYW5kIHRob3NlIGNsb2NrIAp3b3VsZCBub3QgZGVwZW5kIG9uIHRoZSBQSFkgbW9kZSwg
dGhleSB3b3VsZCBkZXBlbmQgb24gdGhlIE1BQyBtb2RlIC4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
