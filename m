Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E203A7996E
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Apr 2025 02:30:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD76CC78F7F;
	Thu,  3 Apr 2025 00:30:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3860CC78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Apr 2025 00:30:30 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532KDUZH010705;
 Thu, 3 Apr 2025 00:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1XAoUUayoifpo55P//Cqrg5SgnVcz0v+hTrWQ+934mc=; b=caQgEfccM3lZ3dQ5
 WiUl/fv42O8PHC//5U9tl32ChayLC25HVaiDHx1bXh6byd6Mc4trdPSiUwu8pqN5
 2ntNosVtTR4AE/bhnj/s1Jxm7GBdAsrNAWUKPBgJ+IdkUigkJO5YADkxCInAdjb9
 D9bpP4NPO+gjftC5I/LBl4rL+HKPrJ6sBjYU/opeAj3ed2BnflpZ1RDyqgj4Yr3t
 GGAWDnvqJvIaR6l4+TyNOQeQTVzaRjP5TwCM+bvn4G1EY+a3ueo9KbfZtNgO2CNJ
 hVNlcD71/6cM4NWzEX/OehKzJw8pSuzwu0U8yFoGTxItjv8UVSafpxPbIm90Gyp1
 W27rQg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc2yrdwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Apr 2025 00:30:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5330TwxS016430
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 3 Apr 2025 00:29:58 GMT
Received: from [10.133.33.117] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Apr 2025
 17:29:55 -0700
Message-ID: <1a496341-cb74-4636-a3dd-9644dee4fc36@quicinc.com>
Date: Thu, 3 Apr 2025 08:29:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
 <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
 <8a34b1ac-5681-4cd8-b960-a154d8678fa2@quicinc.com>
 <20250402090147.GF115840@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <20250402090147.GF115840@e132581.arm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=AMoviu7M c=1 sm=1 tr=0 ts=67edd688 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=ffThkBl6m3zit5QCpSIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yfsHR0kEGPzQucPIHdfVV8GGndp5T9Xh
X-Proofpoint-ORIG-GUID: yfsHR0kEGPzQucPIHdfVV8GGndp5T9Xh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_11,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=834 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020155
Cc: Rob Herring <robh@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
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

CgpPbiA0LzIvMjAyNSA1OjAxIFBNLCBMZW8gWWFuIHdyb3RlOgo+IEhpIEppZSwKPiAKPiBbICsg
Um9iIF0KPiAKPiBPbiBXZWQsIEFwciAwMiwgMjAyNSBhdCAwODo1NTo1MUFNICswODAwLCBKaWUg
R2FuIHdyb3RlOgo+IAo+IFsuLi5dCj4gCj4+Pj4gIMKgIHsKPj4+PiAtwqDCoMKgIHN0cnVjdCBj
bGsgKnBjbGsgPSBOVUxMOwo+Pj4+ICvCoMKgwqAgV0FSTl9PTighcGNsayk7Cj4+Pj4gIMKgwqDC
oMKgwqAgaWYgKCFkZXZfaXNfYW1iYShkZXYpKSB7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHBjbGsg
PSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsICJhcGJfcGNsayIpOwo+Pj4+IC3CoMKgwqDCoMKg
wqDCoCBpZiAoSVNfRVJSKHBjbGspKQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjbGsg
PSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsICJhcGIiKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAg
KnBjbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsICJhcGJfcGNsayIpOwo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAoSVNfRVJSKCpwY2xrKSkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqcGNsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKGRldiwgImFwYiIpOwo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAoSVNfRVJSKCpwY2xrKSkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gUFRSX0VSUigqcGNsayk7Cj4+Pj4gK8KgwqDCoCB9IGVsc2Ugewo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCAvKiBEb24ndCBlbmFibGUgcGNsayBmb3IgYW4gQU1CQSBkZXZpY2UgKi8KPj4+PiAr
wqDCoMKgwqDCoMKgwqAgKnBjbGsgPSBOVUxMOwo+Pj4KPj4+IE5vdyB0aGUgImFwYiIgY2xvY2sg
d29uJ3QgYmUgZW5hYmxlZCBmb3IgYW1iYSBkZXZpY2VzLiBJJ20gYXNzdW1pbmcKPj4+IHRoYXQn
cyBmaW5lIGlmIHRoZSBjbG9jayB3YXMgYWx3YXlzIGNhbGxlZCAiYXBiX3BjbGsiIGZvciB0aGVt
LCBidXQgdGhlCj4+PiBjb21taXQgdGhhdCBhZGRlZCB0aGUgbmV3IGNsb2NrIG5hbWUgZGlkbid0
IHNwZWNpZnkgYW55IHNwZWNpYWwgY2FzaW5nCj4+PiBlaXRoZXIuCj4+Pgo+Pj4gQ2FuIHdlIGhh
dmUgYSBjb21tZW50IHRoYXQgc2F5cyBpdCdzIGRlbGliZXJhdGU/IEJ1dCB0aGUgbW9yZSBJIHRo
aW5rCj4+PiBhYm91dCBpdCB0aGUgbW9yZSBJJ20gY29uZnVzZWQgd2h5IENUQ1UgbmVlZGVkIGEg
ZGlmZmVyZW50IGNsb2NrIG5hbWUgdG8KPj4+IGJlIGRlZmluZWQsIHdoZW4gYWxsIHRoZSBvdGhl
ciBDb3Jlc2lnaHQgZGV2aWNlcyB1c2UgImFwYl9wY2xrIi4KPj4KPj4gSGkgSmFtZXMsCj4+Cj4+
IFRoZSBvcmlnaW5hbCBjbG9jay1uYW1lIGZvciBDVENVIGlzIGFwYl9wY2xrLCBidXQgdGhlIGR0
LWJpbmRpbmcgbWFpbnRhaW5lcgo+PiByZXF1ZXN0IG1lIHRvIGNoYW5nZSBpdCB0byBhcGIsIHRo
YXQncyB3aHkgdGhlIGNsb2NrIG5hbWUgaXMgZGlmZmVyZW50IGZyb20KPj4gb3RoZXJzLgo+Pgo+
PiBJIGFtIG5vdCB3aHkgd2UgbmVlZCBhcGIgaW5zdGVhZCBvZiBhcGJfcGNsayBpbiBkdC1iaW5k
aW5nLiBNYXliZSBzb21lIHJ1bGVzCj4+IGhhdmUgY2hhbmdlZCBmb3IgZHQtYmluZGluZyByZXF1
aXJlbWVudC4KPiAKPiBNeSBjb25jbHVzaW9uIGlzIHRoYXQgaWYgYSBkZXZpY2UgaXMgYW4gQXJt
IFByaW1lY2VsbCBwZXJpcGhlcmFsLCBpdAo+IHNob3VsZCB1c2UgdGhlIGNsb2NrIG5hbWUgImFw
Yl9wY2xrIiAoU2VlIHRoZSBEVCBiaW5kaW5nIGRvYyBbMV0pLgo+IAo+IENUQ1UgaXMgbm90IGFu
IEFybSBQcmltZWNlbGwgcGVyaXBoZXJhbCwgc28gaXQgZG9lcyBub3QgbmVlZCB0byBzdHJpY3Rs
eQo+IGZvbGxvdyB1cCB0aGUgY2xvY2sgbmFtaW5nIGZvciBQcmltZWNlbGwgcGVyaXBoZXJhbC4K
PiAKPiBJbiBBcm0gQ29yZVNpZ2h0IGZyYW1ld29yaywgZm9yIGNvZGUgY29uc2lzdGVuY3ksIEkg
d291bGQgc3VnZ2VzdAo+IHVzaW5nIHRoZSBjbG9jayBuYW1pbmcgImFwYl9wY2xrIiBmb3IgdGhl
IEFQQiBjbG9jayBmb3IgYSBuZXdseSBhZGRlZAo+IGRldmljZSB0aGF0IGV2ZW4gaXQgaXMgbm90
IGEgUHJpbWVjZWxsIHBlcmlwaGVyYWwuCj4gCj4gKFdlIGRvbid0IG5lZWQgdG8gbWFrZSBhbnkg
Y2hhbmdlIHRvIHRoZSBDVENVIGRyaXZlciwgYXMgd2UgbmVlZCB0bwo+IHJlbWFpbiBjb21wYXRp
YmxlIHdpdGggZXhpc3RlZCBEVEIgYmxvYnMpLgo+IAo+IENjJ2luZyBSb2IgaW4gY2FzZSBoZSBo
YXMgYW55IHN1Z2dlc3Rpb25zLgoKSGkgTGVvLAoKVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24u
IEkgYWdyZWUgd2l0aCB5b3UsIHdlIHNob3VsZCB1c2UgdGhlIAoiYXBiX3BjbGsiIGZvciB0aGUg
QVBCIGNsb2NrIGZvciBhIG5ld2x5IGFkZGVkIGRldmljZS4KClRoYW5rcywKSmllCgo+IAo+IFRo
YW5rcywKPiBMZW8KPiAKPiBbMV0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9wcmltZWNlbGwueWFtbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
