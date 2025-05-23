Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6329FAC2491
	for <lists+linux-stm32@lfdr.de>; Fri, 23 May 2025 16:00:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23E56C7A82A;
	Fri, 23 May 2025 14:00:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D58FFCFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 13:59:59 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ND60Jb017699;
 Fri, 23 May 2025 15:59:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 e+IFdO1usXKHPiQf33sJ74JnT4YFmfU5fTYrm93yLqI=; b=Vyz/K+59SCGHceQC
 kOjfJsoERs8fnIZIOj6znI55PUoh6cU/Lvi94TMR1NtqhPDab+uVxYqR70OVE8NC
 KszErRyOOPahLPpNm5tC6/J+V6IU7AvDUsodn3S/eY2N8XJ1guulqMr3Qh3ymeLp
 6J5SWme3OF5d9p+0NQxUYxwHt6/5AjE4NTBDCEceuPkdKq/7xA5/sgqi8E8dzKU7
 8zUVsfFzfFYnfc4KFkkaQYgNA3IwuvBQH492gk/nGJSaisrmj7glHSSy8WxSELYO
 dJQKr2tJ4/p4DCl8TzeFVYhguNyD9mDwQOiCKbkUPjK5QCIqHw1xoGlcO0a+f+Vw
 SYQeUg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf4ej9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 15:59:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E9C840045;
 Fri, 23 May 2025 15:58:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47D74A7437F;
 Fri, 23 May 2025 15:57:43 +0200 (CEST)
Received: from [10.252.20.86] (10.252.20.86) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 15:57:42 +0200
Message-ID: <89b8b7ce-cd0e-438f-95ee-2a3058728a5c@foss.st.com>
Date: Fri, 23 May 2025 15:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-2-cac9d8f63d20@foss.st.com>
 <3edbda17-cff1-4e8c-bac7-5cfed472fc66@oracle.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <3edbda17-cff1-4e8c-bac7-5cfed472fc66@oracle.com>
X-Originating-IP: [10.252.20.86]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01
Cc: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/3] clk: stm32: introduce clocks for
 STM32MP21 platform
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

Ck9uIDUvMjIvMjUgMTg6MjEsIEFMT0sgVElXQVJJIHdyb3RlOgo+Cj4KPiBPbiAyMS0wNS0yMDI1
IDE4OjA4LCBHYWJyaWVsIEZlcm5hbmRleiB3cm90ZToKPj4gVGhpcyBkcml2ZXIgaXMgaW50ZW5k
ZWQgZm9yIHRoZSBTVE0zMk1QMjEgY2xvY2sgZmFtaWx5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBO
aWNvbGFzIExlIEJheW9uPG5pY29sYXMubGUuYmF5b25AZm9zcy5zdC5jb20+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEdhYnJpZWwgRmVybmFuZGV6PGdhYnJpZWwuZmVybmFuZGV6QGZvc3Muc3QuY29tPgo+
PiAtLS0KPj4gwqAgZHJpdmVycy9jbGsvc3RtMzIvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqAgfMKg
wqDCoCA3ICsKPj4gwqAgZHJpdmVycy9jbGsvc3RtMzIvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoCB8
wqDCoMKgIDEgKwo+PiDCoCBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDIxLmMgfCAxNTg2
IAo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIGRyaXZlcnMv
Y2xrL3N0bTMyL3N0bTMybXAyMV9yY2MuaCB8wqAgNjUxICsrKysrKysrKysrKysrKwo+PiDCoCA0
IGZpbGVzIGNoYW5nZWQsIDIyNDUgaW5zZXJ0aW9ucygrKQo+Cj4KPiBSZXZpZXdlZC1ieTogQWxv
ayBUaXdhcmkgPGFsb2suYS50aXdhcmlAb3JhY2xlLmNvbT4KCk1hbnkgdGhhbmtzIEFsb2sKCkJl
c3QgcmVnYXJkcwoKR2FicmllbAoKPgo+IFRoYW5rcywKPiBBbG9rCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
