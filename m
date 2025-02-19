Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA040A3AE2C
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2025 01:59:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9440BC78F96;
	Wed, 19 Feb 2025 00:59:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF2D4CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2025 00:59:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIwUcD015154;
 Wed, 19 Feb 2025 00:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xKoQ4N3icAjL6uyR4WjIfq+9vwxL6ATc8yoGXz9I+cs=; b=dcUnoPartB5KrVk6
 hjKzOHxLlsHqI5w3MwACCr42zgVmLPkBsaqWBo/ZsS2UyI20mykwynmh+M6tlhXe
 Ku8gbZFzXGO2WNNYAqca7XnPGFXctVxRJ1/KbI1t0LceQH0u5uRenitS7Uiw5I4r
 wfgKks0twgQ3GycH+a1npjxs3BAkn1kOzRunvRpbtDo/PKQQ9fuvXI28ph06WK+d
 I9NXk0YvuR5QQrS8fxKpY7qx2vjFoatn5u+HxxGCqJCmfqhfma/CnGN1tBV4pvab
 TXGjdu40WBDoht2hU2SmxDOD1etHmBTsyxq9QOdqnf4+1vbfha6tonoY7jA6N7XR
 J2V0Vg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy48rae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 00:59:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51J0xa9p011640
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 00:59:36 GMT
Received: from [10.133.33.23] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 16:59:32 -0800
Message-ID: <d7680489-db7c-49d5-88ff-29e99a49f624@quicinc.com>
Date: Wed, 19 Feb 2025 08:59:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>, Suzuki K Poulose
 <suzuki.poulose@arm.com>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <0f6369fd-3236-40eb-bf8f-3c3d675137c9@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <0f6369fd-3236-40eb-bf8f-3c3d675137c9@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8DUg291zjXHPjDjqUv3-rA86fz8rv0r6
X-Proofpoint-ORIG-GUID: 8DUg291zjXHPjDjqUv3-rA86fz8rv0r6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_11,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190004
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jinlong Mao <quic_jinlmao@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v12 0/7] Coresight: Add Coresight TMC
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

CgpPbiAyLzE4LzIwMjUgNjowNSBQTSwgSmFtZXMgQ2xhcmsgd3JvdGU6Cj4gCj4gCj4gT24gMTcv
MDIvMjAyNSA5OjMwIGFtLCBKaWUgR2FuIHdyb3RlOgo+PiBGcm9tOiBKaWUgR2FuIDxqaWUuZ2Fu
QG9zcy5xdWFsY29tbS5jb20+Cj4+Cj4+IFRoZSBDb3Jlc2lnaHQgVE1DIENvbnRyb2wgVW5pdChD
VENVKSBkZXZpY2UgaG9zdHMgbWlzY2VsbGFuZW91cyAKPj4gY29uZmlndXJhdGlvbgo+PiByZWdp
c3RlcnMgdG8gY29udHJvbCB2YXJpb3VzIGZlYXR1cmVzIHJlbGF0ZWQgdG8gVE1DIEVUUiBkZXZp
Y2UuCj4+Cj4+IFRoZSBDVENVIGRldmljZSB3b3JrcyBhcyBhIGhlbHBlciBkZXZpY2UgcGh5c2lj
YWxseSBjb25uZWN0ZWQgdG8gdGhlIAo+PiBUTUMgRVRSIGRldmljZS4KPj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHxFVFIwfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8RVRSMXwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuIFzCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvIC4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuwqAgXMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgL8KgIC4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAuwqDCoCBcwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC/CoMKgIC4KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAuwqDCoMKgIFzCoMKgwqDCoMKgwqDCoMKgwqDCoCAvwqDCoMKg
IC4KPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4+IEVUUjBBVElEMC1FVFIwQVRJRDPCoMKgwqDCoCBDVENVwqDCoMKgIEVUUjFBVElEMC1FVFIx
QVRJRDMKPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4+IEVhY2ggRVRSIGhhcyBmb3VyIEFUSUQgcmVnaXN0ZXJzIHdpdGggMTI4IGJpdHMgbG9u
ZyBpbiB0b3RhbC4KPj4gZS5nLiBFVFIwQVRJRDAtRVRSMEFUSUQzIHJlZ2lzdGVycyBhcmUgdXNl
ZCBieSBFVFIwIGRldmljZS4KPj4KPj4gQmFzZWQgb24gdGhlIHRyYWNlIGlkIHdoaWNoIGlzIHBy
b2dyYW1lZCBpbiBDVENVIEFUSUQgcmVnaXN0ZXIgb2YKPj4gc3BlY2lmaWMgRVRSLCB0cmFjZSBk
YXRhIHdpdGggdGhhdCB0cmFjZSBpZCBjYW4gZ2V0IGludG8gRVRSJ3MgYnVmZmVyCj4+IHdoaWxl
IG90aGVyIHRyYWNlIGRhdGEgZ2V0cyBpZ25vcmVkLiBUaGUgbnVtYmVyIG9mIENUQ1UgQVRJRCBy
ZWdpc3RlcnMKPj4gZGVwZW5kcyBvbiB0aGUgbnVtYmVyIG9mIGRlZmluZWQgVE1DIEVUUiBkZXZp
Y2VzLiBGb3IgZXhhbXBsZSwgdHdvIFRNQwo+PiBFVFIgZGV2aWNlcyBuZWVkIGVpZ2h0IEFUSUQg
cmVnaXN0ZXJzLiBFVFIwIHdpdGggRVRSMEFUSUQwLUVUUjBBVElEMwo+PiBhbmQgRVRSMSB3aXRo
IEVUUjFBVElEMC1FVFJBVElEMy4KPj4KPj4gVGhlIHNpZ25pZmljYW50IGNoYWxsZW5nZSBpbiBl
bmFibGluZyB0aGUgZGF0YSBmaWx0ZXIgZnVuY3Rpb24gaXMgaG93Cj4+IHRvIGNvbGxlY3QgdGhl
IHRyYWNlIElEIG9mIHRoZSBzb3VyY2UgZGV2aWNlLiBUaGUgaW50cm9kdWN0aW9uIG9mCj4+IHRy
YWNlX2lkIGNhbGxiYWNrIGZ1bmN0aW9uIGFkZHJlc3NlcyB0aGlzIGNoYWxsZW5nZS4gVGhlIGNh
bGxiYWNrIAo+PiBmdW5jdGlvbgo+PiBjb2xsZWN0cyB0cmFjZSBJRCBvZiB0aGUgZGV2aWNlIGFu
ZCByZXR1cm4gaXQgYmFjay4gVGhlIHRyYWNlIElEIHdpbGwgYmUKPj4gc3RvcmVkIGluIHRoZSBz
dHJ1Y3R1cmUgY2FsbGVkIGNvcmVzaWdodF9wYXRoIGFuZCB0cmFuc21pdHRlZCB0byBoZWxwZXIK
Pj4gYW5kIHNpbmsgZGV2aWNlcy4KPj4KPj4gVGhlIGNvcmVzaWdodF9wYXRoIHN0cnVjdHVyZSBp
cyBjcmVhdGVkIHRvIGFkZHJlc3MgaG93IHRvIHRyYW5zbWl0Cj4+IHBhcmFtZXRlcnMgbmVlZHMg
YnkgY29yZXNpZ2h0X2VuYWJsZV9wYXRoL2NvcmVzaWdodF9kaXNiYWxlX3BhdGgKPj4gZnVuY3Rp
b25zLgo+Pgo+PiBIZXJlIGlzIHRoZSBkZWZpbml0aW9uIG9mIHRoZSBzdHJ1Y3QgY29yZXNpZ2h0
X3BhdGg6Cj4+IC8qKgo+PiDCoCAqIHN0cnVjdCBjb3Jlc2lnaHRfcGF0aCAtIGRhdGEgbmVlZGVk
IGJ5IGVuYWJsZS9kaXNhYmxlIHBhdGgKPj4gwqAgKiBAcGF0aDrCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHBhdGggZnJvbSBzb3VyY2UgdG8gc2luay4KPj4gwqAgKiBAdHJhY2VfaWQ6wqDC
oMKgwqDCoMKgwqDCoMKgwqAgdHJhY2VfaWQgb2YgdGhlIHdob2xlIHBhdGguCj4+IMKgICovCj4+
IHN0cnVjdCBjb3Jlc2lnaHRfcGF0aCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGxpc3Rf
aGVhZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqcGF0aDsKPj4gwqDCoMKgwqDCoMKg
wqDCoCB1OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdHJhY2VfaWQ7Cj4+IH07Cj4+Cj4+IFRoZSBhdGlkX29mZnNldCBtZW50aW9uZWQg
YmVmb3JlIGlzIHRoZSBvZmZzZXQgdG8gQVRJRCByZWdpc3RlciBpbiBDVENVCj4+IGRldmljZS4K
Pj4KPj4gRW5hYmxpbmcgdGhlIHNvdXJjZSBkZXZpY2Ugd2lsbCBjb25maWd1cmUgb25lIGJpdCBp
biB0aGUgQVRJRCByZWdpc3RlciAKPj4gYmFzZWQKPj4gb24gaXRzIHRyYWNlIElELgo+PiBEaXNh
YmxpbmcgdGhlIHNvdXJjZSBkZXZpY2VzIHdpbGwgcmVzZXQgdGhlIGJpdCBpbiB0aGUgQUlURCBy
ZWdpc3Rlcgo+PiBiYXNlZCBvbiBpdHMgdHJhY2UgSUQuCj4+Cj4+IFVzZWFnZToKPj4gRW5hYmxl
Ogo+PiBTVE0gZGV2aWNlIHdpdGggdHJhY2UgSUQgNSBhbmQgRVRSMCBpcyBhY3RpdmF0ZWQuCj4+
IEJpdG1hcCBiZWZvcmUgdGhlIGVuYWJsZW1lbnQ6Cj4+IEVUUjBBVElEMDoKPj4gMzEuLi4uLi4u
Li4uLi4uLi4uLi41NDMyMTAKPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMC4uLjAKPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4KPj4g
Qml0bWFwIGFmdGVyIHRoZSBlbmFibGVtZW50Ogo+PiAzMS4uLi4uLi4uLi4uLi4uLi4uLjU0MzIx
MAo+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiAwMDAwMDAwMDAwMDAwLi4uMDAwMDEw
MDAwMAo+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PQo+Pgo+PiBUaGUgYml0IDUgb2YgdGhl
IEVUUjBBVElEMCByZWdpc3RlciBpcyBjb25maWd1cmVkIHRvIDEgd2hlbiBlbmFibGluZyB0aGUK
Pj4gU1RNIGRldmljZS4KPj4KPj4gRGlzYWJsZToKPj4gU1RNIGRldmljZSB3aXRoIHRyYWNlIElE
IDUgYW5kIEVUUjAgaXMgYWN0aXZhdGVkLgo+PiBCaXRtYXAgYmVmb3JlIHRoZSBkaXNhYmxlbWVu
dDoKPj4gRVRSMEFUSUQwOgo+PiAzMS4uLi4uLi4uLi4uLi4uLi42NTQzMjEwCj4+ID09PT09PT09
PT09PT09PT09PT09PT09PT0KPj4gMDAwMDAwMDAwMDEwMTExLi4uMDEwMDAwMAo+PiA9PT09PT09
PT09PT09PT09PT09PT09PT09Cj4+Cj4+IEJpdG1hcCBhZnRlciB0aGUgZGlzYWJsZW1lbnQKPj4g
RVRSMEFUSUQwOgo+PiAzMS4uLi4uLi4uLi4uLi4uLi42NTQzMjEwCj4+ID09PT09PT09PT09PT09
PT09PT09PT09PT0KPj4gMDAwMDAwMDAwMDEwMTExLi4uMDAwMDAwMAo+PiA9PT09PT09PT09PT09
PT09PT09PT09PT09Cj4+Cj4+IFRoZSBiaXQgNSBvZiB0aGUgRVRSMEFUSUQwIHJlZ2lzdGVyIGlz
IHJlc2V0IHRvIDAgd2hlbiBkaXNhYmxpbmcgdGhlIFNUTQo+PiBkZXZpY2UuCj4+Cj4+IFNpbmNl
cmUgdGhhbmtzIHRvIEphbWVzIENsYXJrIGZvciBwcm92aWRpbmcgYW4gZXhjZWxsZW50IGlkZWEg
dG8gaGFuZGxlCj4+IHRoZSB0cmFjZV9pZCBvZiB0aGUgcGF0aC4KPj4KPj4gQ2hhbmdlcyBpbiBW
MTI6Cj4+IDEuIFVwZGF0ZSB0aGUgbWV0aG9kIGZvciBhbGxvY2F0aW5nIHRyYWNlX2lkIGZvciBw
ZXJmIG1vZGUuCj4+IExpbmsgdG8gVjExIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
YXJtLSAKPj4gbXNtLzIwMjUwMjE0MDI0MDIxLjI0OTY1NS0xLXF1aWNfamllZ2FuQHF1aWNpbmMu
Y29tLwo+Pgo+IAo+IEkgdGVzdGVkIHRoZSBsYXRlc3QgY2hhbmdlLCBsb29rcyBnb29kIHRvIG1l
Lgo+IApIaSBKYW1lcywKClRoYW5rcyBmb3IgdGVzdGluZy4KCkppZQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
