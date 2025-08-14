Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EB7B2658F
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 14:40:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAF57C35E00;
	Thu, 14 Aug 2025 12:40:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1D8BC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 12:40:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ECZQJ4025611;
 Thu, 14 Aug 2025 14:40:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 5fKCMwHQw3vs0QKmCY7jnj2QoZaEjMZpEYfpWJOqqSs=; b=4q5M/wLhYIAq9Tba
 VNQeiHKNYqpAGYn2zILS0VezA5Uq6pnqUZsmPqLfPQzF+UBbKqYF67e/GeufbKY8
 jJpkZ/MMNM1Pknc0uKPEgN92k1KocX3nrxe8UR7sKv4iyFOyAwo6CY93Ubf5DYja
 Oxzu15QnqwQXCx6g9RmzARa0rRAu/yda0O1IHYPgo9vMKKoFvxQ5Zr8MMuwVAMUl
 q29Mpet3JUObDmC0zWcQo98V2XjvO4K+QQ7QFpM3PnxzKJYcDxy7JZZjjwHkEcY7
 vNxt/Oy2PhZAQULdtIpr422XsBfkzmveyaRBVsnwHvVkE5mMii+QOqGz08SSvYQk
 Pe8ZcQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dw7gk7xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 14:40:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 058954004F;
 Thu, 14 Aug 2025 14:39:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5990471FD89;
 Thu, 14 Aug 2025 14:38:14 +0200 (CEST)
Received: from [10.252.20.8] (10.252.20.8) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 14:38:13 +0200
Message-ID: <ac0409ee-b953-4892-961d-4fcfe6007816@foss.st.com>
Date: Thu, 14 Aug 2025 14:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
 <20250812-drm-misc-next-v2-1-132fd84463d7@foss.st.com>
 <20250814-resolute-lime-raven-de4fa5@kuoka>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250814-resolute-lime-raven-de4fa5@kuoka>
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
Subject: Re: [Linux-stm32] [PATCH v2 01/13] dt-bindings: display: st: add
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

CgpPbiA4LzE0LzI1IDExOjA4LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIFR1ZSwg
QXVnIDEyLCAyMDI1IGF0IDAzOjQ4OjU4UE0gKzAyMDAsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3Jv
dGU6Cj4+ICtlbHNlOgo+PiArICBwcm9wZXJ0aWVzOgo+PiArICAgIGNsb2NrczoKPj4gKyAgICAg
IG1heEl0ZW1zOiA0Cj4gbWluSXRlbXMgaW5zdGVhZAo+Cj4+ICsgICAgY2xvY2stbmFtZXM6Cj4+
ICsgICAgICBtYXhJdGVtczogNAo+IG1pbkl0ZW1zIGluc3RlYWQKCkFjaywgaW5kZWVkIEkgd3Jv
bmdseSBjbGFtcGVkIHRoZSB2YWx1ZXMgaGVyZS4KCkJlc3QgcmVnYXJkcywKUmFwaGHDq2wKPgo+
PiArCj4+ICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6
eXN6dG9mCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
