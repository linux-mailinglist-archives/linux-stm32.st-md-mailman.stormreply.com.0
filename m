Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5117EB0CF
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 14:26:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4104C6B44B;
	Tue, 14 Nov 2023 13:26:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 088E3C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 13:26:43 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AE8PX1N024036; Tue, 14 Nov 2023 14:26:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=EInGY1O7eeTJWEq3JL+TXEHTdFwdqTmcYlfV0KHYYDs=; b=75
 530B6v09vu9VhPmUMZ846tUxhiORtsLngdOQu6aqxMWQpnmHlmhy0X9pb8S6Debk
 GTlkMDIdOohxz16BXrEaNnSYgQL0WdIqf0S9YDcW9S1yw7A/zvzWEPn/sChWUQNs
 pWAMFjma0OMianEKwucHmnlVJ3/DToJcaZ0+FQsJ9iZXVN3Fz6AxOVDJ2ZfJMrV7
 nbYFwDrrPZEA1GREwgW9ZzsVGnTE/CqJhoqpgIl6KTlhuEKSNVj8eho/OPlK283x
 3NyQuzMqHnR6XvxgxGDBst+SPVUAW9zuZAUiwX+H9Qo5wo55WyLIyJMRzmLP1lyQ
 Hlrt26Sv/8zmMfVu6tvw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uam249hvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 14:26:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69A3E100038;
 Tue, 14 Nov 2023 14:26:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 619C02122E8;
 Tue, 14 Nov 2023 14:26:37 +0100 (CET)
Received: from [10.201.20.59] (10.201.20.59) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 14 Nov
 2023 14:26:36 +0100
Message-ID: <3e880744-ec9f-4c22-9913-81ec356f8073@foss.st.com>
Date: Tue, 14 Nov 2023 14:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
 <20231019200658.1754190-9-u.kleine-koenig@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20231019200658.1754190-9-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.201.20.59]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_13,2023-11-09_01,2023-05-22_02
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] pwm: stm32: Make ch parameter unsigned
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

T24gMTAvMTkvMjMgMjI6MDcsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEZyb206IFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gVGhlIGNoYW5uZWwgcGFyYW1l
dGVyIGlzIG9ubHkgZXZlciBzZXQgdG8gcHdtLT5od3B3bS4KPiBNYWtlIGl0IHVuc2lnbmVkIGlu
dCBhcyB3ZWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVu
Z3V0cm9uaXguZGU+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVycy9wd20vcHdtLXN0bTMyLmMg
fCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpIaSBVd2UsCgpZb3UgY2FuIGFkZCBteToKUmV2aWV3ZWQtYnk6IEZhYnJpY2UgR2Fz
bmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgoKVGhhbmtzLApGYWJyaWNlCgo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMvcHdtL3B3bS1z
dG0zMi5jCj4gaW5kZXggNWU0ODU4NGUzYmQ0Li4wMDlmOWMxYTVlY2EgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKPiArKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwo+
IEBAIC0zMDgsNyArMzA4LDcgQEAgc3RhdGljIGludCBzdG0zMl9wd21fY2FwdHVyZShzdHJ1Y3Qg
cHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4gIAlyZXR1cm4gcmV0Owo+
ICB9Cj4gIAo+IC1zdGF0aWMgaW50IHN0bTMyX3B3bV9jb25maWcoc3RydWN0IHN0bTMyX3B3bSAq
cHJpdiwgaW50IGNoLAo+ICtzdGF0aWMgaW50IHN0bTMyX3B3bV9jb25maWcoc3RydWN0IHN0bTMy
X3B3bSAqcHJpdiwgdW5zaWduZWQgaW50IGNoLAo+ICAJCQkgICAgaW50IGR1dHlfbnMsIGludCBw
ZXJpb2RfbnMpCj4gIHsKPiAgCXVuc2lnbmVkIGxvbmcgbG9uZyBwcmQsIGRpdiwgZHR5Owo+IEBA
IC0zNzEsNyArMzcxLDcgQEAgc3RhdGljIGludCBzdG0zMl9wd21fY29uZmlnKHN0cnVjdCBzdG0z
Ml9wd20gKnByaXYsIGludCBjaCwKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50
IHN0bTMyX3B3bV9zZXRfcG9sYXJpdHkoc3RydWN0IHN0bTMyX3B3bSAqcHJpdiwgaW50IGNoLAo+
ICtzdGF0aWMgaW50IHN0bTMyX3B3bV9zZXRfcG9sYXJpdHkoc3RydWN0IHN0bTMyX3B3bSAqcHJp
diwgdW5zaWduZWQgaW50IGNoLAo+ICAJCQkJICBlbnVtIHB3bV9wb2xhcml0eSBwb2xhcml0eSkK
PiAgewo+ICAJdTMyIG1hc2s7Cj4gQEAgLTM4Niw3ICszODYsNyBAQCBzdGF0aWMgaW50IHN0bTMy
X3B3bV9zZXRfcG9sYXJpdHkoc3RydWN0IHN0bTMyX3B3bSAqcHJpdiwgaW50IGNoLAo+ICAJcmV0
dXJuIDA7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgc3RtMzJfcHdtX2VuYWJsZShzdHJ1Y3Qgc3Rt
MzJfcHdtICpwcml2LCBpbnQgY2gpCj4gK3N0YXRpYyBpbnQgc3RtMzJfcHdtX2VuYWJsZShzdHJ1
Y3Qgc3RtMzJfcHdtICpwcml2LCB1bnNpZ25lZCBpbnQgY2gpCj4gIHsKPiAgCXUzMiBtYXNrOwo+
ICAJaW50IHJldDsKPiBAQCAtNDExLDcgKzQxMSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX2Vu
YWJsZShzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCBpbnQgY2gpCj4gIAlyZXR1cm4gMDsKPiAgfQo+
ICAKPiAtc3RhdGljIHZvaWQgc3RtMzJfcHdtX2Rpc2FibGUoc3RydWN0IHN0bTMyX3B3bSAqcHJp
diwgaW50IGNoKQo+ICtzdGF0aWMgdm9pZCBzdG0zMl9wd21fZGlzYWJsZShzdHJ1Y3Qgc3RtMzJf
cHdtICpwcml2LCB1bnNpZ25lZCBpbnQgY2gpCj4gIHsKPiAgCXUzMiBtYXNrOwo+ICAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
