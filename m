Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4673CAF5AD7
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jul 2025 16:15:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F47EC3F93A;
	Wed,  2 Jul 2025 14:15:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DA7BC35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jul 2025 14:15:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562DIwPT009778;
 Wed, 2 Jul 2025 16:15:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 VR6E01Xg6J6Izs0olt9dR6pYp+S5ROquFthL7GlUqPs=; b=dBDQHoEXqF/md8Ai
 OKxTINMTwYY9+MXakIisn2u4OHsDwVaws4+1VieBQiNXPftGP0VE8IKDZH79YV9C
 gDu+8iKUecC6lTA5ex8FURzdpDRCP4m/LQweQkCWaJTIbkrTllzw7aH+Rxeuwntn
 utlstZrXHzSVULtL2Cc2OeUtYOrfnxH6LYJk/mWHDIEXpYkQRK9ktb31DLmb16v8
 IQ4M7f9TAHR4Q0aCT0gLzcFyIT99ZXhPfBCV/NcxixuYXHjqrUI8h1A2+IEiQK0n
 OkuVflyw9cWVeufHcOel2SUgz5K4BtxO8qghv8cKOOkUm6NRS9TCAHbMDBGTCt8h
 +QRk2A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tmb9wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jul 2025 16:15:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 46F9340050;
 Wed,  2 Jul 2025 16:14:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22C18BB2448;
 Wed,  2 Jul 2025 16:13:50 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 16:13:49 +0200
Message-ID: <164e93e7-b9b1-45ff-8418-3a381b2bc781@foss.st.com>
Date: Wed, 2 Jul 2025 16:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Zabel <p.zabel@pengutronix.de>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jonathan Corbet <corbet@lwn.net>, Gatien
 Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
 <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
 <5d4cf5bff7733421c8a031493742ba6a21e98583.camel@pengutronix.de>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <5d4cf5bff7733421c8a031493742ba6a21e98583.camel@pengutronix.de>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/13] perf: stm32: introduce DDRPERFM
	driver
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

SGkgUGhpbGlwCgpPbiA2LzMwLzI1IDEwOjM4LCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+IE9uIE1v
LCAyMDI1LTA2LTIzIGF0IDExOjI3ICswMjAwLCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+
IEludHJvZHVjZSB0aGUgZHJpdmVyIGZvciB0aGUgRERSIFBlcmZvcm1hbmNlIE1vbml0b3IgYXZh
aWxhYmxlIG9uCj4+IFNUTTMyTVBVIFNvQy4KPj4KPj4gT24gU1RNMzJNUDIgcGxhdGZvcm1zLCB0
aGUgRERSUEVSRk0gYWxsb3dzIHRvIG1vbml0b3IgdXAgdG8gOCBERFIgZXZlbnRzCj4+IHRoYXQg
Y29tZSBmcm9tIHRoZSBERFIgQ29udHJvbGxlciBzdWNoIGFzIHJlYWQgb3Igd3JpdGUgZXZlbnRz
Lgo+Pgo+PiBPbiBTVE0zMk1QMSBwbGF0Zm9ybXMsIHRoZSBERFJQRVJGTSBjYW5ub3QgbW9uaXRv
ciBhbnkgZXZlbnQgb24gYW55Cj4+IGNvdW50ZXIsIHRoZXJlIGlzIGEgbm90aW9uIG9mIHNldCBv
ZiBldmVudHMuCj4+IEV2ZW50cyBmcm9tIGRpZmZlcmVudCBzZXRzIGNhbm5vdCBiZSBtb25pdG9y
ZWQgYXQgdGhlIHNhbWUgdGltZS4KPj4gVGhlIGZpcnN0IGNob3NlbiBldmVudCBzZWxlY3RzIHRo
ZSBzZXQuCj4+IFRoZSBzZXQgaXMgY29kZWQgaW4gdGhlIGZpcnN0IHR3byBieXRlcyBvZiB0aGUg
Y29uZmlnIHZhbHVlIHdoaWNoIGlzIG9uIDQKPj4gYnl0ZXMuCj4+Cj4+IE9uIFNUTTMyTVAyNXgg
c2VyaWVzLCB0aGUgRERSUEVSRk0gY2xvY2sgaXMgc2hhcmVkIHdpdGggdGhlIEREUiBjb250cm9s
bGVyCj4+IGFuZCBtYXkgYmUgc2VjdXJlZCBieSBib290bG9hZGVycy4KPj4gQWNjZXNzIGNvbnRy
b2xsZXJzIGFsbG93IHRvIGNoZWNrIGFjY2VzcyB0byBhIHJlc291cmNlLiBVc2UgdGhlIGFjY2Vz
cwo+PiBjb250cm9sbGVyIGRlZmluZWQgaW4gdGhlIGRldmljZXRyZWUgdG8ga25vdyBhYm91dCB0
aGUgYWNjZXNzIHRvIHRoZQo+PiBERFJQRVJGTSBjbG9jay4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+PiAtLS0K
Pj4gICBkcml2ZXJzL3BlcmYvS2NvbmZpZyAgICAgICAgIHwgIDExICsKPj4gICBkcml2ZXJzL3Bl
cmYvTWFrZWZpbGUgICAgICAgIHwgICAxICsKPj4gICBkcml2ZXJzL3BlcmYvc3RtMzJfZGRyX3Bt
dS5jIHwgODkzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4g
ICAzIGZpbGVzIGNoYW5nZWQsIDkwNSBpbnNlcnRpb25zKCspCj4+Cj4gWy4uLl0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGVyZi9zdG0zMl9kZHJfcG11LmMgYi9kcml2ZXJzL3BlcmYvc3RtMzJf
ZGRyX3BtdS5jCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4u
YzBiY2UxZjQ0NmEwCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvZHJpdmVycy9wZXJmL3N0bTMy
X2Rkcl9wbXUuYwo+PiBAQCAtMCwwICsxLDg5MyBAQAo+IFsuLi5dCj4+ICsJaWYgKG9mX3Byb3Bl
cnR5X3ByZXNlbnQocGRldi0+ZGV2Lm9mX25vZGUsICJyZXNldHMiKSkgewo+PiArCQlyc3QgPSBk
ZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0KCZwZGV2LT5kZXYsIE5VTEwpOwo+IAo+IFVzZSBkZXZtX3Jl
c2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2ZSgpIGluc3RlYWQuIEl0IHJldHVybnMK
PiBOVUxMIGlmIHRoZSBkZXZpY2UgdHJlZSBkb2Vzbid0IGNvbnRhaW4gYSByZXNldHMgcHJvcGVy
dHkuCgpPayBJIHdpbGwgaGF2ZSBhIGxvb2ssIHRoYW5rIHlvdQoKPiAKPj4gKwkJaWYgKElTX0VS
Uihyc3QpKSB7Cj4+ICsJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gZ2V0IHJlc2V0
XG4iKTsKPiAKPiBQbGVhc2UgY29uc2lkZXIgdXNpbmcgZGV2X2Vycl9wcm9iZSgpIGluc3RlYWQu
CgpPawoKPj4gKwkJCXJldCA9IFBUUl9FUlIocnN0KTsKPj4gKwkJCWdvdG8gZXJyX2NsazsKPj4g
KwkJfQo+PiArCQlyZXNldF9jb250cm9sX2Fzc2VydChyc3QpOwo+PiArCQlyZXNldF9jb250cm9s
X2RlYXNzZXJ0KHJzdCk7Cj4gCj4gVGhlc2UgY2FuIGJlIGRvbmUgdW5jb25kaXRpb25hbGx5LCBh
cyB0aGV5IGFyZSBuby1vcHMgZm9yIHJzdCA9PSBOVUxMLgoKSW5kZWVkCgpCZXN0IHJlZ2FyZHMs
CkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
