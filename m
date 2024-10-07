Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5552993069
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 17:02:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DF4DC6DD94;
	Mon,  7 Oct 2024 15:02:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42FF4C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 15:02:42 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497EXR3A003950;
 Mon, 7 Oct 2024 17:02:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 I0LlClbgeKDBHJrm3HldlhZvNAnt4HDdPl4EU0YX6zc=; b=uCi0A54UigacpP8b
 EWJWXMHODBTuB+ieZqoxhr5y4mYPP9P8RaGlrlT6uewrOgZMWDyNnrF6Ml68lq9Y
 F6D9OKv9+DkL+4sABpBOGe/udyd5SZxAjKFkWBt3IO82+5c2HdtsF68EYot6ffR0
 +aSzGJm71CWso9RHA16ciar0EGpZTAurmqVJWjBRUuF71Y5KO4AU/xMJwVBf0ddJ
 uRd2YM0b99Ne1/FVsDxvMuwvz6d2DiAiP2f+YwGUA6gz2lKfk2AXYC0T88KpDnKb
 S1c5ulM1dew4y608JrP2jSbVOi+HUFEZn/Rl0D61p8a/UknMp+AgpE4iJ/cjGgDc
 iPpSng==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f10ptcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 17:02:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C2F7C40046;
 Mon,  7 Oct 2024 17:00:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 149DD226FAB;
 Mon,  7 Oct 2024 16:59:55 +0200 (CEST)
Received: from [10.48.86.225] (10.48.86.225) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 16:59:54 +0200
Message-ID: <d4bfc454-5a20-4cee-85f6-118323c46eca@foss.st.com>
Date: Mon, 7 Oct 2024 16:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, Olivia Mackall <olivia@selenic.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
 <20241007132721.168428-5-gatien.chevallier@foss.st.com>
 <869fe073-c20f-4611-ae84-8268a890a12c@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <869fe073-c20f-4611-ae84-8268a890a12c@denx.de>
X-Originating-IP: [10.48.86.225]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] arm64: dts: st: add RNG node on
	stm32mp251
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

CgpPbiAxMC83LzI0IDE1OjU1LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiAxMC83LzI0IDM6Mjcg
UE0sIEdhdGllbiBDaGV2YWxsaWVyIHdyb3RlOgo+PiBVcGRhdGUgdGhlIGRldmljZS10cmVlIHN0
bTMybXAyNTEuZHRzaSBieSBhZGRpbmcgdGhlIFJhbmRvbSBOdW1iZXIKPj4gR2VuZXJhdG9yKFJO
Rykgbm9kZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogR2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5j
aGV2YWxsaWVyQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9z
dC9zdG0zMm1wMjUxLmR0c2kgfCAxMCArKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0
L3N0bTMybXAyNTEuZHRzaSAKPj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEu
ZHRzaQo+PiBpbmRleCAxMTY3Y2Y2M2Q3ZTguLjQwYjk2MzUzYTgwMyAxMDA2NDQKPj4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPj4gQEAgLTQ5Myw2ICs0OTMsMTYgQEAgdWFy
dDg6IHNlcmlhbEA0MDM4MDAwMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcm5nOiBybmdANDIwMjAwMDAgewo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDI1LXJuZyI7
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4NDIwMjAwMDAgMHg0
MDA+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmY2xrX3Jj
YnNlYz4sIDwmcmNjIENLX0JVU19STkc+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNsb2NrLW5hbWVzID0gInJuZ19jbGsiLCAicm5nX2hjbGsiOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJlc2V0cyA9IDwmcmNjIFJOR19SPjsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBhY2Nlc3MtY29udHJvbGxlcnMgPSA8JnJpZnNjIDkyPjsKPiBJ
dCB3b3VsZCBiZSBnb29kIGlmIHNvbWVvbmUgZmluYWxseSBzb3J0ZWQgdGhlIGFjY2Vzcy1jb250
cm9sbGVycyAKPiBwcm9wZXJ0eSBpbiBhbGwgdGhlIE1QMiBub2RlcyBhbHBoYWJldGljYWxseSA7
IHRoYXQncyBzZXBhcmF0ZSAKPiBwYXRjaC9zZXJpZXMgdGhvdWdoLgoKSSdsbCBwaW4geW91ciBj
b21tZW50IHRvIHRha2UgYSBsb29rIGludG8gdGhhdCBpbiB0aGUgbmVhciBmdXR1cmUuCgpHYXRp
ZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
