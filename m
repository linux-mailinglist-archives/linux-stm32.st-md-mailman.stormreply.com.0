Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABD390209D
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 13:46:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3203C78011;
	Mon, 10 Jun 2024 11:46:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D304C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 11:46:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A8Csfe015503;
 Mon, 10 Jun 2024 13:46:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NLGY4SlIiBcaxzvgC7IKiZv6Lsi5LnhvOHDsDuCMGlE=; b=p2PN4/PsKalzGyRM
 Ys5q/WeS7Co31Z8hBg0ERHW4EZBE0sRg3sgHdLNvt51bIHkbR9JSjCBbmkR1R9In
 UMQovCBBoQuB40rOsd8ZwlJyh7KWm2V6VGxhBDCG5MAvFjTuxBzjoCLCMvCzM6Uo
 B2bI91W1wst4k6YO1rd2vNfDl6mE0FpgHTgQ4OfS7R1CiOnhYaOrxMuRxDrhuGuC
 rjXxxDM2vP9t0iO8LadmjDTEM4WzY4OIvsYWHLATXJwG4U+5nyBfROskg24u9rY2
 gyIMpz5YO1GQivUykDetLUf3DbhsbTwvPD6OAXOU+7G727qM60LeS/iRuEoUITDk
 1vB+WA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ymemxppqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 13:46:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 12CF040047;
 Mon, 10 Jun 2024 13:46:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 90B9D21684A;
 Mon, 10 Jun 2024 13:45:10 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 13:45:09 +0200
Message-ID: <c5ea12e7-5ee6-4960-9141-e774ccd9977b@foss.st.com>
Date: Mon, 10 Jun 2024 13:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20240610071459.287500-1-christophe.roullier@foss.st.com>
 <20240610071459.287500-8-christophe.roullier@foss.st.com>
 <20139233-4e95-4fe5-84ca-734ee866afca@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <20139233-4e95-4fe5-84ca-734ee866afca@denx.de>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH v6 7/8] net: stmmac: dwmac-stm32: Mask support for PMCR
 configuration
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

Ck9uIDYvMTAvMjQgMTI6MzksIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDYvMTAvMjQgOToxNCBB
TSwgQ2hyaXN0b3BoZSBSb3VsbGllciB3cm90ZToKPgo+IFsuLi5dCj4KPj4gwqAgc3RhdGljIGlu
dCBzdG0zMm1wMV9zZXRfbW9kZShzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0
KQo+PiBAQCAtMzAzLDcgKzMwNyw3IEBAIHN0YXRpYyBpbnQgc3RtMzJtY3Vfc2V0X21vZGUoc3Ry
dWN0IAo+PiBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQpCj4+IMKgwqDCoMKgwqAgZGV2
X2RiZyhkd21hYy0+ZGV2LCAiTW9kZSAlcyIsIAo+PiBwaHlfbW9kZXMocGxhdF9kYXQtPm1hY19p
bnRlcmZhY2UpKTsKPj4gwqAgwqDCoMKgwqDCoCByZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGR3
bWFjLT5yZWdtYXAsIHJlZywKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGR3
bWFjLT5vcHMtPnN5c2NmZ19ldGhfbWFzaywgdmFsIDw8IDIzKTsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFNZU0NGR19NQ1VfRVRIX01BU0ssIHZhbCA8PCAyMyk7Cj4+IMKg
IH0KPj4gwqAgwqAgc3RhdGljIHZvaWQgc3RtMzJfZHdtYWNfY2xrX2Rpc2FibGUoc3RydWN0IHN0
bTMyX2R3bWFjICpkd21hYywgCj4+IGJvb2wgc3VzcGVuZCkKPj4gQEAgLTM0OCw4ICszNTIsMTUg
QEAgc3RhdGljIGludCBzdG0zMl9kd21hY19wYXJzZV9kYXRhKHN0cnVjdCAKPj4gc3RtMzJfZHdt
YWMgKmR3bWFjLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoZHdtYWMtPnJl
Z21hcCk7Cj4+IMKgIMKgwqDCoMKgwqAgZXJyID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgo
bnAsICJzdCxzeXNjb24iLCAxLCAKPj4gJmR3bWFjLT5tb2RlX3JlZyk7Cj4+IC3CoMKgwqAgaWYg
KGVycikKPj4gK8KgwqDCoCBpZiAoZXJyKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJy
KGRldiwgIkNhbid0IGdldCBzeXNjb25maWcgbW9kZSBvZmZzZXQgKCVkKVxuIiwgZXJyKTsKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAg
ZHdtYWMtPm1vZGVfbWFzayA9IFNZU0NGR19NUDFfRVRIX01BU0s7Cj4+ICvCoMKgwqAgZXJyID0g
b2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsICJzdCxzeXNjb24iLCAyLCAKPj4gJmR3bWFj
LT5tb2RlX21hc2spOwo+PiArwqDCoMKgIGlmIChlcnIpCj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZf
ZGJnKGRldiwgIldhcm5pbmcgc3lzY29uZmlnIHJlZ2lzdGVyIG1hc2sgbm90IHNldFxuIik7Cj4K
PiBJc24ndCB0aGlzIGFuIGVycm9yICwgc28gZGV2X2VycigpID8KTm8sIGl0IGlzIG9ubHkgIndh
cm5pbmciIGluZm9ybWF0aW9uLCBmb3IgTVAxIHRoZSBtYXNrIGlzIG5vdCBuZWVkZWQgCihhbmQg
Zm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgaXMgbm90IHBsYW5uZWQgdG8gcHV0IG1hc2sgcGFy
YW1ldGVyIAptYW5kYXRvcnkpCj4KPiBJbmNsdWRlIHRoZSBlcnIgdmFyaWFibGUgaW4gdGhlIGVy
cm9yIG1lc3NhZ2UsIHNlZSB0aGUgZGV2X2VycigpIGFib3ZlIAo+IGZvciBhbiBleGFtcGxlLiBU
aGF0IHdheSB0aGUgbG9nIGFscmVhZHkgY29udGFpbnMgdXNlZnVsIGluZm9ybWF0aW9uIAo+ICh0
aGUgZXJyb3IgY29kZSkgdGhhdCBjYW4gYmUgdXNlZCB0byBuYXJyb3cgZG93biB0aGUgcHJvYmxl
bS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
