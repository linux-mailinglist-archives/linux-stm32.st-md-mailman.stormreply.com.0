Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4823F9314
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Aug 2021 05:49:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C599DC5A4D6;
	Fri, 27 Aug 2021 03:49:09 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B719C5A4D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Aug 2021 03:49:08 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id x16so4581929pfh.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Aug 2021 20:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X2K+kS5TRvGGkXAwbGDp8tnI9+r3LlY6NFNe0uu/BE4=;
 b=k1WbMu8ca8Ct40n9Q0xZcjLb3Q4cHi9KvSJSWG2YCEFvUhdjko2wVk6ZwcMGKpdji7
 dFiETS3KdIiymhyFe2ipAfp7abuUvmRdlfnLg7t+I7TKg6eSGgBaAbKgivUReOvYT8pk
 EgV+iJYf3+f26QLfkxIF+ua6I0NBXrLubi0cajWXvPD/vQRiEXRoK9c8mMuO/EBoaNo9
 A4Qb1owPvMwn3bBPgauzPH3MYsZsR462sBPGT/1Pyp+U3XPhW9rPrbn5BY/Tt+vIXNOX
 4M049c5ZjRleUsBSb33pdVC9oQw9eyOiYVdKKNYw4KHpRfC9/4GQnLmFVyuyqoftMiy/
 PVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X2K+kS5TRvGGkXAwbGDp8tnI9+r3LlY6NFNe0uu/BE4=;
 b=Tq7wM8/3GHm4P3E65cqaikzOy8aBPgklYyVmj85kW6+nfvoJ0sbr1IkaTKjrZU6kI5
 NAUpE6V2lhtxuAtRLv3bEOCXnaxj6nkDhEbONNeR2OjdR0Un9u+rfFKjtu/UqJgDJZnK
 0d9gpSuiQAPCEh0TK25QSDTXyYS4oddEBQtX6vb2BL8jRf89FhrAwNxPLOih37N0hZWN
 dX98ymmQWuRZqcjcfBIaLxcQEQyHXe/8byMi5lNABbHReJgZvT0ywkuDLqNLdzJ9jofL
 mnwyE8hI5EVkkXluunziJnX4Kpmw2lu+QrG3NYGGvV0MvKpzU24/34lYVqkn3krELqAH
 ScWg==
X-Gm-Message-State: AOAM53301RA+fYU15TEG/IiMT4U2dYivaAfK8naEDkGevSIL/E4MIfUP
 Jlq9y3nzBDBD6kYW4JqkqVo=
X-Google-Smtp-Source: ABdhPJwX1U5ELlZ+GkFtm8/nGPz8fVhImmJ/9iReiB1g6lN8ocy4/mI0Kx5nceb3/fjL3f2Vz8u2WQ==
X-Received: by 2002:a65:51c7:: with SMTP id i7mr6107703pgq.300.1630036146775; 
 Thu, 26 Aug 2021 20:49:06 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id o6sm4364693pjk.4.2021.08.26.20.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 20:49:06 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 27 Aug 2021 12:47:54 +0900
Message-Id: <e87de8c56bd9cb5c204c12866de6c04199dee9fa.1630031207.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v16 10/14] counter: Implement
	signalZ_action_component_id sysfs attribute
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
IDs in order to select Synapses for requests. In order for users to know
what component ID belongs to which Synapse this information must be
exposed. The signalZ_action_component_id attribute provides a way for
users to discover what component ID belongs to the respective Synapse.

Cc: Gwendal Grignou <gwendal@chromium.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: David Lechner <david@lechnology.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-counter |  7 ++++
 drivers/counter/counter-sysfs.c             | 45 +++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index dee79b606847..aa2cd3c10d74 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -203,6 +203,13 @@ Description:
 		both edges:
 			Any state transition.
 
+What:		/sys/bus/counter/devices/counterX/countY/signalZ_action_component_id
+KernelVersion:	5.16
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Read-only attribute that indicates the component ID of the
+		respective Synapse of Count Y for Signal Z.
+
 What:		/sys/bus/counter/devices/counterX/countY/spike_filter_ns
 KernelVersion:	5.14
 Contact:	linux-iio@vger.kernel.org
diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
index 108cbd838eb9..ee7ff1cde454 100644
--- a/drivers/counter/counter-sysfs.c
+++ b/drivers/counter/counter-sysfs.c
@@ -532,6 +532,46 @@ static int counter_name_attr_create(struct device *const dev,
 	return 0;
 }
 
+static ssize_t counter_comp_id_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	const size_t id = (size_t)to_counter_attribute(attr)->comp.priv;
+
+	return sprintf(buf, "%zu\n", id);
+}
+
+static int counter_comp_id_attr_create(struct device *const dev,
+				       struct counter_attribute_group *const group,
+				       const char *name, const size_t id)
+{
+	struct counter_attribute *counter_attr;
+
+	/* Allocate Counter attribute */
+	counter_attr = devm_kzalloc(dev, sizeof(*counter_attr), GFP_KERNEL);
+	if (!counter_attr)
+		return -ENOMEM;
+
+	/* Generate component ID name */
+	name = devm_kasprintf(dev, GFP_KERNEL, "%s_component_id", name);
+	if (!name)
+		return -ENOMEM;
+
+	/* Configure Counter attribute */
+	counter_attr->comp.priv = (void *)id;
+
+	/* Configure device attribute */
+	sysfs_attr_init(&counter_attr->dev_attr.attr);
+	counter_attr->dev_attr.attr.name = name;
+	counter_attr->dev_attr.attr.mode = 0444;
+	counter_attr->dev_attr.show = counter_comp_id_show;
+
+	/* Store list node */
+	list_add(&counter_attr->l, &group->attr_list);
+	group->num_attr++;
+
+	return 0;
+}
+
 static struct counter_comp counter_signal_comp = {
 	.type = COUNTER_COMP_SIGNAL_LEVEL,
 	.name = "signal",
@@ -626,6 +666,11 @@ static int counter_sysfs_synapses_add(struct counter_device *const counter,
 					  COUNTER_SCOPE_COUNT, count);
 		if (err < 0)
 			return err;
+
+		/* Create Synapse component ID attribute */
+		err = counter_comp_id_attr_create(dev, group, comp.name, i);
+		if (err < 0)
+			return err;
 	}
 
 	return 0;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
