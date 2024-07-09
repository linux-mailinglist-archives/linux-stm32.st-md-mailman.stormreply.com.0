Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5B92B22C
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 10:30:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53ED2C6DD9E;
	Tue,  9 Jul 2024 08:30:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A79B6C6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 08:30:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46970J4r031206;
 Tue, 9 Jul 2024 10:30:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4ddWApf5yRC6Suz8B9WVJ/vHSrjM8rDrQEFG9pPzp1s=; b=wsEFis3CIz+Vjztg
 XX4X+LydYiLGCdtCM6SabJwpr3ie+6IWfe5khJcstAyiK9MvQwDF62bwvkt+yG5m
 WDGDPT+PiVLG5MPbHD2Q2e2FY6eIYnYZhCjGYuOyEeo3T5qWd42xn8v+kCq8Kvgy
 e589FH4mwHKGI+kOz6DHR0tWMTBeTwQY1auHQeTPmnp1B1rdgdQDAXzgKskL8EMU
 +wQu9wpBqV2WDdxYpOfPfrGHSfmb2vWyXqx4lO6L9/KD1Nw+OacTQ0gnZd4aBXYe
 V4SCC36O5e0JsvY66L55pTxUy6+WgmoQZ6i8euGr9g02YRXW+Jlej17VdIaj7tHA
 N6dp+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 406whft9m4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2024 10:30:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ADADB40044;
 Tue,  9 Jul 2024 10:29:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09C5F216821;
 Tue,  9 Jul 2024 10:28:55 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Jul
 2024 10:28:53 +0200
Message-ID: <f8295b75-1c98-44d3-9da3-92cc192297e2@foss.st.com>
Date: Tue, 9 Jul 2024 10:28:53 +0200
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
X-Originating-IP: [10.129.178.17]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
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

Ck9uIDEvNi8yNCAxNzo1NCwgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgo+IElmIGRybV9kZXZf
cmVnaXN0ZXIoKSBmYWlscywgYSBjYWxsIHRvIGRydl9sb2FkKCkgbXVzdCBiZSB1bmRvbmUsIGFz
Cj4gYWxyZWFkeSBkb25lIGluIHRoZSByZW1vdmUgZnVuY3Rpb24uCj4KPiBGaXhlczogYjc1OTAx
MmM1ZmE3ICgiZHJtL3N0bTogQWRkIFNUTTMyIExUREMgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgoKCkhp
IENocmlzdG9waGUsCgpBZnRlciBzb21lIGRlbGF5OiBhcHBsaWVkIG9uIGRybS1taXNjLW5leHQu
CgpUaGFua3MsClJhcGhhw6tsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
