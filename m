Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C30083F9316
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Aug 2021 05:49:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78617C5A4D5;
	Fri, 27 Aug 2021 03:49:16 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3784FC5A4D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Aug 2021 03:49:13 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id e15so3099607plh.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Aug 2021 20:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sL9LPCzfu7AdHdSAIzrZRarBLN9KzJsdKMehHJFnQLk=;
 b=dZpAN53mqAJT8RlHEZuMwDg9ErculADbWyXkX5cqjTRKH/cld92QDcI3IrtiFgM+Gn
 WAPRyXDff33WPoQ9hDZ8s2b5LTENCmEGpjkrX9aGj13LN54uP2CjNUtPnc/P5G+e3hJi
 12DkhgmjNY+dNdIV2hIN3+sp1aMDXWoNRvlDXY47fq2ZN6wJAl7SbeWrgU8lk5DZO7dK
 VMmQmJDRKqw763nCGwcb/Z5OUdrhq+fDsB5dH862HAy9i0AvmcwtDfACtSOVjdXTwacu
 t3mzCDreJqELu7lv9YtIemkOzrKF2xSPzYc0Krf5GBjhXUcHcw4hCavdMktIUuaCrrwu
 lUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sL9LPCzfu7AdHdSAIzrZRarBLN9KzJsdKMehHJFnQLk=;
 b=APtA6YdSssc777sOrl7r3YNBZRp6c+4l27uQOgpCnCPo///xo7ueAeMrQcgFG9yo2f
 ICtz9DCa1ld/f9ubouznxqIhUcLaOkayf/vH9JLcTZ7IdHTfMh4HclQ0ylD0dQYQMyjx
 lJ1ri4Qj8nsWdNhgmSVJ4iptvFhH7Xqs11zOOHfjR1L7wHQ29+imf5PFvBEJ89x6wW8S
 Q6u5hzNjMqfRLM+3zwOQbzg4tWZhS47lWoOala0actuaqwMPZVZtamVn08eDT1UUlkHL
 KB6XdGd99dIVSQOCmrKzcYJxc9qmdtGEdwMAu2EeLLKNrjMuxyBb3XA3MPU45tnZj2IR
 d3Lw==
X-Gm-Message-State: AOAM533rSJpM7C7YP7HR+280ob1HG8wgAAiZAlzorLXwOIEbxW2kXpvz
 IqDz3cc03zCTT6F2WChmbI4=
X-Google-Smtp-Source: ABdhPJwJM51LGlVEyAz9fooCJ6OKufA04i4PUSnVhQDT9l/Gfq7NrkEKXFuBKeE6D5yH0O7x5WYprA==
X-Received: by 2002:a17:90a:bc49:: with SMTP id
 t9mr8145413pjv.48.1630036151980; 
 Thu, 26 Aug 2021 20:49:11 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id o6sm4364693pjk.4.2021.08.26.20.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 20:49:11 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 27 Aug 2021 12:47:55 +0900
Message-Id: <86be841f8149b6be20cfff6a050ef64b167e37a8.1630031207.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1630031207.git.vilhelm.gray@gmail.com>
References: <cover.1630031207.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v16 11/14] counter: Implement *_component_id
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
index aa2cd3c10d74..0ce16669157e 100644
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
 KernelVersion:	5.16
 Contact:	linux-iio@vger.kernel.org
 Description:
 		Read-only attribute that indicates the component ID of the
-		respective Synapse of Count Y for Signal Z.
+		respective extension or Synapse.
 
 What:		/sys/bus/counter/devices/counterX/countY/spike_filter_ns
 KernelVersion:	5.14
diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
index ee7ff1cde454..97d8d7c2a2b6 100644
--- a/drivers/counter/counter-sysfs.c
+++ b/drivers/counter/counter-sysfs.c
@@ -586,6 +586,7 @@ static int counter_signal_attrs_create(struct counter_device *const counter,
 	int err;
 	struct counter_comp comp;
 	size_t i;
+	struct counter_comp *ext;
 
 	/* Create main Signal attribute */
 	comp = counter_signal_comp;
@@ -601,8 +602,14 @@ static int counter_signal_attrs_create(struct counter_device *const counter,
 
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
@@ -693,6 +700,7 @@ static int counter_count_attrs_create(struct counter_device *const counter,
 	int err;
 	struct counter_comp comp;
 	size_t i;
+	struct counter_comp *ext;
 
 	/* Create main Count attribute */
 	comp = counter_count_comp;
@@ -717,8 +725,14 @@ static int counter_count_attrs_create(struct counter_device *const counter,
 
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
@@ -782,6 +796,7 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
 	struct device *const dev = &counter->dev;
 	int err;
 	size_t i;
+	struct counter_comp *ext;
 
 	/* Add Signals sysfs attributes */
 	err = counter_sysfs_signals_add(counter, cattr_group);
@@ -814,8 +829,14 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
 
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
