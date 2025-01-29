Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C070CA215BD
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 01:47:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68AABC78031;
	Wed, 29 Jan 2025 00:47:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5D3BC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 00:47:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SJgTsf013440;
 Wed, 29 Jan 2025 00:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fssEY9K692umefuNXiIQ7wUUyWXXgJxI8Dl5TjoqpQo=; b=i3efGM9tSfb8j3fS
 Xzzw+X8f5oA/jL/xlVLzMoK8lpvObH513cJr2kW175MNacn5exteNGJUA1WXi4l1
 vAIUu68SWOF6xbu8tzUcAEGvXRcI6zxCVgxU1KHwwA/2OpP56WOlaG6DcFfb4Cnm
 H/EQpV51J8K/hzKor8cHK6b7GbbphpHriNrhO+tG/HvLv0YndixWV8wb+qpX+wxh
 yGSmF4oX442jFwR82X9IdYlhX6pKrErU25tEogTvAfnOQF+40eMmC7fql2UuH2nI
 ZwcsV+0ZlXgxIan02TmTrLmgb5pyialihaZeu5SCkdEuwbTKfz5GiiU2iGufTUV7
 MZc2Eg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f5mrgh7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 00:46:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T0ksFM008953
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 00:46:54 GMT
Received: from [10.133.33.41] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 16:46:47 -0800
Message-ID: <b3d9e4f0-cca8-45a5-a5b7-239cdeed2751@quicinc.com>
Date: Wed, 29 Jan 2025 08:46:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-6-quic_jiegan@quicinc.com>
 <44bd0d5e-a232-49c3-ba2f-e63e2f2c99be@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <44bd0d5e-a232-49c3-ba2f-e63e2f2c99be@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8WMvGvEoB1sxqK5fvkuKZoZqoaVRREfW
X-Proofpoint-ORIG-GUID: 8WMvGvEoB1sxqK5fvkuKZoZqoaVRREfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501290004
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
Subject: Re: [Linux-stm32] [PATCH v9 5/6] Coresight: Add Coresight TMC
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

CgpPbiAxLzI4LzIwMjUgNzo1NSBQTSwgSmFtZXMgQ2xhcmsgd3JvdGU6Cj4gCj4gCj4gT24gMjQv
MDEvMjAyNSA3OjI1IGFtLCBKaWUgR2FuIHdyb3RlOgo+PiBUaGUgQ29yZXNpZ2h0IFRNQyBDb250
cm9sIFVuaXQgaG9zdHMgbWlzY2VsbGFuZW91cyBjb25maWd1cmF0aW9uIAo+PiByZWdpc3RlcnMK
Pj4gd2hpY2ggY29udHJvbCB2YXJpb3VzIGZlYXR1cmVzIHJlbGF0ZWQgdG8gVE1DIEVUUiBzaW5r
Lgo+Pgo+PiBCYXNlZCBvbiB0aGUgdHJhY2UgSUQsIHdoaWNoIGlzIHByb2dyYW1tZWQgaW4gdGhl
IHJlbGF0ZWQgQ1RDVSBBVElECj4+IHJlZ2lzdGVyIG9mIGEgc3BlY2lmaWMgRVRSLCB0cmFjZSBk
YXRhIHdpdGggdGhhdCB0cmFjZSBJRCBnZXRzIGludG8KPj4gdGhlIEVUUiBidWZmZXIsIHdoaWxl
IG90aGVyIHRyYWNlIGRhdGEgZ2V0cyBkcm9wcGVkLgo+Pgo+PiBFbmFibGluZyBzb3VyY2UgZGV2
aWNlIHNldHMgb25lIGJpdCBvZiB0aGUgQVRJRCByZWdpc3RlciBiYXNlZCBvbgo+PiBzb3VyY2Ug
ZGV2aWNlJ3MgdHJhY2UgSUQuCj4+IERpc2FibGluZyBzb3VyY2UgZGV2aWNlIHJlc2V0cyB0aGUg
Yml0IGFjY29yZGluZyB0byB0aGUgc291cmNlCj4+IGRldmljZSdzIHRyYWNlIElELgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBKaWUgR2FuIDxxdWljX2ppZWdhbkBxdWljaW5jLmNvbT4KPj4gLS0tCj4+
IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAxMiArCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9NYWtlZmlsZcKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9j
b3Jlc2lnaHQtY3RjdS5jIHwgMjc2ICsrKysrKysrKysrKysrKysrKysKPj4gwqAgZHJpdmVycy9o
d3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGN1LmggfMKgIDMwICsrCj4+IMKgIGluY2x1
ZGUvbGludXgvY29yZXNpZ2h0LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCAzICstCj4+IMKgIDUgZmlsZXMgY2hhbmdlZCwgMzIxIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHd0cmFjaW5nL2Nv
cmVzaWdodC9jb3Jlc2lnaHQtY3RjdS5jCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0Y3UuaAo+ICA+Cj4gCj4gWy4uLl0KPiAK
Pj4gKy8qCj4+ICsgKiBjdGN1X3NldF9ldHJfdHJhY2VpZDogUmV0cmlldmUgdGhlIEFUSUQgb2Zm
c2V0IGFuZCB0cmFjZSBJRC4KPj4gKyAqCj4+ICsgKiBSZXR1cm5zIDAgaW5kaWNhdGVzIHN1Y2Nl
c3MuIE5vbmUtemVybyByZXN1bHQgbWVhbnMgZmFpbHVyZS4KPj4gKyAqLwo+PiArc3RhdGljIGlu
dCBjdGN1X3NldF9ldHJfdHJhY2VpZChzdHJ1Y3QgY29yZXNpZ2h0X2RldmljZSAqY3NkZXYsIAo+
PiBzdHJ1Y3QgY29yZXNpZ2h0X3BhdGggKmNzX3BhdGgsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYm9vbCBlbmFibGUpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IGNvcmVzaWdo
dF9kZXZpY2UgKnNpbmsgPSBjb3Jlc2lnaHRfZ2V0X3NpbmsoY3NfcGF0aC0+cGF0aCk7Cj4+ICvC
oMKgwqAgc3RydWN0IGN0Y3VfZHJ2ZGF0YSAqZHJ2ZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YShjc2Rl
di0+ZGV2LnBhcmVudCk7Cj4+ICvCoMKgwqAgdTggdHJhY2VfaWQgPSBjc19wYXRoLT50cmFjZV9p
ZDsKPj4gK8KgwqDCoCBpbnQgcG9ydF9udW07Cj4+ICsKPj4gK8KgwqDCoCBpZiAoKHNpbmsgPT0g
TlVMTCkgfHwgIUlTX1ZBTElEX0NTX1RSQUNFX0lEKHRyYWNlX2lkKSB8fCAKPj4gSVNfRVJSX09S
X05VTEwoZHJ2ZGF0YSkpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoJmNzZGV2LT5kZXYs
ICJJbnZhbGlkIHBhcmFtZXRlcnNcbiIpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5W
QUw7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcG9ydF9udW0gPSBjdGN1X2dldF9hY3Rp
dmVfcG9ydChzaW5rLCBjc2Rldik7Cj4+ICvCoMKgwqAgaWYgKHBvcnRfbnVtIDwgMCkKPj4gK8Kg
wqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiArCj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDC
oMKgICogU2tpcCB0aGUgZGlzYWJsZSBzZXNzaW9uIGlmIG1vcmUgdGhhbiBvbmUgVFBETSBkZXZp
Y2UgdGhhdAo+PiArwqDCoMKgwqAgKiBjb25uZWN0ZWQgdG8gdGhlIHNhbWUgVFBEQSBkZXZpY2Ug
aGFzIGJlZW4gZW5hYmxlZC4KPj4gK8KgwqDCoMKgICovCj4+ICvCoMKgwqAgaWYgKGVuYWJsZSkK
Pj4gK8KgwqDCoMKgwqDCoMKgIGF0b21pY19pbmMoJmRydmRhdGEtPnRyYWNlaWRfcmVmY250W3Bv
cnRfbnVtXVt0cmFjZV9pZF0pOwo+PiArwqDCoMKgIGVsc2Ugewo+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKGF0b21pY19kZWNfcmV0dXJuKCZkcnZkYXRhLT50cmFjZWlkX3JlZmNudFtwb3J0X251bV0g
Cj4+IFt0cmFjZV9pZF0pID4gMCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZGJn
KCZjc2Rldi0+ZGV2LCAiU2tpcCB0aGUgZGlzYWJsZSBzZXNzaW9uXG4iKTsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAg
fQo+PiArCj4+ICvCoMKgwqAgZGV2X2RiZygmY3NkZXYtPmRldiwgInRyYWNlaWQgaXMgJWRcbiIs
IGNzX3BhdGgtPnRyYWNlX2lkKTsKPj4gKwo+PiArwqDCoMKgIHJldHVybiBfX2N0Y3Vfc2V0X2V0
cl90cmFjZWlkKGNzZGV2LCB0cmFjZV9pZCwgcG9ydF9udW0sIGVuYWJsZSk7Cj4gCj4gSGkgSmll
LAo+IAo+IFVzaW5nIGF0b21pY19kZWNfcmV0dXJuKCkgaGVyZSBkb2Vzbid0IHByZXZlbnQgX19j
dGN1X3NldF9ldHJfdHJhY2VpZCgpIAo+IGZyb20gcnVubmluZyBjb25jdXJyZW50IGVuYWJsZSBh
bmQgZGlzYWJsZXMuIE9uY2UgeW91IHBhc3MgdGhlIAo+IGF0b21pY19kZWNfcmV0dXJuKCkgYSBz
ZWNvbmQgY2FsbCB0byBlbmFibGUgaXQgd2lsbCBtZXNzIGl0IHVwLgo+IAo+IEkgdGhpbmsgeW91
IG5lZWQgYSBzcGlubG9jayBhcm91bmQgdGhlIHdob2xlIHRoaW5nIGFuZCB0aGVuIHRoZSAKPiBy
ZWZjb3VudHMgZG9uJ3QgbmVlZCB0byBiZSBhdG9taWNzLgo+IApIaSwgSmFtZXMKVGhhbmtzIGZv
ciBjb21tZW50LiBJIG1heSBub3QgZnVsbHkgdGVzdGVkIG15IGNvZGVzIGhlcmUuIFdoYXQgSSB3
YXMgCnRoaW5raW5nIGlzIHRoZXJlJ3Mgbm8gd2F5IHRoZSByZWZjbnQgY291bGQgYmVjb21lIGEg
bmVnYXRpdmUgbnVtYmVyIAp1bmRlciBjdXJyZW50IGZyYW1ld29yay4gU28gSSBqdXN0IGFkZGVk
IHNwaW5sb2NrIGluIApfX2N0Y3Vfc2V0X2V0cl90cmFjZWlkKCkgdG8gZW5zdXJlIGNvbmN1cnJl
bnQgc2Vzc2lvbnMgY29ycmVjdGx5IAptYW5pcHVsYXRlIHRoZSByZWdpc3Rlci4KCkFzIHRoZSB0
cmFjZV9pZCByZWxhdGVkIHRvIHRoZSBiaXQgb2YgdGhlIEFUSUQgcmVnaXN0ZXIsIEkgdGhpbmsg
dGhlIApjb25jdXJyZW50IHByb2Nlc3NlcyBhcmUgd29ya2luZyBmaW5lIHdpdGggc3BpbmxvY2sg
YXJvdW5kIHJlYWQvd3JpdGUgCnJlZ2lzdGVyLgoKSSBtYXkgbm90IGZ1bGx5IGdvdCB5b3VyIHBv
aW50IGhlcmUuIFBsZWFzZSBoZWxwIG1lIHRvIGNvcnJlY3QgaXQuCgpUaGFua3MsCkppZQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
