Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B593A091F
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98766C58D5C;
	Wed,  9 Jun 2021 01:32:53 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B3BFC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:52 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id k7so402651pjf.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=et8AgYiB6JXtqMQ6TgVirGOTerpkjIUvfoH2D1VR5DQ=;
 b=s4EJY6oEU0CsvYizvi25LdRJb2Ox2KhzCDY6fWObA1JbKtiOjj6MKIPiwJh3712EsS
 xaqI7Cfrd8CIbUlJS5kavZ2eRRNZfad94QzYcKWCxIT/xCo1qMI2skqIq/2vpPFBeP/1
 qNcivthCgoWXblUzE4xI3LbcE0beNpRCDS0f054cqovstGhJ3g5erM4vibYU1j/RA47M
 J4iIh2GivW8CASwYIjkiJFTlCXZ1ZMCrIKGMPJhKthmgb4ybgx7aCZMieR/AfnsD2pqW
 EWn1OHUK4WFpQQG5QQ215pawQsYiiP18KgHT2i2XVgLqz0/Py6SDHKzZM3Nxqgd6yM8D
 i4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=et8AgYiB6JXtqMQ6TgVirGOTerpkjIUvfoH2D1VR5DQ=;
 b=h3iXWizhTXpeljEetNgRewnekdlDmu8o+K533di0d77NIc60jm7kkofS5KhLIHeNcZ
 8TpabI/Iv6Cn+HXQVJ3GnyGh5bYyfsowQE5ZxSTDbFZRKTZYGvlo7zMM64gQ5mckDZGi
 LVUQrhqMSulBgyeJPzEaiABbOXz14lnQAvf0JySTd3Xi+ZQzfoGWg+eDpo1XOHNVra7a
 kTi9TMrPBm9TEGMpM0171EtYVyUc3HaguVJEYq/bico3lw5az8f0msnDA2tcDu2TyGop
 HdiBDzNSwqaNnaxJTEgmQNPxJnbFPAFk/V1IGyU/nhartQbKs/3mH9DXNmERRUoXx/on
 zt8Q==
X-Gm-Message-State: AOAM531HLYSprXdUWD7YQLiAglaW9La6gw7BSZWZYuAWzU7hUaonwFFx
 sDLUJsPXhFGZkFuzcnlkP+o=
X-Google-Smtp-Source: ABdhPJztjspuIkpz3EqDj0zBUxhmL8cYAKO2dqyNJadSoJVsV9LoWb0NmJhKu06JkRV65RJmxTLnqg==
X-Received: by 2002:a17:902:db11:b029:110:a7cc:ff46 with SMTP id
 m17-20020a170902db11b0290110a7ccff46mr2943414plx.60.1623202370664; 
 Tue, 08 Jun 2021 18:32:50 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:32:50 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:15 +0900
Message-Id: <776ba3ad0a3c609d3600cffe0ed6446baf29fee9.1623201081.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623201081.git.vilhelm.gray@gmail.com>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v11 12/33] counter: 104-quad-8: Add const
	qualifier for actions_list array
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
quad8_index_actions_list and quad8_synapse_actions_list to match
actions_list.

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index ae89ad7a91c6..09d779544969 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -305,12 +305,12 @@ enum quad8_synapse_action {
 	QUAD8_SYNAPSE_ACTION_BOTH_EDGES
 };
 
-static enum counter_synapse_action quad8_index_actions_list[] = {
+static const enum counter_synapse_action quad8_index_actions_list[] = {
 	[QUAD8_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
 	[QUAD8_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE
 };
 
-static enum counter_synapse_action quad8_synapse_actions_list[] = {
+static const enum counter_synapse_action quad8_synapse_actions_list[] = {
 	[QUAD8_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
 	[QUAD8_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE,
 	[QUAD8_SYNAPSE_ACTION_FALLING_EDGE] = COUNTER_SYNAPSE_ACTION_FALLING_EDGE,
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
