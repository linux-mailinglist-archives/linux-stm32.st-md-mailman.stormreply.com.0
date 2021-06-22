Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB823B06AE
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jun 2021 16:10:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43C13C5A4C9;
	Tue, 22 Jun 2021 14:10:17 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66626C597BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 14:10:14 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 297C321997;
 Tue, 22 Jun 2021 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tUnj+4kuY7j3n/uHhMR317h4ZghN1xQUF/1nt80fbw=;
 b=ZAfKaGwfJl/bWORgeK/1traDZQqAHYvH9UrfPHz2s2V1vb8pRnVpL5vW2PkPerovxtogwH
 qUz4/nAUlfUtLk1spwJoMlVxAUWeAPn/f+ZFpe688fQpa/A76ndIXy6i40gNW69dfGwwqw
 vOWNwdhHSEJ36u7fmsmvJmaX2kjRf5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tUnj+4kuY7j3n/uHhMR317h4ZghN1xQUF/1nt80fbw=;
 b=gf0qHoozlUiAeJS9kfa/wnaV7wfQvxuoDNlSSKCkKr+Dj5Klh7nkIQbT4lDzxzfzEtuaqu
 ur+FHsprO/m7DSBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 1594311A98;
 Tue, 22 Jun 2021 14:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tUnj+4kuY7j3n/uHhMR317h4ZghN1xQUF/1nt80fbw=;
 b=ZAfKaGwfJl/bWORgeK/1traDZQqAHYvH9UrfPHz2s2V1vb8pRnVpL5vW2PkPerovxtogwH
 qUz4/nAUlfUtLk1spwJoMlVxAUWeAPn/f+ZFpe688fQpa/A76ndIXy6i40gNW69dfGwwqw
 vOWNwdhHSEJ36u7fmsmvJmaX2kjRf5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tUnj+4kuY7j3n/uHhMR317h4ZghN1xQUF/1nt80fbw=;
 b=gf0qHoozlUiAeJS9kfa/wnaV7wfQvxuoDNlSSKCkKr+Dj5Klh7nkIQbT4lDzxzfzEtuaqu
 ur+FHsprO/m7DSBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id uJpiBEXv0WD3UAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com
Date: Tue, 22 Jun 2021 16:09:49 +0200
Message-Id: <20210622141002.11590-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
References: <20210622141002.11590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 09/22] drm/imx: Don't set struct
	drm_device.irq_enabled
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

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in imx.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c |  3 ---
 drivers/gpu/drm/imx/imx-drm-core.c  | 11 -----------
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 37ae68a7fba5..917834b1c80e 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -133,8 +133,6 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 	if (ret)
 		goto cleanup_mode_config;
 
-	drm->irq_enabled = true;
-
 	ret = dcss_kms_bridge_connector_init(kms);
 	if (ret)
 		goto cleanup_mode_config;
@@ -178,7 +176,6 @@ void dcss_kms_detach(struct dcss_kms_dev *kms)
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 	drm_crtc_vblank_off(&kms->crtc.base);
-	drm->irq_enabled = false;
 	drm_mode_config_cleanup(drm);
 	dcss_crtc_deinit(&kms->crtc, drm);
 	drm->dev_private = NULL;
diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 76819a8ac37f..9558e9e1b431 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -207,17 +207,6 @@ static int imx_drm_bind(struct device *dev)
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
-	/*
-	 * enable drm irq mode.
-	 * - with irq_enabled = true, we can use the vblank feature.
-	 *
-	 * P.S. note that we wouldn't use drm irq handler but
-	 *      just specific driver own one instead because
-	 *      drm framework supports only one irq handler and
-	 *      drivers can well take care of their interrupts
-	 */
-	drm->irq_enabled = true;
-
 	/*
 	 * set max width and height as default value(4096x4096).
 	 * this value would be used to check framebuffer size limitation
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
