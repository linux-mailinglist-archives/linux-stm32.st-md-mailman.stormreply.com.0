Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80562791269
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 09:41:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 328DEC6B45F;
	Mon,  4 Sep 2023 07:41:40 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A009C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 23:40:59 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6befdad890eso1939718a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Sep 2023 16:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611658; x=1694216458;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1eWAYznHaK0aWczuNWbSMuURPigxfjsQS0xy+Sev48=;
 b=KEHS6Zzn4z6P2Mlcc/C27JsgiHJl88uCVsigWS3T3KK7G5OE+AgDwTFY6S7xNO149R
 gPyt5/UGd+FVRzAUzf4BltrWL/UvdnlebvKWo76GDXhnRjQ5RSx5NTYFdbha1sVnW0yI
 1D9eJPH94K7GX/e0/sd/uoKhJ/yvN4O7iPseY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611658; x=1694216458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1eWAYznHaK0aWczuNWbSMuURPigxfjsQS0xy+Sev48=;
 b=FNp6xb676EFbnBd6d+98ZHNfRA3+lmLn8bajQRuGi8ZM4S05Dgm7cfW36HMoPclY3c
 wOAQCWJzkts5SD5lHJJqdQEE8Zw7Ajn4F4B5F7Q8k0bwiyDKpEFGBBP8D1whpehh8n/2
 iZRmB6omyvxQ781p7dfvobSazpzO2CZK/RMDs7E/wpd8BBx36FXBlYOJD0RxFxyivVbG
 dZBTwoSSNFx9limitVFMaS1eLZMmnRxLbreOvAX1CRtBnqoifzCP5Uula4LnV+5glAnQ
 qhpgJcMBsEEBp3muqoAW95VjydjnlEC8m9h1tvhIO6V0SmQSZcCWPnqPdecWh+KXP3ks
 M1mQ==
X-Gm-Message-State: AOJu0Yx3EGX/2qhFOFDZvebut8Q0j1Onj62CcdtdmIn+/2sU1ZdwhdMC
 wpgWfRNSNvxJYWjuxiybhzwZdw==
X-Google-Smtp-Source: AGHT+IHWh0EZjB4sRwdO+sv2azBowUIC3rylFr9w/wT3XrqIi1O/kU8t1TW+RVuuA1jXai1FluM7wA==
X-Received: by 2002:a05:6870:e2d4:b0:1d0:f067:bf23 with SMTP id
 w20-20020a056870e2d400b001d0f067bf23mr4176763oad.25.1693611658361; 
 Fri, 01 Sep 2023 16:40:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 5-20020a17090a1a4500b0026b4ca7f62csm3773488pjl.39.2023.09.01.16.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:40:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Date: Fri,  1 Sep 2023 16:39:56 -0700
Message-ID: <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234015.566018-1-dianders@chromium.org>
References: <20230901234015.566018-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Sep 2023 07:41:37 +0000
Cc: linux-aspeed@lists.ozlabs.org, tomi.valkeinen@ideasonboard.com,
 linus.walleij@linaro.org, Douglas Anderson <dianders@chromium.org>,
 airlied@gmail.com, linux-stm32@st-md-mailman.stormreply.com, emma@anholt.net,
 joel@jms.id.au, airlied@redhat.com, daniel@ffwll.ch, hdegoede@redhat.com,
 linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com, andrew@aj.id.au,
 tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, jyri.sarha@iki.fi
Subject: [Linux-stm32] [RFT PATCH 5/6] drm: Call
	drm_atomic_helper_shutdown() at shutdown/remove time for misc
	drivers
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

Based on grepping through the source code these drivers appear to be
missing a call to drm_atomic_helper_shutdown() at system shutdown time
and at driver remove (or unbind) time. Among other things, this means
that if a panel is in use that it won't be cleanly powered off at
system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart and at driver remove (or unbind) time comes
straight out of the kernel doc "driver instance overview" in
drm_drv.c.

A few notes about these fixes:
- I confirmed that these drivers were all DRIVER_MODESET type drivers,
  which I believe makes this relevant.
- I confirmed that these drivers were all DRIVER_ATOMIC.
- When adding drm_atomic_helper_shutdown() to the remove/unbind path,
  I added it after drm_kms_helper_poll_fini() when the driver had
  it. This seemed to be what other drivers did. If
  drm_kms_helper_poll_fini() wasn't there I added it straight after
  drm_dev_unregister().
- This patch deals with drivers using the component model in similar
  ways as the patch ("drm: Call drm_atomic_helper_shutdown() at
  shutdown time for misc drivers")
- These fixes rely on the patch ("drm/atomic-helper:
  drm_atomic_helper_shutdown(NULL) should be a noop") to simplify
  shutdown.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c |  7 +++++++
 drivers/gpu/drm/mgag200/mgag200_drv.c   |  8 ++++++++
 drivers/gpu/drm/pl111/pl111_drv.c       |  7 +++++++
 drivers/gpu/drm/stm/drv.c               |  7 +++++++
 drivers/gpu/drm/tilcdc/tilcdc_drv.c     | 11 ++++++++++-
 drivers/gpu/drm/tve200/tve200_drv.c     |  7 +++++++
 drivers/gpu/drm/vboxvideo/vbox_drv.c    | 10 ++++++++++
 7 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index d207b03f8357..78122b35a0cb 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -358,11 +358,18 @@ static void aspeed_gfx_remove(struct platform_device *pdev)
 	sysfs_remove_group(&pdev->dev.kobj, &aspeed_sysfs_attr_group);
 	drm_dev_unregister(drm);
 	aspeed_gfx_unload(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
+static void aspeed_gfx_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
 }
 
 static struct platform_driver aspeed_gfx_platform_driver = {
 	.probe		= aspeed_gfx_probe,
 	.remove_new	= aspeed_gfx_remove,
+	.shutdown	= aspeed_gfx_shutdown,
 	.driver = {
 		.name = "aspeed_gfx",
 		.of_match_table = aspeed_gfx_match,
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index abddf37f0ea1..2fb18b782b05 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_file.h>
@@ -278,6 +279,12 @@ static void mgag200_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	drm_dev_unregister(dev);
+	drm_atomic_helper_shutdown(dev);
+}
+
+static void mgag200_pci_shutdown(struct pci_dev *pdev)
+{
+	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
 }
 
 static struct pci_driver mgag200_pci_driver = {
@@ -285,6 +292,7 @@ static struct pci_driver mgag200_pci_driver = {
 	.id_table = mgag200_pciidlist,
 	.probe = mgag200_pci_probe,
 	.remove = mgag200_pci_remove,
+	.shutdown = mgag200_pci_shutdown,
 };
 
 drm_module_pci_driver_if_modeset(mgag200_pci_driver, mgag200_modeset);
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ba3b5b5f0cdf..02e6b74d5016 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -323,12 +323,18 @@ static void pl111_amba_remove(struct amba_device *amba_dev)
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 
 	drm_dev_unregister(drm);
+	drm_atomic_helper_shutdown(drm);
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
 	drm_dev_put(drm);
 	of_reserved_mem_device_release(dev);
 }
 
+static void pl111_amba_shutdown(struct amba_device *amba_dev)
+{
+	drm_atomic_helper_shutdown(amba_get_drvdata(amba_dev));
+}
+
 /*
  * This early variant lacks the 565 and 444 pixel formats.
  */
@@ -431,6 +437,7 @@ static struct amba_driver pl111_amba_driver __maybe_unused = {
 	},
 	.probe = pl111_amba_probe,
 	.remove = pl111_amba_remove,
+	.shutdown = pl111_amba_shutdown,
 	.id_table = pl111_id_table,
 };
 
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index c68c831136c9..e8523abef27a 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -114,6 +114,7 @@ static void drv_unload(struct drm_device *ddev)
 	DRM_DEBUG("%s\n", __func__);
 
 	drm_kms_helper_poll_fini(ddev);
+	drm_atomic_helper_shutdown(ddev);
 	ltdc_unload(ddev);
 }
 
@@ -225,6 +226,11 @@ static void stm_drm_platform_remove(struct platform_device *pdev)
 	drm_dev_put(ddev);
 }
 
+static void stm_drm_platform_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id drv_dt_ids[] = {
 	{ .compatible = "st,stm32-ltdc"},
 	{ /* end node */ },
@@ -234,6 +240,7 @@ MODULE_DEVICE_TABLE(of, drv_dt_ids);
 static struct platform_driver stm_drm_platform_driver = {
 	.probe = stm_drm_platform_probe,
 	.remove_new = stm_drm_platform_remove,
+	.shutdown = stm_drm_platform_shutdown,
 	.driver = {
 		.name = "stm32-display",
 		.of_match_table = drv_dt_ids,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index fe56beea3e93..8ebd7134ee21 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -175,6 +175,7 @@ static void tilcdc_fini(struct drm_device *dev)
 		drm_dev_unregister(dev);
 
 	drm_kms_helper_poll_fini(dev);
+	drm_atomic_helper_shutdown(dev);
 	tilcdc_irq_uninstall(dev);
 	drm_mode_config_cleanup(dev);
 
@@ -389,6 +390,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 
 init_failed:
 	tilcdc_fini(ddev);
+	platform_set_drvdata(pdev, NULL);
 
 	return ret;
 }
@@ -537,7 +539,8 @@ static void tilcdc_unbind(struct device *dev)
 	if (!ddev->dev_private)
 		return;
 
-	tilcdc_fini(dev_get_drvdata(dev));
+	tilcdc_fini(ddev);
+	dev_set_drvdata(dev, NULL);
 }
 
 static const struct component_master_ops tilcdc_comp_ops = {
@@ -582,6 +585,11 @@ static int tilcdc_pdev_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void tilcdc_pdev_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id tilcdc_of_match[] = {
 		{ .compatible = "ti,am33xx-tilcdc", },
 		{ .compatible = "ti,da850-tilcdc", },
@@ -592,6 +600,7 @@ MODULE_DEVICE_TABLE(of, tilcdc_of_match);
 static struct platform_driver tilcdc_platform_driver = {
 	.probe      = tilcdc_pdev_probe,
 	.remove     = tilcdc_pdev_remove,
+	.shutdown   = tilcdc_pdev_shutdown,
 	.driver     = {
 		.name   = "tilcdc",
 		.pm     = pm_sleep_ptr(&tilcdc_pm_ops),
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 0bb56d063536..acce210e2554 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -242,6 +242,7 @@ static void tve200_remove(struct platform_device *pdev)
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
 	drm_dev_unregister(drm);
+	drm_atomic_helper_shutdown(drm);
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
 	drm_mode_config_cleanup(drm);
@@ -249,6 +250,11 @@ static void tve200_remove(struct platform_device *pdev)
 	drm_dev_put(drm);
 }
 
+static void tve200_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id tve200_of_match[] = {
 	{
 		.compatible = "faraday,tve200",
@@ -263,6 +269,7 @@ static struct platform_driver tve200_driver = {
 	},
 	.probe = tve200_probe,
 	.remove_new = tve200_remove,
+	.shutdown = tve200_shutdown,
 };
 drm_module_platform_driver(tve200_driver);
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 4fee15c97c34..047b95812334 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -12,6 +12,7 @@
 #include <linux/vt_kern.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_file.h>
@@ -97,11 +98,19 @@ static void vbox_pci_remove(struct pci_dev *pdev)
 	struct vbox_private *vbox = pci_get_drvdata(pdev);
 
 	drm_dev_unregister(&vbox->ddev);
+	drm_atomic_helper_shutdown(&vbox->ddev);
 	vbox_irq_fini(vbox);
 	vbox_mode_fini(vbox);
 	vbox_hw_fini(vbox);
 }
 
+static void vbox_pci_shutdown(struct pci_dev *pdev)
+{
+	struct vbox_private *vbox = pci_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(&vbox->ddev);
+}
+
 static int vbox_pm_suspend(struct device *dev)
 {
 	struct vbox_private *vbox = dev_get_drvdata(dev);
@@ -165,6 +174,7 @@ static struct pci_driver vbox_pci_driver = {
 	.id_table = pciidlist,
 	.probe = vbox_pci_probe,
 	.remove = vbox_pci_remove,
+	.shutdown = vbox_pci_shutdown,
 	.driver.pm = pm_sleep_ptr(&vbox_pm_ops),
 };
 
-- 
2.42.0.283.g2d96d420d3-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
