Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFEFB2D515
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 09:41:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26FB3C36B2D;
	Wed, 20 Aug 2025 07:41:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F7D1C36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 07:41:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K6jL1B023265;
 Wed, 20 Aug 2025 09:41:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 b2JiistMyWguTBCrYhx2X5NLWE9VMsmLtXvQuA0ebsM=; b=dOhWmhU1/fCHbDHB
 W0nRFLN7IrrAhIGH009ygWfyKYl4MYgCfhjmyVhajF2YyJk3byfpovKNv1TDgiXr
 8G70EHtq2IYZv6IoA844TPnUNUxieaGFq4B2NPUCFQ1oq3Lr82/+tDKtwV9dzw1x
 oIfMIm/tUJy3DRgK51cgEXoy9hpSLjyOlAA9a2dALcBYFaPo+nOsoYrtrmiHu8kZ
 SoruMBQBgysA9apOTNuNP9xk09NM4V3oBbB4YSFuQsuiLE5Bi39ag+Ek3CfF9K3u
 D3RljfLoEgPMydcdt0QvAqCyWuEHOv9J8nDWlC+rw9GMDMlK1GZgcq/bpzEL1B8n
 Kh1NSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n6uj8us5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Aug 2025 09:41:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0064B40045;
 Wed, 20 Aug 2025 09:39:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F49C52E39B;
 Wed, 20 Aug 2025 09:38:50 +0200 (CEST)
Received: from [10.252.7.99] (10.252.7.99) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 09:38:49 +0200
Message-ID: <ff91b42e-be8d-4147-b489-c9938a4ab344@foss.st.com>
Date: Wed, 20 Aug 2025 09:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
 <175560127037.3969097.6130940505156039734.robh@kernel.org>
 <e144225c-e0e6-4d3e-a4d8-e4c48cdef3f6@foss.st.com>
 <20250819135851.GA115029-robh@kernel.org>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250819135851.GA115029-robh@kernel.org>
X-Originating-IP: [10.252.7.99]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
Cc: Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 01/13] dt-bindings: display: st: add
 new compatible to LTDC device
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

CgpPbiA4LzE5LzI1IDE1OjU4LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBUdWUsIEF1ZyAxOSwg
MjAyNSBhdCAwMzoxNzo0NlBNICswMjAwLCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+Pgo+
PiBPbiA4LzE5LzI1IDEzOjAxLCBSb2IgSGVycmluZyAoQXJtKSB3cm90ZToKPj4+IE9uIFR1ZSwg
MTkgQXVnIDIwMjUgMTE6MTU6NTQgKzAyMDAsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+
Pj4gVGhlIG5ldyBTVE1pY3JvZWxlY3Ryb25pY3MgU29DIGZlYXR1cmVzIGEgZGlzcGxheSBjb250
cm9sbGVyIHNpbWlsYXIgdG8KPj4+PiB0aGUgb25lIHVzZWQgaW4gcHJldmlvdXMgU29Dcy4gIEJl
Y2F1c2UgdGhlcmUgaXMgYWRkaXRpb25hbCByZWdpc3RlcnMsCj4+Pj4gaXQgaXMgaW5jb21wYXRp
YmxlIHdpdGggZXhpc3RpbmcgSVBzLgo+Pj4+Cj4+Pj4gQWRkIHRoZSBuZXcgbmFtZSB0byB0aGUg
bGlzdCBvZiBjb21wYXRpYmxlIHN0cmluZy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJhcGhh
ZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cj4+Pj4gLS0t
Cj4+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy55YW1s
IHwgMzAgKysrKysrKysrKysrKysrKysrKystLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4gSGkgUm9iLAo+Pgo+PiBJdCBzZWVtcyBzZXZl
cmFsIHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMgdHJpZ2dlcmVkIHlvdXIgYm90IHdpdGhvdXQKPj4g
d2FybmluZ3MvZXJyb3JzIG1lc3NhZ2VzLgo+Pgo+PiBEaWQgSSBtaXNzZWQgc29tZXRoaW5nIG9y
IGlzIGl0IGp1c3QgYSBnbGl0Y2ggaW4gdGhlIG1hdHJpeCA/IDopCj4gJ21ha2UgZHRfYmluZGlu
Z19jaGVjaycgaXMgYnJva2VuIGluIGxpbnV4LW5leHQgd2hpY2ggaXMgdXNlZCBpZiB0aGUgCj4g
YmFzZSBjb21taXQgaXMgbm90IHNwZWNpZmllZCBvciBub3QgZm91bmQuIFRoZSBsYXR0ZXIgd2Fz
IHRoZSBjYXNlIGhlcmUuIAo+IFNob3VsZCBiZSBmaXhlZCBpbiB0b21vcnJvdydzIGxpbnV4LW5l
eHQuCgpJbmRlZWQsIEkgYW0gYmFzZWQgb24gbGF0ZXN0IGRybS1taXNjLW5leHQsIHdoaWNoIGV4
cGxhaW5zIHRoZSBub3QgZm91bmQgYmFzZQpjb21taXQuCgpUaGFua3MgZm9yIHRoaXMgaW5mbwoK
UmFwaGHDq2wKPgo+IFJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
