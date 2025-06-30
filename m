Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A9EAED74C
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 10:30:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2650CC32E8F;
	Mon, 30 Jun 2025 08:30:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81A26C32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 08:30:30 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U7pr62007947;
 Mon, 30 Jun 2025 10:30:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 MMhEswzfz6Tdga1zQpQyWh8QYxmL/LddetOQ1V55ux0=; b=pN/5zQWCnOEyU639
 +qKc397SzTfJYoQP9dKXkQCFh5cqxElAX4z1jItyu3OExiThXPfQ+TXlXVGATpEx
 yVy7GcyeoDpKa7RVik4OQtTmjYrGo75a0vZF/3zTFZndMDZWTZFxcSpzVxKbNAch
 YqpoNI8XNHy9LkLuSrQ+ligkl+Wl+TGkl0woYBmxdHDO7DYqsSW7E/ERhIPwJAPP
 Ftz/mEwNhbdMW9oNIAt/NyFLJjZV2JP+5MCE/NXaaBXCvf0WHkSZpSUu5KrSWzyZ
 Kzbp21wHS64tB41Rn5XCykFeJb5ne7ZQAE+3Moni0R1Pr6rREDOAn5BeRCaF6udC
 vtO8qw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tkxsvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 10:30:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9F8324002D;
 Mon, 30 Jun 2025 10:29:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4DA16F3FFE;
 Mon, 30 Jun 2025 10:28:51 +0200 (CEST)
Received: from [10.252.20.7] (10.252.20.7) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 10:28:51 +0200
Message-ID: <5e61da51-cd02-41fd-9773-8bd776e1db62@foss.st.com>
Date: Mon, 30 Jun 2025 10:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Quartulli <antonio@mandelbit.com>, <linux-spi@vger.kernel.org>
References: <20250630081253.17294-1-antonio@mandelbit.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250630081253.17294-1-antonio@mandelbit.com>
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: fix pointer-to-pointer
	variables usage
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

T24gNi8zMC8yNSAxMDoxMiwgQW50b25pbyBRdWFydHVsbGkgd3JvdGU6Cj4gSW4gc3RtMzJfc3Bp
X3ByZXBhcmVfcnhfZG1hX21kbWFfY2hhaW5pbmcoKSBib3RoIHJ4X2RtYV9kZXNjCj4gYW5kIHJ4
X21kbWFfZGVzYyBhcmUgcGFzc2VkIGFzIHBvaW50ZXItdG8tcG9pbnRlciBhcmd1bWVudHMuCj4g
Cj4gVGhlIGdvYWwgaXMgdG8gcGFzcyBiYWNrIHRvIHRoZSBjYWxsZXIgdGhlIHZhbHVlIHJldHVy
bmVkCj4gYnkgZG1hZW5naW5lX3ByZXBfc2xhdmVfc2coKSwgd2hlbiBpdCBpcyBub3QgTlVMTC4K
PiAKPiBIb3dldmVyLCB0aGVzZSB2YXJpYWJsZXMgYXJlIHdyb25nbHkgaGFuZGxlZCBhcyBzaW1w
bGUgcG9pbnRlcnMKPiBkdXJpbmcgbGF0ZXIgYXNzaWdubWVudHMgYW5kIGNoZWNrcy4KPiAKPiBG
aXggdGhpcyBiZWhhdmlvdXIgYnkgaW50cm9kdWNpbmcgdHdvIHBvaW50ZXIgdmFyaWFibGVzCj4g
d2hpY2ggY2FuIHRoZW4gYmUgdHJlYXRlZCBhY2NvcmRpbmdseS4KPiAKPiBGaXhlczogZDE3ZGQy
ZjFkOGExICgic3BpOiBzdG0zMjogdXNlIFNUTTMyIERNQSB3aXRoIFNUTTMyIE1ETUEgdG8gZW5o
YW5jZSBERFIgdXNlIikKPiBBZGRyZXNzZXMtQ292ZXJpdHktSUQ6IDE2NDQ3MTUgKCJOdWxsIHBv
aW50ZXIgZGVyZWZlcmVuY2VzIChSRVZFUlNFX0lOVUxMKSIpCj4gU2lnbmVkLW9mZi1ieTogQW50
b25pbyBRdWFydHVsbGkgPGFudG9uaW9AbWFuZGVsYml0LmNvbT4KPiAKPiAtLS0KPiBDaGFuZ2Vz
IGZyb20gdjE6Cj4gKiBpbnRyb2R1Y2UgKl9tZG1hX2Rlc2MgYW5kICpfZG1hX2Rlc2MgZm9yIGJl
dHRlciByZWFkYWJpbGl0eQo+ICogZml4IGFub3RoZXIgaW5zdGFuY2Ugb2YgcnhfZG1hX2Rlc2Mg
Ym9ndXMgYXNzaWdubWVudCBpbiBjYXNlIG9mCj4gICAgZmFpbHVyZSBvZiBzZ19hbGxvY190YWJs
ZSgpCj4gKiBjb21taXQgdGl0bGUvbWVzc2FnZSByZXdvcmRlZCBhY2NvcmRpbmdseSB0byB0aGUg
cHJldmlvdXMgcG9pbnQKPiAtLS0KPiAgIGRyaXZlcnMvc3BpL3NwaS1zdG0zMi5jIHwgMjIgKysr
KysrKysrKysrLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktc3RtMzIu
YyBiL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCj4gaW5kZXggM2QyMGYwOWYxYWU3Li40YjdmMDc0
ZmRiYTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMKPiArKysgYi9kcml2
ZXJzL3NwaS9zcGktc3RtMzIuYwo+IEBAIC0xNDc0LDYgKzE0NzQsOCBAQCBzdGF0aWMgaW50IHN0
bTMyX3NwaV9wcmVwYXJlX3J4X2RtYV9tZG1hX2NoYWluaW5nKHN0cnVjdCBzdG0zMl9zcGkgKnNw
aSwKPiAgIAkJCQkJCSAgc3RydWN0IGRtYV9hc3luY190eF9kZXNjcmlwdG9yICoqcnhfZG1hX2Rl
c2MsCj4gICAJCQkJCQkgIHN0cnVjdCBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciAqKnJ4X21kbWFf
ZGVzYykKPiAgIHsKPiArCXN0cnVjdCBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciAqX21kbWFfZGVz
YyA9ICpyeF9tZG1hX2Rlc2M7Cj4gKwlzdHJ1Y3QgZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3IgKl9k
bWFfZGVzYyA9ICpyeF9kbWFfZGVzYzsKPiAgIAlzdHJ1Y3QgZG1hX3NsYXZlX2NvbmZpZyByeF9t
ZG1hX2NvbmYgPSB7MH07Cj4gICAJdTMyIHNyYW1fcGVyaW9kLCBuZW50cyA9IDAsIHNwaV9zX2xl
bjsKPiAgIAlzdHJ1Y3Qgc2dfdGFibGUgZG1hX3NndCwgbWRtYV9zZ3Q7Cj4gQEAgLTE1MjQsMTgg
KzE1MjYsMTggQEAgc3RhdGljIGludCBzdG0zMl9zcGlfcHJlcGFyZV9yeF9kbWFfbWRtYV9jaGFp
bmluZyhzdHJ1Y3Qgc3RtMzJfc3BpICpzcGksCj4gICAJCX0KPiAgIAl9Cj4gICAKPiAtCSpyeF9k
bWFfZGVzYyA9IGRtYWVuZ2luZV9wcmVwX3NsYXZlX3NnKHNwaS0+ZG1hX3J4LCBkbWFfc2d0LnNn
bCwKPiAtCQkJCQkgICAgICAgZG1hX3NndC5uZW50cywgcnhfZG1hX2NvbmYtPmRpcmVjdGlvbiwK
PiAtCQkJCQkgICAgICAgRE1BX1BSRVBfSU5URVJSVVBUKTsKPiArCV9kbWFfZGVzYyA9IGRtYWVu
Z2luZV9wcmVwX3NsYXZlX3NnKHNwaS0+ZG1hX3J4LCBkbWFfc2d0LnNnbCwKPiArCQkJCQkgICAg
ZG1hX3NndC5uZW50cywgcnhfZG1hX2NvbmYtPmRpcmVjdGlvbiwKPiArCQkJCQkgICAgRE1BX1BS
RVBfSU5URVJSVVBUKTsKPiAgIAlzZ19mcmVlX3RhYmxlKCZkbWFfc2d0KTsKPiAgIAo+IC0JaWYg
KCFyeF9kbWFfZGVzYykKPiArCWlmICghX2RtYV9kZXNjKQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsK
PiAgIAo+ICAgCS8qIFByZXBhcmUgTURNQSBzbGF2ZV9zZyB0cmFuc2ZlciBNRU1fVE9fTUVNIChT
UkFNPkREUikgKi8KPiAgIAlyZXQgPSBzZ19hbGxvY190YWJsZSgmbWRtYV9zZ3QsIG5lbnRzLCBH
RlBfQVRPTUlDKTsKPiAgIAlpZiAocmV0KSB7Cj4gLQkJcnhfZG1hX2Rlc2MgPSBOVUxMOwo+ICsJ
CV9kbWFfZGVzYyA9IE5VTEw7Cj4gICAJCXJldHVybiByZXQ7Cj4gICAJfQo+ICAgCj4gQEAgLTE1
NTgsMTMgKzE1NjAsMTMgQEAgc3RhdGljIGludCBzdG0zMl9zcGlfcHJlcGFyZV9yeF9kbWFfbWRt
YV9jaGFpbmluZyhzdHJ1Y3Qgc3RtMzJfc3BpICpzcGksCj4gICAJCX0KPiAgIAl9Cj4gICAKPiAt
CSpyeF9tZG1hX2Rlc2MgPSBkbWFlbmdpbmVfcHJlcF9zbGF2ZV9zZyhzcGktPm1kbWFfcngsIG1k
bWFfc2d0LnNnbCwKPiAtCQkJCQkJbWRtYV9zZ3QubmVudHMsIHJ4X21kbWFfY29uZi5kaXJlY3Rp
b24sCj4gLQkJCQkJCURNQV9QUkVQX0lOVEVSUlVQVCk7Cj4gKwlfbWRtYV9kZXNjID0gZG1hZW5n
aW5lX3ByZXBfc2xhdmVfc2coc3BpLT5tZG1hX3J4LCBtZG1hX3NndC5zZ2wsCj4gKwkJCQkJICAg
ICBtZG1hX3NndC5uZW50cywgcnhfbWRtYV9jb25mLmRpcmVjdGlvbiwKPiArCQkJCQkgICAgIERN
QV9QUkVQX0lOVEVSUlVQVCk7Cj4gICAJc2dfZnJlZV90YWJsZSgmbWRtYV9zZ3QpOwo+ICAgCj4g
LQlpZiAoIXJ4X21kbWFfZGVzYykgewo+IC0JCXJ4X2RtYV9kZXNjID0gTlVMTDsKPiArCWlmICgh
X21kbWFfZGVzYykgewo+ICsJCV9kbWFfZGVzYyA9IE5VTEw7Cj4gICAJCXJldHVybiAtRUlOVkFM
Owo+ICAgCX0KPiAgIAoKVGhhbmsgeW91LCBMR1RNCllvdSBjYW4gYWRkIG15IFJldmlld2VkLWJ5
CgpCZXN0IHJlZ2FyZHMsCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
