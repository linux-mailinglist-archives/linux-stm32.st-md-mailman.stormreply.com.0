Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1809341A9E
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:02:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A380C58D5B;
	Fri, 19 Mar 2021 11:02:06 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1025C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:02:05 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id c204so5624127pfc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/u2CPhZ6rUOBCIUNBfUVUJzsOfzYQHrAipQY//P3glw=;
 b=M6FbohQN6QUpKcRcTQtXxctZgSYOg32ch1cIus2E17bA6hd2xMpvKdX+ycavaIlFrQ
 S+GGz2U7BOzk1dN8RRwOMWr4NW1le+2dEx3EJkSuT762rwIHCmfuZiPiUSSwfwsmlPKE
 F4laZsH/rzuyYlmfMPUIDbKkeXatKqP4COm8b8+OABaJ6SVK2xf5PhXJ80QdsLr1bgU5
 zmXn8NsMzlZXTh5Alnf7Cxx5q3QsZRa9asMPdJI0gGzl8lJLYTirsH6rPEpTf5aiyHTZ
 367j4q8x1MDEYISdNpkXK2Ku7ldTDQx08nNoeuMV2+bhDryD9PGEl5C7dtQIfbmKcQ2Q
 g04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/u2CPhZ6rUOBCIUNBfUVUJzsOfzYQHrAipQY//P3glw=;
 b=H838W53PXGK5n0zPOGvX4FBnQlOs3n3V5fwE9vSnKqAURWh6vMWxfMn6D5BcsROgMN
 Zi2WvoUFai4t6sQUMk4COuAbpjlW0fU5vAlZORCCE0I/9LvYW0dqMDZs/C9g0lyr1ul5
 0oRqqF4o7odU3nMIaz70QU/wd7UjBGFOncamFeQ5MWqrASn1numVe9wVZQnooVPdt3bv
 cC7VpU59+VZ8dkSnO16tnSdb+MTgcfDKk50l7PFt3veO8yLkL3uFxeIzWNtojlsvs1xq
 rQiIRsH36mkb64kFbtlSzrQye3AxajTdF+dIaTo9i/144O7Fqg0Jm+3jUTqw4Il+iu9g
 x4PQ==
X-Gm-Message-State: AOAM533m9XRcmB+jRYAF94Ir4pRu9IJ12E//mlVSRHpKKGixL2imfdP/
 M7YU27iDGfrKF0N135woVPBQJKwJxXLflQ==
X-Google-Smtp-Source: ABdhPJzoGuapduW8n7o3efs8G9ZXNqL+hMHW/rmBLdctPnuOUR+alBxNVTO0yFqiValIFXrVtJS4aA==
X-Received: by 2002:a63:3705:: with SMTP id e5mr10731684pga.318.1616151723687; 
 Fri, 19 Mar 2021 04:02:03 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:02:03 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:31 +0900
Message-Id: <92caedb694b4c66d9a5e9190f8c4545ae28dd418.1616150619.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616150619.git.vilhelm.gray@gmail.com>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v10 12/33] counter: 104-quad-8: Add const
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
