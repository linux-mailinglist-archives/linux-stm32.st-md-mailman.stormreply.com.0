Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFAFB3181B
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 14:42:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A78E0C3F95A;
	Fri, 22 Aug 2025 12:42:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FEABC3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 12:42:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MAlQTX029436;
 Fri, 22 Aug 2025 14:42:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 twVR4aLcjBcIxVR1vTBIjLNrHaf5X700fq4KHmsJOG0=; b=DWOSEnndEyapOE0z
 yWh2HktcvWlWZHVAPSNECRWV9xXMgfYF7sqZT8Z2rsta6lW0rXJw8LNtyBfBr88I
 EjmcFYbHkTQo1adZ3IoFV9EbKceqAGe/Is5mk+s+UtPf1Ul4dnJ7R4gX8CLtAUaz
 6D3xgF49WDwaxSKr1YsRUa1iAjNXnrMaaAk1UymjBCxqK7L+cIk/m2IDKOzMD/nR
 t3xoV8acdLP+gFoBMdoEuih82fSSX6v+FFgzkvFqkDrPrrFr1mRGnwWl9n3s+Pnc
 EokqKutOd6JyCkITN1c4i1AomgidgH6dX8ZFXPjoyKmFMFc/d9aecxFkeBwuf4Rh
 33Q5/A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48np7n7656-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 14:42:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3126F4004A;
 Fri, 22 Aug 2025 14:41:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DC5F71CEE0;
 Fri, 22 Aug 2025 14:40:14 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 14:40:13 +0200
Message-ID: <e2a69447-a34c-4e2e-9bbc-3975b9ef08b7@foss.st.com>
Date: Fri, 22 Aug 2025 14:40:12 +0200
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
 <20250821-drm-misc-next-v4-2-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-2-7060500f8fd3@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 02/13] dt-bindings: display: st,
 stm32-ltdc: add access-controllers property
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
dHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCgpMZSAyMS8wOC8yMDI1IMOgIDEzOjA4
LCBSYXBoYWVsIEdhbGxhaXMtUG91IGEgw6ljcml0wqA6Cj4gYWNjZXNzLWNvbnRyb2xsZXJzIGlz
IGFuIG9wdGlvbmFsIHByb3BlcnR5IHRoYXQgYWxsb3dzIGEgcGVyaXBoZXJhbCB0bwo+IHJlZmVy
IHRvIG9uZSBvciBtb3JlIGRvbWFpbiBhY2Nlc3MgY29udHJvbGxlcihzKS4KPgo+IFRoaXMgcHJv
cGVydHkgaXMgYWRkZWQgd2hlbiB0aGUgcGVyaXBoZXJhbCBpcyB1bmRlciB0aGUgU1RNMzIgZmly
ZXdhbGwKPiBjb250cm9sbGVyLiAgSXQgYWxsb3dzIGFuIGFjY3VyYXRlIHJlcHJlc2VudGF0aW9u
IG9mIHRoZSBoYXJkd2FyZSwgd2hlcmUKPiB0aGUgcGVyaXBoZXJhbCBpcyBjb25uZWN0ZWQgdG8g
YSBmaXJld2FsbCBidXMuICBUaGUgZmlyZXdhbGwgY2FuIHRoZW4gY2hlY2sKPiB0aGUgcGVyaXBo
ZXJhbCBhY2Nlc3NlcyBiZWZvcmUgYWxsb3dpbmcgaXRzIGRldmljZSB0byBwcm9iZS4KPgo+IEFj
a2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYt
Ynk6IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+
Cj4gLS0tCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxz
dG0zMi1sdGRjLnlhbWwgfCAzICsrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3N0LHN0bTMyLWx0ZGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMueWFtbAo+IGluZGV4IGJjZWRjZmVmNTQyN2Y1NzI1YTA0
NzNjMDk2MjhlNzBkMTcyYzhmNTguLmUyNzM0N2FjZWU1ZGFjZjU2Y2IzOTcxZDRiNjJjMzRkZmM2
NGQ3ZTIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvc3Qsc3RtMzItbHRkYy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy55YW1sCj4gQEAgLTQxLDYgKzQxLDkgQEAg
cHJvcGVydGllczoKPiAgICAgcmVzZXRzOgo+ICAgICAgIG1heEl0ZW1zOiAxCj4gICAKPiArICBh
Y2Nlc3MtY29udHJvbGxlcnM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiAgICAgcG9ydDoKPiAg
ICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQKPiAgICAgICBk
ZXNjcmlwdGlvbjogfAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
