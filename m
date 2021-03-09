Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F9533267F
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:20:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76F7AC57B78;
	Tue,  9 Mar 2021 13:20:55 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 023B8C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:20:54 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id o38so8749689pgm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HvARqXgeQ2fZeiR/U1XlXXl6N9XMxqOiCPuY7eJJp30=;
 b=daDaJJOuSYYv2U02zs+uchgqbT0gUVfefQebIL0i4wEieLWddHnNzkXYRuIF2Lcfkg
 PPYTwLFD4JRIpZ244rbGj1/4gruuuGVHk5NN3zyAwjTSUIcLoBJovLdzbu7mpvZPULpu
 ZDUUi2D8sPog66u8TuDPAv3Z67uUxKzwsxFfmepV8Z4Vhlh1dqzcLGG9MLSShZjoEdPy
 1wI3yVsYJXhAjlIeY8+VWegA0dMrAh7awbZ38Nb8GFrdjE73E5ltkLM8KyZsEU73IDAP
 YxuC+r8czFtxV14NhFpXVtDsCn2m4WsEjD/Hj8CevL67DxMUJdc019sOgqgWggoo4QVL
 R7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HvARqXgeQ2fZeiR/U1XlXXl6N9XMxqOiCPuY7eJJp30=;
 b=emHBWmKY3d+J46gQjOf+x+S7p2p7w6YgpcTq/5/6JCLYr2InREqCwFdNogCM/PjsJz
 gWNIXm6VRAaI0WhqV48TfmMvc+sgqISEi7NYNxX0d55IiWgLf7L5s6+gnPA81QShxPey
 f2fJ54bqlxbxc672IwQa/IqQBzbwjaiOELgsSZoFn+1r7V4JzFMW9idGMbG0BkK0tI8n
 /5J0rnLrQzK8ZrpiQFz+Yr2C4H7zee3CodH9oncTTf9bJ8a8O0YEz6ICTMM74r+hp7S1
 NRP51FNC7q8Km9o+gKAlGaAgwo+2KE5dYmZ8AlEYYCTvEZ6mx3QwL0FKMOc/NY+onHYZ
 LwTQ==
X-Gm-Message-State: AOAM530E0u8TZXc6SFl3J9o+C0sPbaDMryS6HAOxyv4tHeSv9fNUIMdZ
 q/tksCEpb/1xt+GHqubtWwE=
X-Google-Smtp-Source: ABdhPJzRAXelYHDtirlTtKesTFBuImAY941y8ZqiNjYmDxoddlkFWj+wWb14a12LcAATmO1yfpjUng==
X-Received: by 2002:a63:1946:: with SMTP id 6mr14219508pgz.359.1615296052621; 
 Tue, 09 Mar 2021 05:20:52 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:20:52 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:21 +0900
Message-Id: <fd566f436d28dae842a45f942bf25738ab6bd139.1615293276.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 08/33] counter: interrupt-cnt: Add const
	qualifier for functions_list array
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

The struct counter_count functions_list member expects a const enum
counter_count_function array. This patch adds the const qualifier to the
interrupt__cnt_functions to match functions_list.

Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/interrupt-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrupt-cnt.c
index a99ee7996977..827d785e19b4 100644
--- a/drivers/counter/interrupt-cnt.c
+++ b/drivers/counter/interrupt-cnt.c
@@ -112,7 +112,7 @@ static int interrupt_cnt_write(struct counter_device *counter,
 	return 0;
 }
 
-static enum counter_count_function interrupt_cnt_functions[] = {
+static const enum counter_count_function interrupt_cnt_functions[] = {
 	COUNTER_COUNT_FUNCTION_INCREASE,
 };
 
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
