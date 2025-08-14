Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11560B2658B
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 14:40:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B35A7C35E00;
	Thu, 14 Aug 2025 12:40:08 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CA25C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 12:40:07 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EAioq1010546;
 Thu, 14 Aug 2025 14:39:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WzSNHix+jDzhryW7L6rWS044+qiGmGt0CFqW85ry1ZA=; b=MXCMvXlNHKbc+con
 Gfz+5BevdW0tajuBGnIhEJT5lDj+ijrbmRk/6w1spiO43qCkWl3tZW7gwJ/x36SA
 Qbi0deGn40RBnP5ubhNCLBvz0iAjYE6XmPBN3c60DRZLovhvuEE1GNx84ZR8Hbee
 fFl9MEdnS0k5WqzrGo0JKjLlikmtpaFgtnWE6cic9Fy8xgIvDxVOmmg6t50qAFqJ
 cXPLf9+oWcXdRmy/P11Hv6e9XESlfpbCUObOs00BlYX71IoHDRugn6zS/mG5K/SM
 4cq8ZLBZGub26xJdIXbTKZaZqbHH2ltlsk2vPjFrP+DbHnXWA+i/8KiBMx/twoPk
 66sqnw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48eh9nh6xa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 14:39:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 38D9A4004D;
 Thu, 14 Aug 2025 14:38:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A1B671CEDD;
 Thu, 14 Aug 2025 14:36:49 +0200 (CEST)
Received: from [10.252.20.8] (10.252.20.8) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 14:36:48 +0200
Message-ID: <2c13bf48-5453-4302-9cde-eac51e314af1@foss.st.com>
Date: Thu, 14 Aug 2025 14:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
 <20250812-drm-misc-next-v2-3-132fd84463d7@foss.st.com>
 <20250814-dancing-nautilus-of-camouflage-ebb441@kuoka>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250814-dancing-nautilus-of-camouflage-ebb441@kuoka>
X-Originating-IP: [10.252.20.8]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
Cc: Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 03/13] dt-bindings: display: st: add
 new compatible to LVDS device
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

CgpPbiA4LzE0LzI1IDExOjA5LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIFR1ZSwg
QXVnIDEyLCAyMDI1IGF0IDAzOjQ5OjAwUE0gKzAyMDAsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3Jv
dGU6Cj4+IFVwZGF0ZSB0aGUgY29tcGF0aWJsZSB0byBhY2NlcHQgYm90aCAic3Qsc3RtMzJtcDI1
NS1sdmRzIiBhbmQKPj4gc3Qsc3RtMzJtcDI1LWx2ZHMiIHJlc3BlY3RpdmVseS4gIERlZmF1bHQg
d2lsbCBmYWxsIGJhY2sgdG8KPj4gInN0LHN0bTMybXAyNS1sdmRzIi4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNv
bT4KPj4gLS0tCj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9z
dCxzdG0zMm1wMjUtbHZkcy55YW1sIHwgOCArKysrKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzJtcDI1LWx2ZHMueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMybXAyNS1s
dmRzLnlhbWwKPj4gaW5kZXggNjczNmY5MzI1NmI1Y2ViYjU1OGNkYTUyNTAzNjllYzRiMWIzMDMz
Yy4uYjc3N2M1NTYyNmU0YjMyMmQ3N2VmNDExYWQ5ZTRhM2FmYjZjOTEzMSAxMDA2NDQKPj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzJtcDI1
LWx2ZHMueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9zdCxzdG0zMm1wMjUtbHZkcy55YW1sCj4+IEBAIC0zMSw3ICszMSwxMyBAQCBkZXNjcmlw
dGlvbjogfAo+PiAgCj4+ICBwcm9wZXJ0aWVzOgo+PiAgICBjb21wYXRpYmxlOgo+PiAtICAgIGNv
bnN0OiBzdCxzdG0zMm1wMjUtbHZkcwo+PiArICAgIG9uZU9mOgo+PiArICAgICAgLSBpdGVtczoK
Pj4gKyAgICAgICAgICAtIGVudW06Cj4+ICsgICAgICAgICAgICAgIC0gc3Qsc3RtMzJtcDI1NS1s
dmRzCj4+ICsgICAgICAgICAgLSBjb25zdDogc3Qsc3RtMzJtcDI1LWx2ZHMKPj4gKyAgICAgIC0g
aXRlbXM6Cj4gRHJvcC4gVGhpcyBzaG91bGQgYmUganVzdCBlbnVtIG9yIGNvbnN0LCBubyBuZWVk
IGZvciBpdGVtcy4KCldoeSB3b3VsZCBpdGVtcyBub3QgYmUgYXBwbGljYWJsZSBpbiB0aGlzIGNh
c2UgPyBJIHdhbnQgdGhlIGNvbXBhdGlibGUgZmllbGQgdG8KYmUgZWl0aGVyOgoKY29tcGF0aWJs
ZSA9ICJzdCxzdG0zMm1wMjU1LWx2ZHMiLCAic3Qsc3RtMzJtcDI1LWx2ZHMiOwoKb3IKCmNvbXBh
dGlibGUgPSAic3Qsc3RtMzJtcDI1LWx2ZHMiOwoKZXhhbXBsZS1zY2hlbWEueWFtbCBzdGF0ZXMg
dGhlIHNhbWUgcGF0dGVybi4KCkJlc3QgcmVnYXJkcywKUmFwaGHDq2wKPgo+IEFja2VkLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4KPiBC
ZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
