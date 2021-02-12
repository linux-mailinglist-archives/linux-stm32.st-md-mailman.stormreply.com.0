Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C200319E02
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 13:14:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5B93C57B5B;
	Fri, 12 Feb 2021 12:14:48 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11503C57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 12:14:47 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id t63so8425844qkc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 04:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wQvnOEOCiwFowILdQGnHkV7MlEe+qaKqvDn1S6Ccy7g=;
 b=bdsQe4Txc9lwEijLlKMFaPEa0e+EzyJkmU6+anMzUqwzXzWjrQXX64zJKXVt0J5UwR
 Sebzf93XCIn8+aRZ3aSRjMh+8Z6VrllNvRhbQKeV5yZH1a4BTDW3PCalIrpOuAykH5kN
 8rhVzzN3PrKmsuEogm98LrAzrgYK9Q+Rr18zR7idWcoa0vQcRT4oW5/Ua80kIxgWK37k
 d2yhgZbOWUHkvIrHsLCHEUfjqs8XP7AbNP5zMCFnX/tlbJpVPlbvXUZx3P1FdD/hsCqA
 WnUvEaIDGn8AZTn4/xcX2rnTujLNcXlfYXIRydGQ6rep13ggvlj0qn3LDZwmzAQx9wxV
 4ziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQvnOEOCiwFowILdQGnHkV7MlEe+qaKqvDn1S6Ccy7g=;
 b=hgeR3fQPpD9JzTNHikPVw5HQQn9luR5XQrVemXgmtYZAwvruhLr2uY7PqJNjYubGMv
 kf5c16NlOT/yNnekp39QF6zYM3Xfa1I6Nnaw1NBbFXbWLxJwLjYqoFxyj0SlDNmyLQJX
 ikKkixLeL5Br6Mvz49PyGVZ2Gv6zhxWzeXPW4nY/LrwnWRNuktaKn1VBnlwsC6q4SjRo
 OmbyhchwOEr5GtBXM1dfNmByoJuw02o/EY/xkWaYv0XmSKDy3SzBivn3sp68+ITC526i
 8ijwIL2lKypNZMOba1YyxRnietBqp5wCf4jXOglbY5jVhFVdymCfGIFSd2AJQ8hn2+pT
 LXlg==
X-Gm-Message-State: AOAM531Cgk7UeJlBy9CysaOfxgMaRuDj5+jfyQgrXV0DAAhKDRjBbWe2
 5NMFnt+83A5OF7THmm+DoNs=
X-Google-Smtp-Source: ABdhPJwelSEgslAQWW2y09Ci4d8oryQY/d8G2mwivnjD0nkdPt3Wu1h6AiyrWucXHLu1Rw4Qq6YYTw==
X-Received: by 2002:a37:4242:: with SMTP id p63mr2258218qka.396.1613132086087; 
 Fri, 12 Feb 2021 04:14:46 -0800 (PST)
Received: from localhost.localdomain ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id y135sm6278534qkb.14.2021.02.12.04.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 04:14:45 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 12 Feb 2021 21:13:32 +0900
Message-Id: <9089abe5800ba8a761c6bf1a83e77dfd2686e656.1613131238.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v8 08/22] counter: ftm-quaddec: Add const
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
ftm_quaddec_synapse_actions to match actions_list.

Cc: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/ftm-quaddec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/ftm-quaddec.c b/drivers/counter/ftm-quaddec.c
index c2b3fdfd8b77..9371532406ca 100644
--- a/drivers/counter/ftm-quaddec.c
+++ b/drivers/counter/ftm-quaddec.c
@@ -162,7 +162,7 @@ enum ftm_quaddec_synapse_action {
 	FTM_QUADDEC_SYNAPSE_ACTION_BOTH_EDGES,
 };
 
-static enum counter_synapse_action ftm_quaddec_synapse_actions[] = {
+static const enum counter_synapse_action ftm_quaddec_synapse_actions[] = {
 	[FTM_QUADDEC_SYNAPSE_ACTION_BOTH_EDGES] =
 	COUNTER_SYNAPSE_ACTION_BOTH_EDGES
 };
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
