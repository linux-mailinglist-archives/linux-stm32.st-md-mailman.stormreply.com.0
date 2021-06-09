Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B93A092E
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:33:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF50DC58D5C;
	Wed,  9 Jun 2021 01:33:19 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B782C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:33:18 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id e1so11671432pld.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SU3yllOH/J0JpGXFrD3OtM7IjEx3tP3j/eYcgE0Cn9E=;
 b=oU1U3suREqcUR8q+DQoV+nOF9l7+V7jxKkd2qE+LkqkyCNFZh07cG9+R+F5fNxJEk3
 cQkD3YHNjxDcJOzu0gzBshTatLobefQPDj/DKzqbzwx9MmJKknkzxPhRUF49sWb0W2bO
 GSPdUDYaBGqGA/jnANrtrJw0y2T92z6g5S6nokSsKhtjl5U6h4Ukgr8yPA1WIBkJN+Ni
 dQxsA1vjjDMjceCj4aWFHX6enVIKBpbBZuNTKJ5+EBVsh6pd503wTo90qSvBubigMVca
 C6m7mcqgG/euILcG+F0uYuCZ8axZfxVuZLjEnBLs6nqX+xzqQbkabix6SYoBcq1C/LQp
 xrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SU3yllOH/J0JpGXFrD3OtM7IjEx3tP3j/eYcgE0Cn9E=;
 b=ISxuvceh6JI5QX7n4Q+TchCVmP9qdxSAVZO0dnX3tYd556ScKochzRCzyc8Ij9KqKz
 qfnrI5CgAsmCU5q/vaKSW+1hl/cXYGPzTE6UJ/3gIdXrdjnrO68NbC+36vwJOI8E30Z4
 X5kMDr8GA22V5+/oK8i4AxLp7k8UvEYYDYZukIXuqoJ9bQT0iCLvv2G67sIM7S4vrVqz
 UgTLgbLvzFUyTq1w2Wgi13pigxYkD5EAJc0rNvoy0HSGn2TPaaA6FwaUVO4sHHrBhYS4
 Ab2vm2aN9EfjCt19T77kQit/4kw5nBzARL26NAR/AxaHjUVZ6d92tceWTSdl11eSPsZY
 W43A==
X-Gm-Message-State: AOAM532L93pYxrJkJHaj9jxElvN7JPTV1m0IUZJ8wsrGEunAsqJIKnbR
 HPrfYTDzSzbW2MmH9fYPsXw=
X-Google-Smtp-Source: ABdhPJy2EGG18WDW1z0FafQej0ZZkhrbqQ/DOtLGtgMSYWe3RJuz3NX/UdT0WMsW/+wMSKpBeoazDg==
X-Received: by 2002:a17:90a:2ec6:: with SMTP id
 h6mr7924018pjs.103.1623202396937; 
 Tue, 08 Jun 2021 18:33:16 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:33:16 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:20 +0900
Message-Id: <9675edda958ee2ca371d271f46445d3e1934ba82.1623201081.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623201081.git.vilhelm.gray@gmail.com>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>, kamel.bouhara@bootlin.com,
 gwendal@chromium.org, david@lechnology.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v11 17/33] counter: stm32-timer-cnt: Add const
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
stm32_synapse_actions to match actions_list.

Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 0c18573a7837..603b30ada839 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -267,7 +267,7 @@ enum stm32_synapse_action {
 	STM32_SYNAPSE_ACTION_BOTH_EDGES
 };
 
-static enum counter_synapse_action stm32_synapse_actions[] = {
+static const enum counter_synapse_action stm32_synapse_actions[] = {
 	[STM32_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
 	[STM32_SYNAPSE_ACTION_BOTH_EDGES] = COUNTER_SYNAPSE_ACTION_BOTH_EDGES
 };
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
