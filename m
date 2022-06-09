Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC05450EB
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jun 2022 17:36:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27319C5EC76;
	Thu,  9 Jun 2022 15:36:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 113EEC5E2CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jun 2022 15:36:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 259DPo1v005217;
 Thu, 9 Jun 2022 17:36:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dtuaJa+m/UILQWaO/yxL+xFFP13Uq2Gpdv1svpwFr3g=;
 b=0hbXc5wbc3TBXmJRjVdxvHtTgD+hdgR/QQ3X6RkSFwTvwuCMq0fzlJJuAmYiPWbyDpIi
 WnAFnxsH8NcS3zUQEfYNJQ4RDX0Xzs4V+MU3yYMriUU57miRd9/GQo/y3S09IYN1d2n3
 FpZEXS5F/ePqqgoOvd+2/Q/0CoBW0DZ3w28Qj4PYiY26Gr2GRf0CAFcIOOTFnXmsORxU
 pRyswoGqlunVLEh4KHs+MbZNJmEmMim0A7gfT+DjZnco18D83w9esEeuqhx4BFqBHiAb
 5Jicb5syWMfTHbUW6lQAGuIybfhU2qmZfL5kXAB0hr2XYNKuEGvBilwp4nGFmF/7f6h8 fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gj3d41rjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 17:36:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18BA010002A;
 Thu,  9 Jun 2022 17:36:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09C83221793;
 Thu,  9 Jun 2022 17:36:01 +0200 (CEST)
Received: from [10.201.21.53] (10.75.127.51) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 9 Jun
 2022 17:35:57 +0200
Message-ID: <a41e67b1-49e1-df0a-f349-605c2b9a133e@foss.st.com>
Date: Thu, 9 Jun 2022 17:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220603134250.592408-1-yannick.fertre@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20220603134250.592408-1-yannick.fertre@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_12,2022-06-09_02,2022-02-23_01
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: remove error message about
	scaling
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

SGksCgpUaGFua3MKCkFja2VkLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxh
aXMtcG91QGZvc3Muc3QuY29tPgoKCkNoZWVycywKClJhcGhhw6tsCgpPbiA2LzMvMjIgMTU6NDIs
IFlhbm5pY2sgRmVydHJlIHdyb3RlOgo+IFJlbW92ZSBlcnJvciBtZXNzYWdlIGFib3V0IHNjYWxp
bmcgJiByZXBsYWNlIGl0IGJ5IGEgZGVidWcKPiBtZXNzYWdlIHRvIGF2b2lkIHRvbyBtdWNoIGVy
cm9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZv
c3Muc3QuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDMgKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jCj4gaW5kZXggZWVlZmMzMjYwYzA3Li5hNDA5OGFhZmYyNDMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0
ZGMuYwo+IEBAIC0xMjE1LDcgKzEyMTUsOCBAQCBzdGF0aWMgaW50IGx0ZGNfcGxhbmVfYXRvbWlj
X2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAKPiAgCS8qIFJlamVjdCBzY2FsaW5n
ICovCj4gIAlpZiAoc3JjX3cgIT0gbmV3X3BsYW5lX3N0YXRlLT5jcnRjX3cgfHwgc3JjX2ggIT0g
bmV3X3BsYW5lX3N0YXRlLT5jcnRjX2gpIHsKPiAtCQlEUk1fRVJST1IoIlNjYWxpbmcgaXMgbm90
IHN1cHBvcnRlZCIpOwo+ICsJCURSTV9ERUJVR19EUklWRVIoIlNjYWxpbmcgaXMgbm90IHN1cHBv
cnRlZCIpOwo+ICsKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCX0KPiAgCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
