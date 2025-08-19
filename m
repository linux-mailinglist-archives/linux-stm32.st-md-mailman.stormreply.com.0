Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E59B2C52A
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 15:20:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 926B2C36B19;
	Tue, 19 Aug 2025 13:20:17 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64F4BC36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 13:20:16 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JC1ZpJ008923;
 Tue, 19 Aug 2025 15:20:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QFvqz+B7siHkzQW6WosQ1OICBHcfdz0CqDSUjuLlYg8=; b=v5ardJpZoJ/NvqNX
 f4jxy8ZwgZYVTCJ1sCgIFZtE7m97VwKq5re3ao20inrRsqD7XZvG+zyXzn6Dz45t
 gb2J10sr4S5W1yKGivcA8affvQLkF08RUucTuB/LR1qX1g+gT0fE38LtsZDZ1m/F
 PKW351mdlAzcllWo5H0ChiXyW910ZnOSJMNdOKR6jzmRCn9m5AaqgPw1s6805YiE
 GuDNNIalignEyZgHlHZCUO2Kzj/Vcsj6MruBIW7UDSNWlTse6eRzvtf6pyHukmWU
 qwOZ0gd+xGksY5DQ9H3jgkYo4oGkVG2LZ7s213qfZk2t2UB5moYa3O/CzKKMwK6+
 kUVxrg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48k4xmrrx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Aug 2025 15:20:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B499040047;
 Tue, 19 Aug 2025 15:18:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C12A772BD5A;
 Tue, 19 Aug 2025 15:17:47 +0200 (CEST)
Received: from [10.130.74.180] (10.130.74.180) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 15:17:47 +0200
Message-ID: <e144225c-e0e6-4d3e-a4d8-e4c48cdef3f6@foss.st.com>
Date: Tue, 19 Aug 2025 15:17:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Rob Herring (Arm)" <robh@kernel.org>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
 <175560127037.3969097.6130940505156039734.robh@kernel.org>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <175560127037.3969097.6130940505156039734.robh@kernel.org>
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
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

CgpPbiA4LzE5LzI1IDEzOjAxLCBSb2IgSGVycmluZyAoQXJtKSB3cm90ZToKPiBPbiBUdWUsIDE5
IEF1ZyAyMDI1IDExOjE1OjU0ICswMjAwLCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+PiBU
aGUgbmV3IFNUTWljcm9lbGVjdHJvbmljcyBTb0MgZmVhdHVyZXMgYSBkaXNwbGF5IGNvbnRyb2xs
ZXIgc2ltaWxhciB0bwo+PiB0aGUgb25lIHVzZWQgaW4gcHJldmlvdXMgU29Dcy4gIEJlY2F1c2Ug
dGhlcmUgaXMgYWRkaXRpb25hbCByZWdpc3RlcnMsCj4+IGl0IGlzIGluY29tcGF0aWJsZSB3aXRo
IGV4aXN0aW5nIElQcy4KPj4KPj4gQWRkIHRoZSBuZXcgbmFtZSB0byB0aGUgbGlzdCBvZiBjb21w
YXRpYmxlIHN0cmluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8
cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMueWFtbCB8IDMwICsrKysrKysrKysrKysr
KysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKSGkgUm9iLAoKSXQgc2VlbXMgc2V2ZXJhbCBwYXRjaGVzIG9mIHRoaXMgc2VyaWVzIHRy
aWdnZXJlZCB5b3VyIGJvdCB3aXRob3V0Cndhcm5pbmdzL2Vycm9ycyBtZXNzYWdlcy4KCkRpZCBJ
IG1pc3NlZCBzb21ldGhpbmcgb3IgaXMgaXQganVzdCBhIGdsaXRjaCBpbiB0aGUgbWF0cml4ID8g
OikKCkJlc3QgcmVnYXJkcywKUmFwaGHDq2wKPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcg
J21ha2UgZHRfYmluZGluZ19jaGVjaycgb24geW91ciBwYXRjaDoKPgo+IHlhbWxsaW50IHdhcm5p
bmdzL2Vycm9yczoKPgo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6Cj4KPgo+IGRvYyBy
ZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6Cj4KPiBTZWUgaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUtYmluZGluZ3MvcGF0Y2gvMjAyNTA4
MTktZHJtLW1pc2MtbmV4dC12My0xLTA0MTUzOTc4ZWJkYkBmb3NzLnN0LmNvbQo+Cj4gVGhlIGJh
c2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVu
dCBkZXBlbmRlbmN5Cj4gc2hvdWxkIGJlIG5vdGVkIGluICp0aGlzKiBwYXRjaC4KPgo+IElmIHlv
dSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUg
YWJvdmUKPiBlcnJvcihzKSwgdGhlbiBtYWtlIHN1cmUgJ3lhbWxsaW50JyBpcyBpbnN0YWxsZWQg
YW5kIGR0LXNjaGVtYSBpcyB1cCB0bwo+IGRhdGU6Cj4KPiBwaXAzIGluc3RhbGwgZHRzY2hlbWEg
LS11cGdyYWRlCj4KPiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRo
ZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlCj4gdGhhdCBEVF9TQ0hFTUFfRklMRVMgY2Fu
IGJlIHNldCB0byB5b3VyIHNjaGVtYSBmaWxlIHRvIHNwZWVkIHVwIGNoZWNraW5nCj4geW91ciBz
Y2hlbWEuIEhvd2V2ZXIsIGl0IG11c3QgYmUgdW5zZXQgdG8gdGVzdCBhbGwgZXhhbXBsZXMgd2l0
aCB5b3VyIHNjaGVtYS4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
