Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9303A0926
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:33:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 463DEC58D5D;
	Wed,  9 Jun 2021 01:33:09 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A62B5C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:33:07 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso410272pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QvDxZk7tQB+qPWeMP5/A5ST4dMAl9tR54BVIdJolS0A=;
 b=KiHWgCk0fMMuPdY/N9oF1xeLIsZSAzMgmsgZApr4RK9jG6MVI6mEY0HIz5UhLsMG/y
 yLnZgBvC6SdBhXebLewyHqxSCgoU5G+OpovEKrXIQbW9kIS+bp7i6FILVXSJOqWpBO7V
 SYby1ZrNHw5KIwqhdEstKb08RFH2U5d2YFYRPWD1J5QjgSfzj2fpedKp0qUpft/UJ1vz
 0Bz3uAHrv3baLXfQg/zLemXSumnFo8zHsFGlsDNZjho/BX/hwpyb7anI4cejTKNVdYSa
 24jtuZadKmJRCsAo2u1lQ44PNcxTwClzvzhU3IgOo1WdziaJCJhoDxWGe0PfEPGO/RGK
 Q8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QvDxZk7tQB+qPWeMP5/A5ST4dMAl9tR54BVIdJolS0A=;
 b=s45tLlTYeQ85BepA7gXOAv/Kx+FfnHwJxtqs9HMUjwmFXn4AExqdScDjwzRiddPV7/
 jA2CSKa+wWQcHfGPZJHI41JLgqu6pIqc8DWcy9hoi9+6kY0bsqOpXqdYQ5BbS4UIQQai
 boxZ/FqBTrJqslhNg+NjMNyX+cg9HyYYG1LA+A3uIZsej4LH/rUUYv4EKUna5wtheUkY
 Znb0/s9+ptFq4SxcYXpjPn+lwbuElzCyTa2ETJNbLqAHMfZ1/T7ottZQZSCfyGvu5sW4
 Lbf9OJmmtITFiqyzq2o6sAP/HTAEIbDVl40AqUFC1/BKRSdlXBjN4/1dz5yzFXDDVaKh
 3kYQ==
X-Gm-Message-State: AOAM532cpoasCd6zaWN6K/moIEQgebikEnPrVjTJWaQQv7AMA/8iUqxX
 FKc+zVYcCs5nYrUY8fU6U5TnjYGwKMegSg==
X-Google-Smtp-Source: ABdhPJzGnzC0MKdX0Eu53cfIj6zq6TTIP6Kfu//OQycsPALjV760dgRZAs4Rrh1Wpc7XhPqBUiME3g==
X-Received: by 2002:a17:902:c20d:b029:110:483c:b965 with SMTP id
 13-20020a170902c20db0290110483cb965mr2920907pll.77.1623202386223; 
 Tue, 08 Jun 2021 18:33:06 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:33:05 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:18 +0900
Message-Id: <165f9682ce308a60a477aaa56fdae7bc949dc218.1623201081.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v11 15/33] counter: microchip-tcb-capture: Add
	const qualifier for actions_list array
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
mchp_tc_synapse_actions to match actions_list.

Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/microchip-tcb-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index cabcfebfc799..51b8af80f98b 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -49,7 +49,7 @@ enum mchp_tc_synapse_action {
 	MCHP_TC_SYNAPSE_ACTION_BOTH_EDGE
 };
 
-static enum counter_synapse_action mchp_tc_synapse_actions[] = {
+static const enum counter_synapse_action mchp_tc_synapse_actions[] = {
 	[MCHP_TC_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
 	[MCHP_TC_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE,
 	[MCHP_TC_SYNAPSE_ACTION_FALLING_EDGE] = COUNTER_SYNAPSE_ACTION_FALLING_EDGE,
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
