Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B7D7BB6FC
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 13:53:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD857C6C838;
	Fri,  6 Oct 2023 11:53:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B98F5C6C835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 11:53:47 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 396BnWcb023037; Fri, 6 Oct 2023 13:53:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=FTF/KnFa4HI87ODyf1fZyRJiPCg00/ZE8IQgxm+KA2U=; b=eV
 TnBSVhmLnyHkzhBohrMS3uPcsvYCoh2rqZHs68euBl3pxOwPn7YFnq49qy34Yy6o
 TKOs1HzDmXeDezvYVDIyiBU8sjyKOxt3MaG5AOyKxmJV2vFV9f2mlG3fqMV22Xdj
 sFfNC2aAXYTfg3J/ph9ItApXmL+RDGbDPbRWaFWIu2qsVo7wu+41TvLWZs5036Cl
 LpNdAHRdT1vVx6xLQvK51jvfHApx5UR/f6aRv+5oq2SmmPZtfdspXvepdyc69xUL
 VMFVWI0VD0lk83rUXIZppZDn0D/owwc9G6iJ697pas2f2LHxHuTNp3P4F1Vz42MD
 VmQzDoV+WzTnuG5M58EA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tj06tkeyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Oct 2023 13:53:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE253100053;
 Fri,  6 Oct 2023 13:53:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 049B222AFF5;
 Fri,  6 Oct 2023 13:53:25 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 13:53:24 +0200
Message-ID: <162c98ab-52ca-5f90-d28d-78e7903391b1@foss.st.com>
Date: Fri, 6 Oct 2023 13:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Christophe ROULLIER <christophe.roullier@foss.st.com>, Ben Wolsieffer
 <ben.wolsieffer@hefring.com>
References: <20230928151512.322016-1-christophe.roullier@foss.st.com>
 <20230928151512.322016-9-christophe.roullier@foss.st.com>
 <ZRWfhk0aEDwytGv5@dell-precision-5540>
 <c8804fbe-46e7-2771-e503-4e786df2f97c@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <c8804fbe-46e7-2771-e503-4e786df2f97c@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_09,2023-10-06_01,2023-05-22_02
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 08/12] net: ethernet: stmmac: stm32:
 support the phy-supply regulator binding
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

T24gMTAvNS8yMyAxMzoyNywgQ2hyaXN0b3BoZSBST1VMTElFUiB3cm90ZToKPiAKPiBPbiA5LzI4
LzIzIDE3OjQ1LCBCZW4gV29sc2llZmZlciB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+IE9uIFRodSwg
U2VwIDI4LCAyMDIzIGF0IDA1OjE1OjA4UE0gKzAyMDAsIENocmlzdG9waGUgUm91bGxpZXIgd3Jv
dGU6Cj4+PiBGcm9tOiBDaHJpc3RvcGhlIFJvdWxsaWVyIDxjaHJpc3RvcGhlLnJvdWxsaWVyQHN0
LmNvbT4KPj4+Cj4+PiBDb25maWd1cmUgdGhlIHBoeSByZWd1bGF0b3IgaWYgZGVmaW5lZCBieSB0
aGUgInBoeS1zdXBwbHkiIERUIHBoYW5kbGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoZSBSb3VsbGllciA8Y2hyaXN0b3BoZS5yb3VsbGllckBmb3NzLnN0LmNvbT4KPj4+IC0tLQo+
Pj4gwqAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jIHwgNTEg
KysrKysrKysrKysrKysrKysrLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RtMzIuYyAKPj4+IGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RtMzIuYwo+Pj4gaW5kZXggNzJkZGE3MTg1MGQ3NS4u
MzFlM2FiZDJjYWVhYSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMKPj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMKPj4gLi4uIHNuaXAgLi4uCj4+PiDCoCBzdGF0aWMg
aW50IHN0bTMybXAxX3N1c3BlbmQoc3RydWN0IHN0bTMyX2R3bWFjICpkd21hYykKPj4+IEBAIC00
NTUsMTIgKzQ5NiwyMCBAQCBzdGF0aWMgaW50IHN0bTMybXAxX3N1c3BlbmQoc3RydWN0IHN0bTMy
X2R3bWFjIAo+Pj4gKmR3bWFjKQo+Pj4gwqDCoMKgwqDCoCBpZiAoZHdtYWMtPmVuYWJsZV9ldGhf
Y2spCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGR3bWFjLT5j
bGtfZXRoX2NrKTsKPj4+ICvCoMKgwqAgLyogS2VlcCB0aGUgUEhZIHVwIGlmIHdlIHVzZSBXYWtl
LW9uLUxhbi4gKi8KPj4+ICvCoMKgwqAgaWYgKCFkZXZpY2VfbWF5X3dha2V1cChkd21hYy0+ZGV2
KSkKPj4+ICvCoMKgwqDCoMKgwqDCoCBwaHlfcG93ZXJfb24oZHdtYWMsIGZhbHNlKTsKPj4+ICsK
Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+IMKgIH0KPj4+IMKgIHN0YXRpYyB2b2lkIHN0
bTMybXAxX3Jlc3VtZShzdHJ1Y3Qgc3RtMzJfZHdtYWMgKmR3bWFjKQo+Pj4gwqAgewo+Pj4gwqDC
oMKgwqDCoCBjbGtfZGlzYWJsZV91bnByZXBhcmUoZHdtYWMtPmNsa19ldGhzdHApOwo+Pj4gKwo+
Pj4gK8KgwqDCoCAvKiBUaGUgUEhZIHdhcyB1cCBmb3IgV2FrZS1vbi1MYW4uICovCj4+PiArwqDC
oMKgIGlmICghZGV2aWNlX21heV93YWtldXAoZHdtYWMtPmRldikpCj4+PiArwqDCoMKgwqDCoMKg
wqAgcGh5X3Bvd2VyX29uKGR3bWFjLCB0cnVlKTsKPj4+IMKgIH0KPj4+IMKgIHN0YXRpYyBpbnQg
c3RtMzJtY3Vfc3VzcGVuZChzdHJ1Y3Qgc3RtMzJfZHdtYWMgKmR3bWFjKQo+PiBXaHkgb25seSB0
dXJuIG9mZiB0aGUgcmVndWxhdG9yIGluIHN1c3BlbmQgb24gdGhlIFNUTTMyTVAxIGFuZCBub3Qg
U1RNMzIKPj4gTUNVcz8gSXQgc2VlbXMgbGlrZSB0aGlzIGNvdWxkIGp1c3QgZ28gaW4gc3RtMzJf
ZHdtYWNfc3VzcGVuZC9yZXN1bWUoKS4KPj4KPj4gU2VsZmlzaGx5LCBJIGhhdmUgYSB1c2UgY2Fz
ZSBmb3IgdGhpcyBvbiBhbiBTVE0zMkY3NDYgcGxhdGZvcm0sIHNvIEkKPj4gd291bGQgbGlrZSB0
byBzZWUgc3VwcG9ydCBmb3IgaXQgYW5kIHdvdWxkIHRlc3QgYW4gdXBkYXRlZCB2ZXJzaW9uLgo+
Pgo+IEhpLAo+IAo+IEknbSB3b3JraW5nIG9uIE1QVSBib2FyZHMsIEkgZG8gbm90IGhhdmUgTUNV
IGJvYXJkLCBzbyBmZWVsIGZyZWUgdG8gCj4gY29udHJpYnV0ZSBvbiBNQ1UgcGFydCA7LSkKCkNo
cmlzdG9waGUsCgpUaGUgcG9pbnQgaGVyZSBpcyB0byBtYW5hZ2UgcmVndWxhdG9yIGZvciBNUFUg
YW5kIE1DVS4gSWYgeW91IGRvbid0IGhhdmUgCk1DVSBib2FyZCBpdCBkb2Vzbid0IHNlZW0gdG8g
YmUgYW4gaXNzdWUgYXMgQmVuIHByb3Bvc2VkIHRvIHRlc3QgdGhlIApwYXRjaCBmb3IgeW91LgoK
PiAKPiBUaGFua3MKPiAKPiBDaHJpc3RvcGhlCj4gCj4+PiAtLSAKPj4+IDIuMjUuMQo+Pj4KPj4g
VGhhbmtzLCBCZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
