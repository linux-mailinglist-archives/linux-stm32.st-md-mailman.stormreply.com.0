Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48385930FE2
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2024 10:34:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEA13C6C855;
	Mon, 15 Jul 2024 08:34:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C243C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2024 08:34:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F7qhhC029356;
 Mon, 15 Jul 2024 10:34:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JW1v9I2QQq6tb8htzQlK+uUAsMhkhshbWkdi6NH34IU=; b=SagcaH2C4xzMgF4c
 c+Ga/kBrOnnKUsu2zRE7GEw8U5aWpvcVCLf9wq356oesQ+SNw/88kxPaD2ApXpnp
 TRfutITol0CmXQp+n63b4/IYUXT9vHrcfESb/TYdkBR4cp3rBrD/ZBZ1dms0OpdP
 x7YoEi3JrrQnlf9TgPORH8JpT07O5PSZMZ74QOAc3UnSKN/ahTkFJk7U/biHSDBN
 /Vn+XKXVr29RoKPsMdNJsdZkql3Up6hd/ciM0zSNI9Y91mSsF58y4sb2HxcPYdxa
 cuQNy8JyBXoGkWVvTUfAIyN2n3VjUOdb6iuiwOeH880mS3AHOQngboI7Wu4+J//q
 mbcvGA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40bgwx5sj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jul 2024 10:34:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B799940045;
 Mon, 15 Jul 2024 10:34:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 447DE20E037;
 Mon, 15 Jul 2024 10:33:57 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 15 Jul
 2024 10:33:54 +0200
Message-ID: <ddc81a62-08d5-4f23-b86c-10754fb3e717@foss.st.com>
Date: Mon, 15 Jul 2024 10:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Claudiu Beznea <claudiu.beznea@microchip.com>,
 <yannick.fertre@foss.st.com>, <philippe.cornu@foss.st.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
References: <20230531072854.142629-1-claudiu.beznea@microchip.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20230531072854.142629-1-claudiu.beznea@microchip.com>
X-Originating-IP: [10.129.178.17]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_03,2024-07-11_01,2024-05-17_01
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: check memory returned by
	devm_kzalloc()
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

Ck9uIDUvMzEvMjMgMDk6MjgsIENsYXVkaXUgQmV6bmVhIHdyb3RlOgo+IGRldm1fa3phbGxvYygp
IGNhbiBmYWlsIGFuZCByZXR1cm4gTlVMTCBwb2ludGVyLiBDaGVjayBpdHMgcmV0dXJuIHN0YXR1
cy4KPiBJZGVudGlmaWVkIHdpdGggQ29jY2luZWxsZSAoa21lcnIuY29jY2kgc2NyaXB0KS4KPgo+
IEZpeGVzOiA0ODRlNzJkMzE0NmIgKCJkcm0vc3RtOiBsdGRjOiBhZGQgc3VwcG9ydCBvZiB5Y2Jj
ciBwaXhlbCBmb3JtYXRzIikKPiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRp
dS5iZXpuZWFAbWljcm9jaGlwLmNvbT4KPiAtLS0KPgo+IEhpLAo+Cj4gVGhpcyBoYXMgYmVlbiBh
ZGRyZXNzZWQgdXNpbmcga21lcnIuY29jY2kgc2NyaXB0IHByb3Bvc2VkIGZvciB1cGRhdGUKPiBh
dCBbMV0uCj4KPiBUaGFuayB5b3UsCj4gQ2xhdWRpdSBCZXpuZWEKPgo+IFsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMzA1MzAwNzQwNDQuMTYwMzQyNi0xLWNsYXVkaXUuYmV6bmVh
QG1pY3JvY2hpcC5jb20vCj4KSGkgQ2xhdWRpdSwKCkFmdGVyIHNvbWUgZGVsYXk6IGFwcGxpZWQg
b24gZHJtLW1pc2MtbmV4dC4KClRoYW5rLApSYXBoYcOrbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
