Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2EF3A0921
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A450CC58D5C;
	Wed,  9 Jun 2021 01:32:59 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20A8BC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:57 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id v13so11684481ple.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JrquYkvxwwxaQpkei8svMskXgimhFQ45B33xBG8Z/x4=;
 b=IqBtJ7TBH5T+FDg/B2YXmXc8Fl+/QP9kZ4QjcS+30KTAuNuvpZneMez8fxV/jWTCWE
 mGYXtaQZsZb/Gk5rwrji15SrSNxCwBMCYF7BBYs3Q0HuURNiNc3ExBYk3+EkFKegaNP6
 RFTKR9dNSu7kXFyGPDFEjEqujqzIA3kSL8prTA1gbCbKDLQQzxI1fTrGqdVTbGFuCzH0
 skqeyZcMG4IqGANLsmnODTSHf0YM0nr0Af9XXJwvOrDr2/aQxX6jwjCMZMriVZVxOfMA
 XC0uk0Y+CFQ+NwhTGxbFtYWYy6CIYCsPvcB9SpiRz9UUoolce6ciK5uPH22fUNIv3Nwb
 tS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrquYkvxwwxaQpkei8svMskXgimhFQ45B33xBG8Z/x4=;
 b=uKxBoqhk9jGWs/j/2n0Ui4tbMP1ci0qCFK2G6Vg4riiajHT5MRzfIQN/neVZNaCFFa
 StGPbBL5OueuBWZMuUFfbcF13qto7lYjPtZJd3HIxHe0wz1u5K54mnBW9TFTYZpjFO51
 b9kQMn3KdDWxHlQ2pRMyGX0SKxedJeL98+vKlTUsii/T+83mzPgghKqyFFKDitHznVoQ
 klc+0FKlnTdaOCvPUKnQZqw86rCqaSd6bZrT8akyTbcw0LDb1FqoJJ82lESHLz4KEsS4
 JkEYY5Ci2puhR/iuCSYtdkaa529MigOu2zYnJtqLRYFSLwHMml2bkz79sbkZAWbK50BK
 E6yg==
X-Gm-Message-State: AOAM532bQCZkb2RdTA5X3S9k0YG5wmxKHd9Y8t8T+1cNqm38Red4fYsO
 hAtQU4uzc6OEmu/uImMIw+o=
X-Google-Smtp-Source: ABdhPJxT4r0FYvKTngF67u27Oof0BX5/ssfdITgfV0FJKdbRWz8BLhe1PBwfeNXI5kWQx9cRCrKlhg==
X-Received: by 2002:a17:902:7c92:b029:111:2ca8:3d8e with SMTP id
 y18-20020a1709027c92b02901112ca83d8emr2569557pll.77.1623202375667; 
 Tue, 08 Jun 2021 18:32:55 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:32:55 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:16 +0900
Message-Id: <db1df2021efb1b98e6d1a50787be5a52a1896574.1623201081.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v11 13/33] counter: ftm-quaddec: Add const
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
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
