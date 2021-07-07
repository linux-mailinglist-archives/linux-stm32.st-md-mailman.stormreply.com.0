Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BF93BE4AB
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jul 2021 10:48:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D4C5C57B5B;
	Wed,  7 Jul 2021 08:48:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37618C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jul 2021 08:48:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1678fZUe029506; Wed, 7 Jul 2021 10:48:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=selector1;
 bh=X2A5zaJ3/upwREqwE0Vhej/FGY58c6pTzzxOXfWJAPI=;
 b=6k1KxoxKocPZGaGuTAZhjUNdkV/2745hCIlSADrS+/TeBIFclGm5GO1/O3j8/r3ZDiRq
 cjOIym/vkNPeBPNtR4LICBV3ug9aGp9gC9Zw6tkhC57F0aTMah4M62sOQrAhQSe7igZ3
 sWs9SEiYxd3SA56XQN09qq6zHFXGeXSJJXKL4OMEwanhr1LUVnMXBt9voFQz37gA8b7+
 UvMVxD3U3V+a7B4XWckwHrKKZQy4yDd+NV2RGd3Zi+h37OKCm7ikyQptO1Xig8IxgCiy
 OAWWMuoOPsg0gjvLFFjKLcOxN1UGvJg+Df9W6mWVa5jTgKwfYGEGV0tf5C8+sONKriVv Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39n8ysr1gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 10:48:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5AE210002A;
 Wed,  7 Jul 2021 10:48:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B427216EDE;
 Wed,  7 Jul 2021 10:48:20 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Jul
 2021 10:48:20 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.015; Wed, 7 Jul 2021 10:48:20 +0200
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Yannick FERTRE - foss
 <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>, Matt Roper
 <matthew.d.roper@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [PATCH 0/2] Add "BACKGROUND_COLOR" drm property
Thread-Index: AQHXcwzWM52+nQh1ikqrNewj647ZyA==
Date: Wed, 7 Jul 2021 08:48:20 +0000
Message-ID: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_05:2021-07-06,
 2021-07-07 signatures=0
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>
Subject: [Linux-stm32] [PATCH 0/2] Add "BACKGROUND_COLOR" drm property
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello,

This series aims to add a generic background color property for CRTC as
discussed in the conversation:
https://patchwork.freedesktop.org/patch/439585/

This patch "drm: add crtc background color property" is strongly inspired
of Matthew Roper's.  Please see:
https://patchwork.freedesktop.org/patch/333632/

Raphael Gallais-Pou (2):
  drm: add crtc background color property
  drm/stm: ltdc: add crtc background color property support

 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
 drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++-
 drivers/gpu/drm/drm_mode_config.c         |  6 +++
 drivers/gpu/drm/stm/ltdc.c                | 48 ++++++++++++++++++++---
 include/drm/drm_blend.h                   |  1 +
 include/drm/drm_crtc.h                    | 12 ++++++
 include/drm/drm_mode_config.h             |  5 +++
 include/uapi/drm/drm_mode.h               | 28 +++++++++++++
 9 files changed, 132 insertions(+), 7 deletions(-)

-- 
2.17.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
