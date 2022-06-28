Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F8455BD20
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 04:03:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC0D9C56630;
	Tue, 28 Jun 2022 02:03:10 +0000 (UTC)
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14C3BC04004
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 02:03:09 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-31838c41186so92609617b3.23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 19:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=YzHIr0V9HMEpxWmEi0Xj1DJ+4d2XCpwecNoe7o3TDGc=;
 b=WOYPYkzcX52RhlZvpifs4I6lPFXV+5C99yJcPGn4swZ412myqZhpEpJGG6JT8I+diP
 wmRTXCjvAFpcr/KomN65nvaJHvYHD4UymktEo8kdn5KBIufKB90oBi6uJgpha1QorqN4
 FoHUev8RwrPNG+R9y5XCbQZGHm1ydbiuEHKmkqJMqr5AQVuz0Cn/swj+fCPxGk277wcm
 FeyAuVEaB9fajv1pTRajXKWxqwQb5RRy57WkXDveO+g9jxpPIug/uOD6UHEfjE7VM4eE
 2vOtDCyMr9g/g/WN/lFcVpdMLesGVIWYzLk/qWic19C/MVsZG3elryvTosIN7O8GZ4ml
 x6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=YzHIr0V9HMEpxWmEi0Xj1DJ+4d2XCpwecNoe7o3TDGc=;
 b=EL0dsChL+kwGh+hdcrMBjanby+U/us0p81mBdBjTkjwi7eWStdj7wmw2NCa5YVID5P
 TPHklRJlVqgm+JhvXosXUkIc4rLe4WctZYAyIDDvIkfFHzAuG9mJuTEbAPq5Dsk6mG2a
 hIoxH4xkpiS3c33yi7XBBXac61Ii0h7FNyRzDKhAHacV+Pq1+iLuD15Obvld5VP9EO93
 iWOL7rYFDDADWSdircFJ03zMGoPZsElagz0BU7ekyfVX08GZzWwFlJ+Bsov+uNOXZiUR
 hATviOALCJSvhjCHUHXUrS/93yq2xTmcsI4pfsxCu/GEqYeMqATH5dOgab37ugScSwLE
 Q4mA==
X-Gm-Message-State: AJIora/ja+TorlgqLHYIRexP1DvL0ZZB+WV4OOBWKKFYWIIomPEPA9uJ
 H9rmUWTDwwwAVRNoV29iq8yEmSYrELeLq2s=
X-Google-Smtp-Source: AGRyM1u1CI3RZWjDOxskNtWWSrcYu4D2aM8Nq4tr5iOtzOleCFvS4Q121j5zvIY5WKw81S4m4Q0aaxhGddgoJuc=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:1f27:a302:2101:1c82])
 (user=saravanak job=sendgmr) by 2002:a81:12d3:0:b0:317:aa20:e4eb with SMTP id
 202-20020a8112d3000000b00317aa20e4ebmr18821146yws.352.1656381787829; Mon, 27
 Jun 2022 19:03:07 -0700 (PDT)
Date: Mon, 27 Jun 2022 19:01:02 -0700
In-Reply-To: <20220628020110.1601693-1-saravanak@google.com>
Message-Id: <20220628020110.1601693-2-saravanak@google.com>
Mime-Version: 1.0
References: <20220628020110.1601693-1-saravanak@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, 
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Al Cooper <alcooperx@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Paul Cercueil <paul@crapouillou.net>, 
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Tobias Klauser <tklauser@distanz.ch>, Russell King <linux@armlinux.org.uk>, 
 Vineet Gupta <vgupta@kernel.org>, Richard Genoud <richard.genoud@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexander Shiyan <shc_work@mail.ru>, 
 Baruch Siach <baruch@tkos.co.il>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
 Gabriel Somlo <gsomlo@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pali Rohar <pali@kernel.org>, 
 Andreas Farber <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Hammer Hsieh <hammerh0314@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Timur Tabi <timur@kernel.org>, 
 Michal Simek <michal.simek@xilinx.com>, Saravana Kannan <saravanak@google.com>
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>,
 linux-aspeed@lists.ozlabs.org, linus walleij <linus.walleij@linaro.org>,
 ulf hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 eric dumazet <edumazet@google.com>, pavel machek <pavel@ucw.cz>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 will deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 sascha hauer <sha@pengutronix.de>, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org, kevin hilman <khilman@kernel.org>,
 joerg roedel <joro@8bytes.org>, linux-serial@vger.kernel.org,
 jakub kicinski <kuba@kernel.org>, paolo abeni <pabeni@redhat.com>,
 kernel-team@android.com, len brown <len.brown@intel.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-unisoc@lists.infradead.org, hideaki yoshifuji <yoshfuji@linux-ipv6.org>,
 netdev@vger.kernel.org, david ahern <dsahern@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, heiner kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v1 1/2] driver core: Add probe_no_timeout flag
	for drivers
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

This flag only needs to be set for drivers of devices that meet all the
following conditions:
- Need to probe successfully before userspace init in started
- Have optional suppliers
- Can't wait for deferred_probe_timeout to expire

fw_devlink=on uses this info, as needed, to ignore dependencies on supplier
devices that have not been added or supplier devices that don't have any
drivers.  It's still up to the driver to decide which of the missing
suppliers are optional or not.

Fixes: 71066545b48e ("driver core: Set fw_devlink.strict=1 by default")
Reported-by: Sascha Hauer <sha@pengutronix.de>
Reported-by: Peng Fan <peng.fan@nxp.com>
Reported-by: Fabio Estevam <festevam@gmail.com>
Reported-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/base.h           |  1 +
 drivers/base/core.c           |  7 +++++++
 drivers/base/dd.c             |  3 +++
 include/linux/device.h        |  7 +++++++
 include/linux/device/driver.h | 11 +++++++++++
 5 files changed, 29 insertions(+)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index b3a43a164dcd..149822d2086f 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -193,6 +193,7 @@ extern void device_links_no_driver(struct device *dev);
 extern bool device_links_busy(struct device *dev);
 extern void device_links_unbind_consumers(struct device *dev);
 extern void fw_devlink_drivers_done(void);
+extern void fw_devlink_probe_no_timeout(void);
 
 /* device pm support */
 void device_pm_move_to_tail(struct device *dev);
diff --git a/drivers/base/core.c b/drivers/base/core.c
index ccdd5b4295de..8e18904a1584 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -54,6 +54,7 @@ static unsigned int defer_sync_state_count = 1;
 static DEFINE_MUTEX(fwnode_link_lock);
 static bool fw_devlink_is_permissive(void);
 static bool fw_devlink_drv_reg_done;
+static bool fw_devlink_no_timeout;
 static bool fw_devlink_best_effort;
 
 /**
@@ -969,6 +970,7 @@ static void device_links_missing_supplier(struct device *dev)
 static bool dev_is_best_effort(struct device *dev)
 {
 	return (fw_devlink_best_effort && dev->can_match) ||
+		(fw_devlink_no_timeout && dev->probe_no_timeout) ||
 		(dev->fwnode && (dev->fwnode->flags & FWNODE_FLAG_BEST_EFFORT));
 }
 
@@ -1688,6 +1690,11 @@ void fw_devlink_drivers_done(void)
 	device_links_write_unlock();
 }
 
+void fw_devlink_probe_no_timeout(void)
+{
+	fw_devlink_no_timeout = true;
+}
+
 /**
  * wait_for_init_devices_probe - Try to probe any device needed for init
  *
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index e600dd2afc35..9b0ef2b6a058 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -324,6 +324,8 @@ static int deferred_probe_initcall(void)
 
 	if (!IS_ENABLED(CONFIG_MODULES))
 		fw_devlink_drivers_done();
+	else
+		fw_devlink_probe_no_timeout();
 
 	/*
 	 * Trigger deferred probe again, this time we won't defer anything
@@ -734,6 +736,7 @@ static int __driver_probe_device(struct device_driver *drv, struct device *dev)
 		return -EBUSY;
 
 	dev->can_match = true;
+	dev->probe_no_timeout = drv->probe_no_timeout;
 	pr_debug("bus: '%s': %s: matched device %s with driver %s\n",
 		 drv->bus->name, __func__, dev_name(dev), drv->name);
 
diff --git a/include/linux/device.h b/include/linux/device.h
index 424b55df0272..e6246b6cf6cf 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -536,6 +536,12 @@ struct device_physical_location {
  * @can_match:	The device has matched with a driver at least once or it is in
  *		a bus (like AMBA) which can't check for matching drivers until
  *		other devices probe successfully.
+ * @probe_no_timeout: Set by driver core to indicate that this device's probe
+ *		can't wait till driver_probe_timeout expires. This information
+ *		is used by fw_devlink=on to avoid deferring the probe of this
+ *		device to wait on supplier devices that haven't been added or
+ *		probed successfully.
+ *		See also: probe_no_timeout in struct driver.
  * @dma_coherent: this particular device is dma coherent, even if the
  *		architecture supports non-coherent devices.
  * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for the
@@ -642,6 +648,7 @@ struct device {
 	bool			of_node_reused:1;
 	bool			state_synced:1;
 	bool			can_match:1;
+	bool			probe_no_timeout:1;
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 7acaabde5396..2ce60e511504 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -55,6 +55,15 @@ enum probe_type {
  * @owner:	The module owner.
  * @mod_name:	Used for built-in modules.
  * @suppress_bind_attrs: Disables bind/unbind via sysfs.
+ * @probe_no_timeout: Set to true by drivers that bind to devices that meet all
+ *		these conditions:
+ *		- Need to probe successfully before userspace init in started
+ *		- Have optional suppliers
+ *		- Can't wait for deferred_probe_timeout to expire
+ *		fw_devlink=on uses this info, as needed, to ignore dependencies
+ *		on supplier devices that have not been added or supplier devices
+ *		that don't have any drivers. It's still up to the driver to
+ *		decide which of the missing suppliers are optional or not.
  * @probe_type:	Type of the probe (synchronous or asynchronous) to use.
  * @of_match_table: The open firmware table.
  * @acpi_match_table: The ACPI match table.
@@ -101,6 +110,8 @@ struct device_driver {
 	const char		*mod_name;	/* used for built-in modules */
 
 	bool suppress_bind_attrs;	/* disables bind/unbind via sysfs */
+	bool probe_no_timeout;
+
 	enum probe_type probe_type;
 
 	const struct of_device_id	*of_match_table;
-- 
2.37.0.rc0.161.g10f37bed90-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
