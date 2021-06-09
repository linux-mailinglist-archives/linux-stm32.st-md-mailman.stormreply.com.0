Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE283A091A
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 470E4C58D5D;
	Wed,  9 Jun 2021 01:32:38 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7097CC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:36 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id q15so18041920pgg.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQg0KzWxyLI89TDhRMac/T4xtYtkVk6VuJ1hKQ5bvSc=;
 b=HJGgBGbAjNlvU50Q85PSF+HLHqQwaJ0i/X84fLizAxTBqAMiUe/Vg/Mmwu5pW7AC5o
 0gGuq0YrZ6C7U2euTXPonLgdH0FK/k4BCwWQL6T6Bqa/JOM70dE3/yfQV/kywYqDiuHs
 OeUnD2z6Bck57hihtB9niX2G3p61v0KW4lb68UDWQvhm6BxLR5l1gRfGGn7LTWDEIoUB
 DolNTg+cVwUqVCpN2sFCC4+AWU0Qk+epLPHATux7grkie5cv/TNrXr7tosAEbmTsGK3q
 Wu+yX63QnLGFb8BAVqX4rMn81jJ9+HawssBBfvT6F+0bXcxKCJ+r8GZ6MmjMPPy1EmuU
 4CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQg0KzWxyLI89TDhRMac/T4xtYtkVk6VuJ1hKQ5bvSc=;
 b=eJrYn2XSMSQFHWVXZf1yrWWH/ADg7lwV7UsPBSZL3pNYKpVOyVQM7Axc26AxRDCKHu
 u+JUKeVq0AhQK29lXr2GO9z5PxM3Gpv0/xF1AtrRBFl7yKViXwaM/Mq0RmC5ONx14eSN
 oscluRMka5kXK7sCBPKixoI+5iBPx/oZGfZuopRwFj1l5JNo8XSiiDgrRijsP0LZ2t0F
 v7wGDF8In3t50sXwGnVHa53bG/uarARET3e8Xniny3l23VcVOG60B6q8VW2pXfcDkkap
 PnakWg2VhxrQG/qMdRHmi274rxh3pi8IFq7IB1i+LRNHv1LRpYQMMuCTp2zXNF6164mK
 c3Gg==
X-Gm-Message-State: AOAM530pkG5FXdX+8NBOySKcYW+Ua6+Y6zToIDd4ql/w8Ed28Yi8JINm
 7frXQro+H8wGOUwhaCZaTDo=
X-Google-Smtp-Source: ABdhPJz9AKFpQjyj238FycuGBzVMG+AOxE5pKG97IxPudIluTn3M/FdKu1JEiqaaPp3g9toMHaFYvw==
X-Received: by 2002:a65:4d03:: with SMTP id i3mr1171671pgt.422.1623202355014; 
 Tue, 08 Jun 2021 18:32:35 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:32:34 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:12 +0900
Message-Id: <74cb91ab7b459563762ec28633cd8808093aa2ad.1623201081.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v11 09/33] counter: microchip-tcb-capture: Add
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
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
