Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C133BFAB7
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Jul 2021 14:54:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E256C5718D;
	Thu,  8 Jul 2021 12:54:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C821ACFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jul 2021 12:54:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168Cl4Z3015034; Thu, 8 Jul 2021 14:54:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=selector1;
 bh=u4Ke3f/StqxwDJ/DSjNimnJWqaj5zW0D0V5m4kxombA=;
 b=wxFfkVlnVqjZ2Cop5EgW4pluJDoJ7Sbj19PKraW8e0ppzRP2frLDFEzBwAASUCBB0NcD
 3P8hZfwS5uEmYA8tOwcX3VlIyGw/2+xvNidE4u+B75jNSGgeVEszcQJmxqOMgcbTn2Fs
 5h2I4TTcX+0GdwX2dmfIPSR/nPxfnOihE7jcuY6BfxvkRbEhdZgHg/JsMIf70l8ujxX1
 ucAm2VfqjC7W6MOoMAHBV0E9lyZq3HRyDTRnmT3f8rUG64A5OyyEieuDEetS/L+wM9q+
 vLA8sOi49YmsR3U1nirYbvpSb9dIbhFqsm59BQBQFw6J4gHtLuQJrF6mP3uOxc5c6kPt kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39nwkf1uqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 14:54:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 93B3D10002A;
 Thu,  8 Jul 2021 14:54:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79FD7221F7D;
 Thu,  8 Jul 2021 14:54:29 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Jul
 2021 14:54:28 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.015; Thu, 8 Jul 2021 14:54:28 +0200
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Yannick FERTRE - foss <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Thread-Topic: [PATCH] MAINTAINERS: Add Raphael Gallais-Pou as STM32 DRM
 maintainer
Thread-Index: AQHXc/hjJp54kpJbp024lT+8TOrwPQ==
Date: Thu, 8 Jul 2021 12:54:28 +0000
Message-ID: <20210708125217.11784-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_06:2021-07-08,
 2021-07-08 signatures=0
Cc: Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH] MAINTAINERS: Add Raphael Gallais-Pou as STM32
	DRM maintainer
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

Add Raphael Gallais-Pou as STM32 DRM maintainer.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f1171ceaf8b..4fa3bfc00f57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6165,6 +6165,7 @@ DRM DRIVERS FOR STM
 M:	Yannick Fertre <yannick.fertre@foss.st.com>
 M:	Philippe Cornu <philippe.cornu@foss.st.com>
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
+M:	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.17.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
