Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C35A21D7B
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 14:02:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D16BC78026;
	Wed, 29 Jan 2025 13:02:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E26D7C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 13:02:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T4WeQd018791;
 Wed, 29 Jan 2025 13:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ftSzZxQWxFuySK8miUP6zEBfv5FfrAKGgH7tosFe5+Q=; b=ZP5dGRTbHvz+1l1a
 EIyfBpPA1uW8K9Yz8EKj1eXcqGmyxga6HnYaFPlImzMoJlbufWM+HOl972zOdbSJ
 fOi052peQIgEhFUealWbyvN6N/WmgQRJO8LOYFsz1kKILaHgAs0z4yQduDaeTJ/7
 qc4FlJupmGqdZ9wdqbwfIJSiIvkSAWrPGDOo5t1VGeXkWXFNxfwUBRArjSLwWEBz
 qu8k2iirP75NBl0ivX4Amwu4z2CLVKkjoXAcGdaUYJM7tpLNN9eFBqVjqlLWXSVJ
 A9DErxJ/dCSo6KIO0DNVWTY9ay+lDeKdPmoNvpIYIbo3SOXWfJTk7VbE/GCBeUAu
 4cVpUQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fdd8ru64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 13:02:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50TD2VPj004680
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 13:02:31 GMT
Received: from [10.133.33.43] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 Jan
 2025 05:02:25 -0800
Message-ID: <29bbb602-61fd-44e1-afb5-f158c8d61c97@quicinc.com>
Date: Wed, 29 Jan 2025 21:02:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-6-quic_jiegan@quicinc.com>
 <44bd0d5e-a232-49c3-ba2f-e63e2f2c99be@linaro.org>
 <b3d9e4f0-cca8-45a5-a5b7-239cdeed2751@quicinc.com>
 <070c70ac-c76b-4d1a-acb6-d29cc85967b9@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <070c70ac-c76b-4d1a-acb6-d29cc85967b9@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: RO6md8-g_kwg4T9YiqP0oydXCedLsqFP
X-Proofpoint-GUID: RO6md8-g_kwg4T9YiqP0oydXCedLsqFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290106
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jinlong Mao <quic_jinlmao@quicinc.com>,
 Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v9 5/6] Coresight: Add Coresight TMC
	Control Unit driver
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

CgpPbiAxLzI5LzIwMjUgNjozNSBQTSwgSmFtZXMgQ2xhcmsgd3JvdGU6Cj4gCj4gCj4gT24gMjkv
MDEvMjAyNSAxMjo0NiBhbSwgSmllIEdhbiB3cm90ZToKPj4KPj4KPj4gT24gMS8yOC8yMDI1IDc6
NTUgUE0sIEphbWVzIENsYXJrIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAyNC8wMS8yMDI1IDc6MjUg
YW0sIEppZSBHYW4gd3JvdGU6Cj4+Pj4gVGhlIENvcmVzaWdodCBUTUMgQ29udHJvbCBVbml0IGhv
c3RzIG1pc2NlbGxhbmVvdXMgY29uZmlndXJhdGlvbiAKPj4+PiByZWdpc3RlcnMKPj4+PiB3aGlj
aCBjb250cm9sIHZhcmlvdXMgZmVhdHVyZXMgcmVsYXRlZCB0byBUTUMgRVRSIHNpbmsuCj4+Pj4K
Pj4+PiBCYXNlZCBvbiB0aGUgdHJhY2UgSUQsIHdoaWNoIGlzIHByb2dyYW1tZWQgaW4gdGhlIHJl
bGF0ZWQgQ1RDVSBBVElECj4+Pj4gcmVnaXN0ZXIgb2YgYSBzcGVjaWZpYyBFVFIsIHRyYWNlIGRh
dGEgd2l0aCB0aGF0IHRyYWNlIElEIGdldHMgaW50bwo+Pj4+IHRoZSBFVFIgYnVmZmVyLCB3aGls
ZSBvdGhlciB0cmFjZSBkYXRhIGdldHMgZHJvcHBlZC4KPj4+Pgo+Pj4+IEVuYWJsaW5nIHNvdXJj
ZSBkZXZpY2Ugc2V0cyBvbmUgYml0IG9mIHRoZSBBVElEIHJlZ2lzdGVyIGJhc2VkIG9uCj4+Pj4g
c291cmNlIGRldmljZSdzIHRyYWNlIElELgo+Pj4+IERpc2FibGluZyBzb3VyY2UgZGV2aWNlIHJl
c2V0cyB0aGUgYml0IGFjY29yZGluZyB0byB0aGUgc291cmNlCj4+Pj4gZGV2aWNlJ3MgdHJhY2Ug
SUQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKaWUgR2FuIDxxdWljX2ppZWdhbkBxdWljaW5j
LmNvbT4KPj4+PiAtLS0KPj4+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvS2NvbmZp
Z8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTIgKwo+Pj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2Nv
cmVzaWdodC9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+Pj4gwqAgZHJpdmVy
cy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGN1LmMgfCAyNzYgKysrKysrKysrKysr
KysrIAo+Pj4+ICsrKysKPj4+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNp
Z2h0LWN0Y3UuaCB8wqAgMzAgKysKPj4+PiDCoCBpbmNsdWRlL2xpbnV4L2NvcmVzaWdodC5owqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQo+Pj4+IMKgIDUg
ZmlsZXMgY2hhbmdlZCwgMzIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+PiDCoCBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1j
dGN1LmMKPj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9od3RyYWNpbmcvY29yZXNp
Z2h0L2NvcmVzaWdodC1jdGN1LmgKPj4+IMKgPgo+Pj4KPj4+IFsuLi5dCj4+Pgo+Pj4+ICsvKgo+
Pj4+ICsgKiBjdGN1X3NldF9ldHJfdHJhY2VpZDogUmV0cmlldmUgdGhlIEFUSUQgb2Zmc2V0IGFu
ZCB0cmFjZSBJRC4KPj4+PiArICoKPj4+PiArICogUmV0dXJucyAwIGluZGljYXRlcyBzdWNjZXNz
LiBOb25lLXplcm8gcmVzdWx0IG1lYW5zIGZhaWx1cmUuCj4+Pj4gKyAqLwo+Pj4+ICtzdGF0aWMg
aW50IGN0Y3Vfc2V0X2V0cl90cmFjZWlkKHN0cnVjdCBjb3Jlc2lnaHRfZGV2aWNlICpjc2Rldiwg
Cj4+Pj4gc3RydWN0IGNvcmVzaWdodF9wYXRoICpjc19wYXRoLAo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBlbmFibGUpCj4+Pj4gK3sKPj4+PiArwqDCoMKgIHN0cnVj
dCBjb3Jlc2lnaHRfZGV2aWNlICpzaW5rID0gY29yZXNpZ2h0X2dldF9zaW5rKGNzX3BhdGgtPnBh
dGgpOwo+Pj4+ICvCoMKgwqAgc3RydWN0IGN0Y3VfZHJ2ZGF0YSAqZHJ2ZGF0YSA9IGRldl9nZXRf
ZHJ2ZGF0YShjc2Rldi0+ZGV2LnBhcmVudCk7Cj4+Pj4gK8KgwqDCoCB1OCB0cmFjZV9pZCA9IGNz
X3BhdGgtPnRyYWNlX2lkOwo+Pj4+ICvCoMKgwqAgaW50IHBvcnRfbnVtOwo+Pj4+ICsKPj4+PiAr
wqDCoMKgIGlmICgoc2luayA9PSBOVUxMKSB8fCAhSVNfVkFMSURfQ1NfVFJBQ0VfSUQodHJhY2Vf
aWQpIHx8IAo+Pj4+IElTX0VSUl9PUl9OVUxMKGRydmRhdGEpKSB7Cj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGRldl9lcnIoJmNzZGV2LT5kZXYsICJJbnZhbGlkIHBhcmFtZXRlcnNcbiIpOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+PiArwqDCoMKgIH0KPj4+PiArCj4+Pj4g
K8KgwqDCoCBwb3J0X251bSA9IGN0Y3VfZ2V0X2FjdGl2ZV9wb3J0KHNpbmssIGNzZGV2KTsKPj4+
PiArwqDCoMKgIGlmIChwb3J0X251bSA8IDApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAt
RUlOVkFMOwo+Pj4+ICsKPj4+PiArwqDCoMKgIC8qCj4+Pj4gK8KgwqDCoMKgICogU2tpcCB0aGUg
ZGlzYWJsZSBzZXNzaW9uIGlmIG1vcmUgdGhhbiBvbmUgVFBETSBkZXZpY2UgdGhhdAo+Pj4+ICvC
oMKgwqDCoCAqIGNvbm5lY3RlZCB0byB0aGUgc2FtZSBUUERBIGRldmljZSBoYXMgYmVlbiBlbmFi
bGVkLgo+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+ICvCoMKgwqAgaWYgKGVuYWJsZSkKPj4+PiArwqDC
oMKgwqDCoMKgwqAgYXRvbWljX2luYygmZHJ2ZGF0YS0+dHJhY2VpZF9yZWZjbnRbcG9ydF9udW1d
W3RyYWNlX2lkXSk7Cj4+Pj4gK8KgwqDCoCBlbHNlIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYg
KGF0b21pY19kZWNfcmV0dXJuKCZkcnZkYXRhLT50cmFjZWlkX3JlZmNudFtwb3J0X251bV0gCj4+
Pj4gW3RyYWNlX2lkXSkgPiAwKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Ri
ZygmY3NkZXYtPmRldiwgIlNraXAgdGhlIGRpc2FibGUgc2Vzc2lvblxuIik7Cj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+PiAr
wqDCoMKgIH0KPj4+PiArCj4+Pj4gK8KgwqDCoCBkZXZfZGJnKCZjc2Rldi0+ZGV2LCAidHJhY2Vp
ZCBpcyAlZFxuIiwgY3NfcGF0aC0+dHJhY2VfaWQpOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHJldHVy
biBfX2N0Y3Vfc2V0X2V0cl90cmFjZWlkKGNzZGV2LCB0cmFjZV9pZCwgcG9ydF9udW0sIGVuYWJs
ZSk7Cj4+Pgo+Pj4gSGkgSmllLAo+Pj4KPj4+IFVzaW5nIGF0b21pY19kZWNfcmV0dXJuKCkgaGVy
ZSBkb2Vzbid0IHByZXZlbnQgCj4+PiBfX2N0Y3Vfc2V0X2V0cl90cmFjZWlkKCkgZnJvbSBydW5u
aW5nIGNvbmN1cnJlbnQgZW5hYmxlIGFuZCBkaXNhYmxlcy4gCj4+PiBPbmNlIHlvdSBwYXNzIHRo
ZSBhdG9taWNfZGVjX3JldHVybigpIGEgc2Vjb25kIGNhbGwgdG8gZW5hYmxlIGl0IHdpbGwgCj4+
PiBtZXNzIGl0IHVwLgo+Pj4KPj4+IEkgdGhpbmsgeW91IG5lZWQgYSBzcGlubG9jayBhcm91bmQg
dGhlIHdob2xlIHRoaW5nIGFuZCB0aGVuIHRoZSAKPj4+IHJlZmNvdW50cyBkb24ndCBuZWVkIHRv
IGJlIGF0b21pY3MuCj4+Pgo+PiBIaSwgSmFtZXMKPj4gVGhhbmtzIGZvciBjb21tZW50LiBJIG1h
eSBub3QgZnVsbHkgdGVzdGVkIG15IGNvZGVzIGhlcmUuIFdoYXQgSSB3YXMgCj4+IHRoaW5raW5n
IGlzIHRoZXJlJ3Mgbm8gd2F5IHRoZSByZWZjbnQgY291bGQgYmVjb21lIGEgbmVnYXRpdmUgbnVt
YmVyIAo+PiB1bmRlciBjdXJyZW50IGZyYW1ld29yay4gU28gSSBqdXN0IGFkZGVkIHNwaW5sb2Nr
IGluIAo+PiBfX2N0Y3Vfc2V0X2V0cl90cmFjZWlkKCkgdG8gZW5zdXJlIGNvbmN1cnJlbnQgc2Vz
c2lvbnMgY29ycmVjdGx5IAo+PiBtYW5pcHVsYXRlIHRoZSByZWdpc3Rlci4KPj4KPj4gQXMgdGhl
IHRyYWNlX2lkIHJlbGF0ZWQgdG8gdGhlIGJpdCBvZiB0aGUgQVRJRCByZWdpc3RlciwgSSB0aGlu
ayB0aGUgCj4+IGNvbmN1cnJlbnQgcHJvY2Vzc2VzIGFyZSB3b3JraW5nIGZpbmUgd2l0aCBzcGlu
bG9jayBhcm91bmQgcmVhZC93cml0ZSAKPj4gcmVnaXN0ZXIuCj4+Cj4+IEkgbWF5IG5vdCBmdWxs
eSBnb3QgeW91ciBwb2ludCBoZXJlLiBQbGVhc2UgaGVscCBtZSB0byBjb3JyZWN0IGl0Lgo+Pgo+
PiBUaGFua3MsCj4+IEppZQo+Pgo+Pgo+IAo+IE5vIGl0IGNhbid0IGJlY29tZSBuZWdhdGl2ZSwg
YnV0IHRoZSByZWZjb3VudCBjYW4gYmUgYSBkaWZmZXJlbnQgc3RhdGUgCj4gdG8gdGhlIG9uZSB0
aGF0IHdhcyBhY3R1YWxseSB3cml0dGVuOgo+IAo+IAo+ICDCoCBDUFUwwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQ1BVMQo+ICDCoCAtLS0t
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LS0tLQo+ICDCoCBjdGN1X3NldF9ldHJfdHJhY2VpZChlbmFibGUpCj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN0
Y3Vfc2V0X2V0cl90cmFjZWlkKGRpc2FibGUpCj4gIMKgIGF0b21pY19pbmMoKQo+ICDCoCByZWNv
dW50ID09IDEKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRvbWljX2RlYygpCj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlY291
bnQgPT0gMAo+IAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2N0Y3Vfc2V0X2V0cl90cmFjZWlkKGRpc2FibGUp
Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIExvY2sgYW5kIHdyaXRlIGRpc2FibGUgc3RhdGUgdG8KPiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGV2aWNlCj4gCj4gIMKgIF9fY3RjdV9zZXRfZXRyX3RyYWNlaWQoZW5hYmxlKQo+ICDC
oCBMb2NrIGFuZCB3cml0ZSBlbmFibGUgc3RhdGUgdG8KPiAgwqAgZGV2aWNlCj4gCj4gCj4gQXMg
eW91IGNhbiBzZWUgdGhpcyBsZWF2ZXMgdGhlIGRldmljZSBpbiBhbiBlbmFibGVkIHN0YXRlIGJ1
dCB0aGUgCj4gcmVmY291bnQgaXMgMC4KWWVzLCB5b3UgYXJlIHJpZ2h0LiBJIGRpZG50IGNvbnNp
ZGVyIHRoaXMgc2NlbmFyaW8uIFdlIGRlZmluaXRlbHkgbmVlZCAKc3BpbmxvY2sgaGVyZS4KCj4g
Cj4gVGhpcyBpcyBhbHNvIHF1aXRlIGxhcmdlIGlmIHlvdSB1c2UgYXRvbWljIHR5cGVzOgo+IAo+
ICDCoC8qIHJlZmNudCBmb3IgZWFjaCB0cmFjZWlkIG9mIGVhY2ggc2luayAqLwo+ICDCoGF0b21p
Y190IHRyYWNlaWRfcmVmY250W0FUSURfTUFYX05VTV1bQ09SRVNJR0hUX1RSQUNFX0lEX1JFU19U
T1BdOwo+IAo+IFByZXN1bWFibHkgeW91IGNhbid0IGhhdmUgdGhlIHJlZmNvdW50IGZvciBlYWNo
IElEIGJlIGhpZ2hlciB0aGFuIHRoZSAKPiBtYXggbnVtYmVyIG9mIFRQRE1zIGNvbm5lY3RlZD8g
SWYgeW91IG1ha2UgdGhlIGxvY2tlZCBhcmVhIGEgYml0IHdpZGVyIAo+IHlvdSBkb24ndCBuZWVk
IGF0b21pYyB0eXBlcyBhbmQgYWxzbyBzb2x2ZSB0aGUgYWJvdmUgcHJvYmxlbS4gU28geW91IAo+
IGNvdWxkIGRvIHU4LCBvciBERUNMQVJFX0JJVE1BUCgpIGFuZCBiaXRtYXBfcmVhZCgpIGV0YyB0
byByZWFkIDMgYml0IAo+IHZhbHVlcy4gT3IgaG93ZXZlciB3aWRlIGl0IG5lZWRzIHRvIGJlLgpU
aGUgb3JpZ2luYWwgcHVycG9zZSBvZiB1c2luZyBhdG9taWMgaGVyZSBpcyB0cnlpbmcgdG8gbmFy
cm93IHRoZSBsb2NrZWQgCmFyZWEuCgpJIHRoaW5rIHU4IGlzIG9rIGhlcmUuCnU4IHRyYWNlaWRf
cmVmY250W0FUSURfTUFYX05VTV1bQ09SRVNJR0hUX1RSQUNFX0lEX1JFU19UT1BdIHdpbGwgY29z
dCAKMjI0IGJ5dGVzLCBJIHRoaW5rIGl0J3MgYWNjZXB0YWJsZSBoZXJlLgoKVGhhbmtzLApKaWUK
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
