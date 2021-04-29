Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EA936F085
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Apr 2021 21:35:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF49CC58D5A;
	Thu, 29 Apr 2021 19:35:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96D02C57B74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 19:35:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TJR4GQ024136; Thu, 29 Apr 2021 21:35:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=selector1;
 bh=3zQLdHcnEWGyhtLuQpbU3SHnLEubUwQwtUzeib+iKvQ=;
 b=oUjCEHsfeQzUedgmbllHpCzup7Ot/SHbYn55A2FcqegnUyshJx6hEJFKtRmpV6qZKb3k
 GRCiVT8vBHOXGawqntV2yx6M5wUecD13Dz8XH189QMm3/QF4LpI1i05SH2wDoWfIyw+U
 yJe/zJlpV3AYvyrFlKphGQMXPaRWy7BgY57r/VHP6bvSIuogbuK8Sh0cU5u5KfSfsS2v
 DZ62AG1A7cMYltTUIcRRurLXaQ7U8uA4WTzigMPbqQNUjX0VThPdcGM4uH7ass5zRhCF
 wTBXa3pwPliZholY3Ktby/TmZ00ijYU+R2+ZAeyYWetYbBd6IuEa5qXMYn9rz462qlmv NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 387f926ft5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 21:35:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6FC9610002A;
 Thu, 29 Apr 2021 21:35:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4AA54225F80;
 Thu, 29 Apr 2021 21:35:31 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 29 Apr
 2021 21:35:30 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.012; Thu, 29 Apr 2021 21:35:30 +0200
From: Philippe CORNU - foss <philippe.cornu@foss.st.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Thread-Topic: [PATCH 7/8] drm/stm: Don't set allow_fb_modifiers explicitly
Thread-Index: AQHXO0aRxUV/UT4OhU6BH8EyeQFaRqrL5lA8
Date: Thu, 29 Apr 2021 19:35:30 +0000
Message-ID: <1619724930873.72167@foss.st.com>
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>,
 <20210427092018.832258-7-daniel.vetter@ffwll.ch>
In-Reply-To: <20210427092018.832258-7-daniel.vetter@ffwll.ch>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_10:2021-04-28,
 2021-04-29 signatures=0
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel
 Vetter <daniel.vetter@intel.com>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 7/8] drm/stm: Don't set allow_fb_modifiers
	explicitly
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Daniel,
Many thanks for your patch,
Acked-by: Philippe Cornu <philippe.cornu@st.com>
Philippe :-)

________________________________________
De : Daniel Vetter <daniel.vetter@ffwll.ch>
Envoy=E9 : mardi 27 avril 2021 11:20
=C0 : DRI Development
Cc : Intel Graphics Development; Daniel Vetter; Daniel Vetter; Yannick FERT=
RE - foss; Philippe CORNU - foss; Benjamin Gaignard; Maxime Coquelin; Alexa=
ndre TORGUE - foss; linux-stm32@st-md-mailman.stormreply.com; linux-arm-ker=
nel@lists.infradead.org
Objet : [PATCH 7/8] drm/stm: Don't set allow_fb_modifiers explicitly

Since

commit 890880ddfdbe256083170866e49c87618b706ac7
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri Jan 4 09:56:10 2019 +0100

    drm: Auto-set allow_fb_modifiers when given modifiers at plane init

this is done automatically as part of plane init, if drivers set the
modifier list correctly. Which is the case here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/stm/ltdc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 65c3c79ad1d5..e99771b947b6 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1326,8 +1326,6 @@ int ltdc_load(struct drm_device *ddev)
                goto err;
        }

-       ddev->mode_config.allow_fb_modifiers =3D true;
-
        ret =3D ltdc_crtc_init(ddev, crtc);
        if (ret) {
                DRM_ERROR("Failed to init crtc\n");
--
2.31.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
