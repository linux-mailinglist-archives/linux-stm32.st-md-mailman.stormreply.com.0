Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D08914091
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 04:41:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A49AC71287;
	Mon, 24 Jun 2024 02:41:33 +0000 (UTC)
Received: from out30-112.freemail.mail.aliyun.com
 (out30-112.freemail.mail.aliyun.com [115.124.30.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 674FBC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 02:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1719196884; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=/xgdevl4TYnHfGR8fctsT0v4UfOOmmnya9bKIxDS7gw=;
 b=QOZAyQexw+fRX+OQOj255xEP45jcEEntFqAxUYKlt3+oL2cBy7o0ItcvjNc04HV3ery9me2ydgtSSWEU5zfhGjNfV+HrXAxXk+hwgnkmNqauNiir03oQ0usz/jbK7mgh9mQtpO7VRGt5P88TDo9eSSff9Ewocu+1MKavKAoYy1Y=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067113;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0W90yZxq_1719196874; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W90yZxq_1719196874) by smtp.aliyun-inc.com;
 Mon, 24 Jun 2024 10:41:23 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: yannick.fertre@foss.st.com
Date: Mon, 24 Jun 2024 10:41:13 +0800
Message-Id: <20240624024113.54850-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Cc: mcoquelin.stm32@gmail.com, daniel@ffwll.ch,
 Abaci Robot <abaci@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 tzimmermann@suse.de, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: Remove unused function
	plane_to_ltdc
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

The function are defined in the ltdc.c file, but not called
anywhere, so delete the unused function.

drivers/gpu/drm/stm/ltdc.c:494:35: warning: unused function 'encoder_to_ltdc'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9403
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/stm/ltdc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 5576fdae4962..3f280155e25c 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -491,11 +491,6 @@ static inline struct ltdc_device *plane_to_ltdc(struct drm_plane *plane)
 	return (struct ltdc_device *)plane->dev->dev_private;
 }
 
-static inline struct ltdc_device *encoder_to_ltdc(struct drm_encoder *enc)
-{
-	return (struct ltdc_device *)enc->dev->dev_private;
-}
-
 static inline enum ltdc_pix_fmt to_ltdc_pixelformat(u32 drm_fmt)
 {
 	enum ltdc_pix_fmt pf;
-- 
2.20.1.7.g153144c

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
