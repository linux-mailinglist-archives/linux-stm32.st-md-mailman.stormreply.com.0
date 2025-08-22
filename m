Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABEFB31866
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 14:53:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0477DC3F95B;
	Fri, 22 Aug 2025 12:53:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AA3EC3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 12:53:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCcbNM031206;
 Fri, 22 Aug 2025 14:53:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Re6rTgjaOJt8smZc/4rZ4g/4BKkxRKmFfBQq298eT/0=; b=vSkjrpa5OzOilbnY
 AjvA+2dJFsXmfJ3ZW8ELuKj1dBb5TWl2cyFaTAcL6A5Ho33Ldol3BZXL1ba+EAQD
 t6Ngsy6BQPi4iG9buPN/p6gaFdkFq5kHCoowmxLEzl1RsbP1KxClrsHxI+q15DDl
 9pRunOVJuO3M+/xBrjA7I3NfDhJsaGur9B52FTKJW/wKhn1XVyYWPaRzKTWOFGDc
 t/Y48qbFH9z87oQuWH9KK+in4+hcThVTOAv7wcOf20gl72r0gnPSa832bbZe7oE0
 jVSQxSE2BWoLi9XtSjEjAiSbT1TXpkYAQO0AYNCVRuTQ33aL77NArUd1Gy0nCk8a
 da41+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nd5xs75p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 14:53:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 20DAF4002D;
 Fri, 22 Aug 2025 14:52:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04C7871DB56;
 Fri, 22 Aug 2025 14:51:17 +0200 (CEST)
Received: from [10.130.74.180] (10.130.74.180) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 14:51:16 +0200
Message-ID: <ddb2c0d4-cf26-4357-ad76-5417030dcfd4@foss.st.com>
Date: Fri, 22 Aug 2025 14:51:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-1-7060500f8fd3@foss.st.com>
 <20250822-gifted-messy-fulmar-1eab63@kuoka>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250822-gifted-messy-fulmar-1eab63@kuoka>
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
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
Subject: Re: [Linux-stm32] [PATCH v4 01/13] dt-bindings: display: st: add
 two new compatibles to LTDC device
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

CgpPbiA4LzIyLzI1IDEwOjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIFRodSwg
QXVnIDIxLCAyMDI1IGF0IDAxOjA4OjUxUE0gKzAyMDAsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3Jv
dGU6Cj4+ICsgICAgdGhlbjoKPj4gKyAgICAgIHByb3BlcnRpZXM6Cj4+ICsgICAgICAgIGNsb2Nr
czoKPj4gKyAgICAgICAgICBtYXhJdGVtczogMQo+PiArICAgICAgICBjbG9jay1uYW1lczoKPj4g
KyAgICAgICAgICBtYXhJdGVtczogMQo+PiArICAtIGlmOgo+PiArICAgICAgcHJvcGVydGllczoK
Pj4gKyAgICAgICAgY29tcGF0aWJsZToKPj4gKyAgICAgICAgICBjb250YWluczoKPj4gKyAgICAg
ICAgICAgIGVudW06Cj4+ICsgICAgICAgICAgICAgIC0gc3Qsc3RtMzJtcDI1MS1sdGRjCj4+ICsg
ICAgdGhlbjoKPj4gKyAgICAgIHByb3BlcnRpZXM6Cj4+ICsgICAgICAgIGNsb2NrczoKPiBtaW5J
dGVtczogMgo+Cj4+ICsgICAgICAgICAgbWF4SXRlbXM6IDIKPj4gKyAgICAgICAgY2xvY2stbmFt
ZXM6Cj4gbWluSXRlbXM6IDIKPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCkR1bWIgbWlz
dGFrZXMuLi4gSSdsbCBjb3JyZWN0IGl0IGluIHRoZSB1cGNvbWluZyB2ZXJzaW9uLgoKVGhhbmtz
LApCZXN0IHJlZ2FyZHMsCgpSYXBoYcOrbAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
