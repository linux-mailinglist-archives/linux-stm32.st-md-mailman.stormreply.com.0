Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F275E616
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 03:15:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84BEFC6B442;
	Mon, 24 Jul 2023 01:15:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D268C6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 01:15:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D42DC60F0A;
 Mon, 24 Jul 2023 01:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99C7C433C7;
 Mon, 24 Jul 2023 01:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161300;
 bh=QhZf8toMd5+zDGE1EOIeW6wBNB1VaLLB+7VguP4KCAE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OUhAWf0eKyCot2e+mbFe1KQ9YFR0jcjjhPaYFrokV/ojDoCmwWqPeCUSc23cx3kLg
 UuTj44IuTrAuCyTSajBHo2A4gHYplr6Lvb8UPqKaFj9MIF4Zc5I33ToX+8jVI+mtMx
 1g+fv93Kz+un6oZV2Zs23SpMDvqpWBKH+/LQ48aNmTesMghmXVoZVNKAJnkJ2w99o/
 BM8e2HkJpd/p5S+MwivnFg2S5qkDhj8xkZF/24T2NqR+iVXc2/mHXF1+cVhvWeyNf0
 fzo6Iwce6B4T3FCG+bfFwX+9CxhdTc+kFab1QBVVDh+vXl2pAQ3UrCqkGz3W/b4PR9
 8dxAlY8RchzgQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun, 23 Jul 2023 21:12:44 -0400
Message-Id: <20230724011338.2298062-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
Cc: Sasha Levin <sashal@kernel.org>, mcoquelin.stm32@gmail.com,
 Dan Carpenter <error27@gmail.com>, yannick.fertre@foss.st.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kernel test robot <lkp@intel.com>
Subject: [Linux-stm32] [PATCH AUTOSEL 6.4 16/58] drm/stm: ltdc: fix late
	dereference check
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

From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

[ Upstream commit 898a9e3f56db9860ab091d4bf41b6caa99aafc3d ]

In ltdc_crtc_set_crc_source(), struct drm_crtc was dereferenced in a
container_of() before the pointer check. This could cause a kernel panic.

Fix this smatch warning:
drivers/gpu/drm/stm/ltdc.c:1124 ltdc_crtc_set_crc_source() warn: variable dereferenced before check 'crtc' (see line 1119)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/lkml/202212241802.zeLFZCXB-lkp@intel.com/
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/lkml/202212241802.zeLFZCXB-lkp@intel.com/
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
Signed-off-by: Philippe Cornu <philippe.cornu@foss.st.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230515123818.93971-1-raphael.gallais-pou@foss.st.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/stm/ltdc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 03c6becda795c..b8be4c1db4235 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1145,7 +1145,7 @@ static void ltdc_crtc_disable_vblank(struct drm_crtc *crtc)
 
 static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
 {
-	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
+	struct ltdc_device *ldev;
 	int ret;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -1153,6 +1153,8 @@ static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
 	if (!crtc)
 		return -ENODEV;
 
+	ldev = crtc_to_ltdc(crtc);
+
 	if (source && strcmp(source, "auto") == 0) {
 		ldev->crc_active = true;
 		ret = regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
