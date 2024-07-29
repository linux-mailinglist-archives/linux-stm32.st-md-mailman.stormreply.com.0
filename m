Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBFA93F1E2
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 11:57:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 824EDC6DD96;
	Mon, 29 Jul 2024 09:57:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 995A2C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 09:57:19 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SNndK8017295;
 Mon, 29 Jul 2024 09:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PIO7uXgATEkDVyJhFRXvr5mGGtrsj39Fi6YG5UR0wNY=; b=kWFAOmBvlut90orI
 3S/zdEDvJalMfuFLLn+9I9t0tHeGlCDpOqHkmk0bHd+35CdXD+xqJoOTWD0tgmIW
 uHMIu+JRTo9qzLN+abL+hHFqfbBcQ95QbUQDhQL1LcJo4D51trYH/mrTN5zC4fgu
 xrweGup5wvWP6YyoE3f4+OMApk7QuEb4UNJ1GJYH7+xYerIX0ispuooTuFqYaQRY
 bbZKciS36k9GJRhc77h25P0gpXX5COHWvtZae3Q1OA78+HS8wKx7uIF8CHGHGgEw
 B0WF44T2UWU7SW9jDa2J9NNpIjiNx88LJxrQAb6BiTv8XHfjNlxo9NJgEovC8BRc
 2gkcpw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mrytupug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2024 09:57:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46T9v5L2005132
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2024 09:57:05 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 02:56:58 -0700
Message-ID: <f57d80bd-b40c-44fe-b5ae-9b9eaac643e4@quicinc.com>
Date: Mon, 29 Jul 2024 17:56:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: Simon Horman <horms@kernel.org>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
 <20240709174212.GM346094@kernel.org>
 <c07b8f08-a8ce-427b-81f1-4f5399913fc1@quicinc.com>
In-Reply-To: <c07b8f08-a8ce-427b-81f1-4f5399913fc1@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oXa4W9EY5A_pLVXhNvOzUbebPAqAlBQb
X-Proofpoint-GUID: oXa4W9EY5A_pLVXhNvOzUbebPAqAlBQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290067
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: dwmac-qcom-ethqos:
 Add QCS9100 ethqos compatible
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

CgpPbiA3LzEwLzIwMjQgMzoyNyBQTSwgVGVuZ2ZlaSBGYW4gd3JvdGU6Cj4gCj4gCj4gT24gNy8x
MC8yMDI0IDE6NDIgQU0sIFNpbW9uIEhvcm1hbiB3cm90ZToKPj4gT24gVHVlLCBKdWwgMDksIDIw
MjQgYXQgMTA6MTM6MTZQTSArMDgwMCwgVGVuZ2ZlaSBGYW4gd3JvdGU6Cj4+PiBJbnRyb2R1Y2Ug
c3VwcG9ydCBmb3IgdGhlIFFDUzkxMDAgU29DIGRldmljZSB0cmVlIChEVFNJKSBhbmQgdGhlCj4+
PiBRQ1M5MTAwIFJJREUgYm9hcmQgRFRTLiBUaGUgUUNTOTEwMCBpcyBhIHZhcmlhbnQgb2YgdGhl
IFNBODc3NXAuCj4+PiBXaGlsZSB0aGUgUUNTOTEwMCBwbGF0Zm9ybSBpcyBzdGlsbCBpbiB0aGUg
ZWFybHkgZGVzaWduIHN0YWdlLCB0aGUKPj4+IFFDUzkxMDAgUklERSBib2FyZCBpcyBpZGVudGlj
YWwgdG8gdGhlIFNBODc3NXAgUklERSBib2FyZCwgZXhjZXB0IGl0Cj4+PiBtb3VudHMgdGhlIFFD
UzkxMDAgU29DIGluc3RlYWQgb2YgdGhlIFNBODc3NXAgU29DLgo+Pj4KPj4+IFRoZSBRQ1M5MTAw
IFNvQyBEVFNJIGlzIGRpcmVjdGx5IHJlbmFtZWQgZnJvbSB0aGUgU0E4Nzc1cCBTb0MgRFRTSSwg
YW5kCj4+PiBhbGwgdGhlIGNvbXBhdGlibGUgc3RyaW5ncyB3aWxsIGJlIHVwZGF0ZWQgZnJvbSAi
U0E4Nzc1cCIgdG8gIlFDUzkxMDAiLgo+Pj4gVGhlIFFDUzkxMDAgZGV2aWNlIHRyZWUgcGF0Y2hl
cyB3aWxsIGJlIHB1c2hlZCBhZnRlciBhbGwgdGhlIGRldmljZSB0cmVlCj4+PiBiaW5kaW5ncyBh
bmQgZGV2aWNlIGRyaXZlciBwYXRjaGVzIGFyZSByZXZpZXdlZC4KPj4+Cj4+PiBUaGUgZmluYWwg
ZHRzaSB3aWxsIGxpa2U6Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0tbXNt
LzIwMjQwNzAzMDI1ODUwLjIxNzIwMDgtMy1xdWljX3RlbmdmYW5AcXVpY2luYy5jb20vCj4+Pgo+
Pj4gVGhlIGRldGFpbGVkIGNvdmVyIGxldHRlciByZWZlcmVuY2U6Cj4+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1hcm0tbXNtLzIwMjQwNzAzMDI1ODUwLjIxNzIwMDgtMS1xdWljX3Rl
bmdmYW5AcXVpY2luYy5jb20vCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogVGVuZ2ZlaSBGYW4gPHF1
aWNfdGVuZ2ZhbkBxdWljaW5jLmNvbT4KPj4+IC0tLQo+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+IMKg
wqAgLSBTcGxpdCBodWdlIHBhdGNoIHNlcmllcyBpbnRvIGRpZmZlcmVudCBwYXRjaCBzZXJpZXMg
YWNjb3JkaW5nIHRvCj4+PiDCoMKgwqDCoCBzdWJzeXRlbXMKPj4+IMKgwqAgLSBVcGRhdGUgcGF0
Y2ggY29tbWl0IG1lc3NhZ2UKPj4+Cj4+PiBwcmV2b3VzIGRpc3NjdXNzaW9uIGhlcmU6Cj4+PiBb
MV0gdjE6IAo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLW1zbS8yMDI0MDcw
MzAyNTg1MC4yMTcyMDA4LTEtcXVpY190ZW5nZmFuQHF1aWNpbmMuY29tLwo+Pj4KPj4+IC0tLQo+
Pj4gVGVuZ2ZlaSBGYW4gKDIpOgo+Pj4gwqDCoMKgwqDCoMKgIGR0LWJpbmRpbmdzOiBuZXQ6IHFj
b20sZXRocW9zOiBhZGQgZGVzY3JpcHRpb24gZm9yIHFjczkxMDAKPj4+IMKgwqDCoMKgwqDCoCBu
ZXQ6IHN0bW1hYzogZHdtYWMtcWNvbS1ldGhxb3M6IGFkZCBzdXBwb3J0IGZvciBlbWFjNCBvbiAK
Pj4+IHFjczkxMDAgcGxhdGZvcm1zCj4+Pgo+Pj4gwqAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9xY29tLGV0aHFvcy55YW1swqAgfCAxICsKPj4+IMKgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1swqDCoCB8IDIgKysKPj4+
IMKgIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9z
LmMgfCAxICsKPj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+PiAtLS0K
Pj4+IGJhc2UtY29tbWl0OiAwYjU4ZTEwODA0MmIwZWQyOGE3MWNkN2VkZjUxNzU5OTk5NTViMjMz
Cj4+Cj4+IEknbSBhc3N1bWluZyB0aGF0IHRoaXMgaXMgYSBwYXRjaCBmb3IgbmV0LW5leHQuCj4+
IEJ1dCB0aGUgY29tbWl0IGFib3ZlIGlzIG5vdCBwcmVzZW50IGluIG5ldC1uZXh0LAo+PiBhbmQg
dGhpcyBzZXJpZXMgZG9lc24ndCBhcHBseSB0byBuZXQtbmV4dC4KPj4KPj4gUGxlYXNlIHJlYmFz
ZSB3aGVuIHByZXBhcmluZyB2My4KPj4gQW5kIHBsZWFzZSBkZXNpZ25hdGUgdGhlIHRhcmdldCB0
cmVlIGluIHRoZSBzdWJqZWN0Lgo+Pgo+PiDCoMKgwqDCoFN1YmplY3Q6IFtQQVRDSCBuZXQtbmV4
dCB2M10gLi4uCj4+Cj4+IFRoYW5rcyEKPiAKPiBJIHdpbGxtYWtlIHRoZSBjb3JyZXNwaW5kaW5n
IG1vZGlmaWNhdGlvbnMgYWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdGlvbiAKPiBpbiB0aGUgVjMg
cGF0Y2ggc2VyaWVzLgoKQWZ0ZXIgY29uc2lkZXJpbmcgdGhlIGZlZWRiYWNrIHByb3ZpZGVkIG9u
IHRoZSBzdWJqZWN0LCBXZSBoYXZlIGRlY2lkZWQKdG8ga2VlcCBjdXJyZW50IFNBODc3NXAgY29t
cGF0aWJsZSBhbmQgQUJJIGNvbXBhdGliaWxpdHkgaW4gZHJpdmVycy4KTGV0J3MgY2xvc2UgdGhp
cyBzZXNzaW9uIGFuZCBpZ25vcmUgYWxsIHRoZSBjdXJyZW50IHBhdGNoZXMgaGVyZS4KVGhhbmsg
eW91IGZvciB5b3VyIGlucHV0LgoKPiAKCi0tIApUaHggYW5kIEJScywKVGVuZ2ZlaSBGYW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
