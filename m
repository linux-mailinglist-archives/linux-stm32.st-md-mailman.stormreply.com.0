Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B934A215DC
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 01:57:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B77DC78031;
	Wed, 29 Jan 2025 00:57:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BC51C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 00:57:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SGIWKT023412;
 Wed, 29 Jan 2025 00:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZQQkxtJswJ6G6AZ+K3wO4Z+prFLWuSaEOoIOI5kw36U=; b=S/ncro+YUYOUfehw
 3qe9Aeht3KdfZgEirTupGm5ioCXnmoyAdIrzu/wqx0UjQiy2k/qEMMNnEcMmxKTU
 eWjTYdGcZY3Gk2WcmpQAUz5KeONX1Js1p/L1c4WoMN5ehPd3+MbmSal1lkGiVxdE
 gQdZi5mfoPM69A4GnHWrm1i85PicvJZd2n/UfylePBqVk30R5KZ8tZZkhu4Sge+P
 4xXFrHmVUN+9kaUw9QV+q0hWKfRguuam7dtNQN4lyhlIrlpO6Tdoj+Sl5L20rUqb
 8RZHvltRPyZ0CeQcV5L/gdJozg60VuOWL5EH1H5qZD1GQ56tJFO5i5ydNx/8vsek
 3Lj9vg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f2mps0hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 00:57:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T0vN0i023408
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 00:57:23 GMT
Received: from [10.133.33.41] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 16:57:17 -0800
Message-ID: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
Date: Wed, 29 Jan 2025 08:57:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-4-quic_jiegan@quicinc.com>
 <538ae543-4c43-4df2-8adc-911096fe14dd@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <538ae543-4c43-4df2-8adc-911096fe14dd@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eovWIWCKTdy6jmzv7fp1hOTXOvYeS8PS
X-Proofpoint-ORIG-GUID: eovWIWCKTdy6jmzv7fp1hOTXOvYeS8PS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290006
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
Subject: Re: [Linux-stm32] [PATCH v9 3/6] Coresight: Introduce a new struct
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

CgpPbiAxLzI4LzIwMjUgNzo1NCBQTSwgSmFtZXMgQ2xhcmsgd3JvdGU6Cj4gCj4gCj4gT24gMjQv
MDEvMjAyNSA3OjI1IGFtLCBKaWUgR2FuIHdyb3RlOgo+PiBBZGQgJ3N0cnVjdCBjb3Jlc2lnaHRf
cGF0aCcgdG8gc3RvcmUgdGhlIGRhdGEgdGhhdCBpcyBuZWVkZWQgYnkKPj4gY29yZXNpZ2h0X2Vu
YWJsZV9wYXRoL2NvcmVzaWdodF9kaXNhYmxlX3BhdGguIFRoZSBzdHJ1Y3R1cmUKPj4gd2lsbCBi
ZSB0cmFuc21pdHRlZCB0byB0aGUgaGVscGVyIGFuZCBzaW5rIGRldmljZSB0byBlbmFibGUKPj4g
cmVsYXRlZCBmdW5jYXRpb25hbGl0aWVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKaWUgR2FuIDxx
dWljX2ppZWdhbkBxdWljaW5jLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2Nv
cmVzaWdodC9jb3Jlc2lnaHQtY29yZS5jwqAgfCA4NyArKysrKysrKysrKysrKy0tLS0tCj4+IMKg
IGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRiMTAuYyB8wqAgMyArLQo+
PiDCoCAuLi4vaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuY8KgIHwgNTIg
KysrKysrLS0tLS0KPj4gwqAgLi4uL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bS1w
ZXJmLmjCoCB8wqAgMiArLQo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNp
Z2h0LXByaXYuaMKgIHwgMjEgKysrLS0KPj4gwqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0
L2NvcmVzaWdodC1zeXNmcy5jIHwgMzIgKysrLS0tLQo+PiDCoCAuLi4vaHd0cmFjaW5nL2NvcmVz
aWdodC9jb3Jlc2lnaHQtdG1jLWV0Zi5jwqDCoCB8wqAgMyArLQo+PiDCoCAuLi4vaHd0cmFjaW5n
L2NvcmVzaWdodC9jb3Jlc2lnaHQtdG1jLWV0ci5jwqDCoCB8wqAgNiArLQo+PiDCoCBkcml2ZXJz
L2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRyYmUuY8KgIHzCoCA0ICstCj4+IMKgIGRy
aXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC91bHRyYXNvYy1zbWIuY8KgwqDCoCB8wqAgMyArLQo+
PiDCoCAxMCBmaWxlcyBjaGFuZ2VkLCAxMzcgaW5zZXJ0aW9ucygrKSwgNzYgZGVsZXRpb25zKC0p
Cj4+Cj4gCj4gWy4uLl0KPiAKPiAKPj4gwqDCoMKgwqDCoCBJTklUX0xJU1RfSEVBRChwYXRoKTsK
Pj4gK8KgwqDCoCBjc19wYXRoLT5wYXRoID0gcGF0aDsKPj4gK8KgwqDCoCAvKgo+PiArwqDCoMKg
wqAgKiBTaW5jZSBub3QgYWxsIHNvdXJjZSBkZXZpY2VzIGhhdmUgYSBkZWZpbmVkIHRyYWNlX2lk
IGZ1bmN0aW9uLAo+PiArwqDCoMKgwqAgKiBtYWtlIHN1cmUgdG8gY2hlY2sgZm9yIGl0IGJlZm9y
ZSB1c2UuCj4+ICvCoMKgwqDCoCAqCj4+ICvCoMKgwqDCoCAqIEFzc2VydCB0aGUgbW9kZSBpcyBD
U19NT0RFX1NZU0ZTLCB0aGUgdHJhY2VfaWQgd2lsbCBiZSBhc3NpZ25lZAo+PiArwqDCoMKgwqAg
KiBhZ2FpbiBsYXRlciBpZiB0aGUgbW9kZSBpcyBDU19NT0RFX1BFUkYuCj4+ICvCoMKgwqDCoCAq
Lwo+PiArwqDCoMKgIGlmIChzb3VyY2Vfb3BzKHNvdXJjZSktPnRyYWNlX2lkICE9IE5VTEwpIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJjID0gc291cmNlX29wcyhzb3VyY2UpLT50cmFjZV9pZChzb3Vy
Y2UsIENTX01PREVfU1lTRlMsIE5VTEwpOwo+IAo+IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGRv
IHRoaXMuIERvZXNuJ3QgdGhpcyBjb25zdW1lIHR3byB0cmFjZSBJRHMgZm9yIAo+IGVhY2ggc2Vz
c2lvbj8gQW5kIEknbSBub3QgZXZlbiBzdXJlIGlmIGl0J3MgcmVsZWFzZWQgcHJvcGVybHkgaWYg
aXQncyAKPiBvdmVyd3JpdHRlbi4KWWVzLCB5b3UgYXJlIHJpZ2h0LCB3ZSBtYXkgd2FzdGUgb3Vy
IHRyYWNlIElEIGhlcmUuCj4gCj4gSXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGNvbnNvbGlkYXRl
IHRoZSBhbGwgdGhlIHRyYWNlIElEIGFsbG9jYXRpb24gdG8gCj4gYSBzaW5nbGUgc3RlcCB3aGVu
IGJ1aWxkaW5nIHRoZSBwYXRoLCBvciBhbm90aGVyIGZ1bmN0aW9uIHRoYXQgZ2V0cyAKPiBjYWxs
ZWQganVzdCBhZnRlciB0aGUgcGF0aCBpcyBidWlsdC4gQXQgdGhlIG1vbWVudCB0aGUgSUQgY2Fu
IGJlIAo+IGFsbG9jYXRlZCBmcm9tIGFib3V0IDUgZGlmZmVyZW50IHBsYWNlcyBhbmQgaXQncyBx
dWl0ZSBoYXJkIHRvIAo+IHVuZGVyc3RhbmQsIGVzcGVjaWFsbHkgd2l0aCB0aGVzZSBuZXcgY2hh
bmdlcy4gSSBoYXZlIHNvbWUgb2YgaXQgY29kZWQgCj4gdXAsIGxldCBtZSBmaW5pc2ggaXQgb2Zm
IGFuZCBJIGNhbiBzaGFyZSBpdC4KV2FpdGluZyBmb3IgeW91ciB1cGRhdGUuIEkgYW0gYWxzbyBs
b29raW5nIGZvcndhcmQgdG8gYW5vdGhlciBzb2x1dGlvbi4KCj4gCj4+ICvCoMKgwqDCoMKgwqDC
oCBpZihJU19WQUxJRF9DU19UUkFDRV9JRChyYykpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNzX3BhdGgtPnRyYWNlX2lkID0gcmM7Cj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNzX3BhdGgtPnRyYWNlX2lkID0gMDsKPj4gK8KgwqDCoCB9Cj4+
ICvCoMKgwqAgZWxzZQo+PiArwqDCoMKgwqDCoMKgwqAgY3NfcGF0aC0+dHJhY2VfaWQgPSAwOwo+
IAo+IFsuLi5dCj4gCj4+ICsvKioKPj4gKyAqIHN0cnVjdCBjb3Jlc2lnaHRfcGF0aCAtIGRhdGEg
bmVlZGVkIGJ5IGVuYWJsZS9kaXNhYmxlIHBhdGgKPj4gKyAqIEBoYW5kbGU6wqDCoMKgwqDCoMKg
wqAgcGVyZiBhdXggaGFuZGxlIGZvciBFVE0uCj4+ICsgKiBAcGF0aDrCoMKgwqDCoMKgwqDCoCBw
YXRoIGZyb20gc291cmNlIHRvIHNpbmsuCj4+ICsgKiBAdHJhY2VfaWQ6wqDCoMKgwqDCoMKgwqAg
dHJhY2VfaWQgb2YgdGhlIHdob2xlIHBhdGguCj4+ICsgKi8KPj4gK3N0cnVjdCBjb3Jlc2lnaHRf
cGF0aCB7Cj4+ICvCoMKgwqAgc3RydWN0IHBlcmZfb3V0cHV0X2hhbmRsZcKgwqDCoCAqaGFuZGxl
Owo+IAo+IFRoaXMgaXMgb25seSBuZWVkZWQgdG8gYXZvaWQgYWRkaW5nICpoYW5kbGUgdG8gdGhl
IGVuYWJsZSBmdW5jdGlvbiBjYWxsIAo+IHNpZ25hdHVyZSwgYnV0IGhhdmluZyBpdCBoZXJlIGlt
cGxpZXMgaXQgbmVlZHMgdG8gYmUgc3RvcmVkLiBBbmQgdGhlbiB3ZSAKPiBuZWVkIHRvIG1hbmFn
ZSB0aGUgbGlmZWN5Y2xlIG9mIGl0IGJ5IG51bGxpbmcgaXQgb24gZGVsZXRpb24uIEFsbCBvZiAK
PiB0aGlzIGNhbiBiZSBhdm9pZGVkIGJ5IGp1c3QgYWRkaW5nIGhhbmRsZSB0byBlbmFibGUoKS4K
PiAKPiBVbnJlbGF0ZWQgdG8gdGhpcyBwYXRjaCwgYnV0IEknbSBub3Qgc3VyZSB3aHkgd2Ugd2Vy
ZSBwYXNzaW5nIGFyb3VuZCAKPiB2b2lkKiBmb3IgaGFuZGxlIGVpdGhlci4gSXQganVzdCBtYWtl
cyB0aGUgY29kZSBoYXJkIHRvIHJlYWQgYW5kIGltcGxpZXMgCj4gc29tZSBmbGV4aWJpbGl0eSB0
aGF0IGRvZXNuJ3QgZXhpc3QuIEl0J3MgYWx3YXlzICJzdHJ1Y3QgCj4gcGVyZl9vdXRwdXRfaGFu
ZGxlIiwgc28gd2UgY2FuIGNoYW5nZSB2b2lkKiB0byB0aGF0IGluIHRoZSBlbmFibGUgCj4gZnVu
Y3Rpb25zLiBJIGFsc28gaGF2ZSBhIHBhdGNoIGZvciB0aGlzIHRoYXQgSSdsbCBzaGFyZSBpbiBh
IGJpdC4KPiAKVGhhbmtzIGZvciBzdXBwb3J0LiBJIGFtIHRvdGFsbHkgYWdyZWUgd2l0aCB5b3Uu
IEl0J3Mgbm90IHJlbGF0ZWQgdG8gdGhlIApwYXRjaCBzZXJpZXMgYW5kIGl0IGxvb2tzIGxpa2Ug
YSBoYWNrIGhlcmUuCgpXYWl0aW5nIGZvciB5b3VyIHVwZGF0ZS4KCj4+ICvCoMKgwqAgc3RydWN0
IGxpc3RfaGVhZMKgwqDCoMKgwqDCoMKgICpwYXRoOwo+PiArwqDCoMKgIHU4wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHRyYWNlX2lkOwo+PiArfTsKPj4gKwo+PiDCoCBzdGF0aWMgaW5s
aW5lIHZvaWQgY29yZXNpZ2h0X2luc2VydF9iYXJyaWVyX3BhY2tldCh2b2lkICpidWYpCj4+IMKg
IHsKPj4gwqDCoMKgwqDCoCBpZiAoYnVmKQo+PiBAQCAtMTMyLDE2ICsxNDQsMTUgQEAgc3RhdGlj
IGlubGluZSB2b2lkIENTX1VOTE9DSyh2b2lkIF9faW9tZW0gKmFkZHIpCj4+IMKgwqDCoMKgwqAg
fSB3aGlsZSAoMCk7Cj4+IMKgIH0KPj4gLXZvaWQgY29yZXNpZ2h0X2Rpc2FibGVfcGF0aChzdHJ1
Y3QgbGlzdF9oZWFkICpwYXRoKTsKPj4gLWludCBjb3Jlc2lnaHRfZW5hYmxlX3BhdGgoc3RydWN0
IGxpc3RfaGVhZCAqcGF0aCwgZW51bSBjc19tb2RlIG1vZGUsCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB2b2lkICpzaW5rX2RhdGEpOwo+PiArdm9pZCBjb3Jlc2lnaHRfZGlzYWJsZV9w
YXRoKHN0cnVjdCBjb3Jlc2lnaHRfcGF0aCAqY3NfcGF0aCk7Cj4+ICtpbnQgY29yZXNpZ2h0X2Vu
YWJsZV9wYXRoKHN0cnVjdCBjb3Jlc2lnaHRfcGF0aCAqY3NfcGF0aCwgZW51bSAKPj4gY3NfbW9k
ZSBtb2RlKTsKPj4gwqAgc3RydWN0IGNvcmVzaWdodF9kZXZpY2UgKmNvcmVzaWdodF9nZXRfc2lu
ayhzdHJ1Y3QgbGlzdF9oZWFkICpwYXRoKTsKPiAKPiBUaGlzIG5lZWRzIHRvIGJlIGV4cG9ydGVk
IG90aGVyd2lzZSB0aGUgYnVpbGQgZmFpbHMgYmVjYXVzZSB5b3UgdXNlIGl0IAo+IGluIGEgbW9k
dWxlIGluIGFub3RoZXIgY29tbWl0LiBJIGFzc3VtZSB5b3UgYXJlIGJ1aWxkaW5nIGFzIHN0YXRp
Yz8KPiAKPiAKWWVzLCB5b3UgYXJlIHJpZ2h0LiBJIG1hZGUgYSBtaXN0YWtlIGhlcmUuIEkgZGlk
IG5vdCB0ZXN0IGl0IHdpdGggYnVpbGQgCmFzIG1vZHVsZS4gU29ycnkgYWJvdXQgdGhlIG1pc3Rh
a2UuCgpUaGFua3MsCkppZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
