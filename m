Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E9A956607
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 10:52:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95EE1C6DD9D;
	Mon, 19 Aug 2024 08:52:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 684B2C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 08:52:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47J0g0DS014401;
 Mon, 19 Aug 2024 08:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SzCwS7QNlEIxcBmhnNJGNnNT83kP0LndfQN7r9VYfzg=; b=kAVrJNO5VSRA3Yfd
 t6lXkwHW/XwSDHLE1QS5B0j/sqgMSpOD0KNvOVEWNSP6HYHJ5VZOKKoZySYDNHmU
 dBYyFwRF80qbRwRmOg6XdEtwNUJVr4pHmVeSi/09ILfilkHjvl73oo1PlYRxX85A
 dbnW/ewyzljbzREhb2kEYVGQYG1F76z+/IQurz5DDE3JMw7xw9Ked1ryc8Dlkfty
 9OzTRudpQYjj//OD3d4tAP0siIUvtj2qvf2Vr22L3UH3WF8fY6CbAmUqOJckifNw
 zfAlk2ky3s7XTBn8v+Bvvqr4QOGEbWCrExe8ez6d3Zl8Fukm9/AHMI++NQdGdLIc
 nnIPsA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412mmekdrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2024 08:51:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J8poEK001566
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2024 08:51:50 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 01:51:44 -0700
Date: Mon, 19 Aug 2024 16:51:40 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <ZsMHnKKvOey4SA1O@jiegan-gv.ap.qualcomm.com>
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
 <20240818142834.GA27754-robh@kernel.org>
 <ZsKkm/Pz0GYtH2Gl@jiegan-gv.ap.qualcomm.com>
 <9d9704ed-6ef8-4920-9874-29e0a815e2ba@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d9704ed-6ef8-4920-9874-29e0a815e2ba@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: o7jeiQiUQJah3lHZXkR4lCvm1Y1xekY9
X-Proofpoint-ORIG-GUID: o7jeiQiUQJah3lHZXkR4lCvm1Y1xekY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_07,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190063
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

T24gTW9uLCBBdWcgMTksIDIwMjQgYXQgMDg6MjU6MzNBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBPbiAxOS8wOC8yMDI0IDAzOjQ5LCBKaWVHYW4gd3JvdGU6Cj4gPiBPbiBT
dW4sIEF1ZyAxOCwgMjAyNCBhdCAwODoyODozNEFNIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToK
PiA+PiBPbiBNb24sIEF1ZyAxMiwgMjAyNCBhdCAxMDo0MTozOUFNICswODAwLCBKaWUgR2FuIHdy
b3RlOgo+ID4+PiBBZGQgYmluZGluZyBmaWxlIHRvIHNwZWNpZnkgaG93IHRvIGRlZmluZSBhIENv
cmVzaWdodCBUTUMKPiA+Pj4gQ29udHJvbCBVbml0IGRldmljZSBpbiBkZXZpY2UgdHJlZS4KPiA+
Pj4KPiA+Pj4gSXQgaXMgcmVzcG9uc2libGUgZm9yIGNvbnRyb2xsaW5nIHRoZSBkYXRhIGZpbHRl
ciBmdW5jdGlvbgo+ID4+PiBiYXNlZCBvbiB0aGUgc291cmNlIGRldmljZSdzIFRyYWNlIElEIGZv
ciBUTUMgRVRSIGRldmljZS4KPiA+Pj4gVGhlIHRyYWNlIGRhdGEgd2l0aCB0aGF0IFRyYWNlIGlk
IGNhbiBnZXQgaW50byBFVFIncyBidWZmZXIKPiA+Pj4gd2hpbGUgb3RoZXIgdHJhY2UgZGF0YSBn
ZXRzIGlnbm9yZWQuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEppZSBHYW4gPHF1aWNfamll
Z2FuQHF1aWNpbmMuY29tPgo+ID4+PiAtLS0KPiA+Pj4gIC4uLi9iaW5kaW5ncy9hcm0vcWNvbSxj
b3Jlc2lnaHQtY3RjdS55YW1sICAgICB8IDc5ICsrKysrKysrKysrKysrKysrKysKPiA+Pj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspCj4gPj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLGNvcmVzaWdodC1jdGN1
LnlhbWwKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vcWNvbSxjb3Jlc2lnaHQtY3RjdS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLGNvcmVzaWdodC1jdGN1LnlhbWwKPiA+Pj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi43YTk1ODAwMDc5NDIKPiA+
Pj4gLS0tIC9kZXYvbnVsbAo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL3Fjb20sY29yZXNpZ2h0LWN0Y3UueWFtbAo+ID4+PiBAQCAtMCwwICsxLDc5IEBA
Cj4gPj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkKPiA+Pj4gKyVZQU1MIDEuMgo+ID4+PiArLS0tCj4gPj4+ICskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2FybS9xY29tLGNvcmVzaWdodC1jdGN1LnlhbWwjCj4gPj4+
ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
PiA+Pj4gKwo+ID4+PiArdGl0bGU6IENvcmVTaWdodCBUTUMgQ29udHJvbCBVbml0Cj4gPj4+ICsK
PiA+Pj4gK21haW50YWluZXJzOgo+ID4+PiArICAtIFl1YW5mYW5nIFpoYW5nIDxxdWljX3l1YW5m
YW5nQHF1aWNpbmMuY29tPgo+ID4+PiArICAtIE1hbyBKaW5sb25nIDxxdWljX2ppbmxtYW9AcXVp
Y2luYy5jb20+Cj4gPj4+ICsgIC0gSmllIEdhbiA8cXVpY19qaWVnYW5AcXVpY2luYy5jb20+Cj4g
Pj4+ICsKPiA+Pj4gK2Rlc2NyaXB0aW9uOgo+ID4+PiArICBUaGUgQ29yZXNpZ2h0IFRNQyBDb250
cm9sIHVuaXQgY29udHJvbHMgdmFyaW91cyBDb3Jlc2lnaHQgYmVoYXZpb3JzLgo+ID4+PiArICBJ
dCB3b3JrcyBhcyBhIGhlbHBlciBkZXZpY2Ugd2hlbiBjb25uZWN0ZWQgdG8gVE1DIEVUUiBkZXZp
Y2UuCj4gPj4+ICsgIEl0IGlzIHJlc3BvbnNpYmxlIGZvciBjb250cm9sbGluZyB0aGUgZGF0YSBm
aWx0ZXIgZnVuY3Rpb24gYmFzZWQgb24KPiA+Pj4gKyAgdGhlIHNvdXJjZSBkZXZpY2UncyBUcmFj
ZSBJRCBmb3IgVE1DIEVUUiBkZXZpY2UuIFRoZSB0cmFjZSBkYXRhIHdpdGgKPiA+Pj4gKyAgdGhh
dCBUcmFjZSBpZCBjYW4gZ2V0IGludG8gRVRSJ3MgYnVmZmVyIHdoaWxlIG90aGVyIHRyYWNlIGRh
dGEgZ2V0cwo+ID4+PiArICBpZ25vcmVkLgo+ID4+Cj4gPj4gTm93aGVyZSBpcyBUTUMgZGVmaW5l
ZC4KPiA+IFRoZSBDb3Jlc2lnaHQgVE1DIGNvbnRyb2wgdW5pdChDVENVKSBjb25uZWN0ZWQgdG8g
Q29yZXNpZ2h0IFRNQyBkZXZpY2UgdmlhIHJlcGxpY2F0b3IgYW5kCj4gPiB3b3JrcyBhcyBhIGhl
bHBlciBkZXZpY2UgdG8gVE1DIGRldmljZS4KPiAKPiBEaWQgeW91IHVuZGVyc3RhbmQgdGhlIGZl
ZWRiYWNrIG9yIGp1c3QgcmVzcG9uZGluZyB3aXRoIHdoYXRldmVyIHRvIGdldAo+IHJpZCBvZiBy
ZXZpZXdlcnM/CgpTb3JyeSBmb3IgdGhlIGluc3VmZmljaWVudCBjbGFyaXR5IGluIG15IHJlc3Bv
bnNlLCBJIGFtIGp1c3QgbWlzdW5kZXJzdG9vZCB0aGUgZmVlZGJhY2sgYW5kIHRyeQp0byBleHBs
YWluIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiBUTUMgYW5kIENUQ1UgZGV2aWNlLgoKSSB3aWxs
IGFkZCB0aGUgVE1DIGRlc2NyaXB0aW9uIHRvIGV4cGxhaW4gd2hhdCBUTUMgaXMgYXMgc2hvd24g
YmVsb3c6ClRoZSBUcmFjZSBNZW1vcnkgQ29udHJvbGxlcihUTUMpIGlzIHVzZWQgZm9yIEVtYmVk
ZGVkIFRyYWNlIEJ1ZmZlcihFVEIpLCBFbWJlZGRlZCBUcmFjZSBGSUZPKEVURikKYW5kIEVtYmVk
ZGVkIFRyYWNlIFJvdXRlcihFVFIpIGNvbmZpZ3VyYXRpb25zLiBUaGUgY29uZmlndXJhdGlvbiBt
b2RlIChFVEIsIEVURiwgRVRSKSBpcwpkaXNjb3ZlcmVkIGF0IGJvb3QgdGltZSB3aGVuIHRoZSBk
ZXZpY2UgaXMgcHJvYmVkLgoKPiAKPiA+IAo+ID4gVGhlIGluLXBvcnRzIGxpc3RlZCBiZWxvdyBp
bGx1c3RyYXRlIHRoZWlyIGNvbm5lY3Rpb24gdG8gVE1DIGRldmljZXMuCj4gPiAKPiA+Pgo+ID4+
PiArCj4gPj4+ICtwcm9wZXJ0aWVzOgo+ID4+PiArICBjb21wYXRpYmxlOgo+ID4+PiArICAgIGVu
dW06Cj4gPj4+ICsgICAgICAtIHFjb20sc2E4Nzc1cC1jdGN1Cj4gPj4+ICsKPiA+Pj4gKyAgcmVn
Ogo+ID4+PiArICAgIG1heEl0ZW1zOiAxCj4gPj4+ICsKPiA+Pj4gKyAgY2xvY2tzOgo+ID4+PiAr
ICAgIG1heEl0ZW1zOiAxCj4gPj4+ICsKPiA+Pj4gKyAgY2xvY2stbmFtZXM6Cj4gPj4+ICsgICAg
aXRlbXM6Cj4gPj4+ICsgICAgICAtIGNvbnN0OiBhcGIKPiA+Pj4gKwo+ID4+PiArICBpbi1wb3J0
czoKPiA+Pgo+ID4+IFVzZSAncG9ydHMnIHVubGVzcyB5b3UgaGF2ZSBib3RoIGluIGFuZCBvdXQg
cG9ydHMuCj4gPiBUaGUg4oCYaW4tcG9ydHPigJkgYW5kIOKAmG91dC1wb3J0c+KAmSBwcm9wZXJ0
aWVzIHdpbGwgYmUgcGFyc2VkIGJ5IOKAmG9mX2NvcmVzaWdodF9nZXRfcG9ydF9wYXJlbnTigJkK
PiA+IGFuZCB0aGVpciByZWxhdGlvbnNoaXBzIHRvIG90aGVyIGRldmljZXMgd2lsbCBiZSBzdG9y
ZWQgaW4gdGhlIGNvcmVzaWdodF9wbGF0Zm9ybV9kYXRhIHN0cnVjdHVyZS4KPiA+IAo+ID4gZm9y
IGV4YW1wbGU6Cj4gPiBzdHJ1Y3QgY29yZXNpZ2h0X3BsYXRmb3JtX2RhdGEgewo+ID4gCWludCBu
cl9pbmNvbm5zOwo+ID4gCWludCBucl9vdXRjb25uczsKPiA+IAlzdHJ1Y3QgY29yZXNpZ2h0X2Nv
bm5lY3Rpb24gKipvdXRfY29ubnM7Cj4gPiAJc3RydWN0IGNvcmVzaWdodF9jb25uZWN0aW9uICoq
aW5fY29ubnM7Cj4gPiB9Owo+ID4gCj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92Ni4xMS1yYzQvc291cmNlL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQt
cGxhdGZvcm0uYyNMMTQ3Cj4gCj4gYW5kPyBJZiB5b3UgcmVzcG9uZCB3aXRoIHNvbWUgdW5yZWxh
dGVkIGFyZ3VtZW50LCB3ZSB3aWxsIHJlc3BvbmQgd2l0aAo+IHRoZSBzYW1lOiBVc2UgJ3BvcnRz
JyB1bmxlc3MgeW91IGhhdmUgYm90aCBpbiBhbmQgb3V0IHBvcnRzLgoKU29ycnkgZm9yIHRoZSBp
bnN1ZmZpY2llbnQgcmVzcG9uc2UuCgpUaGUgQ29yZXNpZ2h0IGRyaXZlciBwcmVmZXJzIHVzaW5n
IOKAmGluLXBvcnRz4oCZIGFuZCDigJhvdXQtcG9ydHPigJkgaW5zdGVhZCBvZiB0aGUg4oCYcG9y
dHPigJkgcHJvcGVydHksIGFzIGVhY2gKQ29yZXNpZ2h0IGNvbXBvbmVudCBuZWVkcyB0byBzcGVj
aWZ5IGl0cyBpbnB1dCBhbmQgb3V0cHV0IGRpcmVjdGlvbnMuCgpUaGUgQ29yZXNpZ2h0IHN5c3Rl
bSBvcGVyYXRlcyBieSBpbnRlZ3JhdGluZyBhbGwgQ29yZXNpZ2h0IGNvbXBvbmVudHMgYW5kIGNv
bnN0cnV0aW5nIGl0cyBkYXRhIGZsb3cgcGF0aApiYXNlZCBvbiB0aGUgZGVmaW5lZCBkaXJlY3Rp
b25zLiAKCkNvbnNlcXVlbnRseSwgdGhlIGRhdGEgZmxvdyBkaXJlY3Rpb24gY2Fubm90IGJlIGRl
dGVybWluZWQgd2hlbiB1dGlsaXppbmcgdGhlIOKAmHBvcnRz4oCZIHByb3BlcnR5IGluIHRoZQpD
b3Jlc2lnaHQgc3lzdGVtLgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+IAoKVGhh
bmtzLApKaWUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
