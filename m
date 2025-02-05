Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333BA28340
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 05:09:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 353E9C78F87;
	Wed,  5 Feb 2025 04:09:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D554BC78F86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 04:09:32 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514JXptc031904;
 Wed, 5 Feb 2025 04:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b052cIdAOJ6Sd2S9PBmtHs3u9dhUMPyc4HX3PJEe5Qg=; b=KdKJ4DZGuLZv8DMB
 05KDQNrLDa2i8WQGm7BJ84KyPgi2fsl0hX3ETjI3eNqZkfobQwA5rCuhR16rji/J
 COIG2z6iPBkkrbBxwSzScRKp2Tc91Bfkck+ss7YodPXTrxoMD3EtPRDqd9F3zDq0
 cv/DgOn0Kyi+iW1fCf1VQFXuMxe+SYkyPUG8H4DJBdK8Cf7H52kZER1pt8jxb89Q
 c7q2zlUKkr37hUyknMcvyXBGzZwGZ19OmeFwAyFUswqzVMthy+mvcjdJmGRe+fou
 Pm1uig/7bpOI+EEsgbfLrO65PozMeLeNZlGeXtwFea/qVBOhBhThLN4sXlikvef7
 IWOqVw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ks5kgwb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Feb 2025 04:09:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5154996B027503
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Feb 2025 04:09:09 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 20:09:04 -0800
Message-ID: <edf3cea0-b3da-4eb8-9200-e3c4d6e19b51@quicinc.com>
Date: Wed, 5 Feb 2025 12:09:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-4-quic_jiegan@quicinc.com>
 <0e3f8f35-7ab0-4c2a-b7ce-f5d4f1164af0@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <0e3f8f35-7ab0-4c2a-b7ce-f5d4f1164af0@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7sgp-wmKOtZqfRVHVAvdlnJ9WUQcaqCU
X-Proofpoint-GUID: 7sgp-wmKOtZqfRVHVAvdlnJ9WUQcaqCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_01,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=624 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050028
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

CgpPbiAyLzEvMjAyNSAxMjo0MyBBTSwgSmFtZXMgQ2xhcmsgd3JvdGU6Cj4gCj4gCj4gT24gMjQv
MDEvMjAyNSA3OjI1IGFtLCBKaWUgR2FuIHdyb3RlOgo+PiBBZGQgJ3N0cnVjdCBjb3Jlc2lnaHRf
cGF0aCcgdG8gc3RvcmUgdGhlIGRhdGEgdGhhdCBpcyBuZWVkZWQgYnkKPj4gY29yZXNpZ2h0X2Vu
YWJsZV9wYXRoL2NvcmVzaWdodF9kaXNhYmxlX3BhdGguIFRoZSBzdHJ1Y3R1cmUKPj4gd2lsbCBi
ZSB0cmFuc21pdHRlZCB0byB0aGUgaGVscGVyIGFuZCBzaW5rIGRldmljZSB0byBlbmFibGUKPj4g
cmVsYXRlZCBmdW5jYXRpb25hbGl0aWVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKaWUgR2FuIDxx
dWljX2ppZWdhbkBxdWljaW5jLmNvbT4KPj4gLS0tCj4gWy4uLl0KPj4gwqDCoMKgwqDCoCAvKgo+
PiDCoMKgwqDCoMKgwqAgKiBJZiB3ZSBzdGlsbCBoYXZlIGFjY2VzcyB0byB0aGUgZXZlbnRfZGF0
YSB2aWEgaGFuZGxlLAo+PiBAQCAtNTk1LDExICs1OTksMTEgQEAgc3RhdGljIHZvaWQgZXRtX2V2
ZW50X3N0b3Aoc3RydWN0IHBlcmZfZXZlbnQgCj4+ICpldmVudCwgaW50IG1vZGUpCj4+IMKgwqDC
oMKgwqAgaWYgKCFjc2RldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gLcKgwqDC
oCBwYXRoID0gZXRtX2V2ZW50X2NwdV9wYXRoKGV2ZW50X2RhdGEsIGNwdSk7Cj4+IC3CoMKgwqAg
aWYgKCFwYXRoKQo+PiArwqDCoMKgIGNzX3BhdGggPSBldG1fZXZlbnRfY3B1X3BhdGgoZXZlbnRf
ZGF0YSwgY3B1KTsKPj4gK8KgwqDCoCBpZiAoIWNzX3BhdGgpCj4gCj4gSSBkb24ndCB0aGluayBy
ZW5hbWluZyAncGF0aCcgdG8gJ2NzX3BhdGgnIGlzIHdvcnRoIHRoZSBjaHVybi4gSXQncyBpbiBh
IAo+IGxvdCBvZiBwbGFjZXMgaW4gdGhpcyBjaGFuZ2UsIGJ1dCBJIHRoaW5rIHBhdGggaXMgYWxy
ZWFkeSBnb29kIGVub3VnaC4KPiAKWWVzLCBhZ3JlZSB3aXRoIHlvdS4gSXQgc2VlbXMgdW5uZWNl
c3NhcnkuIFdpbGwgdXBkYXRlIGl0LgoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4g
LcKgwqDCoCBzaW5rID0gY29yZXNpZ2h0X2dldF9zaW5rKHBhdGgpOwo+PiArwqDCoMKgIHNpbmsg
PSBjb3Jlc2lnaHRfZ2V0X3NpbmsoY3NfcGF0aC0+cGF0aCk7Cj4gCj4gY29yZXNpZ2h0X2dldF9z
aW5rKCkgaXMgYWx3YXlzIGNhbGxlZCB3aXRoIGNzX3BhdGgtPnBhdGgsIHNvIHdlIG1pZ2h0IGFz
IAo+IHdlbGwgbWFrZSBpdCB0YWtlIGEgd2hvbGUgcGF0aCBzdHJ1Y3QuIFRoZSBzYW1lIHdpdGgg
YW55IG9mIHRoZSBvdGhlciAKPiBmdW5jdGlvbnMgdGhhdCBvcGVyYXRlIG9uIHBhdGggbGlrZSBj
b3Jlc2lnaHRfZ2V0X3NvdXJjZSgpLgpJdCdzIG1ha2Ugc2Vuc2UgZm9yIG1lIGFuZCBtYWtlIGNv
ZGVzIGVhc3kgdG8gcmVhZC4gSSB3aWxsIHVwZGF0ZSBpdC4KCj4gCgpUaGFua3MsCkppZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
