Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF648C44C7
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 18:04:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9525CC640E5;
	Mon, 13 May 2024 16:04:39 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51583C5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 16:04:33 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DC1mtn004753;
 Mon, 13 May 2024 18:02:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=B766p5PPQr7dHmHzceq9OMDPS3Z4QnY2plz4PZdwYqw=; b=KW
 L06VFgIsC51L9S28vBzQzSYHj6WEM4xVAJUqLfJb8ECuAjIsa1qvRrObJzWq+iYe
 X5ordIMO33l3QmE+JiIrWBS8rm0CkFbUGgvNNYWJAwVpNCQkPU2MCfPP8lI8sB8g
 YEcPAQPwCAWh0vkvYm8gUhl+leGGwl7oCEA/x7tncYr9cOG3CGwF4p9yFkXE3sdB
 E+YQYokSpMjCECWYMDEdS0JtK8u8Y3VxtPAdmr9RNkwKZLB/ZcW+LodFYsPQQTJe
 m4wnAncEWTH1eJmt8clMTns0kKc7LT/amdW8mYFS+lSkg4vu2ydcJXH5V2Mx5bo2
 By1TNcybmLqb5IVmFsvw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y2kmhnf0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 18:02:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C915640044;
 Mon, 13 May 2024 18:02:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBD832248DE;
 Mon, 13 May 2024 18:01:13 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 13 May
 2024 18:01:12 +0200
Message-ID: <8bf3be27-3222-422d-bfff-ff67271981d8@foss.st.com>
Date: Mon, 13 May 2024 18:01:11 +0200
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
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-11-christophe.roullier@foss.st.com>
 <43024130-dcd6-4175-b958-4401edfb5fd8@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <43024130-dcd6-4175-b958-4401edfb5fd8@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_11,2024-05-10_02,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 10/11] ARM: dts: stm32: add ethernet1
 and ethernet2 for STM32MP135F-DK board
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

SGkgTWFyZWsKCk9uIDQvMjYvMjQgMTc6NDQsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDQvMjYv
MjQgMjo1NyBQTSwgQ2hyaXN0b3BoZSBSb3VsbGllciB3cm90ZToKPj4gQWRkIGR1YWwgRXRoZXJu
ZXQ6Cj4+IC1FdGhlcm5ldDE6IFJNSUkgd2l0aCBjcnlzdGFsCj4+IC1FdGhlcm5ldDI6IFJNSUkg
d2l0aG91dCBjcnlzdGFsCj4+IFBIWXMgdXNlZCBhcmUgU01TQyAoTEFOODc0MkEpCj4+Cj4+IFdp
dGggRXRoZXJuZXQxLCB3ZSBjYW4gcGVyZm9ybWVkIFdvTCBmcm9tIFBIWSBpbnN0ZWFkIG9mIEdN
QUMgcG9pbnQKPj4gb2Ygdmlldy4KPj4gKGluIHRoaXMgY2FzZSBJUlEgZm9yIFdvTCBpcyBtYW5h
Z2VkIGFzIHdha2V1cCBwaW4gYW5kIGNvbmZpZ3VyZWQKPj4gaW4gT1Mgc2VjdXJlKS4KPiAKPiBI
b3cgZG9lcyB0aGUgTGludXggUEhZIGRyaXZlciBwcm9jZXNzIHN1Y2ggYSBQSFkgSVJRID8KPiAK
PiBPciBpcyBMaW51eCB1bmF3YXJlIG9mIHRoZSBQSFkgSVJRID8gRG9lc24ndCB0aGF0IGNhdXNl
IGlzc3VlcyA/CgpJbiB0aGlzIGNhc2UsIHdlIHdhbnQgdG8gaGF2ZSBhbiBleGFtcGxlIHRvIHdh
a2V1cCB0aGUgc3lzdGVtIGZyb20gClN0YW5kYnkgbG93IHBvd2VyIG1vZGUgKFZERENQVSBhbmQg
VkREX0NPUkUgb2ZmKSB0aGFua3MgdG8gYSBtYWdpYyAKcGFja2V0IGRldGVjdGVkIGJ5IHRoZSBQ
SFkuIFRoZSBQSFkgdGhlbiBhc3NlcnQgaGlzIGludGVycnVwdCBvdXRwdXQgc2lnbmFsLgpPbiBN
UDEzIERLIHBsYXRmb3JtLCB0aGlzIFBIWSBzaWduYWwgaXMgY29ubmVjdGVkIHRvIGEgc3BlY2lm
aWMgR1BJTwpha2EgIldha2V1cCBwaW5zIiAob25seSA2IHdha2V1cCBwaW5zIGFuIE1QMTMpLiBU
aG9zZSBzcGVjaWZpYyBHUElPcyBhcmUgCmhhbmRsZWQgYnkgdGhlIFBXUiBwZXJpcGhlcmFsIHdo
aWNoIGlzIGNvbnRyb2xsZWQgYnkgdGhlIHNlY3VyZSBPUy4KCk9uIFdvTCBwYWNrZXQsIHRoZSBT
ZWN1cmUgT1MgY2F0Y2hlcyB0aGUgUEhZIGludGVycnVwdCBhbmQgdXNlcyAKYXN5bmNocm9ub3Vz
IG5vdGlmaWNhdGlvbiBtZWNoYW5pc20gdG8gd2FybiBMaW51eCAob24gb3VyIHBsYXRmb3JtIHdl
IAp1c2UgYSBQUEkpLiBPbiBMaW51eCBzaWRlLCBPcHRlZSBjb3JlIGRyaXZlciBjcmVhdGVzIGFu
IGlycSAKZG9tYWluL2lycWNoaXAgdHJpZ2dlcmVkIG9uIHRoZSBhc3luY2hyb25vdXMgbm90aWZp
Y2F0aW9uLiBFYWNoIGRldmljZSAKd2hpY2ggdXNlIGEgd2FrZXVwIHBpbiBuZWVkIHRoZW4gdG8g
cmVxdWVzdCBhbiBJUlEgb24gdGhpcyAiT3B0ZWUgaXJxIApkb21haW4iLgoKVGhpcyBPUFRFRSBp
cnEgZG9tYWluIHdpbGwgYmUgcHVzaGVkIHNvb24uCgpjaGVlcnMKQWxleAoKPiAKPj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0cyAKPj4gYi9hcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdHMKPj4gaW5kZXggNTY3ZTUzYWQyODVm
Li4zYjhlYjBhYjlhYjkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMy
bXAxMzVmLWRrLmR0cwo+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1k
ay5kdHMKPj4gQEAgLTE5LDYgKzE5LDggQEAgLyB7Cj4+IMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJzdCxzdG0zMm1wMTM1Zi1kayIsICJzdCxzdG0zMm1wMTM1IjsKPj4gwqDCoMKgwqDCoCBhbGlh
c2VzIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGV0aGVybmV0MCA9ICZldGhlcm5ldDE7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBldGhlcm5ldDEgPSAmZXRoZXJuZXQyOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
c2VyaWFsMCA9ICZ1YXJ0NDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNlcmlhbDEgPSAmdXNhcnQx
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2VyaWFsMiA9ICZ1YXJ0ODsKPj4gQEAgLTE0MSw2ICsx
NDMsNTIgQEAgJmNyeXAgewo+PiDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gwqAgfTsK
Pj4gKyZldGhlcm5ldDEgewo+PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gK8KgwqDCoCBw
aW5jdHJsLTAgPSA8JmV0aDFfcm1paV9waW5zX2E+Owo+PiArwqDCoMKgIHBpbmN0cmwtMSA9IDwm
ZXRoMV9ybWlpX3NsZWVwX3BpbnNfYT47Cj4+ICvCoMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IiwgInNsZWVwIjsKPj4gK8KgwqDCoCBwaHktbW9kZSA9ICJybWlpIjsKPj4gK8KgwqDCoCBt
YXgtc3BlZWQgPSA8MTAwPjsKPj4gK8KgwqDCoCBwaHktaGFuZGxlID0gPCZwaHkwX2V0aDE+Owo+
IAo+IEtlZXAgdGhlIGxpc3Qgc29ydGVkIHBsZWFzZSAoaXMgdGhlIG1heC1zcGVlZCBldmVuIG5l
ZWRlZD8gaWYgbm90LCBkcm9wIGl0KQo+IAo+PiArwqDCoMKgIG1kaW8gewo+PiArwqDCoMKgwqDC
oMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+ICvCoMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxs
cyA9IDwwPjsKPj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic25wcyxkd21hYy1tZGlv
IjsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgcGh5MF9ldGgxOiBldGhlcm5ldC1waHlAMCB7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiZXRoZXJuZXQtcGh5LWlkMDAw
Ny5jMTMxIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzZXQtZ3Bpb3MgPcKgIDwmbWNw
MjMwMTcgOSBHUElPX0FDVElWRV9MT1c+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcg
PSA8MD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdha2V1cC1zb3VyY2U7Cj4+ICvCoMKg
wqDCoMKgwqDCoCB9Owo+PiArwqDCoMKgIH07Cj4+ICt9Owo+PiArCj4+ICsmZXRoZXJuZXQyIHsK
Pj4gK8KgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+ICvCoMKgwqAgcGluY3RybC0wID0gPCZldGgy
X3JtaWlfcGluc19hPjsKPj4gK8KgwqDCoCBwaW5jdHJsLTEgPSA8JmV0aDJfcm1paV9zbGVlcF9w
aW5zX2E+Owo+PiArwqDCoMKgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7Cj4+
ICvCoMKgwqAgcGh5LW1vZGUgPSAicm1paSI7Cj4+ICvCoMKgwqAgbWF4LXNwZWVkID0gPDEwMD47
Cj4+ICvCoMKgwqAgcGh5LWhhbmRsZSA9IDwmcGh5MF9ldGgyPjsKPj4gK8KgwqDCoCBzdCxleHQt
cGh5Y2xrOwo+PiArwqDCoMKgIHBoeS1zdXBwbHkgPSA8JnNjbWlfdjN2M19zdz47Cj4gCj4gU29y
dCBwbGVhc2UKPiAKPiBbLi4uXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
