Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FC690C4AB
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 10:01:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A9EBC78001;
	Tue, 18 Jun 2024 08:01:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1DBAC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 08:01:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I7SjZ4011154;
 Tue, 18 Jun 2024 10:01:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 KD5DJPIUWljRkbKyGSSk9X0rvNhJfAYrmRTUTF8bu0U=; b=Aig2xZ1EDoDtB4zy
 RCgnLXckb/C5OOIQlev/+QgxHtyLGEojPbAgmgKWCGMGG44AtmNVdNY7uvurqenQ
 pKpkFRXgIgfvyKshpAwkhjaysFhT1dtyfDYUzuQzSnR+HLfp1mDYhKz06HNkt9so
 XJOBRmbrQExx+XhFRGOjQYN0jHhDAvq3CbLRJK94VwtdCPcf3byMLmRtxcDBQ1Wl
 uogFCW9dfVNkD1xkN6Hzpw68wJf2RkoMBcR2pYQTvB31QvYdlLYOHQpcmoTey69L
 v7Z1dAKv5kH5PXiTCqh/wk0u/ZHBKmDBu4paIFyeES1Ytw+Fj63+t1yVw6eGhExn
 A/sbXg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ys0cgabqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 10:01:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8C08740045;
 Tue, 18 Jun 2024 10:01:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8EF58211973;
 Tue, 18 Jun 2024 10:00:42 +0200 (CEST)
Received: from [10.48.86.232] (10.48.86.232) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 18 Jun
 2024 10:00:42 +0200
Message-ID: <10e21012-d7f0-4329-a1bc-537828d7dca1@foss.st.com>
Date: Tue, 18 Jun 2024 10:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240617092016.2958046-1-etienne.carriere@foss.st.com>
 <VE1PR10MB3407EE2C8715D390E286BDB385CE2@VE1PR10MB3407.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Pascal PAILLET-LME <p.paillet@foss.st.com>
In-Reply-To: <VE1PR10MB3407EE2C8715D390E286BDB385CE2@VE1PR10MB3407.EURPRD10.PROD.OUTLOOK.COM>
X-Originating-IP: [10.48.86.232]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Lee Jones <lee@kernel.org>, Pascal PAILLET-LME <p.paillet@st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mfd: dual licensing for
 st, stpmic1 bindings
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

CgpPbiA2LzE3LzI0IDExOjIwLCBFdGllbm5lIENBUlJJRVJFIHdyb3RlOgo+Cj4gQ2hhbmdlIGlu
Y2x1ZGUvZHQtYmluZGluZ3MvbWZkL3N0LHN0cG1pYzEuaCBsaWNlbnNlIG1vZGVsIGZyb20gR1BM
djIuMAo+IG9ubHkgdG8gZHVhbCBHUEx2Mi4wIG9yIEJTRC0yLUNsYXVzZS4gSSBoYXZlIGV2ZXJ5
IGxlZ2l0aW1hY3kgdG8gcmVxdWVzdAo+IHRoaXMgY2hhbmdlIG9uIGJlaGFsZiBvZiBTVE1pY3Jv
ZWxlY3Ryb25pY3MuIFRoaXMgY2hhbmdlIGNsYXJpZmllcyB0aGF0Cj4gdGhpcyBEVCBiaW5kaW5n
IGhlYWRlciBmaWxlIGNhbiBiZSBzaGFyZWQgd2l0aCBzb2Z0d2FyZSBjb21wb25lbnRzIGFzCj4g
Ym9vdGxvYWRlcnMgYW5kIE9TZXMgdGhhdCBhcmUgbm90IHB1Ymxpc2hlZCB1bmRlciBHUEx2MiB0
ZXJtcy4KPgo+IEluIENDIGFyZSBhbGwgdGhlIGNvbnRyaWJ1dG9ycyB0byB0aGlzIGhlYWRlciBm
aWxlLgo+Cj4gQ2M6IFBhc2NhbCBQYWlsbGV0IDxwLnBhaWxsZXRAc3QuY29tPgo+IENjOiBMZWUg
Sm9uZXMgPGxlZUBrZXJuZWwub3JnPgo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pgo+IFNpZ25lZC1vZmYtYnk6IEV0aWVubmUgQ2FycmllcmUgPGV0aWVubmUuY2FycmllcmVAZm9z
cy5zdC5jb20+CgpBY2tlZC1ieTogUGFzY2FsIFBhaWxsZXQgPHAucGFpbGxldEBmb3NzLnN0LmNv
bT4KCj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIENoYW5nZSByZXF1ZXN0IGxpY2Vuc2Ug
ZnJvbSAiR1BMLTIuMC1vbmx5IE9SIEJTRC0zLUNsYXVzZSIgdG8KPiDCoCAiR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSIuCj4gLSBVcGRhdGUgTGVlJ3MgZS1tYWlsIGFkZHJlc3MuCj4gLS0t
Cj4gwqBpbmNsdWRlL2R0LWJpbmRpbmdzL21mZC9zdCxzdHBtaWMxLmggfCAyICstCj4gwqAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2R0LWJpbmRpbmdzL21mZC9zdCxzdHBtaWMxLmggCj4gYi9pbmNsdWRlL2R0LWJp
bmRpbmdzL21mZC9zdCxzdHBtaWMxLmgKPiBpbmRleCAzMjFjZDA4Nzk3ZDkuLjlkZDE1YjljNzQz
ZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL21mZC9zdCxzdHBtaWMxLmgKPiAr
KysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL21mZC9zdCxzdHBtaWMxLmgKPiBAQCAtMSw0ICsxLDQg
QEAKPiAtLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiArLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UgKi8KPiDCoC8q
Cj4gwqAgKiBDb3B5cmlnaHQgKEMpIFNUTWljcm9lbGVjdHJvbmljcyAyMDE4IC0gQWxsIFJpZ2h0
cyBSZXNlcnZlZAo+IMKgICogQXV0aG9yOiBQaGlsaXBwZSBQZXVyaWNoYXJkIDxwaGlsaXBwZS5w
ZXVyaWNoYXJkQHN0LmNvbT4sCj4gLS0gCj4gMi4yNS4xCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
