Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D033DED71
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Aug 2021 14:07:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DCBDC5A4D2;
	Tue,  3 Aug 2021 12:07:24 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68E89C5A4CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 12:07:22 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id nh14so17617137pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Aug 2021 05:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v7akesCPV2znBVRN41Z1QYwIOg8zDhI3rATd9/DVG5U=;
 b=o8GavR/wKut6OKFdeAwWSOFyC1ESFyu/DAQiCFG9l/dutYu1F531OOKdJeA7s2KPz7
 JbEioY/tEqy0Id7cqfk3zZaDGNXdFWC433yWC4RkL4nHJq8SyZruCLIz3F23ubYaaf26
 ChI3vv2E5dk1w9lDFJfsm1PG9Migr3oCW0eBfGViQ2nGsE2kZvvzd8jBUCPFdWPzHifi
 UdcdcqDYDYL9PYijUxaM6bcBQuaaK1YN9ZXiR/VN7E9CWV+0/F0j35m2rwMDUfJWFmt3
 5K8Cp5V5VZA1706dhrHyp2HcBVAbej2wFSTBsxiUDYDewE4E62HTVGHzJc5Iapjuidle
 0AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v7akesCPV2znBVRN41Z1QYwIOg8zDhI3rATd9/DVG5U=;
 b=ClAqKjKJFzCKBjJqyjnj7NYClCVoY/VB7vLUy5rauUSIRz+IYv5OfjcqcWE+Ujli2X
 5C4TwSrs4woghbwEgEgZTYxI4ERwS6n4I1gyym01v4SPX6MR6rvDK67AcH3ii/90NLvB
 CfbWuZIVqA9Y63bmrinHwREQdYOgZuEW72EuC93ks8tzokTCa7m+0rbxPtWtho5aKC/s
 pTEzVAWvFYcUHa6S8SMVJB9zpJgpvS89RDpPrpJcPR5KdjcLqFgO1Y32KZ6TOXjb43kN
 J9NW+QtTwPa4XUmlEMajgmigcfRmsur5YC5OYSah+PW0Oc6P61WdvnKEW0mi9R4JFmXH
 bo6g==
X-Gm-Message-State: AOAM530jVUtI+Zq1HQiy4OrDOYGV9ISEfv30EyLDMZ3ZbMiLJr453/ot
 Hboj4sGpRp56GjhKCVaWNKY=
X-Google-Smtp-Source: ABdhPJwIlGEaDXFXh1LrdCb1ZiVgD+Vh1lHp40Fa2bKaUFlc8S4C6nP8hM1cArlaTOT1u870n7bN/Q==
X-Received: by 2002:a63:4b0a:: with SMTP id y10mr811974pga.437.1627992441166; 
 Tue, 03 Aug 2021 05:07:21 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id n35sm7197502pfv.152.2021.08.03.05.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:07:20 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  3 Aug 2021 21:06:17 +0900
Message-Id: <1ce1988777a86177cbdb001cad49faddfe7660dc.1627990337.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1627990337.git.vilhelm.gray@gmail.com>
References: <cover.1627990337.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v14 07/17] counter: Update counter.h comments
	to reflect sysfs internalization
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

The Counter subsystem architecture and driver implementations have
changed in order to handle Counter sysfs interactions in a more
consistent way. This patch updates the Generic Counter interface
header file comments to reflect the changes.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/counter-core.c |  3 ++
 include/linux/counter.h        | 62 ++++++++++++++++------------------
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/counter/counter-core.c b/drivers/counter/counter-core.c
index 15f735ef296e..9442e3b91468 100644
--- a/drivers/counter/counter-core.c
+++ b/drivers/counter/counter-core.c
@@ -41,6 +41,9 @@ static struct bus_type counter_bus_type = {
  * This function registers a Counter to the system. A sysfs "counter" directory
  * will be created and populated with sysfs attributes correlating with the
  * Counter Signals, Synapses, and Counts respectively.
+ *
+ * RETURNS:
+ * 0 on success, negative error number on failure.
  */
 int counter_register(struct counter_device *const counter)
 {
diff --git a/include/linux/counter.h b/include/linux/counter.h
index b69277f5c4c5..445f22d8bfe2 100644
--- a/include/linux/counter.h
+++ b/include/linux/counter.h
@@ -188,11 +188,10 @@ struct counter_comp {
 
 /**
  * struct counter_signal - Counter Signal node
- * @id:		unique ID used to identify signal
- * @name:	device-specific Signal name; ideally, this should match the name
- *		as it appears in the datasheet documentation
- * @ext:	optional array of Counter Signal extensions
- * @num_ext:	number of Counter Signal extensions specified in @ext
+ * @id:		unique ID used to identify the Signal
+ * @name:	device-specific Signal name
+ * @ext:	optional array of Signal extensions
+ * @num_ext:	number of Signal extensions specified in @ext
  */
 struct counter_signal {
 	int id;
@@ -206,7 +205,7 @@ struct counter_signal {
  * struct counter_synapse - Counter Synapse node
  * @actions_list:	array of available action modes
  * @num_actions:	number of action modes specified in @actions_list
- * @signal:		pointer to associated signal
+ * @signal:		pointer to the associated Signal
  */
 struct counter_synapse {
 	const enum counter_synapse_action *actions_list;
@@ -217,15 +216,14 @@ struct counter_synapse {
 
 /**
  * struct counter_count - Counter Count node
- * @id:			unique ID used to identify Count
- * @name:		device-specific Count name; ideally, this should match
- *			the name as it appears in the datasheet documentation
- * @functions_list:	array available function modes
+ * @id:			unique ID used to identify the Count
+ * @name:		device-specific Count name
+ * @functions_list:	array of available function modes
  * @num_functions:	number of function modes specified in @functions_list
- * @synapses:		array of synapses for initialization
- * @num_synapses:	number of synapses specified in @synapses
- * @ext:		optional array of Counter Count extensions
- * @num_ext:		number of Counter Count extensions specified in @ext
+ * @synapses:		array of Synapses for initialization
+ * @num_synapses:	number of Synapses specified in @synapses
+ * @ext:		optional array of Count extensions
+ * @num_ext:		number of Count extensions specified in @ext
  */
 struct counter_count {
 	int id;
@@ -243,27 +241,27 @@ struct counter_count {
 
 /**
  * struct counter_ops - Callbacks from driver
- * @signal_read:	optional read callback for Signal attribute. The read
- *			level of the respective Signal should be passed back via
- *			the level parameter.
- * @count_read:		optional read callback for Count attribute. The read
- *			value of the respective Count should be passed back via
- *			the val parameter.
- * @count_write:	optional write callback for Count attribute. The write
- *			value for the respective Count is passed in via the val
+ * @signal_read:	optional read callback for Signals. The read level of
+ *			the respective Signal should be passed back via the
+ *			level parameter.
+ * @count_read:		read callback for Counts. The read value of the
+ *			respective Count should be passed back via the value
+ *			parameter.
+ * @count_write:	optional write callback for Counts. The write value for
+ *			the respective Count is passed in via the value
  *			parameter.
  * @function_read:	read callback the Count function modes. The read
  *			function mode of the respective Count should be passed
  *			back via the function parameter.
- * @function_write:	write callback for Count function modes. The function
- *			mode to write for the respective Count is passed in via
- *			the function parameter.
- * @action_read:	read callback the Synapse action modes. The read action
- *			mode of the respective Synapse should be passed back via
- *			the action parameter.
- * @action_write:	write callback for Synapse action modes. The action mode
- *			to write for the respective Synapse is passed in via the
- *			action parameter.
+ * @function_write:	optional write callback for Count function modes. The
+ *			function mode to write for the respective Count is
+ *			passed in via the function parameter.
+ * @action_read:	optional read callback the Synapse action modes. The
+ *			read action mode of the respective Synapse should be
+ *			passed back via the action parameter.
+ * @action_write:	optional write callback for Synapse action modes. The
+ *			action mode to write for the respective Synapse is
+ *			passed in via the action parameter.
  */
 struct counter_ops {
 	int (*signal_read)(struct counter_device *counter,
@@ -291,7 +289,7 @@ struct counter_ops {
 
 /**
  * struct counter_device - Counter data structure
- * @name:		name of the device as it appears in the datasheet
+ * @name:		name of the device
  * @parent:		optional parent device providing the counters
  * @ops:		callbacks from driver
  * @signals:		array of Signals
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
