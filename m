Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1ADB31842
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 14:49:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F50FC3F95B;
	Fri, 22 Aug 2025 12:49:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7AE5C3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 12:49:29 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCkkEZ009011;
 Fri, 22 Aug 2025 14:49:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 BBUcXlxzscyorCoaJ9iJ2kd5UTgHKRJLd4Iov/cXDBI=; b=dRbXqxYFHYZu0NTY
 BCOn6XSFf1YRiKYIGJnepLQpmrq2iyKf65fxTTXn3aH5Nbqc+k/14vp1sLsJyMwe
 ArTs1NeZShJYPrcuVExX22ntyt7ztOQ+4MhjL0z/Q1/n+l6GRtadpTlUfbKyuTZz
 ptr0qVOL3Z2+WiPS6hKrrCIhJLVzohLYDuc/Dpw2+n6+Fj8V7sKFQmqvsvPwk6nn
 z8IOq6SPx/8GWvdMzq3XNzhEmxVQwNzxwuMRaiDpuNBLMzDevzud4FKnSA5BWjJz
 H2hCyxdQjRisapgF+YuRvw+B72ydhRJ2RBTS+sU1MSb94ewt3U46kIMSKn2gqUJ1
 Ce3V5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nj3v87d2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 14:49:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EE9284004B;
 Fri, 22 Aug 2025 14:47:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9057A71CEF9;
 Fri, 22 Aug 2025 14:46:52 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 14:46:51 +0200
Message-ID: <ee21d95d-31fe-40e8-ab89-06ce3a44b4bb@foss.st.com>
Date: Fri, 22 Aug 2025 14:46:51 +0200
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
 <20250821-drm-misc-next-v4-5-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-5-7060500f8fd3@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 05/13] dt-bindings: display: st,
 stm32mp25-lvds: add power-domains property
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
IFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBTVE0zMiBMVkRTIHBlcmlwaGVyYWwg
bWF5IGJlIGluIGEgcG93ZXIgZG9tYWluLiAgQWxsb3cgYW4gb3B0aW9uYWwKPiBzaW5nbGUgJ3Bv
d2VyLWRvbWFpbnMnIGVudHJ5IGZvciBTVE0zMiBMVkRTIGRldmljZXMuCj4KPiBBY2tlZC1ieTog
Um9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBSYXBo
YWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+IC0tLQo+
ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzJtcDI1
LWx2ZHMueWFtbCB8IDMgKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
c3Qsc3RtMzJtcDI1LWx2ZHMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3N0LHN0bTMybXAyNS1sdmRzLnlhbWwKPiBpbmRleCAwNWE3M2JiYzI0NmE4OTk0
YjZhYWJmN2MyY2Q5ZGNhNzczMjMyYmU0Li4xNGUwNDIxNTYxNzljYjJmMmQ5MDY0MjJlYWZmNjg0
MGRhM2M5MWVhIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3N0LHN0bTMybXAyNS1sdmRzLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMm1wMjUtbHZkcy55YW1sCj4gQEAgLTYy
LDYgKzYyLDkgQEAgcHJvcGVydGllczoKPiAgICAgYWNjZXNzLWNvbnRyb2xsZXJzOgo+ICAgICAg
IG1heEl0ZW1zOiAxCj4gICAKPiArICBwb3dlci1kb21haW5zOgo+ICsgICAgbWF4SXRlbXM6IDEK
PiArCj4gICAgIHBvcnRzOgo+ICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3Bl
cnRpZXMvcG9ydHMKPiAgIAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
