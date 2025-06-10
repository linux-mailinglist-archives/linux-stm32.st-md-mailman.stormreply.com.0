Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECADAD360D
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 14:23:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E65DC32EA8;
	Tue, 10 Jun 2025 12:23:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E926C32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 12:23:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLEIT013926;
 Tue, 10 Jun 2025 14:22:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 vtivjLTREzj3xhUyN5Ni31CViS5Q+PvnvLeG0iZlrcE=; b=sB2y45r3vLSNQ2D3
 Uvp21XuXqL78esQhQKZfXzybGiUPlzMD5WzROhXNXMhz5I2Qf6sA+3XtzhPR6yhA
 z8goGGaGkQfFtjmXGXrITS0+041glQb3O3RAHkD58LC4eqNMq4bPjj/V9bRwFoH0
 Oew+fMowKFeQ0HrorR+qQvpTuDI2ZqoHx3uNe14eopQ7fy/o5JjlOEA3njYbw8Du
 HQTCZLXPseBl7Upk4UihrQCFvMqq4vL+M/eTnYzp4d/sxCysSXNVI6GfdpjxMVwc
 VvtKTNsQVCO3Lo/tedoEj5C6QHjUPdt5wRzxrBEFflTbQF98Zr9vHHmVkQLz5bfH
 jqVooQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahm2yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 14:22:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3F73440066;
 Tue, 10 Jun 2025 14:21:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD68CB2149E;
 Tue, 10 Jun 2025 14:20:28 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:20:28 +0200
Message-ID: <3a9e5a1b-41fd-4ddf-938a-bed98551a024@foss.st.com>
Date: Tue, 10 Jun 2025 14:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linus.walleij@linaro.org>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/9] Introduce HDP support for STM32MP
	platforms
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

T24gNi81LzI1IDE1OjAzLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IE9uIFdlZCwgTWF5IDI4LCAy
MDI1IGF0IDM6MzPigK9QTSBDbMOpbWVudCBMZSBHb2ZmaWMKPiA8Y2xlbWVudC5sZWdvZmZpY0Bm
b3NzLnN0LmNvbT4gd3JvdGU6Cj4gCj4+IENsw6ltZW50IExlIEdvZmZpYyAoOSk6Cj4+ICAgICAg
ICBncGlvOiBtbWlvOiBhZGQgQkdQSU9GX05PX0lOUFVUIGZsYWcgZm9yIEdQTyBncGlvY2hpcAo+
PiAgICAgICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IHN0bTMyOiBJbnRyb2R1Y2UgSERQCj4+ICAg
ICAgICBwaW5jdHJsOiBzdG0zMjogSW50cm9kdWNlIEhEUCBkcml2ZXIKPj4gICAgICAgIE1BSU5U
QUlORVJTOiBhZGQgQ2zDqW1lbnQgTGUgR29mZmljIGFzIFNUTTMyIEhEUCBtYWludGFpbmVyCj4g
Cj4gQ2FuIEkgYXBwbHkgdGhlIGRyaXZlciBhbmQgYmluZGluZ3MgcGF0Y2hlcyAxLTQgc2VwYXJh
dGVseQo+IGZyb20gdGhlIHJlc3Qgb2YgdGhlIHNlcmllcz8KClRoZSBNQUlOVEFJTkVSUyBmaWxl
IHdpbGwgbmVlZCBhIGZpeCBpbiB0aGUgZnV0dXJlIHJldmlzaW9uLgpJJ2xsIHdhaXQgS3J6eXN6
dG9mIGFuc3dlcnMgYmVmb3JlIHN1Ym1pdHRpbmcgYSBWNSB3aXRoIHRoZSBmaXguCgpPdGhlcndp
c2UgcGF0Y2ggMS0zIGNhbiBiZSBtZXJnZWQsIGJ1dCBJIHRoaW5rIHlvdSBtYXkgbmVlZCB0aGUg
Ck1BSU5UQUlORVJTIGZpbGUgdG8gbWVyZ2UgdGhlIGRyaXZlciArIGJpbmRpbmdzLgoKQ2zDqW1l
bnQKCj4gCj4+ICAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0
IChIRFApIG9uIHN0bTMybXAxMwo+PiAgICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdh
cmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTUKPj4gICAgICAgIEFSTTogZHRzOiBzdG0z
MjogYWRkIEhhcmR3YXJlIGRlYnVnIHBvcnQgKEhEUCkgb24gc3RtMzJtcDI1Cj4+ICAgICAgICBB
Uk06IGR0czogc3RtMzI6IGFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBIRFAgcGluIGFuZCBhZGQg
SERQIHBpbmN0cmwgbm9kZQo+PiAgICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUg
ZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTU3Yy1kazIgYm9hcmQKPiAKPiBPciBkb2VzIGl0
IG5lZWQgdG8gYmUgbWVyZ2VkIGFsb25nIHdpdGggdGhlc2U/Cj4gCj4gWW91cnMsCj4gTGludXMg
V2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
