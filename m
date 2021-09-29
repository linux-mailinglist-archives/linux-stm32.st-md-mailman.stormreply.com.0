Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B941BD3C
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Sep 2021 05:17:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A92F7C5A4F8;
	Wed, 29 Sep 2021 03:17:04 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9456FC5A4CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Sep 2021 03:17:01 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id n2so526252plk.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 20:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IaNorZsjU8hM7wfPjt4kkgWnkshK3kwrpC14sR+dG8Q=;
 b=MTVhbJ0g2H5Q+y+iwaUM+Bh3FGIN3AqPmcifP/Sor+H7DhGOwW0d9tGv3+DDvgwcy/
 fq6kwXM9UFWAnOHeZ4ndeQY8qRMgDmuCVSohk8BOwv4hKUaJE5pPBFICkQwsJBHimGJC
 QMrlvc4GXCVuNig9YsfSQgGaNuafpLSjFesxO8ou6zgx4oOQ0/mjWpXPlawd73Ckur/S
 xOWa4GYZqR3N8YIABc8ZCr2IoUKsRjG0vYwRYKL47L/vmYzI6xSv7KcCkr38HUtOZv1i
 oCRHaL47cSKjBYzBA5+xzlJ94/SgSQ5VgYd9zT0Tg0SzJMcpt4hrwD9oPiJxtG9fxc5j
 iUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IaNorZsjU8hM7wfPjt4kkgWnkshK3kwrpC14sR+dG8Q=;
 b=dCNMSIOp/GBhyKySx2jj7gw2M8+G13wKjpWk8ghkJNyp+l4KJmABEObhy4jZCxYeTR
 LG4ba+6zAyBy7xbxDyt5j192wm0VxYIBbpsxXv0onQaiB8EDA8ZGIcFHEFtvnZjkE/ia
 iHFe5tyR6xLiIpZVn3nX5rXlhwU6JZBj5rgI7T0aTZcNNng9Is2dbCyycFHgaGEjIsan
 CqTf+VqqCSDXsdVQ2ip4K6Od4dASqRKLI3KmVUlQWmpP4no5GPWEIi/rlLO96ohPshEH
 NM6U6ukCUOU8Ki5t4BrsQzLNguOWW+DMeODoQOf2NUKxiFy9ld0oP2F6TXg8XICGHm57
 7/8w==
X-Gm-Message-State: AOAM532rC345YbBB8+fseyTHY6OGB+PtR7/MeEOr5ny/FY5dop7K/Dpa
 +C1jZWVN3XDusu+RPAI5w08=
X-Google-Smtp-Source: ABdhPJxBpjh5/Urwl7VFC61ZKNbPqzhscwCBb5zGrk+2nHYlWmkuEdjJRuRpMBa/oiQGCRPbmsYQnQ==
X-Received: by 2002:a17:90b:3143:: with SMTP id
 ip3mr3964650pjb.50.1632885420262; 
 Tue, 28 Sep 2021 20:17:00 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id 65sm464203pfv.210.2021.09.28.20.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 20:16:59 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed, 29 Sep 2021 12:16:02 +0900
Message-Id: <a6c81b2f1f5d0b8d59b1ebe4f0fed04914b07547.1632884256.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1632884256.git.vilhelm.gray@gmail.com>
References: <cover.1632884256.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v17 5/9] counter: Implement
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
2.33.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
