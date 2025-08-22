Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E4B318EC
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 15:12:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6CFBC3F95B;
	Fri, 22 Aug 2025 13:12:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D56DC3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 13:12:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MD6IEv005413;
 Fri, 22 Aug 2025 15:11:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 in6GxO8ZSmjbjrF1pJYwhSUIzTBhlvMfmgcVDvnltp8=; b=y2H6Fw/H7iuNqAHM
 c1QQ9sEQ5bcb9CSfE/1HFjzQqEyXJu9Lkdg2z+BHakPXbZN0OxJW9FhxBLlOqtQt
 bUXVbxKu4n882gCHVPMJDxQQQqQphNGBkw7t9RmK+xwVpFfjpAjjkUuV3sumXcoG
 P1Mtwmw/GwWWmrX12RO/GJ/6DOd0KBt2sM90tVUVYqtXiX9M/uGFrINDoMi3k270
 eVyJMn9Jd6DwTEQTADxrkC0yFMJR0a72Js8mZV8swz1d9Ptm2KPGAeu8fMK3UtLe
 oiMbf3Iflu+RZSjQeSqUzhmzfn4O8h0jg061v21cftlA9XQ1tUD2Eklhq6t3yexk
 gAQm8g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n70dk7jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 15:11:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 817BB4004A;
 Fri, 22 Aug 2025 15:10:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D75487206EB;
 Fri, 22 Aug 2025 15:09:35 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 15:09:34 +0200
Message-ID: <7b482e44-5c41-4c2a-b8eb-431da1bdff8d@foss.st.com>
Date: Fri, 22 Aug 2025 15:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-12-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-12-7060500f8fd3@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 12/13] arm64: dts: st: add clock-cells
 to syscfg node on stm32mp251
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

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWNrZWQtYnk6IFlhbm5pY2sgRmVy
dHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCkxlIDIxLzA4LzIwMjUgw6AgMTM6MDks
IFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBNYWtlIHRoZSBzeXNjZmcgbm9kZSBh
IGNsb2NrIHByb3ZpZGVyIHNvIGNsb2NrIGNvbnN1bWVycyBjYW4gcmVhY2ggY2hpbGQKPiBjbG9j
a3MgdGhyb3VnaCBkZXZpY2UtdHJlZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2FsbGFp
cy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cj4gLS0tCj4gICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9z
dG0zMm1wMjUxLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaQo+
IGluZGV4IGI0NGZmMjIxZTBkYTk2OGJlMTA0ZmY4MTk1ZjliZWY3OWM5MGM1N2EuLjI0ODIzYmJm
ZWUzMWYxNWU4MTM1NzNhZDFhMGM0ZjY3YTEyNWNlNTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3N0L3N0bTMybXAyNTEuZHRzaQo+IEBAIC0xODc0LDYgKzE4NzQsNyBAQCBleHRpMTogaW50ZXJy
dXB0LWNvbnRyb2xsZXJANDQyMjAwMDAgewo+ICAgCQlzeXNjZmc6IHN5c2NvbkA0NDIzMDAwMCB7
Cj4gICAJCQljb21wYXRpYmxlID0gInN0LHN0bTMybXAyNS1zeXNjZmciLCAic3lzY29uIjsKPiAg
IAkJCXJlZyA9IDwweDQ0MjMwMDAwIDB4MTAwMDA+Owo+ICsJCQkjY2xvY2stY2VsbHMgPSA8MD47
Cj4gICAJCX07Cj4gICAKPiAgIAkJcGluY3RybDogcGluY3RybEA0NDI0MDAwMCB7Cj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
