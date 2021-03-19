Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D33341A9B
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:01:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53C11C58D5C;
	Fri, 19 Mar 2021 11:01:51 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA269C58D5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:01:49 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso4663659pjb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wYRkXjsb1PVUWcJtSf+4c08/zRkX/J8HBJAhSg6Bbvc=;
 b=n7oeCws7sjZvBebyHE7fBiK6RqTLulu55vDhMPuOzayEz6rz+d1gs3fVWFOtfrJ62e
 toRYYupwhq6QMZ5DL/ZttFp2LB0dIA4DYRM8vCsiVJBqibRMSZJ9aKWhzqptHY2Uu/e2
 OCWOrGDxQ8lNJyRInF/2dOcoyCNxLFJx7Op7QtC2eSoui30LlusueFXfj0813mUgDO1s
 Cyle8ufF1veYYkQltfkhXjr5Zq2lMjcsaOvqM4H2osxFTnzc6gE/RRMgf5IXRAPb8+l9
 QrBSx+4OsUTFOd/rRATdLLUJ6IKwYArS0AZEJ5j7S+L3tJSJ/GP1mejYNihDbI33ikBq
 pmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wYRkXjsb1PVUWcJtSf+4c08/zRkX/J8HBJAhSg6Bbvc=;
 b=fITOzeP8AtyDOkXcO4prhZptj9V+Vi3sqMnzNGmzclICM2lg37F614HsN83Jx5G7Rf
 imlF81r/E90AXbw2vHJqjEFAElrV2xlNweDNcrhbS52LVAEwH58Y8OavMw+LUmwCBB5t
 NodrzEIZOXNJjqXowPFgCMv+gjhXYpi8iy29hji4ttgds9ER6p0C04C1Oc04qi6jirtK
 VX/myigYGM1o5cRlP46tnzA8IOxMELHIjfndkMvX0/DA1o4lik5QeNe7ns+kwaDAQzxB
 GKAhPG6e5ca5A9QUfoWZH+MAr9JIW+8m4ekEEVDg0SupE8gB/KXIPfS/J5SAZ7CIQNFl
 VX8A==
X-Gm-Message-State: AOAM532ifXAU55XvahSO4jxPVAbeehpJvak6z7RNcYWeiA7cio2TWxzn
 ktzAsiktdBXWUj4aOxqaa4Q=
X-Google-Smtp-Source: ABdhPJzLKllTLseOaGqWk7ZaQmgb/qzKLLE1uT5g8JgA/XofhROJiz2cVxQ4Lv0hd09wd8lboU/QnQ==
X-Received: by 2002:a17:902:7609:b029:e6:9f29:625f with SMTP id
 k9-20020a1709027609b02900e69f29625fmr14284842pll.80.1616151708526; 
 Fri, 19 Mar 2021 04:01:48 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:01:48 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:28 +0900
Message-Id: <130ef8380b67430aed17ecd938e6460e73f80058.1616150619.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v10 09/33] counter: microchip-tcb-capture: Add
	const qualifier for functions_list array
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
mchp_tc_count_functions to match functions_list.

Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/microchip-tcb-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 710acc0a3704..cabcfebfc799 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -37,7 +37,7 @@ enum mchp_tc_count_function {
 	MCHP_TC_FUNCTION_QUADRATURE,
 };
 
-static enum counter_count_function mchp_tc_count_functions[] = {
+static const enum counter_count_function mchp_tc_count_functions[] = {
 	[MCHP_TC_FUNCTION_INCREASE] = COUNTER_COUNT_FUNCTION_INCREASE,
 	[MCHP_TC_FUNCTION_QUADRATURE] = COUNTER_COUNT_FUNCTION_QUADRATURE_X4,
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
