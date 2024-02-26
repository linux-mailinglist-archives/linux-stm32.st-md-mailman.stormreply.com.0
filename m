Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D373E867739
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Feb 2024 14:52:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98371C6B46B;
	Mon, 26 Feb 2024 13:52:11 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 910E3C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 13:52:10 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41QALFxh024741; Mon, 26 Feb 2024 14:51:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=HrS/3jPOPurf1a/ULbGVyrwnHZgt1MgGkieYdCEifjc=; b=KH
 iIlvdjS+/zHJOZA1ehXnvdZ96KKoxvYo1na/NVRbFDma7quuT7aSbLxVZoR8p362
 x35rF/jkbaaasbISTLmGb0Hr8QJK0oYI61sv9emxu9d2R9UGV05/NE3ziGg23VhB
 xzg75hXOLYD55+vLvM7h0HOGi0xJn5yjcnJeO+sQNNtmyOxWAglleoFqoO4EtscU
 qqmL5BZ5Jd2Ch2yzDxFIwHvaGF7Acra4O32HOyU2fNOGZiKbyz0eTNNCVUssaVnP
 2b+61EWpSNn47SM2uA4K4+4fOelW7j1z6IxqHm/uwW8G72oEfHX9118zPYK/hsSq
 4kpz9apJwHdKkHTYJcow==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wfv9tw14k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 14:51:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 19F7B40044;
 Mon, 26 Feb 2024 14:51:27 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6ED7027C9C7;
 Mon, 26 Feb 2024 14:50:45 +0100 (CET)
Received: from [10.252.9.163] (10.252.9.163) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 26 Feb
 2024 14:50:44 +0100
Message-ID: <0b91cb58-b9ca-4c67-b15a-77c60bc2ee18@foss.st.com>
Date: Mon, 26 Feb 2024 14:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Katya Orlova <e.orlova@ispras.ru>
References: <20240216125040.8968-1-e.orlova@ispras.ru>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240216125040.8968-1-e.orlova@ispras.ru>
X-Originating-IP: [10.252.9.163]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_09,2024-02-26_01,2023-05-22_02
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
cmxvdmEgPGUub3Jsb3ZhQGlzcHJhcy5ydT4KCkhpIEthdHlhLAoKClRoYW5rcyBmb3IgdGhpcyBz
dWJtaXNzaW9uLgoKQWNrZWQtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxh
aXMtcG91QGZvc3Muc3QuY29tPgoKClJlZ2FyZHMsClJhcGhhw6tsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
