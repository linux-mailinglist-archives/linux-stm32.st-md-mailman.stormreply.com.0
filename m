Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D111891A1C7
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 10:42:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ABD0C71282;
	Thu, 27 Jun 2024 08:42:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3243C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 08:42:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R8034X026625;
 Thu, 27 Jun 2024 10:39:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 xjPP4W+BU82TAbrE67kZo4dj4qLTsmEemGauaFgAobA=; b=W2SOULC79NbGB1SK
 TGwMKVzCHognJFgsosC1vhq3ie5daPOd9KT4b/1JONSE6kU7po0tFY6zralW6uS2
 L8QSxXO6Rl+mPFLww9WCfWzwAGLgo6KArLGYxHBRTN88wqewlFzStM+qTla/9nsn
 xJyh2dNAXox0vn6nRd4cMbpj7wJ+Je1J0UasI4FsRv/VHQfmhHUqcEbwcFuBMaJG
 GGXN9UqKvwXpF7kDvr31LMoMYeNO3KdQvjtLh7FP5qqV8oui8FiQFHO+dwIIlETZ
 i3GnE/BvqEIAn+LNQsRAnzOWo6SS6EU6E5LqR/jwsqNVBT3oZcZLdgBUSukJ7Fp6
 pXkRaw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywnxxmest-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 10:39:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 664CE4002D;
 Thu, 27 Jun 2024 10:39:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D8A62132F8;
 Thu, 27 Jun 2024 10:38:35 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 27 Jun
 2024 10:38:35 +0200
Message-ID: <b2796be8-d372-44e6-959c-e212097e99e8@foss.st.com>
Date: Thu, 27 Jun 2024 10:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
References: <20240613080229.2292413-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240613080229.2292413-2-u.kleine-koenig@baylibre.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_04,2024-06-25_01,2024-05-17_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32mp135f-dk: Document output
	pins for PWMs
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

SGkgVXdlCgpPbiA2LzEzLzI0IDEwOjAyLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUbyBz
aW1wbGlmeSBpZGVudGlmeWluZyB0aGUgcGlucyB3aGVyZSB0aGUgUFdNIG91dHB1dCBpcyByb3V0
ZWQgdG8sCj4gYWRkIGEgY29tbWVudCB0byBlYWNoIFBXTSBkZXZpY2UgYWJvdXQgdGhlIHJlc3Bl
Y3RpdmUgcGluIG9uIHRoZQo+IGV4cGFuc2lvbiBjb25uZWN0b3IuCj4gCj4gU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Cj4gLS0t
Cj4gICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdHMgfCA0ICsrKysKPiAg
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGsuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDEzNWYtZGsuZHRzCj4gaW5kZXggNTY3ZTUzYWQyODVmLi5mMWI1MGU0YzEwNTkgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGsuZHRzCj4gKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGsuZHRzCj4gQEAgLTI3Myw2ICsy
NzMsNyBAQCAmdGltZXJzMyB7Cj4gICAJL2RlbGV0ZS1wcm9wZXJ0eS9kbWEtbmFtZXM7Cj4gICAJ
c3RhdHVzID0gImRpc2FibGVkIjsKPiAgIAlwd20gewo+ICsJCS8qIFBXTSBvdXRwdXQgb24gcGlu
IDcgb2YgdGhlIGV4cGFuc2lvbiBjb25uZWN0b3IgKENOOC43KSB1c2luZyBUSU0zX0NINCBmdW5j
dGlvbiAqLwo+ICAgCQlwaW5jdHJsLTAgPSA8JnB3bTNfcGluc19hPjsKPiAgIAkJcGluY3RybC0x
ID0gPCZwd20zX3NsZWVwX3BpbnNfYT47Cj4gICAJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIs
ICJzbGVlcCI7Cj4gQEAgLTI4OCw2ICsyODksNyBAQCAmdGltZXJzNCB7Cj4gICAJL2RlbGV0ZS1w
cm9wZXJ0eS9kbWEtbmFtZXM7Cj4gICAJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgIAlwd20gewo+
ICsJCS8qIFBXTSBvdXRwdXQgb24gcGluIDMxIG9mIHRoZSBleHBhbnNpb24gY29ubmVjdG9yIChD
TjguMzEpIHVzaW5nIFRJTTRfQ0gyIGZ1bmN0aW9uICovCj4gICAJCXBpbmN0cmwtMCA9IDwmcHdt
NF9waW5zX2E+Owo+ICAgCQlwaW5jdHJsLTEgPSA8JnB3bTRfc2xlZXBfcGluc19hPjsKPiAgIAkJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIjsKPiBAQCAtMzAzLDYgKzMwNSw3IEBA
ICZ0aW1lcnM4IHsKPiAgIAkvZGVsZXRlLXByb3BlcnR5L2RtYS1uYW1lczsKPiAgIAlzdGF0dXMg
PSAiZGlzYWJsZWQiOwo+ICAgCXB3bSB7Cj4gKwkJLyogUFdNIG91dHB1dCBvbiBwaW4gMzIgb2Yg
dGhlIGV4cGFuc2lvbiBjb25uZWN0b3IgKENOOC4zMikgdXNpbmcgVElNOF9DSDMgZnVuY3Rpb24g
Ki8KPiAgIAkJcGluY3RybC0wID0gPCZwd204X3BpbnNfYT47Cj4gICAJCXBpbmN0cmwtMSA9IDwm
cHdtOF9zbGVlcF9waW5zX2E+Owo+ICAgCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic2xl
ZXAiOwo+IEBAIC0zMTYsNiArMzE5LDcgQEAgdGltZXJANyB7Cj4gICAmdGltZXJzMTQgewo+ICAg
CXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gICAJcHdtIHsKPiArCQkvKiBQV00gb3V0cHV0IG9uIHBp
biAzMyBvZiB0aGUgZXhwYW5zaW9uIGNvbm5lY3RvciAoQ044LjMzKSB1c2luZyBUSU0xNF9DSDEg
ZnVuY3Rpb24gKi8KPiAgIAkJcGluY3RybC0wID0gPCZwd20xNF9waW5zX2E+Owo+ICAgCQlwaW5j
dHJsLTEgPSA8JnB3bTE0X3NsZWVwX3BpbnNfYT47Cj4gICAJCXBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCIsICJzbGVlcCI7Cj4gCj4gYmFzZS1jb21taXQ6IDE2MTNlNjA0ZGYwY2QzNTljZjJhN2Zi
ZDliZTdhMGJjZmFjZmFiZDAKCkdvb2QgaWRlYS4gU29tZSBsaW5lcyBleGNlZWQgdGhlIDEwMCBj
aGFyLiBJIGNvdWxkIHJlbW92ZSAiZnVuY3Rpb24iIG9yIApvbmx5IGtlZXAgImZ1bmMiIGluc3Rl
YWQuIFdoYXQgZG8gdSB0aGluayA/CgpOb3RlIGFsc28gdGhhdCBjb21taXQgc2hvdWxkIGJlOiAi
QVJNOiBkdHM6IHN0bTMyOiAuLi4uIi4gaSBjYW4gZml4IGl0IApieSBteXNlbGYuCgpBbGV4Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
