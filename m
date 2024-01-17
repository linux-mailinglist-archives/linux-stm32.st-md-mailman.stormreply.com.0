Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 213B882FE9E
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jan 2024 02:59:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C22EDC6B457;
	Wed, 17 Jan 2024 01:59:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C05A7C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 01:59:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40H0vNFc003306; Wed, 17 Jan 2024 01:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=8ARN7Cx05ObbG1yQxAdeSnIi/eOGIcxsScGIi3qg6wc=; b=UR
 P1xjnlZqjuAmOxARvFuzxkSs+0jp2RQxR7FrMBFkhYEzKuSL9MQmdKstipkm3p5R
 Hfn7yLVZ0nnz42VNn5paiznMK+UfHJ2rBTAtA91uVKGDMHletpr8s1K0tDVEMxcK
 F3SBhP5qsVWQIgM+wxKP2v0sFtQpqHBZplKbWaQxXzDl1fpoOJXtwCkqKwSrNmGo
 qZGQsOqhjHl5zMOLd6gGSQ6GOfuliebbFa5wsWg1+m1TJ7kILNzGbhlF4No57jrd
 wP2onHgXiLIsBvGioGM6jj4jmdYCSq1cYugtgxja1zF5v4fwaN8kxGS55OQJw7Le
 8CG6kFmLoRknM9IYnDHw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vnnkeag9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 01:58:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40H1wm4J002526
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 01:58:48 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 16 Jan
 2024 17:58:43 -0800
Message-ID: <41429e0b-e7f5-40a3-8dff-ebf1d26c9aac@quicinc.com>
Date: Wed, 17 Jan 2024 09:58:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Leo Yan
 <leo.yan@linaro.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
References: <20240115164252.26510-1-quic_jinlmao@quicinc.com>
 <cef041b7-70ac-47c9-888c-696a0cec04d1@arm.com>
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <cef041b7-70ac-47c9-888c-696a0cec04d1@arm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cWZZEmT7fsuxPyYV6xQd7TRWZpKmHbVb
X-Proofpoint-ORIG-GUID: cWZZEmT7fsuxPyYV6xQd7TRWZpKmHbVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-16_14,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401170011
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] coresight: core: Add device name
	support
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

CgpPbiAxLzE2LzIwMjQgOTo0MyBQTSwgU3V6dWtpIEsgUG91bG9zZSB3cm90ZToKPiBPbiAxNS8w
MS8yMDI0IDE2OjQyLCBNYW8gSmlubG9uZyB3cm90ZToKPj4gV2l0aCBjdXJyZW50IGRlc2lnbiwg
dGhlIG5hbWUgb2YgdGhlIG5vbi1jcHUgYm91bmRlZCBjb3Jlc2lnaHQKPj4gY29tcG9uZW50IGlz
IHRoZSBkZXZpY2UgdHlwZSB3aXRoIHRoZSBudW1iZXIuIEFuZCB3aXRoICdscycgY29tbWFuZAo+
PiB3ZSBjYW4gZ2V0IHRoZSByZWdpc3RlciBhZGRyZXNzIG9mIHRoZSBjb21wb25lbnQuIEJ1dCBm
cm9tIHRoZXNlCj4+IGluZm9ybWF0aW9uLCB3ZSBjYW4ndCBrbm93IHdoYXQgdGhlIEhXIG9yIHN5
c3RlbSB0aGUgY29tcG9uZW50IGJlbG9uZ3MKPj4gdG8uIEFkZCBkZXZpY2UtbmFtZSBpbiBEVCB0
byBzdXBwb3J0IGl0Lgo+Pgo+PiBjdGlfc3lzMCAtPiAuLi8uLi8uLi9kZXZpY2VzL3BsYXRmb3Jt
L3NvY0AwLzEzOGYwMDAwLmN0aS9jdGlfc3lzMAo+PiBjdGlfc3lzMSAtPiAuLi8uLi8uLi9kZXZp
Y2VzL3BsYXRmb3JtL3NvY0AwLzEzOTAwMDAwLmN0aS9jdGlfc3lzMQo+PiB0cGRtMCAtPiAuLi8u
Li8uLi9kZXZpY2VzL3BsYXRmb3JtL3NvY0AwLzEwYjBkMDAwLnRwZG0vdHBkbTAKPj4gdHBkbTEg
LT4gLi4vLi4vLi4vZGV2aWNlcy9wbGF0Zm9ybS9zb2NAMC8xMGMyODAwMC50cGRtL3RwZG0xCj4+
IHRwZG0yIC0+IC4uLy4uLy4uL2RldmljZXMvcGxhdGZvcm0vc29jQDAvMTBjMjkwMDAudHBkbS90
cGRtMgo+IAo+IFBsZWFzZSBjb3VsZCB5b3UgcmViYXNlIHRoaXMgb24gZm9yLW5leHQvcXVldWUg
KHdoaWNoIGhhcyBhbGwgYmVsbHMgYW5kIAo+IHdoaXN0bGVzIGVuYWJsZWQgdG8gcmVwb3J0IFdh
cm5pbmdzKSwgZml4aW5nIHRoZSByZXBvcnRlZCBpc3N1ZSBieSAKPiBrZXJuZWwgdGVzdCByb2Jv
dCA/Cj4gCkkgd2lsbCByZWJhc2UgdGhlIHBhdGNoLgoKVGhhbmtzCkppbmxvbmcgTWFvCj4gU3V6
dWtpCj4gCj4gCj4+Cj4+IENoYW5nZSBzaW5jZSBWMToKPj4gMS4gQ2hhbmdlIGNvcmVzaWdodC1u
YW1lIHRvIGRldmljZSBuYW1lLgo+PiAyLiBBZGQgdGhlIGRldmljZS1uYW1lIGluIGNvcmVzaWdo
dCBkdCBiaW5kaW5ncy4KPj4KPj4gTWFvIEppbmxvbmcgKDIpOgo+PiDCoMKgIGNvcmVzaWdodDog
Y29yZTogQWRkIGRldmljZSBuYW1lIHN1cHBvcnQKPj4gwqDCoCBkdC1iaW5kaW5nczogYXJtOiBB
ZGQgZGV2aWNlLW5hbWUgaW4gdGhlIGNvcmVzaWdodCBjb21wb25lbnRzCj4+Cj4+IMKgIC4uLi9i
aW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC1jYXR1LnlhbWzCoMKgwqDCoMKgIHzCoCA1ICsrKwo+
PiDCoCAuLi4vYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtY3B1LWRlYnVnLnlhbWwgfMKgIDUg
KysrCj4+IMKgIC4uLi9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC1jdGkueWFtbMKgwqDCoMKg
wqDCoCB8wqAgNSArKysKPj4gwqAgLi4uL2FybS9hcm0sY29yZXNpZ2h0LWR1bW15LXNpbmsueWFt
bMKgwqDCoMKgwqDCoMKgwqAgfMKgIDUgKysrCj4+IMKgIC4uLi9hcm0vYXJtLGNvcmVzaWdodC1k
dW1teS1zb3VyY2UueWFtbMKgwqDCoMKgwqDCoCB8wqAgNSArKysKPj4gwqAgLi4uL2FybS9hcm0s
Y29yZXNpZ2h0LWR5bmFtaWMtZnVubmVsLnlhbWzCoMKgwqDCoCB8wqAgNSArKysKPj4gwqAgLi4u
L2FybS9hcm0sY29yZXNpZ2h0LWR5bmFtaWMtcmVwbGljYXRvci55YW1sIHzCoCA1ICsrKwo+PiDC
oCAuLi4vYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtZXRiMTAueWFtbMKgwqDCoMKgIHzCoCA1
ICsrKwo+PiDCoCAuLi4vYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtZXRtLnlhbWzCoMKgwqDC
oMKgwqAgfMKgIDUgKysrCj4+IMKgIC4uLi9hcm0vYXJtLGNvcmVzaWdodC1zdGF0aWMtZnVubmVs
LnlhbWzCoMKgwqDCoMKgIHzCoCA1ICsrKwo+PiDCoCAuLi4vYXJtL2FybSxjb3Jlc2lnaHQtc3Rh
dGljLXJlcGxpY2F0b3IueWFtbMKgIHzCoCA1ICsrKwo+PiDCoCAuLi4vYmluZGluZ3MvYXJtL2Fy
bSxjb3Jlc2lnaHQtc3RtLnlhbWzCoMKgwqDCoMKgwqAgfMKgIDUgKysrCj4+IMKgIC4uLi9iaW5k
aW5ncy9hcm0vYXJtLGNvcmVzaWdodC10bWMueWFtbMKgwqDCoMKgwqDCoCB8wqAgNSArKysKPj4g
wqAgLi4uL2JpbmRpbmdzL2FybS9hcm0sY29yZXNpZ2h0LXRwaXUueWFtbMKgwqDCoMKgwqAgfMKg
IDUgKysrCj4+IMKgIC4uLi9iaW5kaW5ncy9hcm0vcWNvbSxjb3Jlc2lnaHQtdHBkYS55YW1swqDC
oMKgwqAgfMKgIDUgKysrCj4+IMKgIC4uLi9iaW5kaW5ncy9hcm0vcWNvbSxjb3Jlc2lnaHQtdHBk
bS55YW1swqDCoMKgwqAgfMKgIDUgKysrCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdo
dC9jb3Jlc2lnaHQtY29yZS5jwqAgfCAzMyArKysrKysrKysrLS0tLS0tLS0tCj4+IMKgIC4uLi9o
d3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1wbGF0Zm9ybS5jwqAgfCAzMSArKysrKysrKysr
KysrKysrKwo+PiDCoCBpbmNsdWRlL2xpbnV4L2NvcmVzaWdodC5owqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+IMKgIDE5IGZpbGVzIGNoYW5nZWQsIDEz
MCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPj4KPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
