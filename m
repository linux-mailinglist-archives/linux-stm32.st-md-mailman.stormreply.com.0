Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C148AED5CE
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 09:36:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FE16C32E8F;
	Mon, 30 Jun 2025 07:35:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E96CAC32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 07:35:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U7AniW028032;
 Mon, 30 Jun 2025 09:35:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3TeFS+uiHYd7t7KK/aAu0N/KEC1YUemvKeluUuOfecA=; b=QA9ziUH74nPr8B5h
 tSCcx7WJc5TajZUH1r7XpOAseYVJXtyyrECAhoHZ1w7H621FQsd/wZuiOntoOLux
 xVb1f3Sq4tnnJX0KF9NbhrT7jrH06muly99q0vw2j8PJgb6cw7X3NQ9vQ6mYIzS7
 FBVzTYysav1JdMt27wULU2nz24Dd7lfN8oNojqaj8xy/D1X7A3XL2xPzl1Tmm8T4
 BhKW6UfEbWYU+dQrmaO10MTQwPFFPtS+ruX6uTVqgBZadAunJcSSjXzMMAfwlpiA
 ANXefcNTmfzo4SoFirZNEOK8fZZWvUkGHf+r+v7WVek7sRmgn+VWHIAHWBqTlFPX
 +f5lqA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j79h5udb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 09:35:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ACD4540047;
 Mon, 30 Jun 2025 09:34:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D342946AD15;
 Mon, 30 Jun 2025 09:34:15 +0200 (CEST)
Received: from [10.252.20.7] (10.252.20.7) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 09:34:15 +0200
Message-ID: <1f49b8f3-44c9-43f3-a3bf-b931fb0726f4@foss.st.com>
Date: Mon, 30 Jun 2025 09:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Quartulli <antonio@mandelbit.com>, <linux-spi@vger.kernel.org>
References: <20250628000227.22895-1-antonio@mandelbit.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250628000227.22895-1-antonio@mandelbit.com>
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix NULL check on
	pointer-to-pointer variable
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

SGkgQW50b25pbywKCk9uIDYvMjgvMjUgMDI6MDIsIEFudG9uaW8gUXVhcnR1bGxpIHdyb3RlOgo+
IEluIHN0bTMyX3NwaV9wcmVwYXJlX3J4X2RtYV9tZG1hX2NoYWluaW5nKCkgYm90aCByeF9kbWFf
ZGVzYwo+IGFuZCByeF9tZG1hX2Rlc2MgYXJlIHBhc3NlZCBhcyBwb2ludGVyLXRvLXBvaW50ZXIg
YXJndW1lbnRzLgo+IAo+IFRoZSBnb2FsIGlzIHRvIHBhc3MgYmFjayB0byB0aGUgY2FsbGVyIHRo
ZSB2YWx1ZSByZXR1cm5lZAo+IGJ5IGRtYWVuZ2luZV9wcmVwX3NsYXZlX3NnKCksIHdoZW4gaXQg
aXMgbm90IE5VTEwuCj4gCj4gSG93ZXZlciwgdGhlIE5VTEwgY2hlY2sgb24gdGhlIHJlc3VsdCBp
cyBlcnJvbmVvdXNseQo+IHBlcmZvcm1lZCB3aXRob3V0IGRlcmVmZXJlbmNpbmcgdGhlIHBvaW50
ZXIuCj4gCj4gQWRkIHRoZSBwcm9wZXIgZGVyZWZlcmVuY2Ugb3BlcmF0b3IgdG8gYm90aCBjaGVj
a3MuCj4gCj4gRml4ZXM6IGQxN2RkMmYxZDhhMSAoInNwaTogc3RtMzI6IHVzZSBTVE0zMiBETUEg
d2l0aCBTVE0zMiBNRE1BIHRvIGVuaGFuY2UgRERSIHVzZSIpCj4gQWRkcmVzc2VzLUNvdmVyaXR5
LUlEOiAxNjQ0NzE1ICgiTnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlcyAoUkVWRVJTRV9JTlVMTCki
KQo+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gUXVhcnR1bGxpIDxhbnRvbmlvQG1hbmRlbGJpdC5j
b20+Cj4gLS0tCj4gICBkcml2ZXJzL3NwaS9zcGktc3RtMzIuYyB8IDYgKysrLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3NwaS9zcGktc3RtMzIuYyBiL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCj4g
aW5kZXggM2QyMGYwOWYxYWU3Li5lOWZhMTdlNTJmYjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9z
cGkvc3BpLXN0bTMyLmMKPiArKysgYi9kcml2ZXJzL3NwaS9zcGktc3RtMzIuYwo+IEBAIC0xNTI5
LDcgKzE1MjksNyBAQCBzdGF0aWMgaW50IHN0bTMyX3NwaV9wcmVwYXJlX3J4X2RtYV9tZG1hX2No
YWluaW5nKHN0cnVjdCBzdG0zMl9zcGkgKnNwaSwKPiAgIAkJCQkJICAgICAgIERNQV9QUkVQX0lO
VEVSUlVQVCk7Cj4gICAJc2dfZnJlZV90YWJsZSgmZG1hX3NndCk7Cj4gICAKPiAtCWlmICghcnhf
ZG1hX2Rlc2MpCj4gKwlpZiAoISpyeF9kbWFfZGVzYykKPiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4g
ICAKPiAgIAkvKiBQcmVwYXJlIE1ETUEgc2xhdmVfc2cgdHJhbnNmZXIgTUVNX1RPX01FTSAoU1JB
TT5ERFIpICovCj4gQEAgLTE1NjMsOCArMTU2Myw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfc3BpX3By
ZXBhcmVfcnhfZG1hX21kbWFfY2hhaW5pbmcoc3RydWN0IHN0bTMyX3NwaSAqc3BpLAo+ICAgCQkJ
CQkJRE1BX1BSRVBfSU5URVJSVVBUKTsKPiAgIAlzZ19mcmVlX3RhYmxlKCZtZG1hX3NndCk7Cj4g
ICAKPiAtCWlmICghcnhfbWRtYV9kZXNjKSB7Cj4gLQkJcnhfZG1hX2Rlc2MgPSBOVUxMOwo+ICsJ
aWYgKCEqcnhfbWRtYV9kZXNjKSB7Cj4gKwkJKnJ4X2RtYV9kZXNjID0gTlVMTDsKPiAgIAkJcmV0
dXJuIC1FSU5WQUw7Cj4gICAJfQo+ICAgCgpHb29kIGNhdGNoIGZvciBib3RoIHBvaW50ZXJzICEK
CkZvciByZWFkYWJpbGl0eSwgSSB3b3VsZCBzdWdnZXN0IHRvIGRlZmluZSB0d28gZG1hX2FzeW5j
X3R4X2Rlc2NyaXB0b3IgCnB0ciBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBmdW5jdGlvbiBzdWNo
IGFzIDoKCXN0cnVjdCBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciAqX21kbWFfZGVzYyA9ICpyeF9t
ZG1hX2Rlc2M7CglzdHJ1Y3QgZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3IgKl9kbWFfZGVzYyA9ICpy
eF9kbWFfZGVzYzsKCkFuZCB0aGVuIHVzZSB0aGVtIGFsbCBhbG9uZyB0aGUgZnVuY3Rpb24gZXZl
biBpbiB0aGUgYXNzaWduYXRpb24uCgpCZXN0IHJlZ2FyZHMsCkNsw6ltZW50Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
