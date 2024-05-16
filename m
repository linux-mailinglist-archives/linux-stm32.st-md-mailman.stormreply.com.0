Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E52AA8C7575
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 13:48:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AD0DC6C83A;
	Thu, 16 May 2024 11:48:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8A17C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 11:48:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G75xZv015041;
 Thu, 16 May 2024 13:48:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=FyX+6EeX2zYSgDjp5p8BhJzA6/x8bIKgkLN30SXYigU=; b=sw
 yyqX7OpzrgCwcEqYkUTPKAjdJuxzbZPKbyE/oSVpph7W+q+0MkUL7kp3Y4iXOMQ3
 ztZOX1efIXcDNYfD97e7KrJLT0rYXt976vy4NfE++5iyjg96+IufoX36K5akdCnp
 z2EGTfWBr5RLGLb/Wgicz7q+qfxUaE4iED5byimWT1Kevv5+BcgfwOoLNpVJUYCI
 x2X6mTdsYmgdC/IdS0hD5h+HTQ+HJBCUkPRmzMnrnjVcTUAIc3DceUD/dxG1FZSV
 eP9Cwcakx53NrZcWOuaRVX9X1o0/G/x5b6HDZbSL0AGjoQliCSKoHR+ZUxvOVtqd
 BzMsMl+dvvNGiecIWvOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4sxv5ehv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 May 2024 13:48:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 033AC4002D;
 Thu, 16 May 2024 13:48:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7E8F218604;
 Thu, 16 May 2024 13:47:14 +0200 (CEST)
Received: from [10.48.87.204] (10.48.87.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 13:47:14 +0200
Message-ID: <8ec4286e-3477-4fcd-8176-5c3a6606f0a1@foss.st.com>
Date: Thu, 16 May 2024 13:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-crypto@vger.kernel.org>
References: <20240516012210.128307-1-marex@denx.de>
 <20240516012210.128307-2-marex@denx.de>
 <1e2da893-efff-4f7c-9842-a9484e4c2230@foss.st.com>
 <404122b2-75fe-4da6-8167-fb98eba7f941@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <404122b2-75fe-4da6-8167-fb98eba7f941@denx.de>
X-Originating-IP: [10.48.87.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_05,2024-05-15_01,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Yang Yingliang <yangyingliang@huawei.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] hwrng: stm32 - cache device pointer
 in struct stm32_rng_private
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

CgpPbiA1LzE2LzI0IDEyOjUyLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA1LzE2LzI0IDExOjM3
IEFNLCBHYXRpZW4gQ0hFVkFMTElFUiB3cm90ZToKPiAKPiBIaSwKPiAKPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jIAo+Pj4gYi9kcml2ZXJzL2NoYXIv
aHdfcmFuZG9tL3N0bTMyLXJuZy5jCj4+PiBpbmRleCA2ZGVjNGFkYzQ5ODUzLi4wMDAxMmU2ZTRj
Y2M4IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcuYwo+
Pj4gKysrIGIvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcuYwo+Pj4gQEAgLTcwLDYg
KzcwLDcgQEAgc3RydWN0IHN0bTMyX3JuZ19jb25maWcgewo+Pj4gwqAgc3RydWN0IHN0bTMyX3Ju
Z19wcml2YXRlIHsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IGh3cm5nIHJuZzsKPj4+ICvCoMKgwqAg
c3RydWN0IGRldmljZSAqZGV2Owo+Pj4gwqDCoMKgwqDCoCB2b2lkIF9faW9tZW0gKmJhc2U7Cj4+
PiDCoMKgwqDCoMKgIHN0cnVjdCBjbGsgKmNsazsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IHJlc2V0
X2NvbnRyb2wgKnJzdDsKPj4+IEBAIC05OSw3ICsxMDAsNyBAQCBzdHJ1Y3Qgc3RtMzJfcm5nX3By
aXZhdGUgewo+Pj4gwqDCoCAqLwo+Pj4gwqAgc3RhdGljIGludCBzdG0zMl9ybmdfY29uY2VhbF9z
ZWVkX2Vycm9yX2NvbmRfcmVzZXQoc3RydWN0IAo+Pj4gc3RtMzJfcm5nX3ByaXZhdGUgKnByaXYp
Cj4+PiDCoCB7Cj4+PiAtwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9IChzdHJ1Y3QgZGV2aWNl
ICopcHJpdi0+cm5nLnByaXY7Cj4+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9IHByaXYt
PmRldjsKPj4+IMKgwqDCoMKgwqAgdTMyIHNyID0gcmVhZGxfcmVsYXhlZChwcml2LT5iYXNlICsg
Uk5HX1NSKTsKPj4+IMKgwqDCoMKgwqAgdTMyIGNyID0gcmVhZGxfcmVsYXhlZChwcml2LT5iYXNl
ICsgUk5HX0NSKTsKPj4+IMKgwqDCoMKgwqAgaW50IGVycjsKPj4+IEBAIC0xNzEsNyArMTcyLDcg
QEAgc3RhdGljIGludCBzdG0zMl9ybmdfY29uY2VhbF9zZWVkX2Vycm9yKHN0cnVjdCAKPj4+IGh3
cm5nICpybmcpCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBzdG0zMl9ybmdfcHJpdmF0
ZSAqcHJpdiA9IGNvbnRhaW5lcl9vZihybmcsIHN0cnVjdCAKPj4+IHN0bTMyX3JuZ19wcml2YXRl
LCBybmcpOwo+Pj4gLcKgwqDCoCBkZXZfZGJnKChzdHJ1Y3QgZGV2aWNlICopcHJpdi0+cm5nLnBy
aXYsICJDb25jZWFsaW5nIHNlZWQgCj4+PiBlcnJvclxuIik7Cj4+PiArwqDCoMKgIGRldl9kYmco
cHJpdi0+ZGV2LCAiQ29uY2VhbGluZyBzZWVkIGVycm9yXG4iKTsKPj4+IMKgwqDCoMKgwqAgaWYg
KHByaXYtPmRhdGEtPmhhc19jb25kX3Jlc2V0KQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBzdG0zMl9ybmdfY29uY2VhbF9zZWVkX2Vycm9yX2NvbmRfcmVzZXQocHJpdik7Cj4+PiBAQCAt
MTg3LDcgKzE4OCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcm5nX3JlYWQoc3RydWN0IGh3cm5nICpy
bmcsIHZvaWQgCj4+PiAqZGF0YSwgc2l6ZV90IG1heCwgYm9vbCB3YWl0KQo+Pj4gwqDCoMKgwqDC
oCBpbnQgcmV0dmFsID0gMCwgZXJyID0gMDsKPj4+IMKgwqDCoMKgwqAgdTMyIHNyOwo+Pj4gLcKg
wqDCoCByZXR2YWwgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KChzdHJ1Y3QgZGV2aWNlIAo+
Pj4gKilwcml2LT5ybmcucHJpdik7Cj4+PiArwqDCoMKgIHJldHZhbCA9IHBtX3J1bnRpbWVfcmVz
dW1lX2FuZF9nZXQocHJpdi0+ZGV2KTsKPj4+IMKgwqDCoMKgwqAgaWYgKHJldHZhbCkKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0dmFsOwo+Pj4gQEAgLTIwNiw3ICsyMDcsNyBAQCBz
dGF0aWMgaW50IHN0bTMyX3JuZ19yZWFkKHN0cnVjdCBod3JuZyAqcm5nLCB2b2lkIAo+Pj4gKmRh
dGEsIHNpemVfdCBtYXgsIGJvb2wgd2FpdCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzciwgc3IsCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMTAsIDUwMDAwKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChlcnIpIHsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vy
cigoc3RydWN0IGRldmljZSAqKXByaXYtPnJuZy5wcml2LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZXZfZXJyKHByaXYtPmRldiwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiJXM6IHRpbWVvdXQgJXghXG4iLCBfX2Z1bmNfXywgc3Ip
Owo+Pgo+PiBOaXQ6IEZpdHMgaW4gb25lIGxpbmUKPiAKPiBUaGUgbGltaXQgaXMgbm93IDEwMCBp
bnN0ZWFkIG9mIDgwIGNoYXJzLCByaWdodCA/Cj4gCj4gYnR3IEkgZm91bmQgb25lIG1vcmUgYW5k
IGZpeGVkIGl0LgoKWWVzIGl0IGlzLAoKdGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
