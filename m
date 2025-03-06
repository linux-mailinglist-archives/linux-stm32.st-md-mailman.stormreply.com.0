Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47953A5450C
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 09:38:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5FCAC78002;
	Thu,  6 Mar 2025 08:38:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEC15C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 08:38:39 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52675g1x027727;
 Thu, 6 Mar 2025 09:38:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 THTPti0GSVkJ4Cd75xheL2m4nwMeiJGZ76Ql1T7hNSg=; b=RRnXXZamHslG4g3e
 Uj+5ddeHAS1FF0PnwSRao4wSH4kqc1blP1txTUwJjJ1OVy5EIqkdi2gabTmdPF28
 UAbwr3nRHkwDUN2laKtxlY4xfiKlVQtDdXBavK4Sn57Hs5+DwHVzQvXq24kizUp3
 rI9XT0Em724nOCx2sDMTh9kBwcS0LzZsaP1aiJc5bS6o86AVz+JFBdmWCed+ETkW
 ADpZLcqFMXsMTW7u2l+WJyZ6ek2QHy5Q8urrPmrgxU3TFNF1HO9TXUlW4dNSsLy4
 h19IrDtz40YnMlhQ/J4lMc5tZ9zS3uPi7c/Hm2+Ets5anIUPnCmc1LswiPHZ6F5S
 7ZaMHw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 454cp8x3cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Mar 2025 09:38:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6EF8740049;
 Thu,  6 Mar 2025 09:37:38 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC809411871;
 Thu,  6 Mar 2025 09:37:16 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 09:37:16 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 09:37:16 +0100
Message-ID: <4081d99c-1283-45a4-9cb8-8e6f8dbd635d@foss.st.com>
Date: Thu, 6 Mar 2025 09:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lezcano <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
References: <20250305125146.1858978-1-fabrice.gasnier@foss.st.com>
 <a7489f16-ca31-4530-8ef1-33079b3c99a9@linaro.org>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <a7489f16-ca31-4530-8ef1-33079b3c99a9@linaro.org>
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] clocksource: stm32-lptimer: use wakeup
 capable instead of init wakeup
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMy81LzI1IDE4OjIzLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBPbiAwNS8wMy8yMDI1IDEz
OjUxLCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4+IEZyb206IEFsZXhhbmRyZSBUb3JndWUgPGFs
ZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4+Cj4+ICJ3YWtldXAtc291cmNlIiBwcm9wZXJ0
eSBkZXNjcmliZXMgYSBkZXZpY2Ugd2hpY2ggaGFzIHdha2V1cCBjYXBhYmlsaXR5Cj4+IGJ1dCBz
aG91bGQgbm90IGZvcmNlIHRoaXMgZGV2aWNlIGFzIGEgd2FrZXVwIHNvdXJjZS4KPiAKPiBJcyB0
aGF0IGEgZml4IHRvIGJlIGNhcnJpZWQgb24gPwoKSGkgRGFuaWVsLAoKVGhhbmtzIGZvciByZXZp
ZXdpbmcsCkkganVzdCBoYXZlIHNlbnQgYSBWMiB3aXRoIEZpeGVzIHRhZywgYW5kIGhhdmUgQ0Mn
ZWQgc3RhYmxlLgoKUGxlYXNlIHJldmlldyB0aGVyZSwKQmVzdCBSZWdhcmRzLApGYWJyaWNlCgpG
aXhlczogNDhiNDFjNWUyZGU2ICgiY2xvY2tzb3VyY2U6IEFkZCBMb3cgUG93ZXIgU1RNMzIgdGlt
ZXJzIGRyaXZlciIpCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhh
bmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgR2Fzbmll
ciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9jbG9j
a3NvdXJjZS90aW1lci1zdG0zMi1scC5jIHwgNCArLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYwo+PiBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGlt
ZXItc3RtMzItbHAuYwo+PiBpbmRleCA5NmQ5NzVhZGY3YTQuLmYwOGJhYTY3MjBmOCAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zdG0zMi1scC5jCj4+ICsrKyBiL2Ry
aXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYwo+PiBAQCAtMTg2LDkgKzE4Niw3IEBA
IHN0YXRpYyBpbnQgc3RtMzJfY2xrZXZlbnRfbHBfcHJvYmUoc3RydWN0Cj4+IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKG9mX3Byb3Bl
cnR5X3JlYWRfYm9vbChwZGV2LT5kZXYucGFyZW50LT5vZl9ub2RlLAo+PiAid2FrZXVwLXNvdXJj
ZSIpKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCByZXQgPSBkZXZpY2VfaW5pdF93YWtldXAoJnBkZXYt
PmRldiwgdHJ1ZSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBnb3RvIG91dF9jbGtfZGlzYWJsZTsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldmlj
ZV9zZXRfd2FrZXVwX2NhcGFibGUoJnBkZXYtPmRldiwgdHJ1ZSk7Cj4+IMKgIMKgwqDCoMKgwqDC
oMKgwqDCoCByZXQgPSBkZXZfcG1fc2V0X3dha2VfaXJxKCZwZGV2LT5kZXYsIGlycSk7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
