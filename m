Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D333BB8E0
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 10:20:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D106C57B60;
	Mon,  5 Jul 2021 08:20:41 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CB5AC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 08:20:38 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d12so16068404pfj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jul 2021 01:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aCuW7jGka7YaAB6OGVNNNB5YUCrDqMyCoehChrk05rk=;
 b=Iz5HZaRHXG+ZKsWQlHa/YTOi1fSkwnchI5ov1WcBJEuGvmenw47v+oMpV+xzmnz+D9
 29YxZ2cgbH8fAhy0K1EYuVOcvpsgJ+6PqOxFDEOhGn1GHfdGRvsWIrxZRp5cV+FQUMkp
 EPtBx9zDI732RFKToJrzxJD4KHjMGUa2Zf+jjKL0ivOoobguhwMYquqi7y2l48MjCMw7
 veWGXUXNpiCgX3mnL3VUD2wwUM3aAR/T+CpcBvco/ovJqHnQcqVwFshWfLum1qbZC1pk
 EPM88A41K66pkOkgoEvR8c8bQIN331n7LObcVUKkXnAHJMeV3cY1j9lvxRwipgDkySmI
 91YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aCuW7jGka7YaAB6OGVNNNB5YUCrDqMyCoehChrk05rk=;
 b=fpIZyI4tKlmwNwmsrJs2RKKccelodd5WyFVVDkQ1S7QxBRGjb65IcIDfJPsIgXje1t
 oFynbNgGeR/iNEc0aAoL5+uFZTFixInq5t4wz2eNZUCP7jhaomfrLQrAmNKHOFuc1Wmp
 EUmHIPk+oF3KPx9SBNVmd1FqxKLd0K0RYlayJAOXcgpfdSH7/K3rrasGj/gsWFnkH10R
 kRn7rTq0/AQnPjTyi0u/QnABH6xSHcFt0XBkyj/MXARUk3bI/h83gzTxmEW65aR2+pp/
 R2hU+E+bv1e2PjWFTqSvdpqFj26NOoeEhVS+mGXqOUF1UQ05CgP4ylhYSlIey9UrkKZ0
 zTsg==
X-Gm-Message-State: AOAM533sBEC6jRa0vqMt8AmrsvEXQaN7sqhITYY4ii4yg93wf3NkH0Xs
 3W8hp7ELS8w6SlNPACQvKH0=
X-Google-Smtp-Source: ABdhPJz8tIldCp8sx5EP1phU9dJqsp6hnuME1dktJHajuC/FiNhAjVHF8raNcC/yPJ6RpjpEBIBgTA==
X-Received: by 2002:a62:5105:0:b029:305:324:17ae with SMTP id
 f5-20020a6251050000b0290305032417aemr14182068pfb.28.1625473236786; 
 Mon, 05 Jul 2021 01:20:36 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y11sm12209986pfo.160.2021.07.05.01.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:20:36 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Mon,  5 Jul 2021 17:19:02 +0900
Message-Id: <0e04a9e6455faf171e5dd7885676e55b5321b1ea.1625471640.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1625471640.git.vilhelm.gray@gmail.com>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, Dan Carpenter <dan.carpenter@oracle.com>,
 kernel@pengutronix.de, William Breathitt Gray <vilhelm.gray@gmail.com>,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v12 14/17] counter: Implement *_component_id
	sysfs attributes
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

The Generic Counter chrdev interface expects users to supply component
IDs in order to select extensions for requests. In order for users to
know what component ID belongs to which extension this information must
be exposed. The *_component_id attribute provides a way for users to
discover what component ID belongs to which respective extension.

Cc: David Lechner <david@lechnology.com>
Cc: Gwendal Grignou <gwendal@chromium.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-counter | 16 ++++++++++-
 drivers/counter/counter-sysfs.c             | 30 ++++++++++++++++-----
 2 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index 9809d8a47431..e0e99adb0ecc 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -203,12 +203,26 @@ Description:
 		both edges:
 			Any state transition.
 
+What:		/sys/bus/counter/devices/counterX/countY/ceiling_component_id
+What:		/sys/bus/counter/devices/counterX/countY/floor_component_id
+What:		/sys/bus/counter/devices/counterX/countY/count_mode_component_id
+What:		/sys/bus/counter/devices/counterX/countY/direction_component_id
+What:		/sys/bus/counter/devices/counterX/countY/enable_component_id
+What:		/sys/bus/counter/devices/counterX/countY/error_noise_component_id
+What:		/sys/bus/counter/devices/counterX/countY/prescaler_component_id
+What:		/sys/bus/counter/devices/counterX/countY/preset_component_id
+What:		/sys/bus/counter/devices/counterX/countY/preset_enable_component_id
 What:		/sys/bus/counter/devices/counterX/countY/signalZ_action_component_id
+What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_component_id
+What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_enable_component_id
+What:		/sys/bus/counter/devices/counterX/signalY/filter_clock_prescaler_component_id
+What:		/sys/bus/counter/devices/counterX/signalY/index_polarity_component_id
+What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode_component_id
 KernelVersion:	5.15
 Contact:	linux-iio@vger.kernel.org
 Description:
 		Read-only attribute that indicates the component ID of the
-		respective Synapse of Count Y for Signal Z.
+		respective extension or Synapse.
 
 What:		/sys/bus/counter/devices/counterX/countY/spike_filter_ns
 KernelVersion:	5.14
diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
index bb49a10f160b..eb1505bfbd89 100644
--- a/drivers/counter/counter-sysfs.c
+++ b/drivers/counter/counter-sysfs.c
@@ -587,6 +587,7 @@ static int counter_signal_attrs_create(struct counter_device *const counter,
 	int err;
 	struct counter_comp comp;
 	size_t i;
+	struct counter_comp *ext;
 
 	/* Create main Signal attribute */
 	comp = counter_signal_comp;
@@ -602,8 +603,13 @@ static int counter_signal_attrs_create(struct counter_device *const counter,
 
 	/* Create an attribute for each extension */
 	for (i = 0; i < signal->num_ext; i++) {
-		err = counter_attr_create(dev, group, signal->ext + i, scope,
-					  signal);
+		ext = signal->ext + i;
+
+		err = counter_attr_create(dev, group, ext, scope, signal);
+		if (err < 0)
+			return err;
+
+		err = counter_comp_id_attr_create(dev, group, ext->name, i);
 		if (err < 0)
 			return err;
 	}
@@ -694,6 +700,7 @@ static int counter_count_attrs_create(struct counter_device *const counter,
 	int err;
 	struct counter_comp comp;
 	size_t i;
+	struct counter_comp *ext;
 
 	/* Create main Count attribute */
 	comp = counter_count_comp;
@@ -718,8 +725,13 @@ static int counter_count_attrs_create(struct counter_device *const counter,
 
 	/* Create an attribute for each extension */
 	for (i = 0; i < count->num_ext; i++) {
-		err = counter_attr_create(dev, group, count->ext + i, scope,
-					  count);
+		ext = count->ext + i;
+
+		err = counter_attr_create(dev, group, ext, scope, count);
+		if (err < 0)
+			return err;
+
+		err = counter_comp_id_attr_create(dev, group, ext->name, i);
 		if (err < 0)
 			return err;
 	}
@@ -783,6 +795,7 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
 	struct device *const dev = &counter->dev;
 	int err;
 	size_t i;
+	struct counter_comp *ext;
 
 	/* Add Signals sysfs attributes */
 	err = counter_sysfs_signals_add(counter, group);
@@ -815,8 +828,13 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
 
 	/* Create an attribute for each extension */
 	for (i = 0; i < counter->num_ext; i++) {
-		err = counter_attr_create(dev, group, counter->ext + i, scope,
-					  NULL);
+		ext = counter->ext + i;
+
+		err = counter_attr_create(dev, group, ext, scope, NULL);
+		if (err < 0)
+			return err;
+
+		err = counter_comp_id_attr_create(dev, group, ext->name, i);
 		if (err < 0)
 			return err;
 	}
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
