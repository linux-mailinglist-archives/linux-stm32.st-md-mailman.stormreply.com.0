Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 146DA3DED85
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Aug 2021 14:08:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC1C3C5A4D0;
	Tue,  3 Aug 2021 12:07:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5BFEC5A4CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 12:07:57 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so302961pji.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Aug 2021 05:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GKMCNriu6Oe0b4ijgDqgdhWJc4dVQTXn+gR1UFw9WGc=;
 b=t16QRjZIxcuYdstsPWLMVOH/nKmuF5tZxc61xEAvfR0GMoxYmpjaQeUAS8sUFqX9jl
 YAjhlkc964yIo8VUWzcnAI5hI0QNDqpJXnAFTtLaR81HI4UGEm7iODItlB9BKddN5M6t
 qU/eHbDqLg3xO2WqXTUoeMolqnhBPPtmfr1sWKwqMnNrAqw8BRXJFKNS/2/kmxOBrixu
 JotPQAyEfy38LcVluV5FmfUksZHpQ4mtN0JWc3XaO+ElD/KITPegAlAzbiQaVjvc9D+X
 NCrO20OOyxtjKvMEwmVt9uEr/joDaV40IgIEdh/jzM61V0B69ZasMH4yrmNLOCpe2XCi
 ltNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GKMCNriu6Oe0b4ijgDqgdhWJc4dVQTXn+gR1UFw9WGc=;
 b=nMtmWLsvO+W6mv5WqHPdNZu5vGMXvs+77emj7OceoC0BOq7LOeNb/vEFO6m+HpNMpL
 tK2j6VEBCZrLn9UTJSQXfcAx13VCNzPqh7+Dkw0WdV8FZ0VBsbumYGsdEPTf2NHG7T1g
 R63WAcTWfkQvxOed3hiHgEcSsXNlLRRPrD8Hg4LicF1aNPYDe7pC5fmalX58fmMVu2O7
 YRXehATcrpVuij+MaPHSkrrOgT4eCAppTePoAyJ714jU1bQJO92YMHC2Q/X6I3B+WKjW
 w9EuxwRIKDNCH5fuVzXrvSXze2vEduFeienV9MWTbxXEgwqWDJvn3ZXXRkGVKOCf9EsX
 sXYQ==
X-Gm-Message-State: AOAM5320WZhAtPK3S6REVCXXkdW+AEW8hA3ZUKQmUYKulJyK1hZreCJE
 eEmY/3/j6FbBZpU5Y4CGbq0=
X-Google-Smtp-Source: ABdhPJyLpOQSNtH7EmIuEBrCh2Djo5Spq15M66GUUwHZD0BSAe1IAKjafBjht842rzJiws9CuFZIJQ==
X-Received: by 2002:a17:90a:fc6:: with SMTP id 64mr22516402pjz.1.1627992476483; 
 Tue, 03 Aug 2021 05:07:56 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id n35sm7197502pfv.152.2021.08.03.05.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:07:55 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  3 Aug 2021 21:06:23 +0900
Message-Id: <7a9fc7e7272650e0d43b23a6ba65bffe889f4c86.1627990337.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1627990337.git.vilhelm.gray@gmail.com>
References: <cover.1627990337.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v14 13/17] counter: Implement
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
