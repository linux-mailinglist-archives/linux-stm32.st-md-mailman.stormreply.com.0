Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 104B03B28FB
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jun 2021 09:29:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6BC8C5A4C0;
	Thu, 24 Jun 2021 07:29:51 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99265C5A4C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 07:29:48 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5424A1FD6C;
 Thu, 24 Jun 2021 07:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCKXy17qyH2Q9pKkbs0zZtkDEhK4999qup2lTZQIc6M=;
 b=J2dVV1jH1Ybt8CUldd9L9wAMOTF1FNE3o8Qsi368Mi8gywkmmzVmYNFmUaYr7ROGxzIO+y
 u8wNt8aZfraYECxPid2ugeewTzkAtar6gHktxy4/lV1jR0WexrgexH+6ivXyxpJaIh7n6+
 EAkzieqXzSbcS965yff1F0xto4xZiqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519788;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCKXy17qyH2Q9pKkbs0zZtkDEhK4999qup2lTZQIc6M=;
 b=G4o3+bS1bdtCGTuYnzgdFHHDANE29YO+l7rERKhHrEh3Tx+IfVm9roE4Nu9QIF6tJLHDbF
 kCHo7RwjMvrLzhCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3867711A97;
 Thu, 24 Jun 2021 07:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCKXy17qyH2Q9pKkbs0zZtkDEhK4999qup2lTZQIc6M=;
 b=J2dVV1jH1Ybt8CUldd9L9wAMOTF1FNE3o8Qsi368Mi8gywkmmzVmYNFmUaYr7ROGxzIO+y
 u8wNt8aZfraYECxPid2ugeewTzkAtar6gHktxy4/lV1jR0WexrgexH+6ivXyxpJaIh7n6+
 EAkzieqXzSbcS965yff1F0xto4xZiqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519788;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCKXy17qyH2Q9pKkbs0zZtkDEhK4999qup2lTZQIc6M=;
 b=G4o3+bS1bdtCGTuYnzgdFHHDANE29YO+l7rERKhHrEh3Tx+IfVm9roE4Nu9QIF6tJLHDbF
 kCHo7RwjMvrLzhCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id OCvMDGs01GAJfwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:29:47 +0000
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
Date: Thu, 24 Jun 2021 09:29:13 +0200
Message-Id: <20210624072916.27703-25-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624072916.27703-1-tzimmermann@suse.de>
References: <20210624072916.27703-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 24/27] drm/vkms: Don't set struct
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
with userspace modesetting. Don't set it in vkms.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 027ffe759440..496de38ad983 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -163,8 +163,6 @@ static int vkms_create(struct vkms_config *config)
 		goto out_devres;
 	}
 
-	vkms_device->drm.irq_enabled = true;
-
 	ret = drm_vblank_init(&vkms_device->drm, 1);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
