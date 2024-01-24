Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8270483A661
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 11:09:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39DF6C6DD6C;
	Wed, 24 Jan 2024 10:09:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D45AC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 10:09:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O9u0v7031076; Wed, 24 Jan 2024 11:09:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=E+ptdx/c28RZ6bn3ntnGPa3sENefNfXpM5d4ZjGqf3c=; b=g8
 Gl8cdbYXZIySCXhBkCloZFCIiSOcYG8qciw8zDyskwd8NA3vEVmfE+s857XW8k8O
 eEiNUSyvah5E3ZegC35FFpuzbNzciWUZRpBrhFsvCHj0Hj89+cdAFA/STTJiGPmp
 9Rr/jwnCtREAonoY2C37ORIQ5m/hbBcckDqMRYY8a5kAflByFadH/dmEQqoyE0kj
 Pfns20LJ8fqqebKPk2HcY4PlqorKmY84/uO0mT6CemqimZ7lq5AojLan311Ahsss
 x45c/tPyYGOE/f2vr6owe0WLjOUnbknz8KIZ5niWjOTF8GetP92TAAP7VRV21pnJ
 /8tVomnaKYslqNXtEY8w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vtmf7jkbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jan 2024 11:09:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 152FD10005D;
 Wed, 24 Jan 2024 11:09:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0969929BBC4;
 Wed, 24 Jan 2024 11:09:05 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 24 Jan
 2024 11:09:04 +0100
Message-ID: <bbf1c946-abf9-4a79-a58f-b170b35b904f@foss.st.com>
Date: Wed, 24 Jan 2024 11:09:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20231018203154.1681457-2-u.kleine-koenig@pengutronix.de>
 <j3i24md6kz2t7tw2teqbhhab2iywj6xkeg4qxw7do6jawm7jxw@ew64jmeef5zl>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <j3i24md6kz2t7tw2teqbhhab2iywj6xkeg4qxw7do6jawm7jxw@ew64jmeef5zl>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_04,2024-01-24_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: lxa-tac: drive
 powerboard lines as open-drain
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

CgpPbiAxLzI0LzI0IDExOjAxLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbywKPiAK
PiBPbiBXZWQsIE9jdCAxOCwgMjAyMyBhdCAxMDozMTo1NVBNICswMjAwLCBVd2UgS2xlaW5lLUvD
tm5pZyB3cm90ZToKPj4gRnJvbTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4
LmRlPgo+Pgo+PiBUaGlzIHJlc3VsdHMgaW4gYSBzbGlnaHQgaW1wcm92ZW1lbnQgaW4gRU1JIHBl
cmZvcm1hbmNlIGR1ZSB0byB0aGUgbGluZXMKPj4gbm8gbG9uZ2VyIGJlaW5nIGRyaXZlbiBieSB0
aGUgc29tZXdoYXQgbm9pc3kgVkREX0lPIHN1cHBseSBvZiB0aGUgU29NLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBMZW9uYXJkIEfDtmhycyA8bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+Cj4+IC0tLQo+PiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWx4YS10YWMt
Z2VuMi5kdHMgfCAyICstCj4+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eGMtbHhh
LXRhYy5kdHNpICAgICB8IDIgKy0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxNTdjLWx4YS10YWMtZ2VuMi5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTU3Yy1seGEtdGFjLWdlbjIuZHRzCj4+IGluZGV4IDhhMzRkMTVlOTAwNS4uNGNjMTc3MDMx
NjYxIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Yy1seGEt
dGFjLWdlbjIuZHRzCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWx4
YS10YWMtZ2VuMi5kdHMKPj4gQEAgLTE0OCw3ICsxNDgsNyBAQCBhZGNAMCB7Cj4+ICAgCQljb21w
YXRpYmxlID0gInRpLGxtcDkyMDY0IjsKPj4gICAJCXJlZyA9IDwwPjsKPj4gICAKPj4gLQkJcmVz
ZXQtZ3Bpb3MgPSA8JmdwaW9hIDQgR1BJT19BQ1RJVkVfSElHSD47Cj4+ICsJCXJlc2V0LWdwaW9z
ID0gPCZncGlvYSA0IChHUElPX0FDVElWRV9ISUdIIHwgR1BJT19PUEVOX0RSQUlOKT47Cj4+ICAg
CQlzaHVudC1yZXNpc3Rvci1taWNyby1vaG1zID0gPDE1MDAwPjsKPj4gICAJCXNwaS1tYXgtZnJl
cXVlbmN5ID0gPDUwMDAwMDA+Owo+PiAgIAkJdmRkLXN1cHBseSA9IDwmcmVnX3BiXzN2Mz47Cj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0
c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kKPj4gaW5k
ZXggZjA5YjdjMzg0YmQ5Li4xODhjOWNmYzcxMDIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMybXAxNXhjLWx4YS10YWMuZHRzaQo+PiArKysgYi9hcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kKPj4gQEAgLTQwOSw3ICs0MDksNyBAQCAm
c2RtbWMyIHsKPj4gICAmc3BpMiB7Cj4+ICAgCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+
ICAgCXBpbmN0cmwtMCA9IDwmc3BpMl9waW5zX2M+Owo+PiAtCWNzLWdwaW9zID0gPCZncGlvZiAx
MiBHUElPX0FDVElWRV9MT1c+Owo+PiArCWNzLWdwaW9zID0gPCZncGlvZiAxMiAoR1BJT19BQ1RJ
VkVfTE9XIHwgR1BJT19PUEVOX0RSQUlOKT47Cj4+ICAgCXN0YXR1cyA9ICJva2F5IjsKPj4gICB9
Owo+PiAgIAo+Pgo+PiBiYXNlLWNvbW1pdDogNGQ1YWIyMzc2ZWM1NzZhZjE3M2U1ZWFjMzg4N2Vk
MGI1MWJkODU2Ngo+IAo+IEdlbnRsZSBwaW5nLiBHaXZlbiB0aGlzIHBhdGNoIGlzIHR3byBtb250
aHMgb2xkIG5vdyBJIGFzc3VtZSBpdCBmZWxsCj4gdGhyb3VnaCB0aGUgY3JhY2tzPwo+IAoKWWVz
LCBhcG9sb2dpemUgZm9yIHRoYXQuCgpBcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpDaGVlcnMKQWxl
eAoKPiBCZXN0IHJlZ2FyZHMKPiBVV2UKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
