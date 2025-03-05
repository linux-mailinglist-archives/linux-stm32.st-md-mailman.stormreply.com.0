Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C3CA4F3DC
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 02:35:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DE82C78F6D;
	Wed,  5 Mar 2025 01:35:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F985CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 01:35:25 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NADJ9025365;
 Wed, 5 Mar 2025 01:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nLs+5SLZJ4qjajbg8dAv5Pp89mRUdsV9Rqw/s+IwB34=; b=mpNBfjRJri4AhMhC
 CMDTZzya5nC8OwRGnHt8JCnDV3zYqX67KpoeVRLDh29Kj9zjBPJAWaA+1aUA1EfZ
 hXhDY6j80xJDYxEqHWlDYbt0CbVh41rdednZ22U4pqPfXXscQsYiDPLMnvCiRH7U
 rVPzPpu2czdSgihoqVOpJ6euUOuPhik7fG0lGjaP9jMrxQkQsftty3a7+L+4+mJ4
 +7/esdeAA7M3EaeuEyttv8bwUn4/Y/8mMb5jURgWJ5p1pxl4o+YpkW4BRF+dPfr2
 3WbP2vxHtlcsk49s1RqhuV1giYkgBFWquMnw0y8gSJhwapQOvu9iknyR1jlmVHea
 Lru1RQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p933q6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Mar 2025 01:35:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5251Z3fZ020582
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Mar 2025 01:35:03 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 17:34:58 -0800
Message-ID: <bb2f4a5d-1a93-4637-908d-316516213061@quicinc.com>
Date: Wed, 5 Mar 2025 09:34:56 +0800
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
 <20250303032931.2500935-5-quic_jiegan@quicinc.com>
 <4e0959e7-cb66-41f1-b686-a274b6cbfd2e@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <4e0959e7-cb66-41f1-b686-a274b6cbfd2e@arm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Me2Wu4/f c=1 sm=1 tr=0 ts=67c7aa48 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8
 a=BNzsuDOjKBzrTUwNBxAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: O5Xb635ZTtY1EM7RJ_0yyvJwNWqU69Zj
X-Proofpoint-ORIG-GUID: O5Xb635ZTtY1EM7RJ_0yyvJwNWqU69Zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_01,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050010
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v15 04/10] Coresight: Introduce a new
 struct coresight_path
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

CgpPbiAzLzUvMjAyNSAxMjoxMCBBTSwgU3V6dWtpIEsgUG91bG9zZSB3cm90ZToKPiBPbiAwMy8w
My8yMDI1IDAzOjI5LCBKaWUgR2FuIHdyb3RlOgo+PiBJbnRyb2R1Y2UgYSBuZXcgc3RyY3V0dXJl
LCAnc3RydWN0IGNvcmVzaWdodF9wYXRoJywgdG8gc3RvcmUgdGhlIGRhdGEgCj4+IHRoYXQKPj4g
dXRpbGl6ZWQgYnkgdGhlIGRldmljZXMgaW4gdGhlIHBhdGguIFRoZSBjb3Jlc2lnaHRfcGF0aCB3
aWxsIGJlIGJ1aWx0LyAKPj4gcmVsZWFzZWQKPj4gYnkgY29yZXNpZ2h0X2J1aWxkX3BhdGgvY29y
ZXNpZ2h0X3JlbGVhc2VfcGF0aCBmdW5jdGlvbnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEppZSBH
YW4gPHF1aWNfamllZ2FuQHF1aWNpbmMuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9od3RyYWNp
bmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jb3JlLmPCoCB8IDE2ICsrKysrLS0tLS0KPj4gwqAgLi4u
L2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bS1wZXJmLmPCoCB8IDMwICsrKysrKysr
KystLS0tLS0tLS0KPj4gwqAgLi4uL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bS1w
ZXJmLmjCoCB8wqAgMiArLQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNp
Z2h0LXByaXYuaMKgIHzCoCA2ICsrLS0KPj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0
L2NvcmVzaWdodC1zeXNmcy5jIHwgMTIgKysrKy0tLS0KPj4gwqAgaW5jbHVkZS9saW51eC9jb3Jl
c2lnaHQuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArKysr
KysrCj4+IMKgIDYgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25z
KC0pCj4+Cj4gCj4gLi4uCj4gCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2NvcmVzaWdo
dC5oIGIvaW5jbHVkZS9saW51eC9jb3Jlc2lnaHQuaAo+PiBpbmRleCBjZTlhNWU3MWIyNjEuLjY3
Y2Y4YmRiZTVjMCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9jb3Jlc2lnaHQuaAo+PiAr
KysgYi9pbmNsdWRlL2xpbnV4L2NvcmVzaWdodC5oCj4+IEBAIC0zMjksNiArMzI5LDE2IEBAIHN0
YXRpYyBzdHJ1Y3QgY29yZXNpZ2h0X2Rldl9saXN0ICh2YXIpID0gCj4+IHvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXAo+PiDCoCAjZGVmaW5lIHRvX2NvcmVzaWdodF9kZXZpY2UoZCkg
Y29udGFpbmVyX29mKGQsIHN0cnVjdCAKPj4gY29yZXNpZ2h0X2RldmljZSwgZGV2KQo+PiArLyoq
Cj4+ICsgKiBzdHJ1Y3QgY29yZXNpZ2h0X3BhdGggLSBkYXRhIG5lZWRlZCBieSBlbmFibGUvZGlz
YWJsZSBwYXRoCj4+ICsgKiBAcGF0aDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXRoIGZy
b20gc291cmNlIHRvIHNpbmsuCj4gCj4gVGhpcyBkb2Vzbid0IG1hdGNoIHRoZSBhY3R1YWwgdmFy
aWFibGUgYmVsb3cuCgpIaSBTdXp1a2ksCgpWZXJ5IHNvcnJ5IGZvciB0aGUgbWlzdGFrZS4gSSBz
aG91bGQgc3BvdCBpdCBpbiBhZHZhbmNlLiBJIHdpbGwgdGFrZSAKY2FyZSBhbmQgZW5oYW5jZSB0
aGUgc2VsZi1jaGVja2luZyBwcm9jZXNzIGluIHRoZSBmdXR1cmUuCgpKaWUKCj4gCj4+ICsgKiBA
dHJhY2VfaWQ6wqDCoMKgwqDCoMKgwqDCoMKgIHRyYWNlX2lkIG9mIHRoZSB3aG9sZSBwYXRoLgo+
PiArICovCj4+ICtzdHJ1Y3QgY29yZXNpZ2h0X3BhdGggewo+PiArwqDCoMKgIHN0cnVjdCBsaXN0
X2hlYWTCoMKgwqAgcGF0aF9saXN0Owo+PiArwqDCoMKgIHU4wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB0cmFjZV9pZDsKPj4gK307Cj4+ICsKPj4gwqAgZW51bSBjc19tb2RlIHsKPj4gwqDCoMKgwqDC
oCBDU19NT0RFX0RJU0FCTEVELAo+PiDCoMKgwqDCoMKgIENTX01PREVfU1lTRlMsCj4gCj4gU3V6
dWtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
