Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6389AB31868
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 14:54:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21101C3F95B;
	Fri, 22 Aug 2025 12:54:07 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3903DC3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 12:54:06 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCc12j019648;
 Fri, 22 Aug 2025 14:53:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 J0xEHhpDr5Ii0lNf94Y5NJ7HClkQVYYRlfEovqbGqyo=; b=yrD/44iTpG6d7ZWH
 wgrtFXahyjJZvdUKlQCA4ddPj0sRoExjds+LljZRRBiQ0y5Vs/RqnX2RPKD2rdDX
 +GeUDKKbq7pQs/fLkoAEqA5Yeqe8/6eqSnCqTBNKQ0mtxwfBV0O+TdGXuQQy6i5T
 b7YzugGDY6bL8EsJ47ZHyg71QYyP5uHOWfV/rJUC6VK7Wkoe06e1YqwP9DtWCbba
 TrjmsxWD8z3bziyn0nc+6/2MiDX8U8Fz96kcXVgve5t7mje+bzwOoQRSQvKeQFWl
 dqXpLwcKhVex7DPC1lghryENCpzYxpQ52mfnxGufdt2SODr8pacM8ut7eUqqT787
 RhXNaA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n81wtrcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 14:53:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5314C40044;
 Fri, 22 Aug 2025 14:52:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0FF66C67BC;
 Fri, 22 Aug 2025 14:51:24 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 14:51:23 +0200
Message-ID: <09c20af0-e33f-4325-9cf5-249cb2f31b38@foss.st.com>
Date: Fri, 22 Aug 2025 14:51:23 +0200
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
 <20250821-drm-misc-next-v4-6-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-6-7060500f8fd3@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 06/13] dt-bindings: arm: stm32: add
 required #clock-cells property
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

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgpSZXZpZXdlZC1ieTogWWFubmljayBG
ZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKTGUgMjEvMDgvMjAyNSDDoCAxMzow
OCwgUmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+IE9uIFNUTTMyTVAyNSBTb0MsIHRo
ZSBzeXNjZmcgcGVyaXBoZXJhbCBwcm92aWRlcyBhIGNsb2NrIHRvIHRoZSBkaXNwbGF5Cj4gc3Vi
c3lzdGVtIHRocm91Z2ggYSBtdWx0aXBsZXhlci4gIFNpbmNlIGl0IG9ubHkgcHJvdmlkZXMgYSBz
aW5nbGUgY2xvY2ssCj4gdGhlIGNlbGwgdmFsdWUgaXMgMC4KPgo+IERvaW5nIHNvIGFsbG93cyB0
aGUgY2xvY2sgY29uc3VtZXJzIHRvIHJlYWNoIHRoZSBwZXJpcGhlcmFsIGFuZCBnYXRlIHRoZQo+
IGNsb2NrIGFjY29yZGluZ2x5Lgo+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxy
b2JoQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFw
aGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgIC4uLi9iaW5kaW5ncy9hcm0v
c3RtMzIvc3Qsc3RtMzItc3lzY29uLnlhbWwgICAgICAgIHwgMzEgKysrKysrKysrKysrKysrLS0t
LS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
c3RtMzIvc3Qsc3RtMzItc3lzY29uLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL3N0bTMyL3N0LHN0bTMyLXN5c2Nvbi55YW1sCj4gaW5kZXggZWQ5NzY1MmM4NDky
MjgxM2U5NGIxODE4YzA3ZmU4NzE0ODkxYzA4OS4uOTVkMjMxOWFmZTIzNWZhODY5NzRkODBmODlj
OWRlZWFlMjI3NTIzMiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL3N0bTMyL3N0LHN0bTMyLXN5c2Nvbi55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdCxzdG0zMi1zeXNjb24ueWFtbAo+IEBA
IC0zNiwyMCArMzYsMzEgQEAgcHJvcGVydGllczoKPiAgICAgY2xvY2tzOgo+ICAgICAgIG1heEl0
ZW1zOiAxCj4gICAKPiArICAiI2Nsb2NrLWNlbGxzIjoKPiArICAgIGNvbnN0OiAwCj4gKwo+ICAg
cmVxdWlyZWQ6Cj4gICAgIC0gY29tcGF0aWJsZQo+ICAgICAtIHJlZwo+ICAgCj4gLWlmOgo+IC0g
IHByb3BlcnRpZXM6Cj4gLSAgICBjb21wYXRpYmxlOgo+IC0gICAgICBjb250YWluczoKPiAtICAg
ICAgICBlbnVtOgo+IC0gICAgICAgICAgLSBzdCxzdG0zMm1wMTU3LXN5c2NmZwo+IC0gICAgICAg
ICAgLSBzdCxzdG0zMmY0LWdjYW4KPiAtdGhlbjoKPiAtICByZXF1aXJlZDoKPiAtICAgIC0gY2xv
Y2tzCj4gK2FsbE9mOgo+ICsgIC0gaWY6Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICAg
Y29tcGF0aWJsZToKPiArICAgICAgICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAgICBlbnVtOgo+
ICsgICAgICAgICAgICAgIC0gc3Qsc3RtMzJtcDE1Ny1zeXNjZmcKPiArICAgICAgICAgICAgICAt
IHN0LHN0bTMyZjQtZ2Nhbgo+ICsgICAgdGhlbjoKPiArICAgICAgcmVxdWlyZWQ6Cj4gKyAgICAg
ICAgLSBjbG9ja3MKPiArICAtIGlmOgo+ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIGNv
bXBhdGlibGU6Cj4gKyAgICAgICAgICBjb25zdDogc3Qsc3RtMzJtcDI1LXN5c2NmZwo+ICsgICAg
dGhlbjoKPiArICAgICAgcmVxdWlyZWQ6Cj4gKyAgICAgICAgLSAiI2Nsb2NrLWNlbGxzIgo+ICAg
Cj4gICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiAgIAo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
