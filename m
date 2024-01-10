Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6748296AA
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jan 2024 10:55:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C508C6A5EA;
	Wed, 10 Jan 2024 09:55:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72D3FC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jan 2024 09:55:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40A9dklx009461; Wed, 10 Jan 2024 10:54:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=SMY/YRkrLa8qTKcLx39OUdusAyLog8eoCTO/ymESOn4=; b=tj
 iGsheSbWzimarjEDpbU+QobiMrSVJmIgPKAo/DWYJhD7pxYKNE56lMoEUWTRUKO/
 ba9JdiKknjytZ4Q9iU43t9r38h1O7AvCv12V+D0BTpMZBq3kSI6AQYk2pVCVRKZA
 4/wkm1NewSIaeykN1KIFMWFCMl1Fqxi8CINWCZPbSaAkS24NQ3n62pDjCUIAtyBY
 P1Nk5rDK/ONiOn36/EtndXk3vtmpZ8+B+e3AJyz2uxoXMRa7gB5eWAbfQMc8kbUT
 BoyfMpxd0Vs/YMDua8YXPo1JegglE/O0SG8S0NVrVThbomT6bRBGzWeZhRnF0pzU
 40eFLUw9P1Cn1zNLv2Xw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vexmffm6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 10:54:31 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1DE610002A;
 Wed, 10 Jan 2024 10:54:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D812257A9B;
 Wed, 10 Jan 2024 10:54:29 +0100 (CET)
Received: from [10.252.22.30] (10.252.22.30) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 10 Jan
 2024 10:54:26 +0100
Message-ID: <74a39554-a514-42f3-a2ab-d436d4fee474@foss.st.com>
Date: Wed, 10 Jan 2024 10:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Anholt <eric@anholt.net>, Neil Armstrong <neil.armstrong@linaro.org>
References: <20fff7f853f20a48a96db8ff186124470ec4d976.1704560028.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20fff7f853f20a48a96db8ff186124470ec4d976.1704560028.git.christophe.jaillet@wanadoo.fr>
X-Originating-IP: [10.252.22.30]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: Fix an error handling path in
 stm_drm_platform_probe()
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

SGkgQ2hyaXN0b3BoZSwKCk9uIDEvNi8yNCAxNzo1NCwgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3Rl
Ogo+IElmIGRybV9kZXZfcmVnaXN0ZXIoKSBmYWlscywgYSBjYWxsIHRvIGRydl9sb2FkKCkgbXVz
dCBiZSB1bmRvbmUsIGFzCj4gYWxyZWFkeSBkb25lIGluIHRoZSByZW1vdmUgZnVuY3Rpb24uCj4K
PiBGaXhlczogYjc1OTAxMmM1ZmE3ICgiZHJtL3N0bTogQWRkIFNUTTMyIExUREMgZHJpdmVyIikK
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3
YW5hZG9vLmZyPgo+IC0tLQo+IFRoaXMgd2FzIGFscmVhZHkgc2VudCBhIGZldyB5ZWFycyBhZ28g
aW4gWzFdIGJ1dCBpdCBnb3Qgbm8gcmVzcG9uc2UuCj4gU2luY2UsIHRoZXJlIGhhcyBiZWVuIHNv
bWUgYWN0aXZpdHkgb24gdGhpcyBkcml2ZXIsIHNvIEkgc2VuZCBpdCBhZ2Fpbi4KPgo+IE5vdGUg
dGhhdCBpdCBpcyB1bnRlc3RlZC4KPgo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjAwNTAxMTI1NTExLjEzMjAyOS0xLWNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyLwo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgpJIHRlc3RlZCBpdCBhZ2FpbnN0
IHN0bTMybXAxNTdjLWRrMi5kdHMuCgpUaGFua3MgZm9yIHlvdXIgc3VibWlzc2lvbi4KCkFja2Vk
LWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29t
PgoKClJlZ2FyZHMsCgpSYXBoYcOrbCBHYWxsYWlzLVBvdQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
