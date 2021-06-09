Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F134F3A0925
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:33:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B97E1C58D5C;
	Wed,  9 Jun 2021 01:33:04 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D06BC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:33:02 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id v11so3204733ply.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lw85OY9IsEQkeBky8rQsiGABab3FzcsYXmNq0PU+6y0=;
 b=Wfncoto56Nnmo+4w8Z+qxMwcdO9zZDMQwYTo1BRw2xORjxeCGglPpRO1Kb6UuuFMR/
 gFjdGSAJvlZ/0DnwcfN5XQmqy6pTvpX2rJlce/wXRRyLqJMy9B1/qKnTvWNQEhO6IR6s
 iGhK9GsKdMAO16cnTVBxhxVefl0KwsVjJbDj+u9Pma8RykOLrgU8kFDhbeDuLu9wkR2o
 z11kDN/8/hqSvyuvfxgkPVem2rhR6kaJ9C+1LKR1rsV4uwTA24T9B/ef6PK9z6Y1Qwll
 rHmruZTFGxc4fe9Si6kuMROCJLh97s2R/ZiBeUrGMTAMsdIsnfzHMsbreiO25ThM2HCX
 xNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lw85OY9IsEQkeBky8rQsiGABab3FzcsYXmNq0PU+6y0=;
 b=VfTMVVTNjOS2JB9imysFazdWK+rO/hOhleEhnW1ABRfGpFYkNE8483hNYgBtw4JzYQ
 LlvIEn6w2dkaSynfEqAQqJbrrZICP7l/KxKrTx1Ku5WW4zcC2gZK//Wn9ZX/i83rgNVN
 H3uzh4gUlfWZFxpTW8a+AqG9mUHIei2dEABfYRygSR4GSyfCn9n974L6HdSSD1sNwohP
 uQtZeYeQecKFGUIZ+v5w1UvioAFoJp3ztOcxGwjkKnCeZTdTfcfRkKXK66daB3mDucPi
 SZ2K3UAF5R3Kh5f+CWIQT39mBXC9uggHdH5J9KZY00DJPdhQdkybWC4jZVtWhJ9W/mH8
 J/lA==
X-Gm-Message-State: AOAM530P/B8nCBobKeuKhoXTK+QEtXCysSwUw2oIYRcaief/o602gc3l
 JMiFwOlh5ofDTQz/PX0bO3Q=
X-Google-Smtp-Source: ABdhPJwUKxbd6KAFcOZwqLerEiDxQZpMz2EYRlzoI+lmPjPlPXIz2hVf9gZtdqAD8keK/olId5lsqQ==
X-Received: by 2002:a17:90a:117:: with SMTP id
 b23mr29364330pjb.183.1623202380699; 
 Tue, 08 Jun 2021 18:33:00 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:33:00 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:17 +0900
Message-Id: <a3bdffbe7c38eb95ea692ed30aeb50dbb65c9e6f.1623201081.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v11 14/33] counter: interrupt-cnt: Add const
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
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
