Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58030341A9F
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:02:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20A82C58D5B;
	Fri, 19 Mar 2021 11:02:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C570C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:02:10 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id w8so4471790pjf.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o9szktyqVt36+WoTRvGFyjpFpuwX5mGOXWZAwxNI2o8=;
 b=EMmwrsrPY2L44xoGNJiGwrnlZa+lwCO8CezAqpflW1G8p+ctWLKic5p2ddU7hWwSfj
 AoqInfEQicqM0k1Kp5hbJ0YYztbI+LSnP5MRSbibyFqFcwdrT2JYDpYBAprhKkQDz9JF
 PXAcwaPTqcSE4451deTVvkHAs58NEg38VmsOK1vvUVvYIIO2EoRH1ouqFWt31kg77drP
 tsGPHvE0VL1P9ple9PkCaThQPxIcLWrDueIPEFUG1n2QYCayBsOxL8nEGyAqcn1/DSD4
 W7bpY2PjwNKI8UTJgmtik4Ueo/86b2UyJ+gOVIqa5pY+/ChN1bOx0kFxtEIx1UTk4NYT
 3jVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o9szktyqVt36+WoTRvGFyjpFpuwX5mGOXWZAwxNI2o8=;
 b=gOhQuHCYVipBXnw522QhJ3shgF7VQyGw+DFLgwPFcScg5jfSdh6aEx9zIGVLCSoKaE
 6zheoOk7Zf0e/rXygWnoDGqXco2rvLJkATuHdLl55BzqP5SqGtwI4BnSdueN0kbeyTey
 HjqHYlV9QbGNDgB9GFQKX7szRyFi35DxvrjyI2o/2GkftN9Oi0eFickibBqPfjTLhd7A
 3h2EEmtpCrhINND3vSlrWeBekMjborCLBLuKhSvCeFwOIb9SWw8qpT0WUkGEC7JHV5cw
 phq0cCA+TxwmDvTykUtwYFK1EADFv2ze7TqnzacdzWTFoCDfxu+jAvi+NX9mNr3Hs0Qd
 /Vcw==
X-Gm-Message-State: AOAM530hX4p5eZiVr/9n6yiGebrw3dv4L8H+8noWxOCmM0HamBr1rKCI
 19Hj7F6e3neL0ICDJFrG53o=
X-Google-Smtp-Source: ABdhPJxL8b/9G2djwsqj4texkb9XQeo1yDBgnCWHkTsY9yJ9mzWyPkA7BuNdLizCBhAJs7phJW3isQ==
X-Received: by 2002:a17:90a:d911:: with SMTP id
 c17mr8789491pjv.98.1616151728644; 
 Fri, 19 Mar 2021 04:02:08 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:02:08 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:32 +0900
Message-Id: <26cb41a51178856fa99e2d8e1912dc9e4a37b605.1616150619.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v10 13/33] counter: ftm-quaddec: Add const
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
