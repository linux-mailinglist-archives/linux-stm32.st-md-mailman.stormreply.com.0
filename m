Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04575586686
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 10:45:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3E37C640F5;
	Mon,  1 Aug 2022 08:45:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B559C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Aug 2022 08:45:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2716fT31028373;
 Mon, 1 Aug 2022 10:44:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=I7b/hxGMS8TVVccr6yHPdrkzx6SCaQqi8VD8U+Ok7Xg=;
 b=1IkGg+7obZoE0ft8TJqYz+tnL7JDta0hS3yx+4L8KUlVtXvxV7f35QjDy95IeR/ZX7Ef
 Keqtf5B6Onr9FLw8gwZwCDfKP8xPmw4y9g6XMA22Cg9rAXNh0l3yAkWjxL0SUZTFpGrJ
 kHqxKFCtkxBGcu5OV6ArYjPhkQ5PwpTT6eJlAg5hVXquqMxVB0lNThnq43ktFJNwpYjF
 epupnwDLMGRtYOlsK1AN1FGjWol+xoIqemlZwixIsTNaXAEwvEw+WOk2/c4ynGoU1miW
 tNxDeF8pqk1SeYgfjmr5LIOywp7Tn979sfW6VNj28wuNrZKIXMnMD3cG7OFu+K/1fxwi Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hmv013c5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 10:44:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E52A10002A;
 Mon,  1 Aug 2022 10:44:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 886F62194F6;
 Mon,  1 Aug 2022 10:44:30 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 1 Aug
 2022 10:44:29 +0200
Message-ID: <dcb245b7-1d2f-0f90-8be8-26688d184b5a@foss.st.com>
Date: Mon, 1 Aug 2022 10:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>
References: <20220519162838.695404-1-u.kleine-koenig@pengutronix.de>
 <20220519162838.695404-2-u.kleine-koenig@pengutronix.de>
 <20220720071834.augn2mtytqzqcixo@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220720071834.augn2mtytqzqcixo@pengutronix.de>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_04,2022-07-28_02,2022-06-22_01
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/2] ARM: dts: stm32mp15x: Add timer
	interrupts
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

SGkgVXdlCgpPbiA3LzIwLzIyIDA5OjE4LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxs
bywKPiAKPiBPbiBUaHUsIE1heSAxOSwgMjAyMiBhdCAwNjoyODozOFBNICswMjAwLCBVd2UgS2xl
aW5lLUvDtm5pZyB3cm90ZToKPj4gVGhlIHRpbWVyIHVuaXRzIGluIHRoZSBzdG0zMm1wMTV4IENQ
VXMgaGF2ZSBpbnRlcnJ1cHRzLCBkZXBlbmRpbmcgb24gdGhlCj4+IHRpbWVyIGZsYXZvdXIgZWl0
aGVyIG9uZSAiZ2xvYmFsIiBvciBmb3VyIGRlZGljYXRlZCBvbmVzLiBBZGQgdGhlIGlycXMKPj4g
dG8gdGhlIHRpbWVyIHVuaXRzIG9uIHN0bTMybXAxNXguCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gVGhp
cyBwYXRjaCB3YXNuJ3QgcGlja2VkIHVwIHlldCAoYXQgbGVhc3Qgbm9ib2R5IHRvbGQgdG8gaGF2
ZSBkb25lIGl0Cj4gYW5kIGl0J3Mgbm90IGluIG5leHQpLiBJcyB0aGVyZSBhIHByb2JsZW0gb3Ro
ZXIgdGhhbiBubyBtYWludGFpbmVyIHRpbWU/Cj4gCj4gQmVzdCByZWdhcmRzCj4gVXdlCj4gCgpJ
IHdhcyB3YWl0aW5nIGZvciBhIHJldmlldyBmcm9tIFJvYiBvciBLcnp5c3p0b2Ygb24gYmluZGlu
Z3MgcGF0Y2ggWzFdLiAKTGV0IG1lIGtub3cgaWYgSSBtaXNzZWQgaXQuCgpBbGV4CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
