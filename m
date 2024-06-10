Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5A901C78
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 10:08:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CFEAC78009;
	Mon, 10 Jun 2024 08:08:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4645EC78007
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 08:08:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459MPVMf009372;
 Mon, 10 Jun 2024 10:08:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dRbbtVz+VqS7/TuWoSy7X/93HAbVqJfuFI4hivhbQiw=; b=NeBN5ovAO8lH5T3I
 vDTZhPG9Cv3sbaAVx4JG6cmaa7BobZvnr4byyUwXe4l9WCnfAanyQb+SZA/pBCi5
 JV+Uga8WDL/UARTZIdV2AQfwYwDDKIDVKiaKX/wiqo+nFvSkROeqiq7+2OCfdsbR
 eBjOpYg+KmnJadXTfDMEhamkhZH1jTi2oXpBVUwzVskH7tEmFeQjt39MqVokTJgd
 XsJBlhyIbn7nelIOquo/IPDbiTahQUyzrNOHjbCWdWhy638ioRpTE/9mVx2nBC+d
 l5htt3H+4o7CuGsrNOlQfOznjliG7U4EfEV+QKEmlKwp1uOoZYgkZ/3mEgdA3WD3
 sQGffA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ymce5ntxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 10:08:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C46094004A;
 Mon, 10 Jun 2024 10:08:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71F08211940;
 Mon, 10 Jun 2024 10:07:12 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 10:07:11 +0200
Message-ID: <036c9f0d-681d-461d-b839-f781fa220e94@foss.st.com>
Date: Mon, 10 Jun 2024 10:06:57 +0200
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
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <6d60bbc6-5ed3-4bb1-ad72-18a2be140b81@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
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

SGkgTWFyZWsKCk9uIDYvNy8yNCAxNDo0OCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNi83LzI0
IDExOjU3IEFNLCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+IAo+IFsuLi5dCj4gCj4+IEBA
IC0xNTA1LDYgKzE1MTEsMzggQEAgc2RtbWMyOiBtbWNANTgwMDcwMDAgewo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH07Cm5vIHNwYWNlIGhlcmUgPwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBldGhlcm5ldDE6IGV0aGVybmV0QDU4MDBhMDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInN0LHN0bTMybXAxMy1kd21hYyIsICJzbnBz
LGR3bWFjLTQuMjBhIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8
MHg1ODAwYTAwMCAweDIwMDA+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
Zy1uYW1lcyA9ICJzdG1tYWNldGgiOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmludGMgR0lDX1NQSSA2MiAKPj4gSVJRX1RZUEVfTEVW
RUxfSElHSD4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDwmZXh0aSA2OCAxPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpbnRlcnJ1cHQtbmFtZXMgPSAibWFjaXJxIiwgImV0aF93YWtlX2lycSI7Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2stbmFtZXMgPSAic3RtbWFjZXRoIiwK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJt
YWMtY2xrLXR4IiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICJtYWMtY2xrLXJ4IiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJldGhzdHAiLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImV0aC1jayI7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZyY2MgRVRIMU1BQz4sCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmcmNjIEVUSDFUWD4sCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmcmNjIEVUSDFSWD4sCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmcmNjIEVUSDFTVFA+LAo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JnJjYyBFVEgxQ0tfSz47
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Qsc3lzY29uID0gPCZzeXNjZmcg
MHg0IDB4ZmYwMDAwPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbnBzLG1p
eGVkLWJ1cnN0Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNucHMscGJsID0g
PDI+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNucHMsYXhpLWNvbmZpZyA9
IDwmc3RtbWFjX2F4aV9jb25maWdfMT47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc25wcyx0c287Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWNjZXNzLWNv
bnRyb2xsZXJzID0gPCZldHpwYyA0OD47Cj4gCj4gS2VlcCB0aGUgbGlzdCBzb3J0ZWQuCgpUaGUg
bGlzdCBpcyBjdXJyZW50bHkgbm90IHNvcnRlZC4gSSBhZ3JlZSB0aGF0IGl0IGlzIGJldHRlciB0
byBoYXZlIGEgCmNvbW1vbiBydWxlIHRvIGVhc3kgdGhlIHJlYWQgYnV0IGl0IHNob3VsZCBiZSBh
cHBsaWVkIHRvIGFsbCB0aGUgbm9kZXMgCmZvciB0aGUgd2hvbGUgU1RNMzIgZmFtaWx5LiBNYXli
ZSB0byBhZGRyZXNzIGJ5IGFub3RoZXIgc2VyaWVzLiBGb3IgdGhlIAp0aW1lIGJlaW5nIHdlIGNh
biBrZWVwIGl0IGFzIGl0IGlzLgoKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
