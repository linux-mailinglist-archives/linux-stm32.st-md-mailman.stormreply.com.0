Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BC43C6DF7
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jul 2021 11:55:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE9F7C597AA;
	Tue, 13 Jul 2021 09:54:59 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29E45C59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 09:54:58 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id a2so21137154pgi.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aujji+42NnuAmjXYd1m2CztTTlNY+0bpT1pWUi5S9DQ=;
 b=uu9HHbhkRlS5nGljRfGQQjz+OWc4W8dE1C4xI10hcWWcP9w7AYA3s5Ja5VNfBaJffx
 HAU057dCB/yqzdHXC2FaesY0GnDacK7JQVDClHe2RpQmIThi95dx5mFynAGw33lcGm+N
 5FabpGsm9Jodd6O29IUcqeYie0/nu8zvvR2UFt3NHKyM4Lzm0ixo4rGopUNFcn21LiGl
 nvNg2PpwGZ19FQDHsTL8YrVIHwtzbKUNvplYthoJyRs6N1Eyjv6eG1muUJnbL9Yupmug
 SaQdjsaPsI5l4BZyXeRa5+LpA/ttnOyK0Foip0Cip5+nOXBlO8TwCYk0v1oKqsmHKM4t
 bDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aujji+42NnuAmjXYd1m2CztTTlNY+0bpT1pWUi5S9DQ=;
 b=gh4DHoqvMA+QzdXsl/P5bEuzVnqOOWnY18PQUCzOpVEn1aIua/rH/y6QWGxnjSSG+f
 B8+xncBEv/ZLnnStzQZCmYgc1fUm6VpB2bAuGdqLTRW+ltGOLgsfrvsP8awtei76g0dr
 s6f9845HLrAV/UmCXu3TKufiQfL4p1rcb18ZjD26u/XA27uxRKjmuzI3Xph4iiJu3k+z
 5EUfHKC/pNiS83gX5jic3d3s1zPFe34Qr1I9iPiVbReZx1jknFTZ96pBxVcEKrtJycaS
 jlbCT1iXH+O9tPVTgEvnwjq3fK0BXfzZ4BN3Yx+6fjI2xyFywY1ljq3zOmvvYBTN5YRc
 zdCQ==
X-Gm-Message-State: AOAM531Ut3YKhjdpQCCdqEsohkSxI9BqoFeMTOwK8Cta6GBvQxKl+18C
 hnHhSxxcMA25XX3Q0ygIgj0=
X-Google-Smtp-Source: ABdhPJybpvYrEOEy75sxOGZHsp9JmvmKEM7F/xpGU3JaxjGPpF+nmMkmb42oE4q5shNbTmjrzYOA4Q==
X-Received: by 2002:a65:5648:: with SMTP id m8mr3560022pgs.93.1626170096729;
 Tue, 13 Jul 2021 02:54:56 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id f6sm18153854pfj.28.2021.07.13.02.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:54:55 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue, 13 Jul 2021 18:53:18 +0900
Message-Id: <b018da44e8454bd4abffa6c214f20984e5311c1d.1626165765.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626165764.git.vilhelm.gray@gmail.com>
References: <cover.1626165764.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v13 14/17] counter: Implement *_component_id
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
 Documentation/ABI/testing/sysfs-bus-counter | 16 +++++++++-
 drivers/counter/counter-sysfs.c             | 33 +++++++++++++++++----
 2 files changed, 42 insertions(+), 7 deletions(-)

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
index 11bef9f8190f..df1d75e0d7b8 100644
--- a/drivers/counter/counter-sysfs.c
+++ b/drivers/counter/counter-sysfs.c
@@ -588,6 +588,7 @@ static int counter_signal_attrs_create(struct counter_device *const counter,
 	int err;
 	struct counter_comp comp;
 	size_t i;
+	struct counter_comp *ext;
 
 	/* Create main Signal attribute */
 	comp = counter_signal_comp;
@@ -603,8 +604,14 @@ static int counter_signal_attrs_create(struct counter_device *const counter,
 
 	/* Create an attribute for each extension */
 	for (i = 0; i < signal->num_ext; i++) {
-		err = counter_attr_create(dev, cattr_group, signal->ext + i,
-					  scope, signal);
+		ext = &signal->ext[i];
+
+		err = counter_attr_create(dev, cattr_group, ext, scope, signal);
+		if (err < 0)
+			return err;
+
+		err = counter_comp_id_attr_create(dev, cattr_group, ext->name,
+						  i);
 		if (err < 0)
 			return err;
 	}
@@ -695,6 +702,7 @@ static int counter_count_attrs_create(struct counter_device *const counter,
 	int err;
 	struct counter_comp comp;
 	size_t i;
+	struct counter_comp *ext;
 
 	/* Create main Count attribute */
 	comp = counter_count_comp;
@@ -719,8 +727,14 @@ static int counter_count_attrs_create(struct counter_device *const counter,
 
 	/* Create an attribute for each extension */
 	for (i = 0; i < count->num_ext; i++) {
-		err = counter_attr_create(dev, cattr_group, count->ext + i,
-					  scope, count);
+		ext = &count->ext[i];
+
+		err = counter_attr_create(dev, cattr_group, ext, scope, count);
+		if (err < 0)
+			return err;
+
+		err = counter_comp_id_attr_create(dev, cattr_group, ext->name,
+						  i);
 		if (err < 0)
 			return err;
 	}
@@ -784,6 +798,7 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
 	struct device *const dev = &counter->dev;
 	int err;
 	size_t i;
+	struct counter_comp *ext;
 
 	/* Add Signals sysfs attributes */
 	err = counter_sysfs_signals_add(counter, cattr_group);
@@ -816,8 +831,14 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
 
 	/* Create an attribute for each extension */
 	for (i = 0; i < counter->num_ext; i++) {
-		err = counter_attr_create(dev, cattr_group, counter->ext + i,
-					  scope, NULL);
+		ext = &counter->ext[i];
+
+		err = counter_attr_create(dev, cattr_group, ext, scope, NULL);
+		if (err < 0)
+			return err;
+
+		err = counter_comp_id_attr_create(dev, cattr_group, ext->name,
+						  i);
 		if (err < 0)
 			return err;
 	}
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
