Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5403B28FD
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jun 2021 09:29:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5B5CC5A4CB;
	Thu, 24 Jun 2021 07:29:51 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDFFFC5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 07:29:49 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 82DCA1FD72;
 Thu, 24 Jun 2021 07:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=kR+PfNe4nXnyixyVaRF0RtzNT/Y+BqKf6PYn7AUAVX71qua/7S7+qcmG/hbNt3W7NtB6qC
 NdAeW+V3JZmU48MszT/PTEHAFi6LavvM+BOc/R69BnhmPFNpb2do7IiZl4BHAiUl7vbqYe
 gb6LzTUcYWQDHVro4mw/9B+wescNlTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519789;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=V09ZCfFQpGvyyZsZioYEqVJyO9lNdN2ZJtxZM8VG5uQx/+rwzENBVnVOyKbDEXhAbreJYn
 Nb2en/6w3HoDtNAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 55DC011C9B;
 Thu, 24 Jun 2021 07:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=kR+PfNe4nXnyixyVaRF0RtzNT/Y+BqKf6PYn7AUAVX71qua/7S7+qcmG/hbNt3W7NtB6qC
 NdAeW+V3JZmU48MszT/PTEHAFi6LavvM+BOc/R69BnhmPFNpb2do7IiZl4BHAiUl7vbqYe
 gb6LzTUcYWQDHVro4mw/9B+wescNlTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519789;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=V09ZCfFQpGvyyZsZioYEqVJyO9lNdN2ZJtxZM8VG5uQx/+rwzENBVnVOyKbDEXhAbreJYn
 Nb2en/6w3HoDtNAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id yH4iFGw01GAJfwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:29:48 +0000
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
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Date: Thu, 24 Jun 2021 09:29:14 +0200
Message-Id: <20210624072916.27703-26-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624072916.27703-1-tzimmermann@suse.de>
References: <20210624072916.27703-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 25/27] drm/vmwgfx: Don't set struct
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
with userspace modesetting. Don't set it in vmxgfx. All usage of
the field within vmwgfx can safely be removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index b9a9b7ddadbd..4b82f5995452 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -292,15 +292,11 @@ void vmw_irq_uninstall(struct drm_device *dev)
 	if (!(dev_priv->capabilities & SVGA_CAP_IRQMASK))
 		return;
 
-	if (!dev->irq_enabled)
-		return;
-
 	vmw_write(dev_priv, SVGA_REG_IRQMASK, 0);
 
 	status = vmw_irq_status_read(dev_priv);
 	vmw_irq_status_write(dev_priv, status);
 
-	dev->irq_enabled = false;
 	free_irq(dev->irq, dev);
 }
 
@@ -315,9 +311,6 @@ int vmw_irq_install(struct drm_device *dev, int irq)
 {
 	int ret;
 
-	if (dev->irq_enabled)
-		return -EBUSY;
-
 	vmw_irq_preinstall(dev);
 
 	ret = request_threaded_irq(irq, vmw_irq_handler, vmw_thread_fn,
@@ -325,7 +318,6 @@ int vmw_irq_install(struct drm_device *dev, int irq)
 	if (ret < 0)
 		return ret;
 
-	dev->irq_enabled = true;
 	dev->irq = irq;
 
 	return ret;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
