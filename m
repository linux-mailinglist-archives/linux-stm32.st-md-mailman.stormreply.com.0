Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1D1A2FFFF
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 02:21:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECECFC78F95;
	Tue, 11 Feb 2025 01:21:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 484F5C78F94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 01:21:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AKuNiO031300;
 Tue, 11 Feb 2025 01:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Lgxx79rg+zY8ZhEl6UOYRyZEbwvUp3kyXUYU+30FnDM=; b=NC6uAbMK2VkWajXR
 578zpcNbOhxTXpIOOQ/5c9+i54PQ3KlmV8F1EVNixJdcfzn0kDkPJGMqzYU+hwpP
 7q+V0vSXWqEETvQqkI93bNb7pkC7ANgorZ6FF6tis8nqy/4H8JksO+n3JdPbAVu8
 rtr59FceO3umtR+JW7GVATGyFuy0MyJ4i1hBoTg6B4d1fVKhAHqbcJSZsf1HdG57
 wQPT4JLakhExqrBYZKlo+LvE0HjlwnjB57fZN8ShVBTTPlRa4apPGf43hJbkd/zh
 R4BMbKnHe10PWMZLrXJIt1s1eGWwr9Gms1vAPXJiAjXeEN/RRaTNDfLRvz1niPkm
 JdIkgg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0ese5cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2025 01:20:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B1KTEG030819
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2025 01:20:29 GMT
Received: from [10.253.11.86] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 17:20:23 -0800
Message-ID: <80762356-f827-4a78-9ccf-dbe644248667@quicinc.com>
Date: Tue, 11 Feb 2025 09:20:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Richard Cochran <richardcochran@gmail.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
 <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
 <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
 <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
 <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JmCXu3hZE9gZMZDOFI493sN8LmLBXd38
X-Proofpoint-ORIG-GUID: JmCXu3hZE9gZMZDOFI493sN8LmLBXd38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110005
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos:
 Mask PHY mode if configured with rgmii-id
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

CgpPbiAyMDI1LTAyLTExIDAyOjAxLCBLb25yYWQgRHliY2lvIHdyb3RlOgo+IE9uIDEwLjAyLjIw
MjUgNDowOSBBTSwgWWlqaWUgWWFuZyB3cm90ZToKPj4KPj4KPj4gT24gMjAyNS0wMS0yNyAxODo0
OSwgS29ucmFkIER5YmNpbyB3cm90ZToKPj4+IE9uIDIyLjAxLjIwMjUgMTA6NDggQU0sIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6Cj4+Pj4gT24gMjIvMDEvMjAyNSAwOTo1NiwgWWlqaWUgWWFu
ZyB3cm90ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMjAyNS0wMS0yMSAyMDo0NywgS3J6eXN6dG9m
IEtvemxvd3NraSB3cm90ZToKPj4+Pj4+IE9uIDIxLzAxLzIwMjUgMDg6NTQsIFlpamllIFlhbmcg
d3JvdGU6Cj4+Pj4+Pj4gVGhlIFF1YWxjb21tIGJvYXJkIGFsd2F5cyBjaG9vc2VzIHRoZSBNQUMg
dG8gcHJvdmlkZSB0aGUgZGVsYXkgaW5zdGVhZCBvZgo+Pj4+Pj4+IHRoZSBQSFksIHdoaWNoIGlz
IGNvbXBsZXRlbHkgb3Bwb3NpdGUgdG8gdGhlIHN1Z2dlc3Rpb24gb2YgdGhlIExpbnV4Cj4+Pj4+
Pj4ga2VybmVsLgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBIb3cgZG9lcyB0aGUgTGludXgga2VybmVs
IHN1Z2dlc3QgaXQ/Cj4+Pj4+Pgo+Pj4+Pj4+IFRoZSB1c2FnZSBvZiBwaHktbW9kZSBpbiBsZWdh
Y3kgRFRTIHdhcyBhbHNvIGluY29ycmVjdC4gQ2hhbmdlIHRoZQo+Pj4+Pj4+IHBoeV9tb2RlIHBh
c3NlZCBmcm9tIHRoZSBEVFMgdG8gdGhlIGRyaXZlciBmcm9tIFBIWV9JTlRFUkZBQ0VfTU9ERV9S
R01JSV9JRAo+Pj4+Pj4+IHRvIFBIWV9JTlRFUkZBQ0VfTU9ERV9SR01JSSB0byBlbnN1cmUgY29y
cmVjdCBvcGVyYXRpb24gYW5kIGFkaGVyZW5jZSB0bwo+Pj4+Pj4+IHRoZSBkZWZpbml0aW9uLgo+
Pj4+Pj4+IFRvIGFkZHJlc3MgdGhlIEFCSSBjb21wYXRpYmlsaXR5IGlzc3VlIGJldHdlZW4gdGhl
IGtlcm5lbCBhbmQgRFRTIGNhdXNlZCBieQo+Pj4+Pj4+IHRoaXMgY2hhbmdlLCBoYW5kbGUgdGhl
IGNvbXBhdGlibGUgc3RyaW5nICdxY29tLHFjczQwNC1ldmItNDAwMCcgaW4gdGhlCj4+Pj4+Pj4g
Y29kZSwgYXMgaXQgaXMgdGhlIG9ubHkgbGVnYWN5IGJvYXJkIHRoYXQgbWlzdGFrZW5seSB1c2Vz
IHRoZSAncmdtaWknCj4+Pj4+Pj4gcGh5LW1vZGUuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBZaWppZSBZYW5nIDxxdWljX3lpaml5YW5nQHF1aWNpbmMuY29tPgo+Pj4+Pj4+IC0tLQo+
Pj4+Pj4+ICDCoMKgIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1l
dGhxb3MuY8KgwqDCoCB8IDE4ICsrKysrKysrKysrKystLS0tLQo+Pj4+Pj4+ICDCoMKgIDEgZmls
ZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4+Pj4+Cj4+Pj4+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
LXFjb20tZXRocW9zLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy1xY29tLWV0aHFvcy5jCj4+Pj4+Pj4gaW5kZXggMmE1YjM4NzIzNjM1YjVlZjkyMzNjYTQ3MDll
OTlkZDVkZGYwNmI3Ny4uZTIyOGE2MjcyM2UyMjFkNThkOGM0ZjEwNDEwOWUwZGNmNjgyZDA2ZCAx
MDA2NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy1xY29tLWV0aHFvcy5jCj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+Pj4+Pj4+IEBAIC00MDEsMTQgKzQwMSwx
MSBAQCBzdGF0aWMgaW50IGV0aHFvc19kbGxfY29uZmlndXJlKHN0cnVjdCBxY29tX2V0aHFvcyAq
ZXRocW9zKQo+Pj4+Pj4+ICDCoMKgIHN0YXRpYyBpbnQgZXRocW9zX3JnbWlpX21hY3JvX2luaXQo
c3RydWN0IHFjb21fZXRocW9zICpldGhxb3MpCj4+Pj4+Pj4gIMKgwqAgewo+Pj4+Pj4+ICDCoMKg
wqDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gJmV0aHFvcy0+cGRldi0+ZGV2Owo+Pj4+Pj4+
IC3CoMKgwqAgaW50IHBoYXNlX3NoaWZ0Owo+Pj4+Pj4+ICvCoMKgwqAgaW50IHBoYXNlX3NoaWZ0
ID0gMDsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgIGludCBsb29wYmFjazsKPj4+Pj4+PiAgwqDCoCDC
oMKgwqDCoMKgwqAgLyogRGV0ZXJtaW5lIGlmIHRoZSBQSFkgYWRkcyBhIDIgbnMgVFggZGVsYXkg
b3IgdGhlIE1BQyBoYW5kbGVzIGl0ICovCj4+Pj4+Pj4gLcKgwqDCoCBpZiAoZXRocW9zLT5waHlf
bW9kZSA9PSBQSFlfSU5URVJGQUNFX01PREVfUkdNSUlfSUQgfHwKPj4+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgZXRocW9zLT5waHlfbW9kZSA9PSBQSFlfSU5URVJGQUNFX01PREVfUkdNSUlfVFhJRCkK
Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgcGhhc2Vfc2hpZnQgPSAwOwo+Pj4+Pj4+IC3CoMKgwqAg
ZWxzZQo+Pj4+Pj4+ICvCoMKgwqAgaWYgKGV0aHFvcy0+cGh5X21vZGUgPT0gUEhZX0lOVEVSRkFD
RV9NT0RFX1JHTUlJX0lEKQo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaGFzZV9zaGlm
dCA9IFJHTUlJX0NPTkZJRzJfVFhfQ0xLX1BIQVNFX1NISUZUX0VOOwo+Pj4+Pj4+ICDCoMKgIMKg
wqDCoMKgwqDCoCAvKiBEaXNhYmxlIGxvb3BiYWNrIG1vZGUgKi8KPj4+Pj4+PiBAQCAtODEwLDYg
KzgwNywxNyBAQCBzdGF0aWMgaW50IHFjb21fZXRocW9zX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoCByZXQgPSBvZl9nZXRfcGh5X21vZGUo
bnAsICZldGhxb3MtPnBoeV9tb2RlKTsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+
Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0
LCAiRmFpbGVkIHRvIGdldCBwaHkgbW9kZVxuIik7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICvCoMKgwqAg
cm9vdCA9IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7Cj4+Pj4+Pj4gK8KgwqDCoCBpZiAocm9v
dCAmJiBvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShyb290LCAicWNvbSxxY3M0MDQtZXZiLTQwMDAi
KSkKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gRmlyc3QsIGp1c3QgY2hlY2sgaWYgbWFjaGluZSBpcyBj
b21wYXRpYmxlLCBkb24ndCBvcGVuIGNvZGUgaXQuCj4+Pj4+Pgo+Pj4+Pj4gU2Vjb25kLCBkcml2
ZXJzIHNob3VsZCByZWFsbHksIHJlYWxseSBub3QgcmVseSBvbiB0aGUgbWFjaGluZS4gSSBkb24n
dAo+Pj4+Pj4gdGhpbmsgaG93IHRoaXMgcmVzb2x2ZXMgQUJJIGJyZWFrIGZvciBvdGhlciB1c2Vy
cyBhdCBhbGwuCj4+Pj4+Cj4+Pj4+IEFzIGRldGFpbGVkIGluIHRoZSBjb21taXQgZGVzY3JpcHRp
b24sIHNvbWUgYm9hcmRzIG1pc3Rha2VubHkgdXNlIHRoZQo+Pj4+PiAncmdtaWknIHBoeS1tb2Rl
LCBhbmQgdGhlIE1BQyBkcml2ZXIgaGFzIGFsc28gaW5jb3JyZWN0bHkgcGFyc2VkIGFuZAo+Pj4+
Cj4+Pj4gVGhhdCdzIGEga2luZCBvZiBhbiBBQkkgbm93LCBhc3N1bWluZyBpdCB3b3JrZWQgZmlu
ZS4KPj4+Cj4+PiBJJ20gaW5jbGluZWQgdG8gdGhpbmsgaXQncyBiZXR0ZXIgdG8gZHJvcCBjb21w
YXRpYmlsaXR5IGdpdmVuIHdlJ3JlIHRhbGtpbmcKPj4+IGFib3V0IHJhdGhlciBvYnNjdXJlIGJv
YXJkcyBoZXJlLgo+Pj4KPj4+ICQgcmcgJ21vZGUuKj0uKiJyZ21paSInIGFyY2gvYXJtNjQvYm9v
dC9kdHMvcWNvbSAtbAo+Pj4KPj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYTgxNTVwLWFk
cC5kdHMKPj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9xY3M0MDQtZXZiLTQwMDAuZHRzCj4+
Pgo+Pj4gUUNTNDA0IHNlZW1zIHRvIGhhdmUgemVybyBpbnRlcmVzdCBmcm9tIGFueW9uZSAoYW5k
IGhhcyBiZWVuIGNvbnNpZGVyZWQKPj4+IGZvciByZW1vdmFsIHVwc3RyZWFtLi4pLgo+Pj4KPj4+
IFRoZSBBRFAgZG9lc24ndCBzZWUgbXVjaCB0cmFjdGlvbiBlaXRoZXIsIGxhc3QgdGltZSBhcm91
bmQgc29tZW9uZSBmb3VuZAo+Pj4gYSBib290IGJyZWFraW5nIGlzc3VlIG1vbnRocyBhZnRlciBp
dCB3YXMgY29tbWl0dGVkLgo+Pgo+PiBCdXQgd2hhdCBhYm91dCB0aGUgb3V0LW9mLXRyZWUgYm9h
cmRzIHRoYXQgQW5kcmV3IG1lbnRpb25lZD8gV2UgbmVlZCB0byBlbnN1cmUgd2UgZG9uJ3QgYnJl
YWsgdGhlbSwgcmlnaHQ/Cj4gCj4gTm8uIFdoYXQncyBub3Qgb24gdGhlIGxpc3QsIGRvZXNuJ3Qg
ZXhpc3QKCk9rYXksIEkgdW5kZXJzdGFuZC4KCj4gCj4gS29ucmFkCgotLSAKQmVzdCBSZWdhcmRz
LApZaWppZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
