Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E98EB90230F
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 15:51:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A25DCC7801C;
	Mon, 10 Jun 2024 13:51:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB349C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 13:51:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ACUjOe011470;
 Mon, 10 Jun 2024 15:51:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 i7o7N5B7+jfcvWuYAHwVeh2JCgEO5HfdPITsk4LeZr0=; b=z9bRYthrmDiTXApj
 hZJp31j8pmkI58wkwiYMwvJ6dh6cN3rCynpQ9QTFAvjM3MCCBgq8aFc+mfFihPdK
 EsUWEtdN5Q2ROL7KIJniKD6CHTXu6jH2oLfcgVTpLUrnvqKl/KB1x8n4z1nQlf2a
 kXCQAtY5+9PITZj1vmpy/9DBsZMHKC9h7aM7yk3zCpeo0OIUvrj3zw1b77hQ1+ED
 LyLHae/7asxFwA2ViqgzBQjVYJtuomxbYIjoUXROe+rYDVYn+0EAUSrOi+sNmK9e
 wJCEUcF+/upWIvYu446W/1gZCJGY5FcOHDumDCEIREoOTl2hPEA85kooQ4ICTkYp
 fXXc+A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yme6d74q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 15:51:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DA57940046;
 Mon, 10 Jun 2024 15:51:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0ECB2194EE;
 Mon, 10 Jun 2024 15:49:59 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 15:49:58 +0200
Message-ID: <91af5c61-f23f-4f72-a8c8-f32b2c368768@foss.st.com>
Date: Mon, 10 Jun 2024 15:49:58 +0200
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
 <c5ea12e7-5ee6-4960-9141-e774ccd9977b@foss.st.com>
 <09105afe-1123-407a-96c3-2ea88602aad0@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <09105afe-1123-407a-96c3-2ea88602aad0@denx.de>
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

Ck9uIDYvMTAvMjQgMTU6NDMsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDYvMTAvMjQgMTo0NSBQ
TSwgQ2hyaXN0b3BoZSBST1VMTElFUiB3cm90ZToKPj4KPj4gT24gNi8xMC8yNCAxMjozOSwgTWFy
ZWsgVmFzdXQgd3JvdGU6Cj4+PiBPbiA2LzEwLzI0IDk6MTQgQU0sIENocmlzdG9waGUgUm91bGxp
ZXIgd3JvdGU6Cj4+Pgo+Pj4gWy4uLl0KPj4+Cj4+Pj4gwqAgc3RhdGljIGludCBzdG0zMm1wMV9z
ZXRfbW9kZShzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0KQo+Pj4+IEBAIC0z
MDMsNyArMzA3LDcgQEAgc3RhdGljIGludCBzdG0zMm1jdV9zZXRfbW9kZShzdHJ1Y3QgCj4+Pj4g
cGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0KQo+Pj4+IMKgwqDCoMKgwqAgZGV2X2RiZyhk
d21hYy0+ZGV2LCAiTW9kZSAlcyIsIAo+Pj4+IHBoeV9tb2RlcyhwbGF0X2RhdC0+bWFjX2ludGVy
ZmFjZSkpOwo+Pj4+IMKgIMKgwqDCoMKgwqAgcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0cyhkd21h
Yy0+cmVnbWFwLCByZWcsCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGR3
bWFjLT5vcHMtPnN5c2NmZ19ldGhfbWFzaywgdmFsIDw8IDIzKTsKPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgU1lTQ0ZHX01DVV9FVEhfTUFTSywgdmFsIDw8IDIzKTsKPj4+
PiDCoCB9Cj4+Pj4gwqAgwqAgc3RhdGljIHZvaWQgc3RtMzJfZHdtYWNfY2xrX2Rpc2FibGUoc3Ry
dWN0IHN0bTMyX2R3bWFjICpkd21hYywgCj4+Pj4gYm9vbCBzdXNwZW5kKQo+Pj4+IEBAIC0zNDgs
OCArMzUyLDE1IEBAIHN0YXRpYyBpbnQgc3RtMzJfZHdtYWNfcGFyc2VfZGF0YShzdHJ1Y3QgCj4+
Pj4gc3RtMzJfZHdtYWMgKmR3bWFjLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRS
X0VSUihkd21hYy0+cmVnbWFwKTsKPj4+PiDCoCDCoMKgwqDCoMKgIGVyciA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyX2luZGV4KG5wLCAic3Qsc3lzY29uIiwgMSwgCj4+Pj4gJmR3bWFjLT5tb2RlX3Jl
Zyk7Cj4+Pj4gLcKgwqDCoCBpZiAoZXJyKQo+Pj4+ICvCoMKgwqAgaWYgKGVycikgewo+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkNhbid0IGdldCBzeXNjb25maWcgbW9kZSBv
ZmZzZXQgKCVkKVxuIiwgZXJyKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+
PiArwqDCoMKgIH0KPj4+PiArCj4+Pj4gK8KgwqDCoCBkd21hYy0+bW9kZV9tYXNrID0gU1lTQ0ZH
X01QMV9FVEhfTUFTSzsKPj4+PiArwqDCoMKgIGVyciA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2lu
ZGV4KG5wLCAic3Qsc3lzY29uIiwgMiwgCj4+Pj4gJmR3bWFjLT5tb2RlX21hc2spOwo+Pj4+ICvC
oMKgwqAgaWYgKGVycikKPj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2RiZyhkZXYsICJXYXJuaW5n
IHN5c2NvbmZpZyByZWdpc3RlciBtYXNrIG5vdCBzZXRcbiIpOwo+Pj4KPj4+IElzbid0IHRoaXMg
YW4gZXJyb3IgLCBzbyBkZXZfZXJyKCkgPwo+PiBObywgaXQgaXMgb25seSAid2FybmluZyIgaW5m
b3JtYXRpb24sIGZvciBNUDEgdGhlIG1hc2sgaXMgbm90IG5lZWRlZCAKPj4gKGFuZCBmb3IgYmFj
a3dhcmQgY29tcGF0aWJpbGl0eSBpcyBub3QgcGxhbm5lZCB0byBwdXQgbWFzayBwYXJhbWV0ZXIg
Cj4+IG1hbmRhdG9yeSkKPgo+IFNob3VsZCB0aGlzIGJlIGFuIGVycm9yIGZvciBhbnl0aGluZyBu
ZXdlciB0aGFuIE1QMTUgdGhlbiA/CkZvciBNUDI1LCBubyBuZWVkIG9mIG1hc2ssIHNvIGZvciBt
b21lbnQgaXQgaXMgc3BlY2lmaWMgdG8gTVAxMy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
