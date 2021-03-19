Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 253F9341AAA
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:02:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E15AFC58D5C;
	Fri, 19 Mar 2021 11:02:21 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C45F9C58D5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:02:19 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id w11so2782639ply.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lP4DMV1k2SKwBGG4XgbDMs9P1GWZ9vtwOGQw009rdwI=;
 b=KXlYrHJXMRHv6/1HCs2KIjiBVTKWFcJfWoq67AacvPXMLIx+iRiPEyXQpwMIqLG7ou
 Wcd7Zj9VztkSNbvD3Gehrs7eVsyKUTEwfZBgHJl3cYLBe0X6X1vTdIMuiLP2wpzXSqRY
 Rlm2iL0l0mtBWVcW5IHqZcpor5yYkorjL9n32skrpRf0N1Uf5OgO+cCKI0VKIY7+c0du
 VPNSz3dd+Il5jrGCtorVnVWMKLrTPn7HmHaGqs7FhZH/j6zG7Kzr+g2AW8UNE61/BLY0
 nq/D1ajtYgjR435gVplkiX57/0+lormJ9Nm8RgkTghuZGJisD4o/AsiBX+cD2+lzwHKo
 EkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lP4DMV1k2SKwBGG4XgbDMs9P1GWZ9vtwOGQw009rdwI=;
 b=BLw6W13sgE8wQNQ1B/h4m4YuG/zUswq+kOpNO3DW8vlzhNF/GahDPafHvGvDYjQ73I
 eGmjQAkc0mtfuSGmjmlSM9+Q3H78QF9Mk6i1ZdQARW0EfB3Vh1f8dVfmK+qmK4SoxH01
 tu5iwT16k8CxSY4t5rncXXA23QDCwAhBazSASrsoXspjx6lNlKJdVf3yhUHmkfVhpkbF
 TsuxeTy6k4mJaZDj/VDVqyrhnpzuabVVQbhMv5qMTIbg/kKO5lCVPSUro9rEaW2faBEo
 IlDDh62NTPRoBHp8IvL9YZA0ZF37+0XINo/BNHOZmNybQ+e1HOoHKx36P0Kn1NqFEbsD
 b/Bg==
X-Gm-Message-State: AOAM531gjy0yWHgxByJewUlFheBT0W7q4MaJoZECgMTGndzoeov1cOmX
 ckndjmQjrhXLt9kgZknqaX2aY0v/rgxWZg==
X-Google-Smtp-Source: ABdhPJyLCSHLBNb1i1M1D6923w5s3KUyG3J7/Ct9odrQ4EqOHGCrgICCXj/iH02jQFwP21RlrYmnDQ==
X-Received: by 2002:a17:90a:69c6:: with SMTP id
 s64mr8922168pjj.37.1616151738483; 
 Fri, 19 Mar 2021 04:02:18 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:02:18 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:34 +0900
Message-Id: <5043d74887ca245274e535633a8eb472f690bb7b.1616150619.git.vilhelm.gray@gmail.com>
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
Subject: [Linux-stm32] [PATCH v10 15/33] counter: microchip-tcb-capture: Add
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
