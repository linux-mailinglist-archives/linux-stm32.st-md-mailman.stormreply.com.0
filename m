Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3AAA2F645
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 19:01:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31819C78F94;
	Mon, 10 Feb 2025 18:01:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F7BDC78F8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 18:01:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ABgUC0000369
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 10 Feb 2025 18:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nRIgquMblxmiFtLWE8uSlg81ZeJdWHIECgta1ooGHZE=; b=FLJQE7msxiBv8Q2e
 4t0V7pAIGLQlOUGGIjezyRn6OOlV+w4kLff7G3L8ZGX8rXTcXLdtL1TR//N1n2R0
 RpdnZD6WhU+UkqjL+zw6qbvllZ0vZnsZ/VD9AwWjShj0quKK6MncNf8tqECZ4Gjl
 ebG6NURd4oveqz0xbJlPiFv+K23YlJRRDZgS4EzEXIbV8zCpjkW7A4RKFoV4+yay
 j8vN8dT3ZVzDPDDmygbIzb8nU0A7laM7V6IcGdbURUfM0BUZq7ja9v6Kpjv+jXkt
 9DDR+Vv9zxfPUEW4WY5J2ObSXNISHdofzxfR6oJZ+bcmj4RYb+VtsZGzKu/gibVJ
 R3ic4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk10g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 18:01:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4718cb6689eso3904921cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 10:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739210469; x=1739815269;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nRIgquMblxmiFtLWE8uSlg81ZeJdWHIECgta1ooGHZE=;
 b=eHLDUa+EIClNmZ4lflBYuSB5pOOxsTqzqELFqtSVdimzDbjNvBCcWopcdOo+ZPA5uB
 fjgCcoWocNV0y57M/1t2UiAC5z7Pp4MbLql5QTGQLNyNpORaSs8aVfVQJVa9uUEdaYIn
 zyBh03OOUHH4kCOYKEsj66mQiEjS6i0XtRvmdOcCBqzVTwBZJPhCF9+r7W+CmLHl82VX
 3NxVaitRf7yKIq+vJC7aA5EENa9HSGD86Wah1nZsPl1UXhWV/Nv70/6Qgs8R4wt/Uuy2
 gy4BRfaySSGnC/qt0A22Vgyi+xxUQHNwBOwttE1Whkqr6C7XPaFnAud2E+wnKNlFufWE
 xuxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9stwQOFWmoShEuzu1JMzbakhyT5rp5V0TbzTPbVQw2W0qeOwsd5IvRjAQRG5JgPVHCO/ww6wSZOXBSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzEVzJetPFhZfp9nvezGPrv7R2+woPNw6y5RoGhygweWVVMrxTF
 yD3n2ttmog5EZoSPdu/T5oLmuvQkiJ/02OGQl5T+j44jE7JNeKLMGAtNByI4PUtoV5xWq6L1+FX
 6059jZO6odZdqcDw8F8rFbtHuGIMM7J8mq4btp6M4fqwWkHpI5wIfjCt3ENkbBiE6j0tX4r758L
 IQDXw=
X-Gm-Gg: ASbGncuRycrZ5vOhzVxnwcqZ4mCuN0WZ5dZzuWg914BHowQ+Ao3lzNP0U2y3tYzThk8
 drBQzrBhDYE+SmMdwbcVI++nunauKADRgm/ozD7+ECN+6ZpZVCNHLLr7xwykaQVQt5IPIj8SSa1
 +Tnt/IhOwZJWEnfoRKM4lcqzJzC4YgNMZHfoe0DT+TfhuiPnBtX/coZyiMaz8cSMjqX+f5fyG6+
 AWqeyveDfwS3yaoeoneRvnbubh0wS4QV6ElM1c52/x31P7ovp6wwojkUaFgauV6rHFBZY13XKr7
 8HSDFV/lhhNqN1FuOZrDQ4C4Xqznzfr5edJOxabXePMS/HMsfdwYWtAbouY=
X-Received: by 2002:ac8:57d1:0:b0:462:b46b:8bf8 with SMTP id
 d75a77b69052e-47167b066cbmr77016701cf.14.1739210469194; 
 Mon, 10 Feb 2025 10:01:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjNHMrPdlFQI52pflImfeJmycM/6sYmtEApuonTlMDTKaYLqKa6DC/5hsEpJ2wVSAK4BNHWA==
X-Received: by 2002:ac8:57d1:0:b0:462:b46b:8bf8 with SMTP id
 d75a77b69052e-47167b066cbmr77016271cf.14.1739210468350; 
 Mon, 10 Feb 2025 10:01:08 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7b77d58bdsm351070566b.130.2025.02.10.10.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 10:01:07 -0800 (PST)
Message-ID: <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yijie Yang <quic_yijiyang@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
 <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
 <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
 <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
X-Proofpoint-GUID: e-Q6SyuYptihuBYt0fzi5Tra4NFHLER8
X-Proofpoint-ORIG-GUID: e-Q6SyuYptihuBYt0fzi5Tra4NFHLER8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100147
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTAuMDIuMjAyNSA0OjA5IEFNLCBZaWppZSBZYW5nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjUt
MDEtMjcgMTg6NDksIEtvbnJhZCBEeWJjaW8gd3JvdGU6Cj4+IE9uIDIyLjAxLjIwMjUgMTA6NDgg
QU0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBPbiAyMi8wMS8yMDI1IDA5OjU2LCBZ
aWppZSBZYW5nIHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBPbiAyMDI1LTAxLTIxIDIwOjQ3LCBLcnp5
c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+PiBPbiAyMS8wMS8yMDI1IDA4OjU0LCBZaWppZSBZ
YW5nIHdyb3RlOgo+Pj4+Pj4gVGhlIFF1YWxjb21tIGJvYXJkIGFsd2F5cyBjaG9vc2VzIHRoZSBN
QUMgdG8gcHJvdmlkZSB0aGUgZGVsYXkgaW5zdGVhZCBvZgo+Pj4+Pj4gdGhlIFBIWSwgd2hpY2gg
aXMgY29tcGxldGVseSBvcHBvc2l0ZSB0byB0aGUgc3VnZ2VzdGlvbiBvZiB0aGUgTGludXgKPj4+
Pj4+IGtlcm5lbC4KPj4+Pj4KPj4+Pj4KPj4+Pj4gSG93IGRvZXMgdGhlIExpbnV4IGtlcm5lbCBz
dWdnZXN0IGl0Pwo+Pj4+Pgo+Pj4+Pj4gVGhlIHVzYWdlIG9mIHBoeS1tb2RlIGluIGxlZ2FjeSBE
VFMgd2FzIGFsc28gaW5jb3JyZWN0LiBDaGFuZ2UgdGhlCj4+Pj4+PiBwaHlfbW9kZSBwYXNzZWQg
ZnJvbSB0aGUgRFRTIHRvIHRoZSBkcml2ZXIgZnJvbSBQSFlfSU5URVJGQUNFX01PREVfUkdNSUlf
SUQKPj4+Pj4+IHRvIFBIWV9JTlRFUkZBQ0VfTU9ERV9SR01JSSB0byBlbnN1cmUgY29ycmVjdCBv
cGVyYXRpb24gYW5kIGFkaGVyZW5jZSB0bwo+Pj4+Pj4gdGhlIGRlZmluaXRpb24uCj4+Pj4+PiBU
byBhZGRyZXNzIHRoZSBBQkkgY29tcGF0aWJpbGl0eSBpc3N1ZSBiZXR3ZWVuIHRoZSBrZXJuZWwg
YW5kIERUUyBjYXVzZWQgYnkKPj4+Pj4+IHRoaXMgY2hhbmdlLCBoYW5kbGUgdGhlIGNvbXBhdGli
bGUgc3RyaW5nICdxY29tLHFjczQwNC1ldmItNDAwMCcgaW4gdGhlCj4+Pj4+PiBjb2RlLCBhcyBp
dCBpcyB0aGUgb25seSBsZWdhY3kgYm9hcmQgdGhhdCBtaXN0YWtlbmx5IHVzZXMgdGhlICdyZ21p
aScKPj4+Pj4+IHBoeS1tb2RlLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFlpamllIFlh
bmcgPHF1aWNfeWlqaXlhbmdAcXVpY2luYy5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+IMKgwqAgLi4u
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jwqDCoMKgIHwg
MTggKysrKysrKysrKysrKy0tLS0tCj4+Pj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+Pj4+
Pj4gaW5kZXggMmE1YjM4NzIzNjM1YjVlZjkyMzNjYTQ3MDllOTlkZDVkZGYwNmI3Ny4uZTIyOGE2
MjcyM2UyMjFkNThkOGM0ZjEwNDEwOWUwZGNmNjgyZDA2ZCAxMDA2NDQKPj4+Pj4+IC0tLSBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKPj4+
Pj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20t
ZXRocW9zLmMKPj4+Pj4+IEBAIC00MDEsMTQgKzQwMSwxMSBAQCBzdGF0aWMgaW50IGV0aHFvc19k
bGxfY29uZmlndXJlKHN0cnVjdCBxY29tX2V0aHFvcyAqZXRocW9zKQo+Pj4+Pj4gwqDCoCBzdGF0
aWMgaW50IGV0aHFvc19yZ21paV9tYWNyb19pbml0KHN0cnVjdCBxY29tX2V0aHFvcyAqZXRocW9z
KQo+Pj4+Pj4gwqDCoCB7Cj4+Pj4+PiDCoMKgwqDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0g
JmV0aHFvcy0+cGRldi0+ZGV2Owo+Pj4+Pj4gLcKgwqDCoCBpbnQgcGhhc2Vfc2hpZnQ7Cj4+Pj4+
PiArwqDCoMKgIGludCBwaGFzZV9zaGlmdCA9IDA7Cj4+Pj4+PiDCoMKgwqDCoMKgwqAgaW50IGxv
b3BiYWNrOwo+Pj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqAgLyogRGV0ZXJtaW5lIGlmIHRoZSBQSFkg
YWRkcyBhIDIgbnMgVFggZGVsYXkgb3IgdGhlIE1BQyBoYW5kbGVzIGl0ICovCj4+Pj4+PiAtwqDC
oMKgIGlmIChldGhxb3MtPnBoeV9tb2RlID09IFBIWV9JTlRFUkZBQ0VfTU9ERV9SR01JSV9JRCB8
fAo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGV0aHFvcy0+cGh5X21vZGUgPT0gUEhZX0lOVEVSRkFD
RV9NT0RFX1JHTUlJX1RYSUQpCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgcGhhc2Vfc2hpZnQgPSAw
Owo+Pj4+Pj4gLcKgwqDCoCBlbHNlCj4+Pj4+PiArwqDCoMKgIGlmIChldGhxb3MtPnBoeV9tb2Rl
ID09IFBIWV9JTlRFUkZBQ0VfTU9ERV9SR01JSV9JRCkKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHBoYXNlX3NoaWZ0ID0gUkdNSUlfQ09ORklHMl9UWF9DTEtfUEhBU0VfU0hJRlRfRU47Cj4+
Pj4+PiDCoMKgIMKgwqDCoMKgwqDCoCAvKiBEaXNhYmxlIGxvb3BiYWNrIG1vZGUgKi8KPj4+Pj4+
IEBAIC04MTAsNiArODA3LDE3IEBAIHN0YXRpYyBpbnQgcWNvbV9ldGhxb3NfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+Pj4+IMKgwqDCoMKgwqDCoCByZXQgPSBvZl9nZXRf
cGh5X21vZGUobnAsICZldGhxb3MtPnBoeV9tb2RlKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoCBpZiAo
cmV0KQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCByZXQsICJGYWlsZWQgdG8gZ2V0IHBoeSBtb2RlXG4iKTsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKg
wqAgcm9vdCA9IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7Cj4+Pj4+PiArwqDCoMKgIGlmIChy
b290ICYmIG9mX2RldmljZV9pc19jb21wYXRpYmxlKHJvb3QsICJxY29tLHFjczQwNC1ldmItNDAw
MCIpKQo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBGaXJzdCwganVzdCBjaGVjayBpZiBtYWNoaW5lIGlzIGNv
bXBhdGlibGUsIGRvbid0IG9wZW4gY29kZSBpdC4KPj4+Pj4KPj4+Pj4gU2Vjb25kLCBkcml2ZXJz
IHNob3VsZCByZWFsbHksIHJlYWxseSBub3QgcmVseSBvbiB0aGUgbWFjaGluZS4gSSBkb24ndAo+
Pj4+PiB0aGluayBob3cgdGhpcyByZXNvbHZlcyBBQkkgYnJlYWsgZm9yIG90aGVyIHVzZXJzIGF0
IGFsbC4KPj4+Pgo+Pj4+IEFzIGRldGFpbGVkIGluIHRoZSBjb21taXQgZGVzY3JpcHRpb24sIHNv
bWUgYm9hcmRzIG1pc3Rha2VubHkgdXNlIHRoZQo+Pj4+ICdyZ21paScgcGh5LW1vZGUsIGFuZCB0
aGUgTUFDIGRyaXZlciBoYXMgYWxzbyBpbmNvcnJlY3RseSBwYXJzZWQgYW5kCj4+Pgo+Pj4gVGhh
dCdzIGEga2luZCBvZiBhbiBBQkkgbm93LCBhc3N1bWluZyBpdCB3b3JrZWQgZmluZS4KPj4KPj4g
SSdtIGluY2xpbmVkIHRvIHRoaW5rIGl0J3MgYmV0dGVyIHRvIGRyb3AgY29tcGF0aWJpbGl0eSBn
aXZlbiB3ZSdyZSB0YWxraW5nCj4+IGFib3V0IHJhdGhlciBvYnNjdXJlIGJvYXJkcyBoZXJlLgo+
Pgo+PiAkIHJnICdtb2RlLio9LioicmdtaWkiJyBhcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20gLWwK
Pj4KPj4gYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NhODE1NXAtYWRwLmR0cwo+PiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3Fjb20vcWNzNDA0LWV2Yi00MDAwLmR0cwo+Pgo+PiBRQ1M0MDQgc2VlbXMg
dG8gaGF2ZSB6ZXJvIGludGVyZXN0IGZyb20gYW55b25lIChhbmQgaGFzIGJlZW4gY29uc2lkZXJl
ZAo+PiBmb3IgcmVtb3ZhbCB1cHN0cmVhbS4uKS4KPj4KPj4gVGhlIEFEUCBkb2Vzbid0IHNlZSBt
dWNoIHRyYWN0aW9uIGVpdGhlciwgbGFzdCB0aW1lIGFyb3VuZCBzb21lb25lIGZvdW5kCj4+IGEg
Ym9vdCBicmVha2luZyBpc3N1ZSBtb250aHMgYWZ0ZXIgaXQgd2FzIGNvbW1pdHRlZC4KPiAKPiBC
dXQgd2hhdCBhYm91dCB0aGUgb3V0LW9mLXRyZWUgYm9hcmRzIHRoYXQgQW5kcmV3IG1lbnRpb25l
ZD8gV2UgbmVlZCB0byBlbnN1cmUgd2UgZG9uJ3QgYnJlYWsgdGhlbSwgcmlnaHQ/CgpOby4gV2hh
dCdzIG5vdCBvbiB0aGUgbGlzdCwgZG9lc24ndCBleGlzdAoKS29ucmFkCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
