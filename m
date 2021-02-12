Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0835B319E01
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 13:14:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C314FC57B5B;
	Fri, 12 Feb 2021 12:14:42 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18A2AC57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 12:14:41 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id m144so8400905qke.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 04:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4RVacsqoYzmylNKCath3c3Ne8oWPnlwk8NYh3tn8zeA=;
 b=SKctp4vDgTsV14fVKI7dhcglVl2L1UAIHQ/X/m4dhyJAABbwmQIbaHLQCJV0LfpTNg
 9QGhruNMC84onXhOn1rLtQD4JFNzmReZndfh6wDUcHzvjmDxvfMpOz5M9Vsph/RE5cad
 BmB90edCp+b5pgdhWxp08y1zSRWSZRrhLlKg26/XsPy6H580e23NRioA9rG25ER/fHUq
 6aCc9iN9h6RQcgwtuGrvn1kBXuhLfDfLbNt4eNqduF+6iHhx5zcYWsE12yuwhoeOEiDu
 rQ/8qWqSVjmUFqiMoTx2jJ5R5upBh+b1dXfxZkPcSMVF/u4QwuxQ/DdEnDFQGcPhbJVd
 Wzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4RVacsqoYzmylNKCath3c3Ne8oWPnlwk8NYh3tn8zeA=;
 b=jRfX5dDAbDD4m/ZZUsj+HbdGkAicdYfIWsLK0wzzpaw6bgLI7F1B6Sx01LytXMSmbk
 idqhI647sAZl4M4AKE+EkMXgVkf6Whc8GaQTtk2u9dzp3JwLw+OzWOLfKIjiLHDTYQ8f
 R8i0LS04cDYCrsm4GFFNRM06SqxQxGNahlNwWXfky6K/P+YeSJbLqKaCBXjXc3ph+EUG
 H1PIihCpIHBok6glUC+w7IT1LNAt6gxQM6VHQWf4YdaWByPCmjT03peVZS4mbVMWwxAg
 JjKDPSqtICkldi2Fx4vz1sHqg2KV1KVPH7tO92wqKtEmgvg7UW2byl69hrJM0/MNFQpH
 V+qg==
X-Gm-Message-State: AOAM530vPxbV4iBiUzvdjq+KNBOarXevOZq8u5sV1QhZeK2hQyHGEXUC
 HjEhXmyNF3nu39bPRDQqBUk=
X-Google-Smtp-Source: ABdhPJyAo21v5popAcAZAA/3yEpMI6qCZtg0s/4jH5oGtDgCZb40rgb3q4w+8k/AySBSxaYjvVEV0w==
X-Received: by 2002:a37:6484:: with SMTP id y126mr2179765qkb.430.1613132080125; 
 Fri, 12 Feb 2021 04:14:40 -0800 (PST)
Received: from localhost.localdomain ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id y135sm6278534qkb.14.2021.02.12.04.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 04:14:39 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 12 Feb 2021 21:13:31 +0900
Message-Id: <0ae8373f4e587981a409a36cfea70328b5153ed3.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1613131238.git.vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v8 07/22] counter: 104-quad-8: Add const
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

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index af4e0503b074..9a96296b0625 100644
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
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
