Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A32EA4F3ED
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 02:38:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57100C78F6D;
	Wed,  5 Mar 2025 01:38:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17659CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 01:38:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NACHM009868;
 Wed, 5 Mar 2025 01:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6fXsemTRvb33GDa9HuDSscYG9ZYenOtIbcGHc+Y5ios=; b=fi1hokbEPKzjSwig
 f3o9GtdkYo/k2VNCry0p0ye8MfYn+zvADlIL+B4/7WCjiG8BSJTlNPfVFpCQE9Al
 6G3WMv5EulAlqeJQC+yYMX+6/ovtyjd0KJfSri+8Vdw21SXoxM2LlHW/9yhfQ2un
 Fzc6eOBN0I1bPEsv+EuFd0a1RZjDc6f+LHZe6NC9+TEE4MUfinfTg+jcsENFOsU1
 ougC4otCt/K6KDgoodcBm/tYrRszmWx1qWTl/AT5h1W/clKq4ANsrRQT7VzK1ml/
 jRkXo3lm/pEY1Sp/oq+49YWpBr8kcUcofhv4WSQVEGlSXguiBRBzmbmNvqa8RyNH
 hE3QJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tkpu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Mar 2025 01:37:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5251bRGS023547
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Mar 2025 01:37:27 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 17:37:22 -0800
Message-ID: <25fadd59-e728-4fc0-9441-e9630c8c64cb@quicinc.com>
Date: Wed, 5 Mar 2025 09:37:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-6-quic_jiegan@quicinc.com>
 <8efe6176-44a2-4b3d-b9b5-855b26f00187@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <8efe6176-44a2-4b3d-b9b5-855b26f00187@arm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c7aae5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=ke3Xk7aYDoRetkXMGe0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tbGWPvLgxQDczMcusIcCpbkV5VuIddwS
X-Proofpoint-ORIG-GUID: tbGWPvLgxQDczMcusIcCpbkV5VuIddwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_01,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050011
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v15 05/10] Coresight: Allocate trace ID
 after building the path
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

CgpPbiAzLzQvMjAyNSAxMDo1OCBQTSwgU3V6dWtpIEsgUG91bG9zZSB3cm90ZToKPiBPbiAwMy8w
My8yMDI1IDAzOjI5LCBKaWUgR2FuIHdyb3RlOgo+PiBUaGUgdHJhY2VfaWQgd2lsbCBiZSBzdG9y
ZWQgaW4gY29yZXNpZ2h0X3BhdGggaW5zdGVhZCBvZiBiZWluZyBkZWNsYXJlZAo+PiBldmVyeXdo
ZXJlIGFuZCBhbGxvY2F0ZWQgYWZ0ZXIgYnVpbGRpbmcgdGhlIHBhdGguCj4+Cj4+IENvLWRldmVs
b3BlZC1ieTogSmFtZXMgQ2xhcmsgPGphbWVzLmNsYXJrQGxpbmFyby5vcmc+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEphbWVzIENsYXJrIDxqYW1lcy5jbGFya0BsaW5hcm8ub3JnPgo+PiBTaWduZWQtb2Zm
LWJ5OiBKaWUgR2FuIDxxdWljX2ppZWdhbkBxdWljaW5jLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZl
cnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY29yZS5jwqAgfCA0NCArKysrKysrKysr
KysrKysrKysrCj4+IMKgIC4uLi9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1ldG0tcGVy
Zi5jwqAgfMKgIDUgKy0tCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2ln
aHQtcHJpdi5owqAgfMKgIDIgKwo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29y
ZXNpZ2h0LXN5c2ZzLmMgfMKgIDQgKysKPj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od3RyYWNp
bmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmMgYi9kcml2ZXJzLyAKPj4gaHd0cmFjaW5nL2Nv
cmVzaWdodC9jb3Jlc2lnaHQtY29yZS5jCj4+IGluZGV4IGVkMGU5MzY4MzI0ZC4uNmFkYzA2OTk1
ZDc2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0
LWNvcmUuYwo+PiArKysgYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNv
cmUuYwo+PiBAQCAtNjU1LDYgKzY1NSw1MCBAQCBzdGF0aWMgdm9pZCBjb3Jlc2lnaHRfZHJvcF9k
ZXZpY2Uoc3RydWN0IAo+PiBjb3Jlc2lnaHRfZGV2aWNlICpjc2RldikKPj4gwqDCoMKgwqDCoCB9
Cj4+IMKgIH0KPj4gKy8qCj4+ICsgKiBjb3Jlc2lnaHQgZGV2aWNlIHdpbGwgcmVhZCB0aGVpciBl
eGlzdGluZyBvciBhbGxvYyBhIHRyYWNlIElELCBpZiAKPj4gdGhlaXIgdHJhY2VfaWQKPj4gKyAq
IGNhbGxiYWNrIGlzIHNldC4KPj4gKyAqCj4+ICsgKiBSZXR1cm4gMCBpZiB0aGUgdHJhY2VfaWQg
Y2FsbGJhY2sgaXMgbm90IHNldC4KPj4gKyAqIFJldHVybiB0aGUgcmVzdWx0IG9mIHRoZSB0cmFj
ZV9pZCBjYWxsYmFjayBpZiBpdCBpcyBzZXQuIFRoZSAKPj4gcmV0dXJuIHZhbHVlCj4+ICsgKiB3
aWxsIGJlIHRoZSB0cmFjZV9pZCBpZiBzdWNjZXNzZnVsLCBhbmQgYW4gZXJyb3IgbnVtYmVyIGlm
IGl0IGZhaWxzLgo+PiArICovCj4+ICtzdGF0aWMgaW50IGNvcmVzaWdodF9nZXRfdHJhY2VfaWQo
c3RydWN0IGNvcmVzaWdodF9kZXZpY2UgKmNzZGV2LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBlbnVtIGNzX21vZGUgbW9kZSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGNvcmVzaWdodF9kZXZpY2UgKnNpbmspCj4+ICt7Cj4+ICvC
oMKgwqAgaWYgKGNvcmVzaWdodF9vcHMoY3NkZXYpLT50cmFjZV9pZCkKPj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiBjb3Jlc2lnaHRfb3BzKGNzZGV2KS0+dHJhY2VfaWQoY3NkZXYsIG1vZGUsIHNp
bmspOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gKy8qCj4+ICsgKiBD
YWxsIHRoaXMgYWZ0ZXIgY3JlYXRpbmcgdGhlIHBhdGggYW5kIGJlZm9yZSBlbmFibGluZyBpdC4g
VGhpcyBsZWF2ZXMKPj4gKyAqIHRoZSB0cmFjZSBJRCBzZXQgb24gdGhlIHBhdGgsIG9yIGl0IHJl
bWFpbnMgMCBpZiBpdCBjb3VsZG4ndCBiZSAKPj4gYXNzaWduZWQuCj4+ICsgKi8KPj4gK3ZvaWQg
Y29yZXNpZ2h0X3BhdGhfYXNzaWduX3RyYWNlX2lkKHN0cnVjdCBjb3Jlc2lnaHRfcGF0aCAqcGF0
aCwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW0gY3NfbW9k
ZSBtb2RlKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBjb3Jlc2lnaHRfZGV2aWNlICpzaW5rID0g
Y29yZXNpZ2h0X2dldF9zaW5rKCZwYXRoLSAKPj4gPnBhdGhfbGlzdCk7Cj4+ICvCoMKgwqAgc3Ry
dWN0IGNvcmVzaWdodF9ub2RlICpuZDsKPj4gK8KgwqDCoCBpbnQgdHJhY2VfaWQ7Cj4+ICsKPj4g
K8KgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KG5kLCAmcGF0aC0+cGF0aF9saXN0LCBsaW5rKSB7
Cj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBBc3NpZ24gYSB0cmFjZSBJRCB0byB0aGUgcGF0aCBmb3Ig
dGhlIGZpcnN0IGRldmljZSB0aGF0IAo+PiB3YW50cyB0byBkbyBpdCAqLwo+PiArwqDCoMKgwqDC
oMKgwqAgdHJhY2VfaWQgPSBjb3Jlc2lnaHRfZ2V0X3RyYWNlX2lkKG5kLT5jc2RldiwgbW9kZSwg
c2luayk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+ICvCoMKgwqDCoMKgwqDCoMKgICog
MCBpbiB0aGlzIGNvbnRleHQgaXMgdGhhdCBpdCBkaWRuJ3Qgd2FudCB0byBhc3NpZ24gc28ga2Vl
cCAKPj4gc2VhcmNoaW5nLgo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIE5vbiAwIGlzIGVpdGhlciBz
dWNjZXNzIG9yIGZhaWwuCj4+ICvCoMKgwqDCoMKgwqDCoCAqLwo+IAo+IGNoZWNrcGF0Y2ggY29t
cGxhaW5zOgo+IAo+IFdBUk5JTkc6IEJsb2NrIGNvbW1lbnRzIHNob3VsZCBhbGlnbiB0aGUgKiBv
biBlYWNoIGxpbmUKPiAjNjU6IEZJTEU6IGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jl
c2lnaHQtY29yZS5jOjY5NDoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogTm9u
IDAgaXMgZWl0aGVyIHN1Y2Nlc3Mgb3IgZmFpbC4KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqLwo+IAo+IAo+IFBsZWFzZSBtYWtlIHN1cmUgdG8gcnVuIHRoZSBjaGVja3BhdGNoIG9u
IGluZGl2aWR1YWwgcGF0Y2hlcyBiZWZvcmUgCj4gc3VibWl0dGluZyBpbiB0aGUgZnV0dXJlLiBJ
IHdpbGwgZml4IHRoaXMgdXAgbG9jYWxseSBmb3Igbm93Lgo+IAo+IEtpbmQgcmVnYXJkcwo+IFN1
enVraQo+IAoKSGkgU3V6dWtpLAoKU3VyZS4gVGhhbmtzIGZvciBoZWxwIHRvIGRlYWwgd2l0aCB0
aGUgZXJyb3IgdGhpcyB0aW1lLiBJIHdpbGwgdGFrZSBjYXJlIAppbiBmdXR1cmUuCgpKaWUKCj4g
Cj4gCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAodHJhY2VfaWQgIT0gMCkgewo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwYXRoLT50cmFjZV9pZCA9IHRyYWNlX2lkOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm47Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgfQo+PiAr
fQo+PiArCj4+IMKgIC8qKgo+PiDCoMKgICogX2NvcmVzaWdodF9idWlsZF9wYXRoIC0gcmVjdXJz
aXZlbHkgYnVpbGQgYSBwYXRoIGZyb20gYSBAY3NkZXYgdG8gCj4+IGEgc2luay4KPj4gwqDCoCAq
IEBjc2RldjrCoMKgwqAgVGhlIGRldmljZSB0byBzdGFydCBmcm9tLgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1ldG0tcGVyZi5jIGIvIAo+PiBk
cml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bS1wZXJmLmMKPj4gaW5kZXgg
YjA0MjY3OTJmMDhhLi4xMzQyOTBhYjYyMmUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaHd0cmFj
aW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuYwo+PiArKysgYi9kcml2ZXJzL2h3dHJh
Y2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bS1wZXJmLmMKPj4gQEAgLTMxOSw3ICszMTksNiBA
QCBzdGF0aWMgdm9pZCAqZXRtX3NldHVwX2F1eChzdHJ1Y3QgcGVyZl9ldmVudCAKPj4gKmV2ZW50
LCB2b2lkICoqcGFnZXMsCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCB1MzIgaWQsIGNmZ19oYXNoOwo+
PiDCoMKgwqDCoMKgIGludCBjcHUgPSBldmVudC0+Y3B1Owo+PiAtwqDCoMKgIGludCB0cmFjZV9p
ZDsKPj4gwqDCoMKgwqDCoCBjcHVtYXNrX3QgKm1hc2s7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGNv
cmVzaWdodF9kZXZpY2UgKnNpbmsgPSBOVUxMOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBjb3Jlc2ln
aHRfZGV2aWNlICp1c2VyX3NpbmsgPSBOVUxMLCAqbGFzdF9zaW5rID0gTlVMTDsKPj4gQEAgLTQw
OSw4ICs0MDgsOCBAQCBzdGF0aWMgdm9pZCAqZXRtX3NldHVwX2F1eChzdHJ1Y3QgcGVyZl9ldmVu
dCAKPj4gKmV2ZW50LCB2b2lkICoqcGFnZXMsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCAvKiBlbnN1cmUgd2UgY2FuIGFsbG9jYXRlIGEgdHJhY2UgSUQgZm9y
IHRoaXMgQ1BVICovCj4+IC3CoMKgwqDCoMKgwqDCoCB0cmFjZV9pZCA9IGNvcmVzaWdodF90cmFj
ZV9pZF9nZXRfY3B1X2lkX21hcChjcHUsICZzaW5rLSAKPj4gPnBlcmZfc2lua19pZF9tYXApOwo+
PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFJU19WQUxJRF9DU19UUkFDRV9JRCh0cmFjZV9pZCkpIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGNvcmVzaWdodF9wYXRoX2Fzc2lnbl90cmFjZV9pZChwYXRoLCBD
U19NT0RFX1BFUkYpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFJU19WQUxJRF9DU19UUkFDRV9J
RChwYXRoLT50cmFjZV9pZCkpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3B1bWFz
a19jbGVhcl9jcHUoY3B1LCBtYXNrKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29y
ZXNpZ2h0X3JlbGVhc2VfcGF0aChwYXRoKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29udGludWU7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29y
ZXNpZ2h0LXByaXYuaCBiL2RyaXZlcnMvIAo+PiBod3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdo
dC1wcml2LmgKPj4gaW5kZXggMjdiN2RjMzQ4ZDRhLi4yYmVhMzViYWUwZDQgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtcHJpdi5oCj4+ICsrKyBi
L2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtcHJpdi5oCj4+IEBAIC0xNTIs
NiArMTUyLDggQEAgaW50IGNvcmVzaWdodF9tYWtlX2xpbmtzKHN0cnVjdCBjb3Jlc2lnaHRfZGV2
aWNlIAo+PiAqb3JpZywKPj4gwqAgdm9pZCBjb3Jlc2lnaHRfcmVtb3ZlX2xpbmtzKHN0cnVjdCBj
b3Jlc2lnaHRfZGV2aWNlICpvcmlnLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBjb3Jlc2lnaHRfY29ubmVjdGlvbiAqY29ubik7Cj4+IMKgIHUzMiBjb3Jlc2ln
aHRfZ2V0X3NpbmtfaWQoc3RydWN0IGNvcmVzaWdodF9kZXZpY2UgKmNzZGV2KTsKPj4gK3ZvaWQg
Y29yZXNpZ2h0X3BhdGhfYXNzaWduX3RyYWNlX2lkKHN0cnVjdCBjb3Jlc2lnaHRfcGF0aCAqcGF0
aCwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtIGNzX21vZGUg
bW9kZSk7Cj4+IMKgICNpZiBJU19FTkFCTEVEKENPTkZJR19DT1JFU0lHSFRfU09VUkNFX0VUTTNY
KQo+PiDCoCBleHRlcm4gaW50IGV0bV9yZWFkbF9jcDE0KHUzMiBvZmYsIHVuc2lnbmVkIGludCAq
dmFsKTsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2ln
aHQtc3lzZnMuYyBiL2RyaXZlcnMvIAo+PiBod3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1z
eXNmcy5jCj4+IGluZGV4IGNiNGMzOTczMmQyNi4uZDAzNzUxYmYzZDhhIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXN5c2ZzLmMKPj4gKysrIGIv
ZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1zeXNmcy5jCj4+IEBAIC0yMDks
NiArMjA5LDEwIEBAIGludCBjb3Jlc2lnaHRfZW5hYmxlX3N5c2ZzKHN0cnVjdCAKPj4gY29yZXNp
Z2h0X2RldmljZSAqY3NkZXYpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4gwqDC
oMKgwqDCoCB9Cj4+ICvCoMKgwqAgY29yZXNpZ2h0X3BhdGhfYXNzaWduX3RyYWNlX2lkKHBhdGgs
IENTX01PREVfU1lTRlMpOwo+PiArwqDCoMKgIGlmICghSVNfVkFMSURfQ1NfVFJBQ0VfSUQocGF0
aC0+dHJhY2VfaWQpKQo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfcGF0aDsKPj4gKwo+PiDC
oMKgwqDCoMKgIHJldCA9IGNvcmVzaWdodF9lbmFibGVfcGF0aCgmcGF0aC0+cGF0aF9saXN0LCBD
U19NT0RFX1NZU0ZTLCBOVUxMKTsKPj4gwqDCoMKgwqDCoCBpZiAocmV0KQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byBlcnJfcGF0aDsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
