Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 237F2332689
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:21:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E207DC57B78;
	Tue,  9 Mar 2021 13:21:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4099C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:21:25 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id ba1so6568759plb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hMXw7mJLvmbOCLGtZkacbJfdNcshHDOykbRbagCdG6s=;
 b=dS5t11yTimmAgWJ/VyICyJwpRHriakfanzUCa8NwNNgvjVV+OGrPXIiYtW0Ce4opoj
 rYPFyJDZvTANqOGxcWde7x9EbxGjgYr0F4jX5zctNvALNAqyNnOMOM0QLHzURiv0A0YZ
 T5710qgW8E/37FOATqErMkbQdmEqgjmUQfVHaTEwtExaO4o/oSs3f+Qh2j2MU0hQnBLX
 Rb1i2KdWdYNFjby3VInHJSZvRbjDMr6ghHAw18IbicCLbq+MQ1m97oQzgjKucim0ZBXE
 YRcJGy1mmKRRtRGnf+2HPZr70tPqUd9+tIReg3e0KnviRS2tRAyDCLZlgmV78FIT0EM6
 VWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hMXw7mJLvmbOCLGtZkacbJfdNcshHDOykbRbagCdG6s=;
 b=Xy4BxI7L4J+ahV2AIUQ5I/tSaRsZyh8lH3KSkW+v2UV8fxXtOp3PNPjOcIq9VUG7ZZ
 c03nnzCTwMInEOiNC3rlG+EQF/QKxruZthNqSq7P1bTgJfQDWAVfXY+4x2nJUNGFRPv+
 u6uMWQ3H43TrEWxOlCNIQRJMdWme9pJJXmwnhpi0IXURY1zn+E5q2xstSb31Qj6AHBnV
 lkWmHxO6N6ZKxp3DZtwc+Z5JJtVCeEPDXgYFxp3r8U2DcJJ8ys2xYBkpuCpPLLBfhyxl
 rt8vqdi8pBHBcPBahvIl4nTuSJaMpuCQIgELOdtcZ2wD5K1kqCUD6zAfhpiZ93g4W8BB
 SreA==
X-Gm-Message-State: AOAM532SBiEaHTmSOiJje119+nQtXcu2d8kRSPcrYBYGG+hSb+iIEir9
 Ml8KxRoTK0Ur1VuF3dlJOS8=
X-Google-Smtp-Source: ABdhPJxoxzQivWDNyZ9YM3b54AMuzlgre0Fcfw0AmJmmILw6QJPteZGZXZjWn8Dhf1/XZN5tsVsGDg==
X-Received: by 2002:a17:90a:ea91:: with SMTP id
 h17mr4726826pjz.66.1615296084435; 
 Tue, 09 Mar 2021 05:21:24 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:21:24 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:27 +0900
Message-Id: <0cad0b85e28f558e4774f02ca267c32a6ac03b6d.1615293276.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 14/33] counter: interrupt-cnt: Add const
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
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
