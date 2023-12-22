Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD1D81C6EE
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 09:56:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC73BC6C820;
	Fri, 22 Dec 2023 08:56:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE9ECC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 08:56:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3BM2PZdm029359; Fri, 22 Dec 2023 09:55:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=6K7EDgRoPeNIU6pGeEY5sDhAR+XpZ5VVTKmSc5bq+Rc=; b=6G
 1tEDCPhk8pbY2YBJT2Uv+BV0qhciaE1wl9Fy44m8TqHk3Em7lZLefgoDSHSrZyXS
 wZMfRrSNPvuxNlG08DKfBAFhk3Rzg/NO+/Kh0PmBqiYaptt6q3cO19qx4fMvAg5y
 vS9E4Gc9zSQO26dNpb9lBWKHpQyRJou5vknC12ZocDDD9mPM5CNSf2u7MILgpmfL
 pTcWGwKJ8QaqIxjh/bVZK1rZAyY2h12bHWKKPgEApOdDEVJ5U2H0FqJB3mn1qQDp
 uaICui3Fqp3th65GACnQi1jtIZepj2uRxqXPnXY2isywfMoFmCr9YD6KOKATqQWU
 UBBVBHXsvLz9LSCD6IlQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v11w9bbx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Dec 2023 09:55:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 13F57100069;
 Fri, 22 Dec 2023 09:55:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B562120B63A;
 Fri, 22 Dec 2023 09:55:37 +0100 (CET)
Received: from [10.252.15.82] (10.252.15.82) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Dec
 2023 09:55:37 +0100
Message-ID: <024f56fd-6fe2-4a6f-a5a0-2ef06faa653a@foss.st.com>
Date: Fri, 22 Dec 2023 09:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
 <20231221124339.420119-3-raphael.gallais-pou@foss.st.com>
 <88834783-5aea-46d2-82cc-dd22cb4473f5@linaro.org>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <88834783-5aea-46d2-82cc-dd22cb4473f5@linaro.org>
X-Originating-IP: [10.252.15.82]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-22_04,2023-12-21_02,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH RESEND v1 2/8] dt-bindings: display: add
 dt-bindings for STM32 LVDS device
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

Ck9uIDEyLzIxLzIzIDIxOjM2LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDIxLzEy
LzIwMjMgMTM6NDMsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+IEFkZCBkdC1iaW5kaW5n
IGZpbGUgZm9yICJzdCxzdG0zMi1sdmRzIiBjb21wYXRpYmxlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+
PiAtLS0KPiBJIGRvbid0IGtub3cgd2h5IHRoaXMgd2FzIHJlc2VuZCwgbm90aGluZyBleHBsYWlu
cyBpdCwgYnV0IEkgYWxyZWFkeQo+IGNvbW1lbnRlZCBvbiBvdGhlciB2ZXJzaW9uLgo+Cj4gUGxl
YXNlIHJlc3BvbmQgdG8gY29tbWVudHMgdGhlcmUuCj4KPiBJbiB0aGUgZnV0dXJlLCB1bmxlc3Mg
aXQgaXMgb2J2aW91cyByZXNlbmQgb3ZlciAyIHdlZWtzLCBzYXkgd2h5IHlvdSBhcmUKPiBkb2lu
ZyBpdCBhbmQgd2hhdCBjaGFuZ2VkLgoKTXkgcHJveHkgdGVuZHMgdG8gYmxvY2sgZXZlcnkgcGF0
Y2ggYWZ0ZXIgYSBiYXRjaCBvZiA0IG9yIDUgcGF0Y2hlcy4gU2luY2UgaXQKc3BsaXR0ZWQgdGhl
IHNlcmllIGluIGhhbGYgSSByZXNlbnQgaXQgc28gdGhhdCB0aGUgc2VyaWUgY291bGQgYmUgZW50
aXJlbHkgcmVhZAp3aXRob3V0IHByb2JsZW1zLiBUaGlzIGV4cGxhaW5zIHRoZSByZXNlbmQuIEkg
d2FzIG5vdCBzdXJlIGFib3V0IHB1dHRpbmcgYSBzaG9ydApleHBsYW5hdGlvbiBpbiB0aGUgY292
ZXIgbGV0dGVyIHNpbmNlIGl0IHdhcyBub3QgcmVsYXRlZCBhbnkgY2hhbmdlIGluIHRoZQpzZXJp
ZSwgYnV0IG5leHQgdGltZSBJIHdpbGwgZG8gc28uCgpCZXN0IFJlZ2FyZHMsCgpSYXBoYcOrbAoK
Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
