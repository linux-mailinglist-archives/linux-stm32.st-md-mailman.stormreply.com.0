Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D74A3796E
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 02:15:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 706A7C78F68;
	Mon, 17 Feb 2025 01:15:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BF62C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 01:15:23 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H03ATu003101;
 Mon, 17 Feb 2025 01:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QEWtjHoNU9NHeQt4i7TL5SjyB4mbjcKUSANV4HeIacY=; b=iyT66gWyEWb+iNmP
 W0DOspffSWoDU+ma/fpk4gHVCpQWKKqngH/NAJQdvnsZ9eVuKwRBmaA1uw9e27/l
 sptmnes6vjQejj9mb66SntVkNIR4FdlhbfpH1GqM4bsbBhyhgL7qMzGMS+5xw3gm
 KaxIQpKn6ClN3IUrNDn/oVfctl6HeOu/iFsKgoTAREhgw3b753z8GjICBaE0VVUB
 M7Ap0WOq2+mW4Tvibpi4kjOfcgxo7URn3eXDHt3eTWF21tPgIJrTQpL+qLFaUJ8A
 M2aAN4U5L4bO+zvG4bSkus78SEqD/wsWh8kkGykXdRbkzdAclKx0sVlDBgxSOWHj
 42sbTw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7v839a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2025 01:14:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51H1EwWC029430
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2025 01:14:58 GMT
Received: from [10.133.33.23] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Feb
 2025 17:14:54 -0800
Message-ID: <5e6edfce-ef2e-48d2-ad0c-0120606394fb@quicinc.com>
Date: Mon, 17 Feb 2025 09:14:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
 <20250207064213.2314482-5-quic_jiegan@quicinc.com>
 <a633f52c-81e8-4c0d-aca7-cc18360866eb@linaro.org>
 <4b521b49-7104-4f25-82cb-4f9be7b235f4@quicinc.com>
 <b61af324-7488-4a4f-9f9e-2ecb004fc4c7@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <b61af324-7488-4a4f-9f9e-2ecb004fc4c7@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ncpn-UUadyPb6vXM7jc6XjlAZmOQIyol
X-Proofpoint-GUID: ncpn-UUadyPb6vXM7jc6XjlAZmOQIyol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=908 priorityscore=1501
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170007
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
Subject: Re: [Linux-stm32] [PATCH v10 4/7] Coresight: Introduce a new struct
	coresight_path
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

CgpPbiAyLzE0LzIwMjUgNzowOSBQTSwgSmFtZXMgQ2xhcmsgd3JvdGU6Cj4gCj4gCj4gT24gMTQv
MDIvMjAyNSAxOjM0IGFtLCBKaWUgR2FuIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyLzE0LzIwMjUgMTI6
MDAgQU0sIEphbWVzIENsYXJrIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAwNy8wMi8yMDI1IDY6NDIg
YW0sIEppZSBHYW4gd3JvdGU6Cj4+Pj4gQWRkICdzdHJ1Y3QgY29yZXNpZ2h0X3BhdGgnIHRvIHN0
b3JlIHRoZSBkYXRhIHRoYXQgaXMgbmVlZGVkIGJ5Cj4+Pj4gY29yZXNpZ2h0X2VuYWJsZV9wYXRo
L2NvcmVzaWdodF9kaXNhYmxlX3BhdGguIFRoZSBzdHJ1Y3R1cmUgd2lsbCBiZQo+Pj4+IHRyYW5z
bWl0dGVkIHRvIGFueSByZXF1aXJlZCBkZXZpY2VzIHRvIGVuYWJsZSByZWxhdGVkIGZ1bmNhdGlv
bmFsaXRpZXMuCj4+Pj4KPj4+PiBUaGUgdHJhY2VfaWQgd2lsbCBiZSBhbGxvY2F0ZWQgYWZ0ZXIg
dGhlIHBhdGggaXMgYnVpbHQuIENvbnNlcXVlbnRseSwKPj4+PiBUaGUgRVRNM3ggYW5kIEVUTTR4
IGRldmljZXMgd2lsbCBkaXJlY3RseSByZWFkIHRoZSB0cmFjZV9pZCBmcm9tIHBhdGgKPj4+PiB3
aGljaCByZXN1bHQgaW4gZXRtX3JlYWRfYWxsb2NfdHJhY2VfaWQgYW5kIGV0bTRfcmVhZF9hbGxv
Y190cmFjZV9pZAo+Pj4+IGJlaW5nIGRlbGV0ZWQuCj4+Pj4KPj4+PiBDby1kZXZlbG9wZWQtYnk6
IEphbWVzIENsYXJrIDxqYW1lcy5jbGFya0BsaW5hcm8ub3JnPgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEphbWVzIENsYXJrIDxqYW1lcy5jbGFya0BsaW5hcm8ub3JnPgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEppZSBHYW4gPHF1aWNfamllZ2FuQHF1aWNpbmMuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgIGRyaXZl
cnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY29yZS5jwqAgfCAxMDYgKysrKysrKysr
KysrIAo+Pj4+ICstLS0tLQo+Pj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jl
c2lnaHQtZHVtbXkuYyB8wqDCoCA1ICstCj4+Pj4gwqAgLi4uL2h3dHJhY2luZy9jb3Jlc2lnaHQv
Y29yZXNpZ2h0LWV0bS1wZXJmLmPCoCB8wqAgMzAgKysrLS0KPj4+PiDCoCAuLi4vaHd0cmFjaW5n
L2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuaMKgIHzCoMKgIDIgKy0KPj4+PiDCoCBkcml2
ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bS5owqDCoCB8wqDCoCAxIC0KPj4+
PiDCoCAuLi4vY29yZXNpZ2h0L2NvcmVzaWdodC1ldG0zeC1jb3JlLmPCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDU0ICsrLS0tLS0tLQo+Pj4+IMKgIC4uLi9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bTR4
LWNvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTQgKystLS0tLS0tCj4+Pj4gwqAgZHJpdmVy
cy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1ldG00eC5oIHzCoMKgIDEgLQo+Pj4+IMKg
IGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtcHJpdi5owqAgfMKgIDEyICst
Cj4+Pj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1zdG0uY8KgwqAg
fMKgwqAgMyArLQo+Pj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQt
c3lzZnMuYyB8wqAgMTcgKystCj4+Pj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2Nv
cmVzaWdodC10cGRtLmPCoCB8wqDCoCAzICstCj4+Pj4gwqAgaW5jbHVkZS9saW51eC9jb3Jlc2ln
aHQuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEyICstCj4+
Pj4gwqAgMTMgZmlsZXMgY2hhbmdlZCwgMTQzIGluc2VydGlvbnMoKyksIDE1NyBkZWxldGlvbnMo
LSkKPj4+Pgo+Pj4gWy4uLl0KPj4+PiBAQCAtMzUyLDcgKzM1Miw3IEBAIHN0YXRpYyB2b2lkICpl
dG1fc2V0dXBfYXV4KHN0cnVjdCBwZXJmX2V2ZW50IAo+Pj4+ICpldmVudCwgdm9pZCAqKnBhZ2Vz
LAo+Pj4+IMKgwqDCoMKgwqDCoCAqIENQVXMsIHdlIGNhbiBoYW5kbGUgaXQgYW5kIGZhaWwgdGhl
IHNlc3Npb24uCj4+Pj4gwqDCoMKgwqDCoMKgICovCj4+Pj4gwqDCoMKgwqDCoCBmb3JfZWFjaF9j
cHUoY3B1LCBtYXNrKSB7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgKnBh
dGg7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBjb3Jlc2lnaHRfcGF0aCAqcGF0aDsKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGNvcmVzaWdodF9kZXZpY2UgKmNzZGV2Owo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBjc2RldiA9IHBlcl9jcHUoY3NkZXZfc3JjLCBjcHUpOwo+Pj4+
IEBAIC00MDUsMTUgKzQwNSwxNSBAQCBzdGF0aWMgdm9pZCAqZXRtX3NldHVwX2F1eChzdHJ1Y3Qg
cGVyZl9ldmVudCAKPj4+PiAqZXZlbnQsIHZvaWQgKipwYWdlcywKPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjcHVtYXNrX2NsZWFyX2NwdShjcHUsIG1hc2spOwo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
Pj4gLQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBlbnN1cmUgd2UgY2FuIGFsbG9jYXRlIGEg
dHJhY2UgSUQgZm9yIHRoaXMgQ1BVICovCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHRyYWNlX2lkID0g
Y29yZXNpZ2h0X3RyYWNlX2lkX2dldF9jcHVfaWRfbWFwKGNwdSwgJnNpbmstIAo+Pj4+ID5wZXJm
X3NpbmtfaWRfbWFwKTsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFJU19WQUxJRF9DU19UUkFD
RV9JRCh0cmFjZV9pZCkpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgdHJhY2VfaWQgPSBjb3Jlc2ln
aHRfcGF0aF9hc3NpZ25fdHJhY2VfaWQocGF0aCwgQ1NfTU9ERV9QRVJGKTsKPj4+PiArCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIC8qIENhbiBiZSAwIGFuZCB2YWxpZCwgRVRFIGRvZXNuJ3QgbmVlZCBh
biBJRCAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAodHJhY2VfaWQgPCAwKSB7Cj4+Pgo+Pj4g
Tm90IHN1cmUgd2h5IEkgd3JvdGUgaXQgbGlrZSB0aGlzLCBidXQgSSB0aGluayB3ZSBzaG91bGQg
bGVhdmUgaXQgYXMgCj4+PiBpdCB3YXMgd2l0aCAhSVNfVkFMSURfQ1NfVFJBQ0VfSUQoKS4gRXZl
biB3aXRoIEVURSBpdCBjYWxscyB0aGUgdHJhY2UgCj4+PiBJRCBhbGxvY2F0b3IsIHNvIG5vdGhp
bmcgaGFzIGNoYW5nZWQgaGVyZS4KPj4+Cj4+IFN1cmUsIFdpbGwgcmVzdG9yZS4gRm9yIEVURSBv
ciBFVE0sIHdlIGRvbnQgbmVlZCB0cmF2ZXJzZSB0aGUgcGF0aCwgCj4+IGp1c3QgZGlyZWN0bHkg
YWxsb2NhdGUgdGhlIHRyYWNlIGlkIGJhc2VkIG9uIGNwdSBpZC4KPj4KPj4gSmllCj4+Cj4+Cj4g
Cj4gU29ycnkgSSBtZWFudCB0byBvbmx5IGtlZXAgdGhlICFJU19WQUxJRF9DU19UUkFDRV9JRCgp
IGJpdC4gV2Ugc3RpbGwgCj4gbmVlZCB0byBjYWxsIHRoZSBuZXcgY29yZXNpZ2h0X3BhdGhfYXNz
aWduX3RyYWNlX2lkKCkgb3RoZXJ3aXNlIGl0IAo+IGRvZXNuJ3QgZ2V0IGFzc2lnbmVkIHRvIHRo
ZSBwYXRoLiBJIHNhdyB0aGF0IGdvdCByZW1vdmVkIGluIHYxMS4KPiAKPiAKU29ycnkgZm9yIHRo
ZSBtaXN1bmRlcnN0YW5kaW5nLCBJIHdhcyBmb2N1c2VkIG9uICJub3RoaW5nIGhhcyBjaGFuZ2Vk
IApoZXJlIiwgbG9sLgoKSSBnb3QgeW91ciBwb2ludCBoZXJlLgpTbyB0aGUgdXBkYXRlZCBjb2Rl
cyBzaG91bGQgYmU6Ci4uLgogICAgICAgICAgICAgICAgIC8qIGVuc3VyZSB3ZSBjYW4gYWxsb2Nh
dGUgYSB0cmFjZSBJRCBmb3IgdGhpcyBDUFUgKi8KICAgICAgICAgICAgICAgICB0cmFjZV9pZCA9
IGNvcmVzaWdodF9wYXRoX2Fzc2lnbl90cmFjZV9pZChwYXRoLCAKQ1NfTU9ERV9QRVJGKTsKICAg
ICAgICAgICAgICAgICBpZiAoIUlTX1ZBTElEX0NTX1RSQUNFX0lEKHRyYWNlX2lkKSkgewogICAg
ICAgICAgICAgICAgICAgICAgICAgY3B1bWFza19jbGVhcl9jcHUoY3B1LCBtYXNrKTsKICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvcmVzaWdodF9yZWxlYXNlX3BhdGgocGF0aCk7CiAgICAgICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgICAgICAgICB9Ci4uLgoKClRoYW5r
cywKSmllCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
