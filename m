Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6338487D147
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Mar 2024 17:40:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EAB7C6DD69;
	Fri, 15 Mar 2024 16:40:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88B93C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 16:40:27 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42FEkFZJ021920; Fri, 15 Mar 2024 17:40:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=8yeqzO7B3mr+EiV0jNhU6eDDqyUYHa/uGezqm7wGIkE=; b=Yy
 62tgn3Hs4grXiop+HVWVvKqNlc14T5Jo0qKRA+dy4ZrcehKjkKVOS02Yzbkq/EqE
 deDE2uk+QO6Ya+Yj6rKoFubJJu9A99/DXSJv6rkgMXRR/Yu3PUTn1LO+RGEmnPYK
 3vHCXCDEs0anPL5igDIUFqXCQuBYwsmdLgSU65gb31u62WaFU7mD+egLTgUoDG2Y
 dZUA/vcyz6t1o4HMMX5tZnflVOJIcYAZXYeJnlwLBSyWgBIyeQXJACtiZPv0+C5v
 eLhsc82Bn70D4IK/by7RUXr03LuNcezsjN9Ua27B7A3FBZvE4md7lj1+Y7yYeSZc
 BXaBEBQGxisDhQoiw6MQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wv9y9ut90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Mar 2024 17:40:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A03034002D;
 Fri, 15 Mar 2024 17:39:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBF7D2801CF;
 Fri, 15 Mar 2024 17:39:36 +0100 (CET)
Received: from [10.252.9.197] (10.252.9.197) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Mar
 2024 17:39:35 +0100
Message-ID: <861cb184-42ee-4f27-9b0c-3129d52cc706@foss.st.com>
Date: Fri, 15 Mar 2024 17:39:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 <linux-pwm@vger.kernel.org>
References: <20240315145443.982807-2-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20240315145443.982807-2-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.252.9.197]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-15_04,2024-03-13_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Add error messages in
	.probe()'s error paths
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

T24gMy8xNS8yNCAxNTo1NCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gR2l2aW5nIGFuIGlu
ZGljYXRpb24gYWJvdXQgdGhlIHByb2JsZW0gaWYgcHJvYmluZyBhIGRldmljZSBmYWlscyBpcyBh
Cj4gbmljZSBtb3ZlLiBEbyB0aGF0IGZvciB0aGUgc3RtMzIgcHdtIGRyaXZlci4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlPgoKSGkgVXdlLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB5b3UgY2FuIGFkZCBteToKUmV2
aWV3ZWQtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgoK
QmVzdCBSZWdhcmRzLApGYWJyaWNlCgo+IC0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyB8
IDkgKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIGIvZHJpdmVy
cy9wd20vcHdtLXN0bTMyLmMKPiBpbmRleCAwYzAyOGQxN2MwNzUuLmZmZTU3MmI3NjE3NCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwo+ICsrKyBiL2RyaXZlcnMvcHdtL3B3
bS1zdG0zMi5jCj4gQEAgLTY0OCwxMSArNjQ4LDEzIEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlwcml2LT5tYXhfYXJyID0gZGRh
dGEtPm1heF9hcnI7Cj4gIAo+ICAJaWYgKCFwcml2LT5yZWdtYXAgfHwgIXByaXYtPmNsaykKPiAt
CQlyZXR1cm4gLUVJTlZBTDsKPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUws
ICJGYWlsZWQgdG8gZ2V0ICVzXG4iLAo+ICsJCQkJICAgICBwcml2LT5yZWdtYXAgPyAiY2xrIiA6
ICJyZWdtYXAiKTsKPiAgCj4gIAlyZXQgPSBzdG0zMl9wd21fcHJvYmVfYnJlYWtpbnB1dHMocHJp
diwgbnApOwo+ICAJaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJCXJldHVybiBkZXZfZXJy
X3Byb2JlKGRldiwgcmV0LAo+ICsJCQkJICAgICAiRmFpbGVkIHRvIGNvbmZpZ3VyZSBicmVha2lu
cHV0c1xuIik7Cj4gIAo+ICAJc3RtMzJfcHdtX2RldGVjdF9jb21wbGVtZW50YXJ5KHByaXYpOwo+
ICAKPiBAQCAtNjY0LDcgKzY2Niw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJcmV0ID0gZGV2bV9wd21jaGlwX2FkZChk
ZXYsIGNoaXApOwo+ICAJaWYgKHJldCA8IDApCj4gLQkJcmV0dXJuIHJldDsKPiArCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZShkZXYsIHJldCwKPiArCQkJCSAgICAgIkZhaWxlZCB0byByZWdpc3RlciBw
d21jaGlwXG4iKTsKPiAgCj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBjaGlwKTsKPiAg
Cj4gCj4gYmFzZS1jb21taXQ6IGRkNmM2ZDU3YWI2MWQ0OTZmNmZmN2Q2Y2EzODYxMTA2MmFmMTQy
YTEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
