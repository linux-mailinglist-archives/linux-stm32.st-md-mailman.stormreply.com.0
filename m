Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 783EAA28509
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 08:45:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 266F8C78034;
	Wed,  5 Feb 2025 07:45:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDB1DC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 07:45:06 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51503gGF004701;
 Wed, 5 Feb 2025 07:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K/K//dAWi6x+8KI7nlUs8PdklqseAGDqAT8TYyRKscE=; b=DEw6oHGRj2+ImEKw
 G9YVbnetNysHtQTN3sWVZbM4lCNnJopdGrgLEmv544RdTaQWhF7avpahc8VDbsUa
 KVECXBzMireQs3tFb1T8K2+2Ay4jFqtcjq8DB2OAeucczgc7qzvB6C3lztZm+rGf
 5cGoHkHH9aIpoYiGcyfH1/sqgMiZ2xOpwsUhV9jj7yQgK5L3aIHV7YyBe+HtO9R6
 jHFWrWOMWXWR7epNqKvw+zL+s4o33GIa6QrDSoR576di3UUQH8c3xCcv6J08/sv5
 G74JUiWFDq6eyNbgqvLpSC3EqX1diZUgpAY5bw2cTCSl7Gu3UH+D0BNd2Q17kpAD
 QdVTtw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kw440tqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Feb 2025 07:44:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5157iooi005024
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Feb 2025 07:44:50 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 23:44:45 -0800
Message-ID: <d32b7b8f-fc23-4bef-bcd7-b519c43dc77e@quicinc.com>
Date: Wed, 5 Feb 2025 15:44:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Gan <quic_jiegan@quicinc.com>
To: James Clark <james.clark@linaro.org>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
 <33302e34-2e13-4bda-ae44-4c111167dde5@quicinc.com>
Content-Language: en-US
In-Reply-To: <33302e34-2e13-4bda-ae44-4c111167dde5@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gb3Cl6UXuJMToHYAiGtfMCqC5mwkq828
X-Proofpoint-ORIG-GUID: gb3Cl6UXuJMToHYAiGtfMCqC5mwkq828
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_03,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502050060
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 quic_jinlmao@quicinc.com, alexander.shishkin@linux.intel.com,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 quic_tingweiz@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mike.leach@linaro.org
Subject: Re: [Linux-stm32] [PATCH 0/3] coresight: Alloc trace ID after
	building the path
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

CgpPbiAyLzUvMjAyNSAxMjoxMyBQTSwgSmllIEdhbiB3cm90ZToKPiAKPiAKPiBPbiAyLzEvMjAy
NSAxMjozNiBBTSwgSmFtZXMgQ2xhcmsgd3JvdGU6Cj4+IFByb29mIG9mIGNvbmNlcHQgdG8gc3Vw
cG9ydCBDVENVIGRldmljZS4gQXBwbGllcyB0byBKaWUncyBwYXRjaHNldCBpbgo+PiB0aGUgcGFy
ZW50IGVtYWlsLiBJIHRoaW5rIHRoaXMgd291bGQgYmUgYSBnb29kIHNpbXBsaWZpY2F0aW9uLCBp
dAo+PiByZW1vdmVzIHNvbWUgY29kZSBhbmQgbWFrZXMgdGhpbmdzIGEgYml0IGNsZWFyZXIsIGFu
ZCB3b3JrcyBmb3IgYm90aCB0aGUKPj4gb2xkIGFuZCBuZXcgQ1RDVSByZXF1aXJlbWVudHMuIEl0
IHdpbGwgcmVxdWlyZSBtZXJnaW5nIGludG8gdGhlIHBhcmVudAo+PiBwYXRjaHNldCBzb21laG93
IGFzIGl0IHVuZG9lcyBzb21lIG9mIHRob3NlIGNoYW5nZXMuCj4gSGksIEphbWVzCj4gCj4gSSB0
ZXN0ZWQgdGhlIHBhdGNoIHNlcmllcyBhbmQgaXQgd29ya3Mgd2VsbC4KPiAKPiBDYW4gSSBjb21i
aW5lIHRoZXNlIHBhdGNoc2V0cyB3aXRoIG1pbmUgd2l0aCBjby1kZXZlbG9wZWQgdGFnPwo+IE9y
IGFyZSB5b3UgcHJlZmVyIHRvIHN1Ym1pdCB0aGVtIGluZGVwZW5kZW50bHk/Cj4gCj4gSSBiZWxp
ZXZlIGl0IHdvdWxkIGJlIGVhc2llciB0byByZWFkIGlmIHdlIGNvbWJpbmVkIHRoZSBjb2RlcyB0
b2dldGhlci4KCkhpLCBKYW1lcwoKUGxlYXNlIGlnbm9yZSBteSBxdWVzdGlvbnMgaGVyZS4gSSBt
aXNzZWQgdGhlIGxhc3QgcGFyYWdyYXBoIG9mIHRoZSAKZGVzY3JpcHRpb24uCgpJIG1lcmdlZCB5
b3VyIGNvZGVzIHdpdGggbWluZSBhbmQgYWRkZWQgY28tZGV2ZWxvcGVkIGFuZCBTT0IgdGFnLgoK
U29ycnkgZm9yIHRoZSBtaXN0YWtlLgoKVGhhbmtzLApKaWUKCj4gCj4+Cj4+IEphbWVzIENsYXJr
ICgzKToKPj4gwqDCoCBjb3Jlc2lnaHQ6IERvbid0IHNhdmUgaGFuZGxlIGluIHBhdGgKPj4gwqDC
oCBjb3Jlc2lnaHQ6IEV4cG9ydCBjb3Jlc2lnaHRfZ2V0X3NpbmsoKQo+PiDCoMKgIGNvcmVzaWdo
dDogQWxsb2MgdHJhY2UgSUQgYWZ0ZXIgYnVpbGRpbmcgdGhlIHBhdGgKPj4KPj4gwqAgZHJpdmVy
cy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmPCoCB8IDEwNyArKysrKysrKysr
KysrLS0tLS0KPj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1kdW1t
eS5jIHzCoMKgIDkgKy0KPj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdo
dC1ldGIxMC5jIHzCoMKgIDggKy0KPj4gwqAgLi4uL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNp
Z2h0LWV0bS1wZXJmLmPCoCB8wqAgMjAgKystLQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jl
c2lnaHQvY29yZXNpZ2h0LWV0bS5owqDCoCB8wqDCoCAxIC0KPj4gwqAgLi4uL2NvcmVzaWdodC9j
b3Jlc2lnaHQtZXRtM3gtY29yZS5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA4NCArKy0tLS0tLS0t
LS0tLQo+PiDCoCAuLi4vY29yZXNpZ2h0L2NvcmVzaWdodC1ldG0zeC1zeXNmcy5jwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCAzICstCj4+IMKgIC4uLi9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bTR4LWNv
cmUuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgODMgKystLS0tLS0tLS0tLS0KPj4gwqAgLi4uL2Nv
cmVzaWdodC9jb3Jlc2lnaHQtZXRtNHgtc3lzZnMuY8KgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNCAr
LQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bTR4LmggfMKg
wqAgMSAtCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtcHJpdi5o
wqAgfMKgIDE3ICstLQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0
LXN0bS5jwqDCoCB8wqDCoCA1ICstCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9j
b3Jlc2lnaHQtc3lzZnMuYyB8wqDCoCA2ICstCj4+IMKgIC4uLi9od3RyYWNpbmcvY29yZXNpZ2h0
L2NvcmVzaWdodC10bWMtZXRmLmPCoMKgIHzCoMKgIDkgKy0KPj4gwqAgLi4uL2h3dHJhY2luZy9j
b3Jlc2lnaHQvY29yZXNpZ2h0LXRtYy1ldHIuY8KgwqAgfMKgIDEzICstLQo+PiDCoCBkcml2ZXJz
L2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRtYy5owqDCoCB8wqDCoCAyICstCj4+IMKg
IGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtdHBkYS5jwqAgfMKgwqAgMyAr
LQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRwZG0uY8KgIHzC
oMKgIDMgKy0KPj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC10cGl1
LmPCoCB8wqDCoCAyICstCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2ln
aHQtdHJiZS5jwqAgfMKgwqAgNCArLQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQv
dWx0cmFzb2Mtc21iLmPCoMKgwqAgfMKgwqAgOCArLQo+PiDCoCBpbmNsdWRlL2xpbnV4L2NvcmVz
aWdodC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjUgKysr
LQo+PiDCoCAyMiBmaWxlcyBjaGFuZ2VkLCAxNTkgaW5zZXJ0aW9ucygrKSwgMjU4IGRlbGV0aW9u
cygtKQo+Pgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
