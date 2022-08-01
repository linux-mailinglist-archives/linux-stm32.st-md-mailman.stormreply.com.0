Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA2D586BF9
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 15:29:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 384D6C640F5;
	Mon,  1 Aug 2022 13:29:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE833C03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Aug 2022 13:29:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2719pgGx003239;
 Mon, 1 Aug 2022 15:28:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=a1HMbAEdWLn+FNF0+2Ws3CrNvw3tnB1rE4cGaL0xKU0=;
 b=qol5DtfArmU94z+/2n3ug/4IRssv3XMghvPVAM8f2WKpRltEuz/GXnQRqgP/yZkUwlhm
 djib4mYZb5bf7yQv8z4fNHsqrRQY6d8J26oHW909/0z6o9iDDXbZlh8vLAAo8KT+VPrF
 jHh9VoAxvwejpyJaiQDlNUrIxi4iINMsvLwxv7gdbZMVmcpAMWrFxkozfSkw39YHuzfL
 qVINoTOgQJU5qEdk9itVyUbUVMyFMzXGOCJ11K3ek+gJAYruazcVbYXXehvKLl3mZbBI
 sHqztlzSGja0qIuqhXsbjhZyF8xAprR0vGyRQyRbFTM632ughhiGGX8cnHUIlJvqiFva sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hmv01527w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 15:28:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE51910002A;
 Mon,  1 Aug 2022 15:28:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7E4922D18D;
 Mon,  1 Aug 2022 15:28:45 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 1 Aug
 2022 15:28:44 +0200
Message-ID: <0323004a-c948-d3a6-03b0-480b2171ee67@foss.st.com>
Date: Mon, 1 Aug 2022 15:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20220519162838.695404-1-u.kleine-koenig@pengutronix.de>
 <20220519162838.695404-2-u.kleine-koenig@pengutronix.de>
 <20220720071834.augn2mtytqzqcixo@pengutronix.de>
 <dcb245b7-1d2f-0f90-8be8-26688d184b5a@foss.st.com>
 <20220801095308.5ueokezguhfcug3u@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220801095308.5ueokezguhfcug3u@pengutronix.de>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_07,2022-08-01_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

T24gOC8xLzIyIDExOjUzLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBPbiBNb24sIEF1ZyAw
MSwgMjAyMiBhdCAxMDo0NDoyOEFNICswMjAwLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+PiBI
aSBVd2UKPj4KPj4gT24gNy8yMC8yMiAwOToxOCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+
PiBIZWxsbywKPj4+Cj4+PiBPbiBUaHUsIE1heSAxOSwgMjAyMiBhdCAwNjoyODozOFBNICswMjAw
LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4+PiBUaGUgdGltZXIgdW5pdHMgaW4gdGhlIHN0
bTMybXAxNXggQ1BVcyBoYXZlIGludGVycnVwdHMsIGRlcGVuZGluZyBvbiB0aGUKPj4+PiB0aW1l
ciBmbGF2b3VyIGVpdGhlciBvbmUgImdsb2JhbCIgb3IgZm91ciBkZWRpY2F0ZWQgb25lcy4gQWRk
IHRoZSBpcnFzCj4+Pj4gdG8gdGhlIHRpbWVyIHVuaXRzIG9uIHN0bTMybXAxNXguCj4+Pj4KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlPgo+Pj4KPj4+IFRoaXMgcGF0Y2ggd2Fzbid0IHBpY2tlZCB1cCB5ZXQgKGF0IGxl
YXN0IG5vYm9keSB0b2xkIHRvIGhhdmUgZG9uZSBpdAo+Pj4gYW5kIGl0J3Mgbm90IGluIG5leHQp
LiBJcyB0aGVyZSBhIHByb2JsZW0gb3RoZXIgdGhhbiBubyBtYWludGFpbmVyIHRpbWU/Cj4+Pgo+
Pj4gQmVzdCByZWdhcmRzCj4+PiBVd2UKPj4+Cj4+Cj4+IEkgd2FzIHdhaXRpbmcgZm9yIGEgcmV2
aWV3IGZyb20gUm9iIG9yIEtyenlzenRvZiBvbiBiaW5kaW5ncyBwYXRjaCBbMV0uIExldAo+PiBt
ZSBrbm93IGlmIEkgbWlzc2VkIGl0Lgo+IAo+IFlvdSBkaWQ6Cj4gCj4gUGF0Y2ggIzEgd2FzIHJl
dmlld2VkIGJ5IFJvYiBhbmQgdGFrZW4gYnkgTGVlLCBjdXJyZW50bHkgd2FpdGluZyBpbgo+ICdm
b3ItbWZkLW5leHQnIG9mCj4gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2xlZS9tZmQuZ2l0IGFzCj4gOTg3NWFiNTNjOGFlICgiZHQtYmluZGluZ3M6IG1mZDog
c3RtMzItdGltZXJzOiBEb2N1bWVudCBob3cgdG8gc3BlY2lmeQo+IGludGVycnVwdHMiKS4KCk9r
LCBteSBtaXN0YWtlLiBJJ2xsIGFwcGx5IGl0IGZvciB2NS4yMS4KCkNoZWVycwpBbGV4Cgo+IAo+
IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
