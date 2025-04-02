Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C7A785EB
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Apr 2025 02:56:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EF4FC78F9A;
	Wed,  2 Apr 2025 00:56:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C62C4C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Apr 2025 00:56:13 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531C4eBX001410;
 Wed, 2 Apr 2025 00:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JQPdJka26Zt3f5JYNWnVHi8ewypPJUPCEoqjarXgSWc=; b=Z0OHfjDqasIQgEJP
 mVfMJYZxi7mwcE/g5i/J7Rb4GMWggUY5TAwJ+WiKnDenJY3kBMEJOigHtpdJ8gA7
 gK75On2CxZVc+zEvIXhWm/xlCW7a5+MdzZzcQJts52owp4t5xVyzPBkMf/SI2xBK
 J7e+Ox3hiImS9/bgthgkCu7samyyI6+84atIUx0Jo8PDlXgEmGB2DhT/iyjjSi4a
 Q+97vGhbrPIfMmskrCCkk3fOVs4fCw7E65Rbz9KBNvUR5KdCu8c06QKpFnB/WIQ2
 o0V5ZNt3SLvUozBCVU1lHASb0f3cM+ut/ryL0lTh83iq8G7dRcixAxk+AkFyEKsh
 uE2yEQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qhxtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Apr 2025 00:55:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5320twOu007562
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Apr 2025 00:55:58 GMT
Received: from [10.133.33.107] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Apr 2025
 17:55:54 -0700
Message-ID: <8a34b1ac-5681-4cd8-b960-a154d8678fa2@quicinc.com>
Date: Wed, 2 Apr 2025 08:55:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
 <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67ec8b1f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7CQSdrXTAAAA:8
 a=Jy6px9J2CyRB1KJ-eCEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: DzYqgaASLaIqlX-980ncbcyes28NL15m
X-Proofpoint-GUID: DzYqgaASLaIqlX-980ncbcyes28NL15m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_10,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020004
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 9/9] coresight: Consolidate clock
	enabling
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

CgpPbiA0LzEvMjAyNSAxMDo1OCBQTSwgSmFtZXMgQ2xhcmsgd3JvdGU6Cj4gCj4gCj4gT24gMjcv
MDMvMjAyNSAxMTozOCBhbSwgTGVvIFlhbiB3cm90ZToKPj4gQ29yZVNpZ2h0IGRyaXZlcnMgZW5h
YmxlIHBjbGsgYW5kIGF0Y2xrIGNvbmRpdGlvbmFsbHkuwqAgRm9yIGV4YW1wbGUsCj4+IHBjbGsg
aXMgb25seSBlbmFibGVkIGluIHRoZSBzdGF0aWMgcHJvYmUsIHdoaWxlIGF0Y2xrIGlzIGFuIG9w
dGlvbmFsCj4+IGNsb2NrIHRoYXQgaXQgaXMgZW5hYmxlZCBmb3IgYm90aCBkeW5hbWljIGFuZCBz
dGF0aWMgcHJvYmVzLCBpZiBpdCBpcwo+PiBwcmVzZW50LsKgIEluIHRoZSBjdXJyZW50IENvcmVT
aWdodCBkcml2ZXJzLCB0aGVzZSB0d28gY2xvY2tzIGFyZQo+PiBpbml0aWFsaXplZCBzZXBhcmF0
ZWx5LsKgIFRoaXMgY2F1c2VzIGNvbXBsZXggYW5kIGR1cGxpY2F0ZSBjb2Rlcy4KPj4KPj4gVGhp
cyBwYXRjaCBjb25zb2xpZGF0ZXMgY2xvY2sgZW5hYmxpbmcgaW50byBhIGNlbnRyYWwgcGxhY2Uu
wqAgSXQgcmVuYW1lcwo+PiBjb3Jlc2lnaHRfZ2V0X2VuYWJsZV9hcGJfcGNsaygpIHRvIGNvcmVz
aWdodF9nZXRfZW5hYmxlX2Nsb2NrcygpIGFuZAo+PiBlbmNhcHN1bGF0ZXMgY2xvY2sgaW5pdGlh
bGl6YXRpb24gbG9naWM6Cj4+Cj4+IMKgIC0gSWYgYSBjbG9jayBpcyBpbml0aWFsaXplZCBzdWNj
ZXNzZnVsbHksIGl0cyBjbG9jayBwb2ludGVyIGlzIGFzc2lnbmVkCj4+IMKgwqDCoCB0byB0aGUg
ZG91YmxlIHBvaW50ZXIgcGFzc2VkIGFzIGFuIGFyZ3VtZW50Lgo+PiDCoCAtIElmIHBjbGsgaXMg
c2tpcHBlZCBmb3IgYW4gQU1CQSBkZXZpY2UsIG9yIGlmIGF0Y2xrIGlzIG5vdCBmb3VuZCwgdGhl
Cj4+IMKgwqDCoCBjb3JyZXNwb25kaW5nIGRvdWJsZSBwb2ludGVyIGlzIHNldCB0byBOVUxMLsKg
IFRoZSBmdW5jdGlvbiByZXR1cm5zCj4+IMKgwqDCoCBTdWNjZXNzICgwKSB0byBndWlkZSBjYWxs
ZXJzIGNhbiBwcm9jZWVkIHdpdGggbm8gZXJyb3IuCj4+IMKgIC0gT3RoZXJ3aXNlLCBhbiBlcnJv
ciBudW1iZXIgaXMgcmV0dXJuZWQgZm9yIGZhaWx1cmVzLgo+Pgo+PiBDb3JlU2lnaHQgZHJpdmVy
cyBhcmUgcmVmaW5lZCBzbyB0aGF0IGNsb2NrcyBhcmUgaW5pdGlhbGl6ZWQgaW4gb25lIGdvLgo+
PiBBcyBhIHJlc3VsdCwgZHJpdmVyIGRhdGEgbm8gbG9uZ2VyIG5lZWRzIHRvIGJlIGFsbG9jYXRl
ZCBzZXBhcmF0ZWx5IGluCj4+IHRoZSBzdGF0aWMgYW5kIGR5bmFtaWMgcHJvYmVzLsKgIE1vdmVk
IHRoZSBhbGxvY2F0aW9uIGludG8gYSBsb3ctbGV2ZWwKPj4gZnVuY3Rpb24gdG8gYXZvaWQgY29k
ZSBkdXBsaWNhdGlvbi4KPj4KPj4gU3VnZ2VzdGVkLWJ5OiBTdXp1a2kgSyBQb3Vsb3NlIDxzdXp1
a2kucG91bG9zZUBhcm0uY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBMZW8gWWFuIDxsZW8ueWFuQGFy
bS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0
LWNhdHUuY8KgwqDCoMKgwqDCoCB8IDMwICsrKysrKysrKyAKPj4gKy0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3B1LWRlYnVn
LmPCoCB8IDI5ICsrKysrKysrKysgCj4+ICstLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgZHJpdmVy
cy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGN1LWNvcmUuY8KgIHzCoCA4ICsrKyst
LS0tCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtNHgtY29y
ZS5jIHwgMTEgKysrKy0tLS0tLS0KPj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2Nv
cmVzaWdodC1mdW5uZWwuY8KgwqDCoMKgIHwgMTEgKysrKy0tLS0tLS0KPj4gwqAgZHJpdmVycy9o
d3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1yZXBsaWNhdG9yLmMgfCAxMSArKysrLS0tLS0t
LQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXN0bS5jwqDCoMKg
wqDCoMKgwqAgfMKgIDkgKysrLS0tLS0tCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdo
dC9jb3Jlc2lnaHQtdG1jLWNvcmUuY8KgwqAgfCAzMCArKysrKysrKysgCj4+ICstLS0tLS0tLS0t
LS0tLS0tLS0tLQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRw
aXUuY8KgwqDCoMKgwqDCoCB8IDEwICsrKystLS0tLS0KPj4gwqAgaW5jbHVkZS9saW51eC9jb3Jl
c2lnaHQuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgMzggKysrKysrKysrKysrIAo+PiArKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+PiDCoCAx
MCBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspLCAxMDYgZGVsZXRpb25zKC0pCj4+Cj4g
Wy4uLl0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvY29yZXNpZ2h0LmggYi9pbmNsdWRl
L2xpbnV4L2NvcmVzaWdodC5oCj4+IGluZGV4IDI2ZWI0YTYxYjk5Mi4uY2YzZmJiYzAwNzZhIDEw
MDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2NvcmVzaWdodC5oCj4+ICsrKyBiL2luY2x1ZGUv
bGludXgvY29yZXNpZ2h0LmgKPj4gQEAgLTQ3MSwyNSArNDcxLDQxIEBAIHN0YXRpYyBpbmxpbmUg
Ym9vbCBpc19jb3Jlc2lnaHRfZGV2aWNlKHZvaWQgCj4+IF9faW9tZW0gKmJhc2UpCj4+IMKgIH0K
Pj4gwqAgLyoKPj4gLSAqIEF0dGVtcHQgdG8gZmluZCBhbmQgZW5hYmxlICJBUEIgY2xvY2siIGZv
ciB0aGUgZ2l2ZW4gZGV2aWNlCj4+ICsgKiBBdHRlbXB0IHRvIGZpbmQgYW5kIGVuYWJsZSBwcm9n
cmFtbWluZyBjbG9jayAocGNsaykgYW5kIHRyYWNlIAo+PiBjbG9jayAoYXRjbGspCj4+ICsgKiBm
b3IgdGhlIGdpdmVuIGRldmljZS4KPj4gwqDCoCAqCj4+IC0gKiBSZXR1cm5zOgo+PiArICogVGhl
IEFNQkEgYnVzIGRyaXZlciB3aWxsIGNvdmVyIHRoZSBwY2xrLCB0byBhdm9pZCBkdXBsaWNhdGUg
Cj4+IG9wZXJhdGlvbnMsCj4+ICsgKiBza2lwIHRvIGdldCBhbmQgZW5hYmxlIHRoZSBwY2xrIGZv
ciBhbiBBTUJBIGRldmljZS4KPj4gwqDCoCAqCj4+IC0gKiBjbGvCoMKgIC0gQ2xvY2sgaXMgZm91
bmQgYW5kIGVuYWJsZWQKPj4gLSAqIE5VTEzCoCAtIENsb2NrIGlzIG5vdCBuZWVkZWQgYXMgaXQg
aXMgbWFuYWdlZCBieSB0aGUgQU1CQSBidXMgZHJpdmVyCj4+IC0gKiBFUlJPUiAtIENsb2NrIGlz
IGZvdW5kIGJ1dCBmYWlsZWQgdG8gZW5hYmxlCj4+ICsgKiBhdGNsayBpcyBhbiBvcHRpb25hbCBj
bG9jaywgaXQgd2lsbCBiZSBvbmx5IGVuYWJsZWQgd2hlbiBpdCBpcyAKPj4gZXhpc3RlZC4KPj4g
KyAqIE90aGVyd2lzZSwgYSBOVUxMIHBvaW50ZXIgd2lsbCBiZSByZXR1cm5lZCB0byBjYWxsZXIu
Cj4+ICsgKgo+PiArICogUmV0dXJuczogJzAnIG9uIFN1Y2Nlc3M7IEVycm9yIGNvZGUgb3RoZXJ3
aXNlLgo+PiDCoMKgICovCj4+IC1zdGF0aWMgaW5saW5lIHN0cnVjdCBjbGsgKmNvcmVzaWdodF9n
ZXRfZW5hYmxlX2FwYl9wY2xrKHN0cnVjdCBkZXZpY2UgCj4+ICpkZXYpCj4+ICtzdGF0aWMgaW5s
aW5lIGludCBjb3Jlc2lnaHRfZ2V0X2VuYWJsZV9jbG9ja3Moc3RydWN0IGRldmljZSAqZGV2LAo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGNsayAqKnBjbGssCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgY2xrICoqYXRjbGspCj4gCj4gVGhpcyBmdW5jdGlvbiBoYXMg
Z3Jvd24gYSBiaXQgbm93LCBwcm9iYWJseSBiZXN0IHRvIHJlbW92ZSBpdCBmcm9tIHRoZSAKPiBo
ZWFkZXIgYW5kIGV4cG9ydCBpdCBpbnN0ZWFkLgo+IAo+PiDCoCB7Cj4+IC3CoMKgwqAgc3RydWN0
IGNsayAqcGNsayA9IE5VTEw7Cj4+ICvCoMKgwqAgV0FSTl9PTighcGNsayk7Cj4+IMKgwqDCoMKg
wqAgaWYgKCFkZXZfaXNfYW1iYShkZXYpKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBwY2xrID0gZGV2
bV9jbGtfZ2V0X2VuYWJsZWQoZGV2LCAiYXBiX3BjbGsiKTsKPj4gLcKgwqDCoMKgwqDCoMKgIGlm
IChJU19FUlIocGNsaykpCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjbGsgPSBkZXZtX2Ns
a19nZXRfZW5hYmxlZChkZXYsICJhcGIiKTsKPj4gK8KgwqDCoMKgwqDCoMKgICpwY2xrID0gZGV2
bV9jbGtfZ2V0X2VuYWJsZWQoZGV2LCAiYXBiX3BjbGsiKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChJU19FUlIoKnBjbGspKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqcGNsayA9IGRldm1f
Y2xrX2dldF9lbmFibGVkKGRldiwgImFwYiIpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VS
UigqcGNsaykpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKCpwY2xr
KTsKPj4gK8KgwqDCoCB9IGVsc2Ugewo+PiArwqDCoMKgwqDCoMKgwqAgLyogRG9uJ3QgZW5hYmxl
IHBjbGsgZm9yIGFuIEFNQkEgZGV2aWNlICovCj4+ICvCoMKgwqDCoMKgwqDCoCAqcGNsayA9IE5V
TEw7Cj4gCj4gTm93IHRoZSAiYXBiIiBjbG9jayB3b24ndCBiZSBlbmFibGVkIGZvciBhbWJhIGRl
dmljZXMuIEknbSBhc3N1bWluZyAKPiB0aGF0J3MgZmluZSBpZiB0aGUgY2xvY2sgd2FzIGFsd2F5
cyBjYWxsZWQgImFwYl9wY2xrIiBmb3IgdGhlbSwgYnV0IHRoZSAKPiBjb21taXQgdGhhdCBhZGRl
ZCB0aGUgbmV3IGNsb2NrIG5hbWUgZGlkbid0IHNwZWNpZnkgYW55IHNwZWNpYWwgY2FzaW5nIAo+
IGVpdGhlci4KPiAKPiBDYW4gd2UgaGF2ZSBhIGNvbW1lbnQgdGhhdCBzYXlzIGl0J3MgZGVsaWJl
cmF0ZT8gQnV0IHRoZSBtb3JlIEkgdGhpbmsgCj4gYWJvdXQgaXQgdGhlIG1vcmUgSSdtIGNvbmZ1
c2VkIHdoeSBDVENVIG5lZWRlZCBhIGRpZmZlcmVudCBjbG9jayBuYW1lIHRvIAo+IGJlIGRlZmlu
ZWQsIHdoZW4gYWxsIHRoZSBvdGhlciBDb3Jlc2lnaHQgZGV2aWNlcyB1c2UgImFwYl9wY2xrIi4K
CkhpIEphbWVzLAoKVGhlIG9yaWdpbmFsIGNsb2NrLW5hbWUgZm9yIENUQ1UgaXMgYXBiX3BjbGss
IGJ1dCB0aGUgZHQtYmluZGluZyAKbWFpbnRhaW5lciByZXF1ZXN0IG1lIHRvIGNoYW5nZSBpdCB0
byBhcGIsIHRoYXQncyB3aHkgdGhlIGNsb2NrIG5hbWUgaXMgCmRpZmZlcmVudCBmcm9tIG90aGVy
cy4KCkkgYW0gbm90IHdoeSB3ZSBuZWVkIGFwYiBpbnN0ZWFkIG9mIGFwYl9wY2xrIGluIGR0LWJp
bmRpbmcuIE1heWJlIHNvbWUgCnJ1bGVzIGhhdmUgY2hhbmdlZCBmb3IgZHQtYmluZGluZyByZXF1
aXJlbWVudC4KClRoYW5rcywKSmllCgo+IAo+PiDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoCByZXR1
cm4gcGNsazsKPj4gK8KgwqDCoCBpZiAoYXRjbGspIHsKPj4gK8KgwqDCoMKgwqDCoMKgICphdGNs
ayA9IGRldm1fY2xrX2dldF9vcHRpb25hbF9lbmFibGVkKGRldiwgImF0Y2xrIik7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAoSVNfRVJSKCphdGNsaykpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiBQVFJfRVJSKCphdGNsayk7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcmV0
dXJuIDA7Cj4+IMKgIH0KPj4gwqAgI2RlZmluZSBDT1JFU0lHSFRfUElEUm4oaSnCoMKgwqAgKDB4
RkUwICsgKChpKSAqIDQpKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
