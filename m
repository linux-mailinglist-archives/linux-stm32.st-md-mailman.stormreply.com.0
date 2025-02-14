Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8FBA353B9
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 02:35:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2B27C78F7D;
	Fri, 14 Feb 2025 01:35:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE270C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 01:35:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DH0kde007790;
 Fri, 14 Feb 2025 01:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0u3fEONfKvAuvIGM4UDfbVuyo9+YhA7NYskf4eKIEGw=; b=StqYn5vGkivbyXUP
 nYds6W25WCsGmIo62reZdI3y2GJXRs9TQcQ7VNjl4etHRwi04QCk2lolppH/5/Kw
 rIk48jDGO28QHwaYah2GzknALYxMBhyiBl+InNYOXGhRQwb9Uykw4UE1SOVt9Mzh
 oUgT18t6BqbQpQuV0zNwi0mWfNJ1xqq9/XiCqNfN0qbyP7vzCD0e3He6zLKZSZjB
 incs4uZKUIrlmRAwdsPl++IGO0mUi2bnrx1Z5aAsK9YofJpOa5Uq1gVVesTjO7Qy
 DMe8TiFtszV2HWP+qyk+oIFqRDe+Ai2/ItY8a7CsouPofL6Kx3qZ6M3wJ4epOWQH
 dvQSlA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qwqjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 01:34:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E1YgIW030624
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 01:34:42 GMT
Received: from [10.133.33.20] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 17:34:37 -0800
Message-ID: <4b521b49-7104-4f25-82cb-4f9be7b235f4@quicinc.com>
Date: Fri, 14 Feb 2025 09:34:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
 <20250207064213.2314482-5-quic_jiegan@quicinc.com>
 <a633f52c-81e8-4c0d-aca7-cc18360866eb@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <a633f52c-81e8-4c0d-aca7-cc18360866eb@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: n12lx9MUXtTmuN9oW17JdwUUnfTKoQSB
X-Proofpoint-ORIG-GUID: n12lx9MUXtTmuN9oW17JdwUUnfTKoQSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=792 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140008
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

CgpPbiAyLzE0LzIwMjUgMTI6MDAgQU0sIEphbWVzIENsYXJrIHdyb3RlOgo+IAo+IAo+IE9uIDA3
LzAyLzIwMjUgNjo0MiBhbSwgSmllIEdhbiB3cm90ZToKPj4gQWRkICdzdHJ1Y3QgY29yZXNpZ2h0
X3BhdGgnIHRvIHN0b3JlIHRoZSBkYXRhIHRoYXQgaXMgbmVlZGVkIGJ5Cj4+IGNvcmVzaWdodF9l
bmFibGVfcGF0aC9jb3Jlc2lnaHRfZGlzYWJsZV9wYXRoLiBUaGUgc3RydWN0dXJlIHdpbGwgYmUK
Pj4gdHJhbnNtaXR0ZWQgdG8gYW55IHJlcXVpcmVkIGRldmljZXMgdG8gZW5hYmxlIHJlbGF0ZWQg
ZnVuY2F0aW9uYWxpdGllcy4KPj4KPj4gVGhlIHRyYWNlX2lkIHdpbGwgYmUgYWxsb2NhdGVkIGFm
dGVyIHRoZSBwYXRoIGlzIGJ1aWx0LiBDb25zZXF1ZW50bHksCj4+IFRoZSBFVE0zeCBhbmQgRVRN
NHggZGV2aWNlcyB3aWxsIGRpcmVjdGx5IHJlYWQgdGhlIHRyYWNlX2lkIGZyb20gcGF0aAo+PiB3
aGljaCByZXN1bHQgaW4gZXRtX3JlYWRfYWxsb2NfdHJhY2VfaWQgYW5kIGV0bTRfcmVhZF9hbGxv
Y190cmFjZV9pZAo+PiBiZWluZyBkZWxldGVkLgo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IEphbWVz
IENsYXJrIDxqYW1lcy5jbGFya0BsaW5hcm8ub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBD
bGFyayA8amFtZXMuY2xhcmtAbGluYXJvLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogSmllIEdhbiA8
cXVpY19qaWVnYW5AcXVpY2luYy5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9j
b3Jlc2lnaHQvY29yZXNpZ2h0LWNvcmUuY8KgIHwgMTA2ICsrKysrKysrKysrKystLS0tLQo+PiDC
oCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWR1bW15LmMgfMKgwqAgNSAr
LQo+PiDCoCAuLi4vaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuY8KgIHzC
oCAzMCArKystLQo+PiDCoCAuLi4vaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBl
cmYuaMKgIHzCoMKgIDIgKy0KPj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVz
aWdodC1ldG0uaMKgwqAgfMKgwqAgMSAtCj4+IMKgIC4uLi9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0
bTN4LWNvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTQgKystLS0tLS0tCj4+IMKgIC4uLi9j
b3Jlc2lnaHQvY29yZXNpZ2h0LWV0bTR4LWNvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTQg
KystLS0tLS0tCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRt
NHguaCB8wqDCoCAxIC0KPj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdo
dC1wcml2LmjCoCB8wqAgMTIgKy0KPj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2Nv
cmVzaWdodC1zdG0uY8KgwqAgfMKgwqAgMyArLQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jl
c2lnaHQvY29yZXNpZ2h0LXN5c2ZzLmMgfMKgIDE3ICsrLQo+PiDCoCBkcml2ZXJzL2h3dHJhY2lu
Zy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRwZG0uY8KgIHzCoMKgIDMgKy0KPj4gwqAgaW5jbHVkZS9s
aW51eC9jb3Jlc2lnaHQuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDEyICstCj4+IMKgIDEzIGZpbGVzIGNoYW5nZWQsIDE0MyBpbnNlcnRpb25zKCspLCAxNTcg
ZGVsZXRpb25zKC0pCj4+Cj4gWy4uLl0KPj4gQEAgLTM1Miw3ICszNTIsNyBAQCBzdGF0aWMgdm9p
ZCAqZXRtX3NldHVwX2F1eChzdHJ1Y3QgcGVyZl9ldmVudCAKPj4gKmV2ZW50LCB2b2lkICoqcGFn
ZXMsCj4+IMKgwqDCoMKgwqDCoCAqIENQVXMsIHdlIGNhbiBoYW5kbGUgaXQgYW5kIGZhaWwgdGhl
IHNlc3Npb24uCj4+IMKgwqDCoMKgwqDCoCAqLwo+PiDCoMKgwqDCoMKgIGZvcl9lYWNoX2NwdShj
cHUsIG1hc2spIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgKnBhdGg7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgY29yZXNpZ2h0X3BhdGggKnBhdGg7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgY29yZXNpZ2h0X2RldmljZSAqY3NkZXY7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBjc2RldiA9IHBlcl9jcHUoY3NkZXZfc3JjLCBjcHUpOwo+PiBAQCAtNDA1LDE1ICs0
MDUsMTUgQEAgc3RhdGljIHZvaWQgKmV0bV9zZXR1cF9hdXgoc3RydWN0IHBlcmZfZXZlbnQgCj4+
ICpldmVudCwgdm9pZCAqKnBhZ2VzLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjcHVt
YXNrX2NsZWFyX2NwdShjcHUsIG1hc2spOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b250aW51ZTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gLQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgLyogZW5zdXJlIHdlIGNhbiBhbGxvY2F0ZSBhIHRyYWNlIElEIGZvciB0aGlzIENQVSAqLwo+
PiAtwqDCoMKgwqDCoMKgwqAgdHJhY2VfaWQgPSBjb3Jlc2lnaHRfdHJhY2VfaWRfZ2V0X2NwdV9p
ZF9tYXAoY3B1LCAmc2luay0gCj4+ID5wZXJmX3NpbmtfaWRfbWFwKTsKPj4gLcKgwqDCoMKgwqDC
oMKgIGlmICghSVNfVkFMSURfQ1NfVFJBQ0VfSUQodHJhY2VfaWQpKSB7Cj4+ICvCoMKgwqDCoMKg
wqDCoCB0cmFjZV9pZCA9IGNvcmVzaWdodF9wYXRoX2Fzc2lnbl90cmFjZV9pZChwYXRoLCBDU19N
T0RFX1BFUkYpOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBDYW4gYmUgMCBhbmQgdmFsaWQs
IEVURSBkb2Vzbid0IG5lZWQgYW4gSUQgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIGlmICh0cmFjZV9p
ZCA8IDApIHsKPiAKPiBOb3Qgc3VyZSB3aHkgSSB3cm90ZSBpdCBsaWtlIHRoaXMsIGJ1dCBJIHRo
aW5rIHdlIHNob3VsZCBsZWF2ZSBpdCBhcyBpdCAKPiB3YXMgd2l0aCAhSVNfVkFMSURfQ1NfVFJB
Q0VfSUQoKS4gRXZlbiB3aXRoIEVURSBpdCBjYWxscyB0aGUgdHJhY2UgSUQgCj4gYWxsb2NhdG9y
LCBzbyBub3RoaW5nIGhhcyBjaGFuZ2VkIGhlcmUuCj4gClN1cmUsIFdpbGwgcmVzdG9yZS4gRm9y
IEVURSBvciBFVE0sIHdlIGRvbnQgbmVlZCB0cmF2ZXJzZSB0aGUgcGF0aCwganVzdCAKZGlyZWN0
bHkgYWxsb2NhdGUgdGhlIHRyYWNlIGlkIGJhc2VkIG9uIGNwdSBpZC4KCkppZQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
