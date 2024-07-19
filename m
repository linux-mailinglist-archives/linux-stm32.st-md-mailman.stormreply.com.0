Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7BA9376BF
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jul 2024 12:47:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 990A8C7801A;
	Fri, 19 Jul 2024 10:47:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA353C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 10:47:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J9Zwhn029511;
 Fri, 19 Jul 2024 12:47:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 RZzj3xHQgxgU107La7qjlbXpfm5eUgRVHoyUDQSd6KY=; b=lrTrJsCqgSQle2Om
 LxEWA/Dt+ATafATyv5hLaZbFZR3reM+Ko2Z9BRsI2p2Ao+7Kf0D77m1zJpUkF1FV
 k9FAJj3J/S4hH91GMKvolG9y6o6nHTGaFPDkmrniQ3lgAllZt/27OJ/vhD05/NUO
 z6wLI/952vYK/8Q0QVyu2jhUVkNj5D5wfZUV1z4BFa+obDN750zZLkhQtdpFX0jq
 /3OD3f8q/9YO9nNLdyTJmFPOVW/0oHc/0cQhJ9FMZVE3QuuxoMwe4dd31noSLRuw
 371mcc5TbZX9nTkRGgLvJbuZVZHJ6SP/BU9+Ek9EBRpzRXorLANtEEnQmB3jW02z
 BQUapw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40fe1nhyx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jul 2024 12:47:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D0C4340044;
 Fri, 19 Jul 2024 12:47:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3173C24DCA3;
 Fri, 19 Jul 2024 12:46:22 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 19 Jul
 2024 12:46:21 +0200
Message-ID: <2e47028a-fc8c-40d6-a69a-4b7bc3464974@foss.st.com>
Date: Fri, 19 Jul 2024 12:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240712131453.98597-1-yannick.fertre@foss.st.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240712131453.98597-1-yannick.fertre@foss.st.com>
X-Originating-IP: [10.129.178.17]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: remove reload interrupt
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

Ck9uIDcvMTIvMjQgMTU6MTQsIFlhbm5pY2sgRmVydHJlIHdyb3RlOgo+IFRoZSByZWxvYWQgaW50
ZXJydXB0IGlzIG5vdCB1c2VkIGJ5IHRoZSBkcml2ZXIuIFRvIGF2b2lkCj4gdW5uZWNlc3Nhcnkg
Y2FsbHMgb2YgdGhlIGludGVycnVwdCByb3V0aW5lLCBkb24ndCBlbmFibGUgaXQuCj4gU29sdmUg
c21hbGwgdHlwbyBhbmQgYWRkIG1hc2sgdG8gc2ltcGxpZnkgdGhlIGRyaXZlci4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCgpI
aSBZYW5uaWNrLAoKQXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0LgoKVGhhbmtzLApSYXBoYcOrbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
