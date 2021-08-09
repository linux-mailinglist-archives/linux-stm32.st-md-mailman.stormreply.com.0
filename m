Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D0F3E45C3
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 14:38:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D350C5A4CF;
	Mon,  9 Aug 2021 12:38:42 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6463BC5A4CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 12:38:40 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so25410354pjn.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Aug 2021 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GKMCNriu6Oe0b4ijgDqgdhWJc4dVQTXn+gR1UFw9WGc=;
 b=emOcOs9OtYl2hpoG1uGmocdYTiOr+x/C+4HIwtiawm4q2PKkfcyVaznfNYIg8X05xL
 rEXD8WBSqknqYsEG6dcHQ1lH715EQY403EYOqbaHaOn2rDfb+ZzeNbWUcS4jLecuZzqO
 r/MLxPVDXaHBiS3lT1oukAbBHABv4P2BlcKRkgRAWmW4UKKeIqlCPaXF7rJg32xRysJX
 QPl9fcZZqIItTwjH9eCiA93JcNEBVDEPP0NGsm63XZqJ0OY/ww75tQZ7ygW/yXeYlG41
 Ar/8Nz4Dj2nVRQ03+31we2bIquVFdsvgHNmHjZsByXtRX44Lhl8SyBLwPJ+BfrPoIEez
 g4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GKMCNriu6Oe0b4ijgDqgdhWJc4dVQTXn+gR1UFw9WGc=;
 b=DKHh0U/MeEvQz8LuWa8kQcY5asMPn1Kr/6E54FUSXMUZOzpjjgP/1tmHSqDHnn1iMl
 KOjNJ6DPo/G2FhYUtd2i7PvecaAq22CHpPdKYavhTvYeN16PM+j4HzUQSyE7gQilziBy
 8fOFGwFRLFfRFpzfmg3RRvio3PHfxfbb1p8Zd1jXJpaYPtDJBA+MlIN0JSkeaRNVUl5I
 TU56kHlX4REgqMm1TNpQ0A31bVvuhBS3pLxZBh1tkc4ZORQYnPp0AEDFLxggyw+BS7la
 A42GzsaQ473B3nCq9uD5nNWHLImvU4RmIMxaMBKL3GlH+/UlinhCcLnZ2mkFEHHnAr6o
 FJzw==
X-Gm-Message-State: AOAM531NmOZButNA9JDuyrRphg26cOim2dvti48bGxCFYeuDOG45auAh
 EPTa/qYbV+KR0RIpfDISRfs=
X-Google-Smtp-Source: ABdhPJwqr2htRdtyBeh2MILvtPISM2foEQ7rRT86QHqHJ2+DnDJv9ziRaXIZgIiAaMXUBO4mrm/vMQ==
X-Received: by 2002:a05:6a00:1a0e:b029:3c2:ee2f:b236 with SMTP id
 g14-20020a056a001a0eb02903c2ee2fb236mr23792542pfv.80.1628512719140; 
 Mon, 09 Aug 2021 05:38:39 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id e35sm22382177pjk.28.2021.08.09.05.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 05:38:38 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Mon,  9 Aug 2021 21:37:34 +0900
Message-Id: <d72159ab7ebfe607d86c0ab472979e8eca6f16a0.1628511445.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628511445.git.vilhelm.gray@gmail.com>
References: <cover.1628511445.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v15 09/13] counter: Implement
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
 drivers/counter/counter-sysfs.c             | 46 ++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index dee79b606847..9809d8a47431 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -203,6 +203,13 @@ Description:
 		both edges:
 			Any state transition.
 
+What:		/sys/bus/counter/devices/counterX/countY/signalZ_action_component_id
+KernelVersion:	5.15
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Read-only attribute that indicates the component ID of the
+		respective Synapse of Count Y for Signal Z.
+
 What:		/sys/bus/counter/devices/counterX/countY/spike_filter_ns
 KernelVersion:	5.14
 Contact:	linux-iio@vger.kernel.org
diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
index dbb507c9da11..11bef9f8190f 100644
--- a/drivers/counter/counter-sysfs.c
+++ b/drivers/counter/counter-sysfs.c
@@ -393,7 +393,6 @@ static int counter_avail_attr_create(struct device *const dev,
 	struct counter_attribute *counter_attr;
 	struct device_attribute *dev_attr;
 
-	/* Allocate Counter attribute */
 	counter_attr = devm_kzalloc(dev, sizeof(*counter_attr), GFP_KERNEL);
 	if (!counter_attr)
 		return -ENOMEM;
@@ -535,6 +534,46 @@ static int counter_name_attr_create(struct device *const dev,
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
@@ -629,6 +668,11 @@ static int counter_sysfs_synapses_add(struct counter_device *const counter,
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
