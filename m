Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF530A4C5
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Feb 2021 11:00:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CECDEC57185;
	Mon,  1 Feb 2021 10:00:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0F95C57181
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Feb 2021 10:00:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1119aXJ2030768; Mon, 1 Feb 2021 11:00:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=0OHT/KLCuvN+f9RwKM/ud/dFXHBYEnWKpIcB3tlYBfs=;
 b=jOI40WdRKGctPn1+GwHJ9dpkkaX8RM7PknIPny1H8PcdSFJpsk5iFd6Hz2AVMyARkjZF
 IiZ6xtZh5gne0pTaLDFwNUn+0kEITORKzo6FQDSBz4EJlB0K0ZBlZtzwIQNCd9ovEIs2
 YqaM3GP5hLIbqlvPQPXGDKoQPzZPq6Qu6N8RumyYOGmVgyqWC1kWuSTT7BhDWMcDyazj
 dkpXN3rynnGTZEZC5xiL8yF7PQS9hwGmmgwZBmksUbn5O2/fbh35CEnpJ7+B/TkOD2YV
 GtenP74LhXFzRy3HMF/aQ7dITfUakTcepaSMECTjwIMHZWe2/5abWAVxtPZyX2HPNrKV lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0nrjdey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 11:00:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C470310003D;
 Mon,  1 Feb 2021 11:00:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B98CF22D602;
 Mon,  1 Feb 2021 11:00:27 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Feb 2021 11:00:27
 +0100
From: <patrice.chotard@foss.st.com>
To: <linux-kernel@vger.kernel.org>
Date: Mon, 1 Feb 2021 11:00:21 +0100
Message-ID: <20210201100023.10985-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210201100023.10985-1-patrice.chotard@foss.st.com>
References: <20210201100023.10985-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-01_04:2021-01-29,
 2021-02-01 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] MAINTAINERS: Update some st.com email
	addresses to foss.st.com
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Update some st.com to foss.st.com addresses related to STMicroelectronics
drivers. All these people will now use this new email address for upstream
activities.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 MAINTAINERS | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3e847f7f3dc..8222e50a9902 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2504,7 +2504,7 @@ N:	sc27xx
 N:	sc2731
 
 ARM/STI ARCHITECTURE
-M:	Patrice Chotard <patrice.chotard@st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://www.stlinux.com
@@ -2537,7 +2537,7 @@ F:	include/linux/remoteproc/st_slim_rproc.h
 
 ARM/STM32 ARCHITECTURE
 M:	Maxime Coquelin <mcoquelin.stm32@gmail.com>
-M:	Alexandre Torgue <alexandre.torgue@st.com>
+M:	Alexandre Torgue <alexandre.torgue@foss.st.com>
 L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -3149,7 +3149,7 @@ C:	irc://irc.oftc.net/bcache
 F:	drivers/md/bcache/
 
 BDISP ST MEDIA DRIVER
-M:	Fabien Dessenne <fabien.dessenne@st.com>
+M:	Fabien Dessenne <fabien.dessenne@foss.st.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	https://linuxtv.org
@@ -5042,7 +5042,7 @@ S:	Maintained
 F:	drivers/platform/x86/dell-wmi.c
 
 DELTA ST MEDIA DRIVER
-M:	Hugues Fruchet <hugues.fruchet@st.com>
+M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	https://linuxtv.org
@@ -5974,8 +5974,8 @@ F:	Documentation/devicetree/bindings/display/st,stih4xx.txt
 F:	drivers/gpu/drm/sti
 
 DRM DRIVERS FOR STM
-M:	Yannick Fertre <yannick.fertre@st.com>
-M:	Philippe Cornu <philippe.cornu@st.com>
+M:	Yannick Fertre <yannick.fertre@foss.st.com>
+M:	Philippe Cornu <philippe.cornu@foss.st.com>
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
 M:	Vincent Abriou <vincent.abriou@st.com>
 L:	dri-devel@lists.freedesktop.org
@@ -8196,7 +8196,7 @@ F:	include/linux/hugetlb.h
 F:	mm/hugetlb.c
 
 HVA ST MEDIA DRIVER
-M:	Jean-Christophe Trotin <jean-christophe.trotin@st.com>
+M:	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	https://linuxtv.org
@@ -11101,7 +11101,7 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/dvb-frontends/stv6111*
 
 MEDIA DRIVERS FOR STM32 - DCMI
-M:	Hugues Fruchet <hugues.fruchet@st.com>
+M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
@@ -16813,7 +16813,7 @@ F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
 F:	drivers/media/i2c/st-mipid02.c
 
 ST STM32 I2C/SMBUS DRIVER
-M:	Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
+M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-stm32*
@@ -16944,7 +16944,7 @@ S:	Maintained
 F:	drivers/block/skd*[ch]
 
 STI AUDIO (ASoC) DRIVERS
-M:	Arnaud Pouliquen <arnaud.pouliquen@st.com>
+M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
@@ -16964,15 +16964,15 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/usb/stk1160/
 
 STM32 AUDIO (ASoC) DRIVERS
-M:	Olivier Moysan <olivier.moysan@st.com>
-M:	Arnaud Pouliquen <arnaud.pouliquen@st.com>
+M:	Olivier Moysan <olivier.moysan@foss.st.com>
+M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/st,stm32-*.yaml
 F:	sound/soc/stm/
 
 STM32 TIMER/LPTIMER DRIVERS
-M:	Fabrice Gasnier <fabrice.gasnier@st.com>
+M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
 S:	Maintained
 F:	Documentation/ABI/testing/*timer-stm32
 F:	Documentation/devicetree/bindings/*/*stm32-*timer*
@@ -16982,7 +16982,7 @@ F:	include/linux/*/stm32-*tim*
 
 STMMAC ETHERNET DRIVER
 M:	Giuseppe Cavallaro <peppe.cavallaro@st.com>
-M:	Alexandre Torgue <alexandre.torgue@st.com>
+M:	Alexandre Torgue <alexandre.torgue@foss.st.com>
 M:	Jose Abreu <joabreu@synopsys.com>
 L:	netdev@vger.kernel.org
 S:	Supported
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
