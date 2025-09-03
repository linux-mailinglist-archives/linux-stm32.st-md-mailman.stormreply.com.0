Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E43B426FC
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 18:34:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85713C36B2E;
	Wed,  3 Sep 2025 16:34:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2567C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 16:34:05 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583EMrHv014128;
 Wed, 3 Sep 2025 18:33:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 sJgQ4wFgS+Q4c8sjFQ1HI1R30BLvBEm5k6Lw0ZflD58=; b=lQhwXFr1YA3vYFsB
 zEywhbZtYavi123rwSnRHg/LdNbXMB1hUX9pim/k7svnF2laG1phu1TzK+36lh64
 b4TGruJGG9evzDFBdnDPPgQjiLusbVYh0linc2EpPu3HsCuAWxRHfNxXDS6YRsh2
 W/NVMeGGLB/XvQdPez4RzXVxxUcc3TFp5bE0DhDOLZEx93tRXp5SyciK9nAsfQty
 TaE8wePCS5xM7igexFkTuC+HcQTwe0wQnZPZiKnEPisqaHjmNZlToYJfcqjnFTvU
 quMwNmwdMeX3kcmfL4O7ouCIg7RDASYEhQXsUtmUx9V9JtP910fcSObpphS0BEvq
 0ZYxIg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav2qr89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 18:33:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A7DB140047;
 Wed,  3 Sep 2025 18:32:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2601E2B4B65;
 Wed,  3 Sep 2025 18:31:31 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 18:31:30 +0200
Message-ID: <2e57454f-14fd-4d41-8753-2eac06f0597d@foss.st.com>
Date: Wed, 3 Sep 2025 18:31:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 0/8] Introduce HDP support for STM32MP
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

SGkgQ2zDqW1lbnQKCk9uIDcvMTEvMjUgMDk6NDEsIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToK
PiBUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIHRoZSBIYXJkd2FyZSBEZWJ1ZyBQb3J0IChI
RFApIHN1cHBvcnQgZm9yCj4gU1RNMzJNUCBwbGF0Zm9ybXMuCj4gCj4gSXQgaW5jbHVkZXMgdXBk
YXRlcyB0byB0aGUgbW1pbyBncGlvIGRyaXZlciwgdGhlIGFkZGl0aW9uIG9mIGRldmljZSB0cmVl
Cj4gYmluZGluZ3MsIHRoZSBIRFAgZHJpdmVyLCBhbmQgdXBkYXRlcyB0byB0aGUgZGV2aWNlIHRy
ZWUgZmlsZXMgZm9yCj4gU1RNMzJNUDEzLCBTVE0zMk1QMTUsCj4gYW5kIFNUTTMyTVAyNSBTb0Nz
Lgo+IFRoZSBzZXJpZXMgYWxzbyB1cGRhdGVzIHRoZSBNQUlOVEFJTkVSUyBmaWxlIHRvIGluY2x1
ZGUgbXlzZWxmIGFzIHRoZQo+IG1haW50YWluZXIgZm9yIHRoZSBTVE0zMiBIRFAgZHJpdmVyIGFu
ZCBhZGRzIHRoZSBuZWNlc3NhcnkKPiBwaW5tdXggY29uZmlndXJhdGlvbnMgZm9yIEhEUCBwaW5z
IG9uIFNUTTMyTVAxNTdDLURLMiBhcyBleGFtcGxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPiAtLS0KCi4uLgoK
PiAKPiAtLS0KPiBDbMOpbWVudCBMZSBHb2ZmaWMgKDgpOgo+ICAgICAgICBkdC1iaW5kaW5nczog
cGluY3RybDogc3RtMzI6IEludHJvZHVjZSBIRFAKPiAgICAgICAgcGluY3RybDogc3RtMzI6IElu
dHJvZHVjZSBIRFAgZHJpdmVyCj4gICAgICAgIE1BSU5UQUlORVJTOiBhZGQgQ2zDqW1lbnQgTGUg
R29mZmljIGFzIFNUTTMyIEhEUCBtYWludGFpbmVyCj4gICAgICAgIEFSTTogZHRzOiBzdG0zMjog
YWRkIEhhcmR3YXJlIGRlYnVnIHBvcnQgKEhEUCkgb24gc3RtMzJtcDEzCj4gICAgICAgIEFSTTog
ZHRzOiBzdG0zMjogYWRkIEhhcmR3YXJlIGRlYnVnIHBvcnQgKEhEUCkgb24gc3RtMzJtcDE1Cj4g
ICAgICAgIEFSTTogZHRzOiBzdG0zMjogYWRkIEhhcmR3YXJlIGRlYnVnIHBvcnQgKEhEUCkgb24g
c3RtMzJtcDI1Cj4gICAgICAgIEFSTTogZHRzOiBzdG0zMjogYWRkIGFsdGVybmF0ZSBwaW5tdXgg
Zm9yIEhEUCBwaW4gYW5kIGFkZCBIRFAgcGluY3RybCBub2RlCj4gICAgICAgIEFSTTogZHRzOiBz
dG0zMjogYWRkIEhhcmR3YXJlIGRlYnVnIHBvcnQgKEhEUCkgb24gc3RtMzJtcDE1N2MtZGsyIGJv
YXJkCj4gCj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLWhkcC55
YW1sICB8IDE4NyArKysrKysKPiAgIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA2ICsKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
MzEuZHRzaSAgICAgICAgICAgICAgIHwgICA3ICsKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMybXAxNS1waW5jdHJsLmR0c2kgICAgICAgIHwgIDI1ICsKPiAgIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxNTEuZHRzaSAgICAgICAgICAgICAgIHwgICA3ICsKPiAgIGFyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi5kdHMgICAgICAgICAgIHwgICA2ICsKPiAgIGFyY2gv
YXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpICAgICAgICAgICAgIHwgICA3ICsKPiAg
IGRyaXZlcnMvcGluY3RybC9zdG0zMi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDE0
ICsKPiAgIGRyaXZlcnMvcGluY3RybC9zdG0zMi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
IHwgICAxICsKPiAgIGRyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLWhkcC5jICAg
ICAgICAgIHwgNzIwICsrKysrKysrKysrKysrKysrKysrKwo+ICAgMTAgZmlsZXMgY2hhbmdlZCwg
OTgwIGluc2VydGlvbnMoKykKPiAtLS0KPiBiYXNlLWNvbW1pdDogMzFiNmQyNWEyNWFjM2ZlNGVl
NjA5MmYyYmYwNGE4MTZlNGI1YjY0YQo+IGNoYW5nZS1pZDogMjAyNTAyMjQtaGRwLXVwc3RyZWFt
LTYyMmU1ZGExNGE5Zgo+IAo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IENsw6ltZW50IExlIEdvZmZp
YyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KCkRUIHBhdGNoZXMgYXBwbGllZCBvbiBz
dG0zMi1uZXh0LgoKVGhhbmtzLgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
