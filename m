Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 842D8854A0A
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 14:07:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37022C57194;
	Wed, 14 Feb 2024 13:07:02 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0941CCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 13:07:00 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41EAkluT003447; Wed, 14 Feb 2024 14:05:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=6JiODRjaO2dJYsPTRF3ubKwIZmX6ilhdny5oB6yaPLo=; b=JE
 fKY8Q2CZX4CJjNoixt8t7tdmPidEzQ0ZdCTfuVH/0/UBKZtHUkD7pS/q0gCOW2ww
 kPNYaY9J0Wdu0PYy6Lp0trb7fAwRD5zFw9EIpmn6UMaK7Wy8TLgXbuQMrPHwx/Bg
 kIv7pkOkAy3Es3Uz2ABf2jqFVCJvII6Two+C/1m7yQstCAibbpJIyVs+BIln4eiR
 5pascRsmc0al9JpyaP0MqcXKVwRTjF+CSIPaoCJwpgl53VoNGo9qoxR56XA6UvxH
 dZNBCuUAvHlJyN1kZRvJr5Rx2ox32g0g6uLWnGKv3S7aCoDo9jV2mML5nrLoTLxJ
 AlhsOxKNgzg7lNIYrqww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6mynmkdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 14:05:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3F07240044;
 Wed, 14 Feb 2024 14:05:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE3A826C6C2;
 Wed, 14 Feb 2024 14:04:42 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 14 Feb
 2024 14:04:42 +0100
Message-ID: <a82bf354-f900-4f12-a9b7-0927403ecac3@foss.st.com>
Date: Wed, 14 Feb 2024 14:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20240129114649.2458468-2-u.kleine-koenig@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240129114649.2458468-2-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_06,2024-02-14_01,2023-05-22_02
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: lxa-tac: reduce RGMII
 interface drive strength
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

SGkKCk9uIDEvMjkvMjQgMTI6NDYsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEZyb206IExl
b25hcmQgR8O2aHJzIDxsLmdvZWhyc0BwZW5ndXRyb25peC5kZT4KPiAKPiBUaGlzIHJlc3VsdHMg
aW4gYW4gaW1wcm92ZW1lbnQgb2YgRU1JIHBlcmZvcm1hbmNlIGJ5IHJlZHVjaW5nIHRoZQo+IDEy
NU1IeiBlbWlzc2lvbiBhbmQgaXRzIGhhcm1vbmljcyBjYXVzZWQgYnkgdGhlIFJHTUlJIGNsb2Nr
IGxpbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1
dHJvbml4LmRlPgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTV4Yy1seGEtdGFjLmR0c2kgfCA0ICsrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1
eGMtbHhhLXRhYy5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eGMtbHhhLXRh
Yy5kdHNpCj4gaW5kZXggN2U4MzVhN2NmNjRhLi5jZmFmOGFkZGUzMTkgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eGMtbHhhLXRhYy5kdHNpCj4gKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eGMtbHhhLXRhYy5kdHNpCj4gQEAgLTQ3MSw2ICs0
NzEsMTAgQEAgc3dpdGNoOiBzd2l0Y2hAMCB7Cj4gICAJCWludGVycnVwdC1wYXJlbnQgPSA8Jmdw
aW9hPjsKPiAgIAkJaW50ZXJydXB0cyA9IDw2IElSUV9UWVBFX0VER0VfUklTSU5HPjsKPiAgIAo+
ICsJCS8qIFJlZHVjZSBSR01JSSBFTUkgZW1pc3Npb25zIGJ5IHJlZHVjaW5nIGRyaXZlIHN0cmVu
Z3RoICovCj4gKwkJbWljcm9jaGlwLGhpLWRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wID0gPDIwMDA+
Owo+ICsJCW1pY3JvY2hpcCxsby1kcml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDw4MDAwPjsKPiAr
Cj4gICAJCXBvcnRzIHsKPiAgIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAgCQkJI3NpemUt
Y2VsbHMgPSA8MD47CgpBcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpUaGFua3MKQWxleApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
