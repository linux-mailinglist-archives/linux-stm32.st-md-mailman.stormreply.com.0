Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDCC8A5179
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Apr 2024 15:34:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2262DC6B444;
	Mon, 15 Apr 2024 13:34:05 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AFF4C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 13:11:20 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43FC9XOS025032; Mon, 15 Apr 2024 15:10:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=uGQbqktQLTz+NMhP0izBTeN658aw+zWIfZaPtqfijk4=; b=Lx
 uy+YW/FHxcbqJdIdwGLP/rglp+bz8tDG1QNBGbfgrQ0zYVFOh9eLkh1BJOMCnkyV
 p+yGzDGn0JacWO4UH4wRH3qLsU4NNsm4GGm6TBz32WzI19m9dsE14faKv7aw5JAE
 3ERc3Fhv0AifNvpuswnwbySlmaK3PHdocW7JFCN+xdgIjpmVuKCykTdtapXbWlzA
 TH9lTFXDdsJ3IGSaw0OOLx1Jwrq0mnrVvHMvktdooGJkXvD4/ALScM6L4PF5/0ta
 83ewU16afGt5rAxGVePrQxF3jByXLn+/GTGvWPnhBUACxCBGZassvG+wF+PJCJYu
 kNDil2465UClSpJ9r6LQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg50hnaqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Apr 2024 15:10:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E16B94002D;
 Mon, 15 Apr 2024 15:10:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 433D9216EFC;
 Mon, 15 Apr 2024 15:10:16 +0200 (CEST)
Received: from [10.48.86.107] (10.48.86.107) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Apr
 2024 15:10:15 +0200
Message-ID: <90faea2e-1795-4303-a20f-e1fcef9e0e00@foss.st.com>
Date: Mon, 15 Apr 2024 15:10:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-watchdog@vger.kernel.org>
References: <20240321011207.45388-1-marex@denx.de>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20240321011207.45388-1-marex@denx.de>
X-Originating-IP: [10.48.86.107]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_10,2024-04-15_01,2023-05-22_02
X-Mailman-Approved-At: Mon, 15 Apr 2024 13:34:04 +0000
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3] watchdog: stm32_iwdg: Add pretimeout
 support
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

SGVsbG8gTWFyZWssCgpPbiAzLzIxLzI0IDAyOjExLCBNYXJlayBWYXN1dCB3cm90ZToKPiBUaGUg
U1RNMzJNUDE1eHggSVdERyBhZGRzIHJlZ2lzdGVycyB3aGljaCBwZXJtaXQgdGhpcyBJUCB0byBn
ZW5lcmF0ZQo+IHByZXRpbWVvdXQgaW50ZXJydXB0LiBUaGlzIGludGVycnVwdCBjYW4gYWxzbyBi
ZSB1c2VkIHRvIHdha2UgdGhlIENQVQo+IGZyb20gc3VzcGVuZC4gSW1wbGVtZW50IHN1cHBvcnQg
Zm9yIGdlbmVyYXRpbmcgdGhpcyBpbnRlcnJ1cHQgYW5kIGxldAo+IHVzZXJzcGFjZSBjb25maWd1
cmUgdGhlIHByZXRpbWVvdXQuIEluIGNhc2UgdGhlIHByZXRpbWVvdXQgaXMgbm90Cj4gY29uZmln
dXJlZCBieSB1c2VyLCBzZXQgcHJldGltZW91dCB0byBoYWxmIG9mIHRoZSBXRFQgdGltZW91dCBj
eWNsZS4KCiBGcm9tIHRoZSBjb2RlIGJlbG93IEkgc2VlIHRoYXQgdGhlIHByZXRpbWVvdXQgaXMg
c2V0IHRvIDc1JSBhbmQgbm90IDUwJSAKYXMgeW91IHNhaWQuCkZvciB0aGUgcmVzdCB5b3UgY2Fu
IHB1dCBhcyB5b3Ugd2FudCA6ClJldmlld2VkLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1l
bnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cm9yClRlc3RlZC1ieTogQ2zDqW1lbnQgTGUgR29mZmlj
IDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoKPiAuLi4KPiAgIAo+IEBAIC04OCwxMyAr
OTcsMTggQEAgc3RhdGljIGlubGluZSB2b2lkIHJlZ193cml0ZSh2b2lkIF9faW9tZW0gKmJhc2Us
IHUzMiByZWcsIHUzMiB2YWwpCj4gICBzdGF0aWMgaW50IHN0bTMyX2l3ZGdfc3RhcnQoc3RydWN0
IHdhdGNoZG9nX2RldmljZSAqd2RkKQo+ICAgewo+ICAgCXN0cnVjdCBzdG0zMl9pd2RnICp3ZHQg
PSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZGQpOwo+IC0JdTMyIHRvdXQsIHByZXNjLCBpd2RnX3Js
ciwgaXdkZ19wciwgaXdkZ19zcjsKPiArCXUzMiB0b3V0LCBwdG90LCBwcmVzYywgaXdkZ19ybHIs
IGl3ZGdfZXdjciwgaXdkZ19wciwgaXdkZ19zcjsKPiAgIAlpbnQgcmV0Owo+ICAgCj4gICAJZGV2
X2RiZyh3ZGQtPnBhcmVudCwgIiVzXG4iLCBfX2Z1bmNfXyk7Cj4gICAKPiArCWlmICghd2RkLT5w
cmV0aW1lb3V0KQo+ICsJCXdkZC0+cHJldGltZW91dCA9IDMgKiB3ZGQtPnRpbWVvdXQgLyA0Owo+
ICsKPiAuLi4KSGVyZSBpcyB0aGUgNzUlIHByZXRpbWVvdXQuCgpCZXN0IHJlZ2FyZHMsCgpDbMOp
bWVudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
