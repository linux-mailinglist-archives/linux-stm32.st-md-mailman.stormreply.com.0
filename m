Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C83341AA0
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:02:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE271C58D5B;
	Fri, 19 Mar 2021 11:02:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E81CBC58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:02:14 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id ay2so2783114plb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CzS3NlE62IcJjUyZ5qk3czC9f+XUZUeA9uXPPXXnAM8=;
 b=dtjQRf0CP07sJ2z6Eneel0Gon/lsArlDmbRz3ilHaaIf6tLCjQ75zJ+hQMh90HxX7+
 Im7ilddYq70zNTOEkZLRerrCW6QT+mlit1re7YhLWszt/dg8BNF5l/0t2BhlmT9DAUt1
 pWc4sKTXeqHAUym9rdNfJjrIuUjaLSKAmPUjt+fgSVi9lZCyOY6lqnevZj2X8cmtD+FR
 miZoYmsDlr3U/4i9GhNt5If18c1KXoect8VRsOkuembFBKk/MYFcpCe02muVPltNyr+C
 qZ5EY2SwIDq0UQW9G8kF8t5wwbZ8N1Mfa2Xilw+RXrmSlIJZgVspwC6uXCfF3QFy4vp1
 3pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CzS3NlE62IcJjUyZ5qk3czC9f+XUZUeA9uXPPXXnAM8=;
 b=T+KxVz4uSU8tidDBdyENNaqiOiVEA/sZtpEYgFotOVMgsHh6MDjjAHLbAAvs1P+4Nb
 WVneHj/EWBK9B5THQvsMpEtnYXntmB6YOXW5D0LSAFYeAfi4FdgcPUaq7s5T2nUF1udk
 7yp661s+ogIbUWVEZPZezgSz+ToCpSmDRKzgrylk09zBcL9g/frR7fB7oghzfxJ4Fdve
 jSBT5/PTD0EZTjMRn1Tnq7RJTD34OXUOJ3BXfnvJBA/7hyGaSNyjhwAFKekCHFDQW3h3
 6/zxuASPeT8AEQowPQsgpXKTXdsCbnK/s5K9IaJb1gqO/zM97+GgXHKlkoct5EClrA+v
 R97Q==
X-Gm-Message-State: AOAM531sYvu6OFgachlCD5Q/azJkBFdU2OW5CzA6AYwFPLKgljHKlpYV
 TOHFJAj4o2am/qjFGQE7yZQ=
X-Google-Smtp-Source: ABdhPJyq+X+ih+kVYAP/TinmHgoIzLZQepjdalrkaduhO8V2BqB+ieMb4gPKsDDBHOEkNy1Gvl3YLw==
X-Received: by 2002:a17:902:70c5:b029:e6:cba1:5d94 with SMTP id
 l5-20020a17090270c5b02900e6cba15d94mr11170116plt.84.1616151733578; 
 Fri, 19 Mar 2021 04:02:13 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:02:13 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:33 +0900
Message-Id: <961bd5450371a32492d5cb189ccfdbe7d9160975.1616150619.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v10 14/33] counter: interrupt-cnt: Add const
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
interrupt_cnt_synapse_actionss to match actions_list.

Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/interrupt-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrupt-cnt.c
index 827d785e19b4..0e07607f2cd3 100644
--- a/drivers/counter/interrupt-cnt.c
+++ b/drivers/counter/interrupt-cnt.c
@@ -77,7 +77,7 @@ static const struct counter_count_ext interrupt_cnt_ext[] = {
 	},
 };
 
-static enum counter_synapse_action interrupt_cnt_synapse_actionss[] = {
+static const enum counter_synapse_action interrupt_cnt_synapse_actionss[] = {
 	COUNTER_SYNAPSE_ACTION_RISING_EDGE,
 };
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
