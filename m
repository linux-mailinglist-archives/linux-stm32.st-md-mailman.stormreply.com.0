Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 022CB9376C5
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jul 2024 12:48:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC89BC7801A;
	Fri, 19 Jul 2024 10:48:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFC14C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 10:48:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J9RJFn010370;
 Fri, 19 Jul 2024 12:48:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 6v9mXPTP2gc6lkDgu/ArdtuvjDBIS/gGTRxcEZCHv1o=; b=rZDhHyMun4/53BuU
 +9QWLUT/eVCruYA4C3tkEraS5AfXQ5pojtaT/hbz9kgsJ/KoUNOF7g2I+keWKUDC
 /5Sk5Fs3IwMadbzTTJnt4qshuKF3W8QiGCUV7RjztBrpa5H71rAIeohvGMqiEVSf
 2Hb+27lDCw1mGxsmCwwlFpdAaEqB6njLGEQ8rpl6gZOX8r+PPCj5Es8N+h8INIuV
 /u9BDXnqqLA8zI5/6FxlidC5nOfT/zGPQMoi+jx7gKL+efxLN2ArKB7jXZDbx6wl
 1cUwA1OCnyTeE3G4ZkOHB5/PL1vpBm9g1vH0zAh5DJi3heZ7+S9M9qDNoMDJwH9t
 8XYM4Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40fe179yuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jul 2024 12:48:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 261BF4002D;
 Fri, 19 Jul 2024 12:47:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 800D924F390;
 Fri, 19 Jul 2024 12:47:28 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 19 Jul
 2024 12:47:25 +0200
Message-ID: <fca733ed-198a-4aa5-b180-f6746e6e37d8@foss.st.com>
Date: Fri, 19 Jul 2024 12:47:24 +0200
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
References: <20240712131344.98113-1-yannick.fertre@foss.st.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240712131344.98113-1-yannick.fertre@foss.st.com>
X-Originating-IP: [10.129.178.17]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: reset plane transparency
 after plane disable
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

Ck9uIDcvMTIvMjQgMTU6MTMsIFlhbm5pY2sgRmVydHJlIHdyb3RlOgo+IFRoZSBwbGFuZSdzIG9w
YWNpdHkgc2hvdWxkIGJlIHJlc2V0ZWQgd2hpbGUgdGhlIHBsYW5lCj4gaXMgZGlzYWJsZWQuIEl0
IHByZXZlbnRzIGZyb20gc2VlaW5nIGEgcG9zc2libGUgZ2xvYmFsCj4gb3IgbGF5ZXIgYmFja2dy
b3VuZCBjb2xvciBzZXQgZWFybGllci4KPgo+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHJl
IDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCkhpIFlhbm5pY2ssCgpBcHBsaWVkIG9uIGRy
bS1taXNjLW5leHQuCgpUaGFua3MsClJhcGhhw6tsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
