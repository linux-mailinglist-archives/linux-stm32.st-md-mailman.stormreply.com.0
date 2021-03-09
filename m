Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 642FE332696
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:21:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30C77C57B78;
	Tue,  9 Mar 2021 13:21:33 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0000C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:21:30 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id p21so8752634pgl.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rC2Th++vNt7CqGAj8WhJOkxOFf8ZEs13/9ziRoW9ymc=;
 b=E/4zwhWgcU4xyOXY8FDQeW+SR9ur9RmudK7zimF4LzKDITpUVG4827s/iONgSA9PpG
 y9Tby0YfFWbRhVpxHArnaYYiqbKBuTV5jVQyckjVVAxHjufzRbu70bxnbXuYrr2sKz78
 Azqb0OjEmY08D5CCel1gMdHXed8HtHiT2xBGNlLhKuS/Fs2W+/9HpIe7RfjBM1uWQOJ+
 czzF9qSKODr59CXoLqF1iJTdYqABa64zXh00WbOV2AMDX8GPj/rDiOYJcCFVqAfcMfE/
 xsqpJniF26aFbx9eCEEI+DnaWOsEKuW4ns05JQLBiDwb8tfqP/WNMJfIxzpH2me97cIL
 Enbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rC2Th++vNt7CqGAj8WhJOkxOFf8ZEs13/9ziRoW9ymc=;
 b=jROnWPdVVu4wEcAqzrB3Z2n+L0B2SgIGoCSShdgWYgcYQ1x+ooJWEWoUEDdgjWka+l
 qsk+o/LDmvVy/2ZVPIwHyP7BQYSp8+261xJXDMq09klRTIhqMH8X9mC4fp/Xca3aMouP
 6Gwqdb+DB4MUbATUB5XYKHfDz85I132NRm9YkpQkk3j4QF9vu/3sAD84WNfjNsUlPX9e
 GR2ufaJK2ScCskoo9bGR4arC+b8gXbqk3AvhVAj/yWLJzefLDAF44Jh6ybL7+UoExGF3
 8Eq5Zhft9Gho9JtC4uC3gBN41LF1VPVbIo20QqQGwdwMaScwRxWZrKUdVH7YLT01CO5h
 UwTw==
X-Gm-Message-State: AOAM5319rDI9xsgzCOrwdOczAoP7iwRgI0gNRAJMLpohE1ar2PgCqwTq
 b9+qjYEkatKTidk+6IaFPa4=
X-Google-Smtp-Source: ABdhPJw9kLoA+icLpJPLdh1A/lMDX6fb53r5KBvtgKq0qWuhM1Z2JhSYca6Qi8lTMgRjJfO1PhKqmw==
X-Received: by 2002:a63:2e06:: with SMTP id u6mr9962931pgu.444.1615296089500; 
 Tue, 09 Mar 2021 05:21:29 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:21:28 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:28 +0900
Message-Id: <08b2f787df2965aca63988ca35e58133cb4e2c3e.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1615293276.git.vilhelm.gray@gmail.com>
References: <cover.1615293276.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 15/33] counter: microchip-tcb-capture: Add
	const qualifier for actions_list array
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

The struct counter_synapse actions_list member expects a const enum
counter_synapse_action array. This patch adds the const qualifier to the
mchp_tc_synapse_actions to match actions_list.

Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/microchip-tcb-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index cabcfebfc799..51b8af80f98b 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -49,7 +49,7 @@ enum mchp_tc_synapse_action {
 	MCHP_TC_SYNAPSE_ACTION_BOTH_EDGE
 };
 
-static enum counter_synapse_action mchp_tc_synapse_actions[] = {
+static const enum counter_synapse_action mchp_tc_synapse_actions[] = {
 	[MCHP_TC_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
 	[MCHP_TC_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE,
 	[MCHP_TC_SYNAPSE_ACTION_FALLING_EDGE] = COUNTER_SYNAPSE_ACTION_FALLING_EDGE,
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
