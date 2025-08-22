Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F159BB3183E
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 14:48:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A12EC3F95B;
	Fri, 22 Aug 2025 12:48:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBFC7C3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 12:48:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCgmp0005067;
 Fri, 22 Aug 2025 14:48:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 TGbeZuqspzRioDGrdvKPMUoTcNPF7/XnoWtRoGzbxwQ=; b=4t5an2Ivhpfv44vd
 pS602YSZFg2zu/Ma53LpeLjt9uVgcrxM/zA9mrYjWj9md+D50UqoNLMtyrHBVThD
 ns2T8NhfiIJCji7gnXToOWLv4qUmlUMqBllMGf2MY9BnjwOeLh5CgH3UMjdRkuSU
 jvmo7fQ6ukEBWck3EDHSq1y5zZYveTyPQ86nsPnvY6gLUxRFeauBIYCOfihhJfWL
 dIjBrHGib5QXRPnevSicyqCidUtqNAxfN8vlggmd/fbqe6Oav96TABlTaKr2kWQe
 T4UFAa1zB6vmq3QL4LBz0qeJFizbY7ncMbp7ZnZMtDWG0iSXjT0bdR6/cRbgG4El
 snQJ0g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nd5xs6qd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 14:48:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7D0E540048;
 Fri, 22 Aug 2025 14:47:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8279A71DB2B;
 Fri, 22 Aug 2025 14:46:17 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 14:46:16 +0200
Message-ID: <13ae9184-e835-476c-a96c-df8cd94c6e4b@foss.st.com>
Date: Fri, 22 Aug 2025 14:46:16 +0200
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
 <20250821-drm-misc-next-v4-4-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-4-7060500f8fd3@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 04/13] dt-bindings: display: st,
 stm32mp25-lvds: add access-controllers property
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
dHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCkxlIDIxLzA4LzIwMjUgw6AgMTM6MDgs
IFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBhY2Nlc3MtY29udHJvbGxlcnMgaXMg
YW4gb3B0aW9uYWwgcHJvcGVydHkgdGhhdCBhbGxvd3MgYSBwZXJpcGhlcmFsIHRvCj4gcmVmZXIg
dG8gb25lIG9yIG1vcmUgZG9tYWluIGFjY2VzcyBjb250cm9sbGVyKHMpLgo+Cj4gVGhpcyBwcm9w
ZXJ0eSBpcyBhZGRlZCB3aGVuIHRoZSBwZXJpcGhlcmFsIGlzIHVuZGVyIHRoZSBTVE0zMiBmaXJl
d2FsbAo+IGNvbnRyb2xsZXIuICBJdCBhbGxvd3MgYW4gYWNjdXJhdGUgcmVwcmVzZW50YXRpb24g
b2YgdGhlIGhhcmR3YXJlLCB3aGVyZQo+IHRoZSBwZXJpcGhlcmFsIGlzIGNvbm5lY3RlZCB0byBh
IGZpcmV3YWxsIGJ1cy4gIFRoZSBmaXJld2FsbCBjYW4gdGhlbgo+IGNoZWNrIHRoZSBwZXJpcGhl
cmFsIGFjY2Vzc2VzIGJlZm9yZSBhbGxvd2luZyBpdHMgZGV2aWNlIHRvIHByb2JlLgo+Cj4gQWNr
ZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1i
eTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4K
PiAtLS0KPiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0
bTMybXAyNS1sdmRzLnlhbWwgfCAzICsrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3N0LHN0bTMybXAyNS1sdmRzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMm1wMjUtbHZkcy55YW1sCj4gaW5kZXggNzRlNjFkOTUz
NzBjMjk5MTMwNDEwY2RhYWU4MzM1MTQzMjRjM2U4Zi4uMDVhNzNiYmMyNDZhODk5NGI2YWFiZjdj
MmNkOWRjYTc3MzIzMmJlNCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMm1wMjUtbHZkcy55YW1sCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzJtcDI1LWx2ZHMueWFtbAo+
IEBAIC01OSw2ICs1OSw5IEBAIHByb3BlcnRpZXM6Cj4gICAgIHJlc2V0czoKPiAgICAgICBtYXhJ
dGVtczogMQo+ICAgCj4gKyAgYWNjZXNzLWNvbnRyb2xsZXJzOgo+ICsgICAgbWF4SXRlbXM6IDEK
PiArCj4gICAgIHBvcnRzOgo+ICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3Bl
cnRpZXMvcG9ydHMKPiAgIAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
