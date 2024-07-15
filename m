Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7119310F4
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2024 11:14:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A859C6C855;
	Mon, 15 Jul 2024 09:14:06 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A0E2C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2024 09:13:59 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F7r7Hx026109;
 Mon, 15 Jul 2024 11:13:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 kuaNFAqThOoB9rmCaN7C7WwFLev4HV8YKvV5v5sDUiQ=; b=B9roO90gcn1ENBF0
 z4Ev6meXnFIEMQhMSpW7RHj+DQm/EkcFglSpDKrz6+qJnLksQLg1067WfCmR402L
 bZhP+deSisnB4KRc/xrHW76cn3aofR3tb8oLDdbdyjKgT69EhSlYn4fTpACyCpy3
 Rg+RhewE/ATVrwapVybaIPwaXIxOyEZJkvL7Ht6sJLXOGIOMAQH+SMVvS/kDibYH
 Q/4C6xvjf+IaFWbC1QtKPsAr2DG5UD6CFkX2XVZnxkQVXe9yiY7lmAgPAy6pBYFc
 4aPpkc+LBclVBHhHG8RtJUTjt3zEoULHEx1fGxzrG7+xiGtUb5Fogov5+vt7Yz+w
 qGsbxg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40c4hhupjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jul 2024 11:13:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EEA3B4002D;
 Mon, 15 Jul 2024 11:13:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85B06210F9C;
 Mon, 15 Jul 2024 11:12:56 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 15 Jul
 2024 11:12:55 +0200
Message-ID: <16438bb1-2677-48bb-bdb0-91dc9d83792e@foss.st.com>
Date: Mon, 15 Jul 2024 11:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Katya Orlova <e.orlova@ispras.ru>
References: <20240216125040.8968-1-e.orlova@ispras.ru>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240216125040.8968-1-e.orlova@ispras.ru>
X-Originating-IP: [10.129.178.17]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_05,2024-07-11_01,2024-05-17_01
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Yannick Fertre <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 lvc-project@linuxtesting.org
Subject: Re: [Linux-stm32] [PATCH v4] drm/stm: Avoid use-after-free issues
 with crtc and plane
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

Ck9uIDIvMTYvMjQgMTM6NTAsIEthdHlhIE9ybG92YSB3cm90ZToKPiBsdGRjX2xvYWQoKSBjYWxs
cyBmdW5jdGlvbnMgZHJtX2NydGNfaW5pdF93aXRoX3BsYW5lcygpLAo+IGRybV91bml2ZXJzYWxf
cGxhbmVfaW5pdCgpIGFuZCBkcm1fZW5jb2Rlcl9pbml0KCkuIFRoZXNlIGZ1bmN0aW9ucwo+IHNo
b3VsZCBub3QgYmUgY2FsbGVkIHdpdGggcGFyYW1ldGVycyBhbGxvY2F0ZWQgd2l0aCBkZXZtX2t6
YWxsb2MoKQo+IHRvIGF2b2lkIHVzZS1hZnRlci1mcmVlIGlzc3VlcyBbMV0uCj4KPiBVc2UgYWxs
b2NhdGlvbnMgbWFuYWdlZCBieSB0aGUgRFJNIGZyYW1ld29yay4KPgo+IEZvdW5kIGJ5IExpbnV4
IFZlcmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpLgo+Cj4gWzFdCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC91MzY2aTc2ZTNxaGgzcmE1b3hydG5nanRtMnU1bHRlcmtl
a2N6NnkyamtuZGh1eHpsaUBkaXVqb240aDdxd2IvCj4KPiBTaWduZWQtb2ZmLWJ5OiBLYXR5YSBP
cmxvdmEgPGUub3Jsb3ZhQGlzcHJhcy5ydT4KCgpIaSBLYXR5YSwKCkFmdGVyIHNvbWUgZGVsYXk6
IGFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dC4KClRoYW5rcywKUmFwaGHDq2wKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
