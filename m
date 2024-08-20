Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD90957E44
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 08:37:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A74A6C6DD6B;
	Tue, 20 Aug 2024 06:37:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8799ACFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 06:36:53 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JMKo56021551;
 Tue, 20 Aug 2024 06:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YQb4LmIC0mA5qtNW2MIk3oGIKgb4a2IQ7WObeGXruKE=; b=JpoLJOE2DGRWC1q2
 Dj50b7AbfeB4yd1oSFYnV3O8rKVg+/DBGzbNa/NXfVvs6f5rZf01jwlSBq1ioddq
 H6BgkDMRqGT01ZR3jeJ+aDhso7MLUvqJUbqEg85zNrw9OsL6gH8cLtseCddjAiok
 J3h3Ras0PVS/xLt6IEbmnuxeGmx6PPaop0/f1QrK8QVIBz7dXwnsPbEKoXwiGvA0
 dau9+HVlqjWiSItddbcrq9xL6WRIcpBxhq3HpGnVSCmMRsXFzhcpL8bI3slNzQSY
 qqj54VLbkCErxHKyqp6bM0N0vqj57YuHyRxlPp/5/yNOHIinNcJPi/vWSuRZEc2I
 s9x0qg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412n586k9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2024 06:36:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K6aYBr019004
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2024 06:36:34 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 23:36:28 -0700
Date: Tue, 20 Aug 2024 14:36:24 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <ZsQ5aMkXnyX9mumz@jiegan-gv.ap.qualcomm.com>
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
 <20240818142834.GA27754-robh@kernel.org>
 <ZsKkm/Pz0GYtH2Gl@jiegan-gv.ap.qualcomm.com>
 <9d9704ed-6ef8-4920-9874-29e0a815e2ba@kernel.org>
 <ZsMHnKKvOey4SA1O@jiegan-gv.ap.qualcomm.com>
 <d117e157-f2e2-4e17-bbe4-b84001eae1bb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d117e157-f2e2-4e17-bbe4-b84001eae1bb@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MaPs9rNuKB5n6QBqYbE1sVslx4673JUH
X-Proofpoint-ORIG-GUID: MaPs9rNuKB5n6QBqYbE1sVslx4673JUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200048
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Song Chai <quic_songchai@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-kernel@lists.infradead.org,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-msm@vger.kernel.org, James Clark <james.clark@linaro.org>, Tao
 Zhang <quic_taozha@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>
Subject: Re: [Linux-stm32] [PATCH v3 3/5] dt-bindings: arm: Add Coresight
 TMC Control Unit hardware
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gTW9uLCBBdWcgMTksIDIwMjQgYXQgMTE6NTE6NDFBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBPbiAxOS8wOC8yMDI0IDEwOjUxLCBKaWVHYW4gd3JvdGU6Cj4gPiBPbiBN
b24sIEF1ZyAxOSwgMjAyNCBhdCAwODoyNTozM0FNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOgo+ID4+IE9uIDE5LzA4LzIwMjQgMDM6NDksIEppZUdhbiB3cm90ZToKPiA+Pj4gT24g
U3VuLCBBdWcgMTgsIDIwMjQgYXQgMDg6Mjg6MzRBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6
Cj4gPj4+PiBPbiBNb24sIEF1ZyAxMiwgMjAyNCBhdCAxMDo0MTozOUFNICswODAwLCBKaWUgR2Fu
IHdyb3RlOgo+ID4+Pj4+IEFkZCBiaW5kaW5nIGZpbGUgdG8gc3BlY2lmeSBob3cgdG8gZGVmaW5l
IGEgQ29yZXNpZ2h0IFRNQwo+ID4+Pj4+IENvbnRyb2wgVW5pdCBkZXZpY2UgaW4gZGV2aWNlIHRy
ZWUuCj4gPj4+Pj4KPiA+Pj4+PiBJdCBpcyByZXNwb25zaWJsZSBmb3IgY29udHJvbGxpbmcgdGhl
IGRhdGEgZmlsdGVyIGZ1bmN0aW9uCj4gPj4+Pj4gYmFzZWQgb24gdGhlIHNvdXJjZSBkZXZpY2Un
cyBUcmFjZSBJRCBmb3IgVE1DIEVUUiBkZXZpY2UuCj4gPj4+Pj4gVGhlIHRyYWNlIGRhdGEgd2l0
aCB0aGF0IFRyYWNlIGlkIGNhbiBnZXQgaW50byBFVFIncyBidWZmZXIKPiA+Pj4+PiB3aGlsZSBv
dGhlciB0cmFjZSBkYXRhIGdldHMgaWdub3JlZC4KPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEppZSBHYW4gPHF1aWNfamllZ2FuQHF1aWNpbmMuY29tPgo+ID4+Pj4+IC0tLQo+ID4+Pj4+
ICAuLi4vYmluZGluZ3MvYXJtL3Fjb20sY29yZXNpZ2h0LWN0Y3UueWFtbCAgICAgfCA3OSArKysr
KysrKysrKysrKysrKysrCj4gPj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCsp
Cj4gPj4+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL3Fjb20sY29yZXNpZ2h0LWN0Y3UueWFtbAo+ID4+Pj4+Cj4gPj4+Pj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbSxjb3Jlc2ln
aHQtY3RjdS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29t
LGNvcmVzaWdodC1jdGN1LnlhbWwKPiA+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+Pj4+
IGluZGV4IDAwMDAwMDAwMDAwMC4uN2E5NTgwMDA3OTQyCj4gPj4+Pj4gLS0tIC9kZXYvbnVsbAo+
ID4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbSxj
b3Jlc2lnaHQtY3RjdS55YW1sCj4gPj4+Pj4gQEAgLTAsMCArMSw3OSBAQAo+ID4+Pj4+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+
Pj4+PiArJVlBTUwgMS4yCj4gPj4+Pj4gKy0tLQo+ID4+Pj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9zY2hlbWFzL2FybS9xY29tLGNvcmVzaWdodC1jdGN1LnlhbWwjCj4gPj4+Pj4gKyRz
Y2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4+
Pj4+ICsKPiA+Pj4+PiArdGl0bGU6IENvcmVTaWdodCBUTUMgQ29udHJvbCBVbml0Cj4gPj4+Pj4g
Kwo+ID4+Pj4+ICttYWludGFpbmVyczoKPiA+Pj4+PiArICAtIFl1YW5mYW5nIFpoYW5nIDxxdWlj
X3l1YW5mYW5nQHF1aWNpbmMuY29tPgo+ID4+Pj4+ICsgIC0gTWFvIEppbmxvbmcgPHF1aWNfamlu
bG1hb0BxdWljaW5jLmNvbT4KPiA+Pj4+PiArICAtIEppZSBHYW4gPHF1aWNfamllZ2FuQHF1aWNp
bmMuY29tPgo+ID4+Pj4+ICsKPiA+Pj4+PiArZGVzY3JpcHRpb246Cj4gPj4+Pj4gKyAgVGhlIENv
cmVzaWdodCBUTUMgQ29udHJvbCB1bml0IGNvbnRyb2xzIHZhcmlvdXMgQ29yZXNpZ2h0IGJlaGF2
aW9ycy4KPiA+Pj4+PiArICBJdCB3b3JrcyBhcyBhIGhlbHBlciBkZXZpY2Ugd2hlbiBjb25uZWN0
ZWQgdG8gVE1DIEVUUiBkZXZpY2UuCj4gPj4+Pj4gKyAgSXQgaXMgcmVzcG9uc2libGUgZm9yIGNv
bnRyb2xsaW5nIHRoZSBkYXRhIGZpbHRlciBmdW5jdGlvbiBiYXNlZCBvbgo+ID4+Pj4+ICsgIHRo
ZSBzb3VyY2UgZGV2aWNlJ3MgVHJhY2UgSUQgZm9yIFRNQyBFVFIgZGV2aWNlLiBUaGUgdHJhY2Ug
ZGF0YSB3aXRoCj4gPj4+Pj4gKyAgdGhhdCBUcmFjZSBpZCBjYW4gZ2V0IGludG8gRVRSJ3MgYnVm
ZmVyIHdoaWxlIG90aGVyIHRyYWNlIGRhdGEgZ2V0cwo+ID4+Pj4+ICsgIGlnbm9yZWQuCj4gPj4+
Pgo+ID4+Pj4gTm93aGVyZSBpcyBUTUMgZGVmaW5lZC4KPiA+Pj4gVGhlIENvcmVzaWdodCBUTUMg
Y29udHJvbCB1bml0KENUQ1UpIGNvbm5lY3RlZCB0byBDb3Jlc2lnaHQgVE1DIGRldmljZSB2aWEg
cmVwbGljYXRvciBhbmQKPiA+Pj4gd29ya3MgYXMgYSBoZWxwZXIgZGV2aWNlIHRvIFRNQyBkZXZp
Y2UuCj4gPj4KPiA+PiBEaWQgeW91IHVuZGVyc3RhbmQgdGhlIGZlZWRiYWNrIG9yIGp1c3QgcmVz
cG9uZGluZyB3aXRoIHdoYXRldmVyIHRvIGdldAo+ID4+IHJpZCBvZiByZXZpZXdlcnM/Cj4gPiAK
PiA+IFNvcnJ5IGZvciB0aGUgaW5zdWZmaWNpZW50IGNsYXJpdHkgaW4gbXkgcmVzcG9uc2UsIEkg
YW0ganVzdCBtaXN1bmRlcnN0b29kIHRoZSBmZWVkYmFjayBhbmQgdHJ5Cj4gPiB0byBleHBsYWlu
IHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiBUTUMgYW5kIENUQ1UgZGV2aWNlLgo+ID4gCj4gPiBJ
IHdpbGwgYWRkIHRoZSBUTUMgZGVzY3JpcHRpb24gdG8gZXhwbGFpbiB3aGF0IFRNQyBpcyBhcyBz
aG93biBiZWxvdzoKPiA+IFRoZSBUcmFjZSBNZW1vcnkgQ29udHJvbGxlcihUTUMpIGlzIHVzZWQg
Zm9yIEVtYmVkZGVkIFRyYWNlIEJ1ZmZlcihFVEIpLCBFbWJlZGRlZCBUcmFjZSBGSUZPKEVURikK
PiA+IGFuZCBFbWJlZGRlZCBUcmFjZSBSb3V0ZXIoRVRSKSBjb25maWd1cmF0aW9ucy4gVGhlIGNv
bmZpZ3VyYXRpb24gbW9kZSAoRVRCLCBFVEYsIEVUUikgaXMKPiA+IGRpc2NvdmVyZWQgYXQgYm9v
dCB0aW1lIHdoZW4gdGhlIGRldmljZSBpcyBwcm9iZWQuCj4gCj4gVGhhbmtzLgo+IAo+ID4gCj4g
Pj4KPiA+Pj4KPiA+Pj4gVGhlIGluLXBvcnRzIGxpc3RlZCBiZWxvdyBpbGx1c3RyYXRlIHRoZWly
IGNvbm5lY3Rpb24gdG8gVE1DIGRldmljZXMuCj4gPj4+Cj4gPj4+Pgo+ID4+Pj4+ICsKPiA+Pj4+
PiArcHJvcGVydGllczoKPiA+Pj4+PiArICBjb21wYXRpYmxlOgo+ID4+Pj4+ICsgICAgZW51bToK
PiA+Pj4+PiArICAgICAgLSBxY29tLHNhODc3NXAtY3RjdQo+ID4+Pj4+ICsKPiA+Pj4+PiArICBy
ZWc6Cj4gPj4+Pj4gKyAgICBtYXhJdGVtczogMQo+ID4+Pj4+ICsKPiA+Pj4+PiArICBjbG9ja3M6
Cj4gPj4+Pj4gKyAgICBtYXhJdGVtczogMQo+ID4+Pj4+ICsKPiA+Pj4+PiArICBjbG9jay1uYW1l
czoKPiA+Pj4+PiArICAgIGl0ZW1zOgo+ID4+Pj4+ICsgICAgICAtIGNvbnN0OiBhcGIKPiA+Pj4+
PiArCj4gPj4+Pj4gKyAgaW4tcG9ydHM6Cj4gPj4+Pgo+ID4+Pj4gVXNlICdwb3J0cycgdW5sZXNz
IHlvdSBoYXZlIGJvdGggaW4gYW5kIG91dCBwb3J0cy4KPiA+Pj4gVGhlIOKAmGluLXBvcnRz4oCZ
IGFuZCDigJhvdXQtcG9ydHPigJkgcHJvcGVydGllcyB3aWxsIGJlIHBhcnNlZCBieSDigJhvZl9j
b3Jlc2lnaHRfZ2V0X3BvcnRfcGFyZW504oCZCj4gPj4+IGFuZCB0aGVpciByZWxhdGlvbnNoaXBz
IHRvIG90aGVyIGRldmljZXMgd2lsbCBiZSBzdG9yZWQgaW4gdGhlIGNvcmVzaWdodF9wbGF0Zm9y
bV9kYXRhIHN0cnVjdHVyZS4KPiA+Pj4KPiA+Pj4gZm9yIGV4YW1wbGU6Cj4gPj4+IHN0cnVjdCBj
b3Jlc2lnaHRfcGxhdGZvcm1fZGF0YSB7Cj4gPj4+IAlpbnQgbnJfaW5jb25uczsKPiA+Pj4gCWlu
dCBucl9vdXRjb25uczsKPiA+Pj4gCXN0cnVjdCBjb3Jlc2lnaHRfY29ubmVjdGlvbiAqKm91dF9j
b25uczsKPiA+Pj4gCXN0cnVjdCBjb3Jlc2lnaHRfY29ubmVjdGlvbiAqKmluX2Nvbm5zOwo+ID4+
PiB9Owo+ID4+Pgo+ID4+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMS1y
YzQvc291cmNlL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtcGxhdGZvcm0u
YyNMMTQ3Cj4gPj4KPiA+PiBhbmQ/IElmIHlvdSByZXNwb25kIHdpdGggc29tZSB1bnJlbGF0ZWQg
YXJndW1lbnQsIHdlIHdpbGwgcmVzcG9uZCB3aXRoCj4gPj4gdGhlIHNhbWU6IFVzZSAncG9ydHMn
IHVubGVzcyB5b3UgaGF2ZSBib3RoIGluIGFuZCBvdXQgcG9ydHMuCj4gPiAKPiA+IFNvcnJ5IGZv
ciB0aGUgaW5zdWZmaWNpZW50IHJlc3BvbnNlLgo+ID4gCj4gPiBUaGUgQ29yZXNpZ2h0IGRyaXZl
ciBwcmVmZXJzIHVzaW5nIOKAmGluLXBvcnRz4oCZIGFuZCDigJhvdXQtcG9ydHPigJkgaW5zdGVh
ZCBvZiB0aGUg4oCYcG9ydHPigJkgcHJvcGVydHksIGFzIGVhY2gKPiA+IENvcmVzaWdodCBjb21w
b25lbnQgbmVlZHMgdG8gc3BlY2lmeSBpdHMgaW5wdXQgYW5kIG91dHB1dCBkaXJlY3Rpb25zLgo+
ID4gCj4gPiBUaGUgQ29yZXNpZ2h0IHN5c3RlbSBvcGVyYXRlcyBieSBpbnRlZ3JhdGluZyBhbGwg
Q29yZXNpZ2h0IGNvbXBvbmVudHMgYW5kIGNvbnN0cnV0aW5nIGl0cyBkYXRhIGZsb3cgcGF0aAo+
ID4gYmFzZWQgb24gdGhlIGRlZmluZWQgZGlyZWN0aW9ucy4gCj4gPiAKPiA+IENvbnNlcXVlbnRs
eSwgdGhlIGRhdGEgZmxvdyBkaXJlY3Rpb24gY2Fubm90IGJlIGRldGVybWluZWQgd2hlbiB1dGls
aXppbmcgdGhlIOKAmHBvcnRz4oCZIHByb3BlcnR5IGluIHRoZQo+ID4gQ29yZXNpZ2h0IHN5c3Rl
bS4KPiAKPiBJdCBjYW4gYmUgZGV0ZXJtaW5lZC4gRHJpdmVyIGtub3dzIHRoYXQgdGhlcmUgYXJl
IG9ubHkgaW4tcG9ydHMsIHNvIHlvdQo+IGNhbm5vdCBoYXZlIGhlcmUgb3RoZXIgZGlyZWN0aW9u
LiBNYXliZSB0aGUgZHJpdmVycyBoYXZlIHNvbWVob3cgdGhpcwo+IGhhcmQtY29kZWQ/IEJ1dCB0
aGF0J3MgYSBiaXQgYW5ub3lpbmcgbGltaXRhdGlvbi4KPiAKSW4gQ29yZXNpZ2h0IHBsYXRmb3Jt
IGRyaXZlciwgdGhlIG9mX2NvcmVzaWdodF9nZXRfcG9ydF9wYXJlbnQgZnVuY3Rpb24gaXMgdXNl
ZCB0byByZXRyaWV2ZSB0aGUgcGFyZW50IG9mIHRoZSAncG9ydHMnIG5vZGUuClRoZSBmdW5jdGlv
biBpcyBzcGVjaWZpY2FsbHkgaGFyZC1jb2RlZCB0byByZWNvZ25pemUgJ2luLXBvcnRzJyBhbmQg
J291dC1wb3J0cycuIEkgdGhpbmsgdGhhdCdzIHRoZSBsaW1pdGF0aW9uIGZvcgoncG9ydHMnIHBy
b3BlcnR5LgoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTEtcmM0L3NvdXJj
ZS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXBsYXRmb3JtLmMjTDE0NwoK
VGhuYWtzLApKaWUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
