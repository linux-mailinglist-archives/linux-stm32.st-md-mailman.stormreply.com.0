Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDC434E3AC
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 10:58:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 761C8C57B60;
	Tue, 30 Mar 2021 08:58:56 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA539C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 08:58:53 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id y2so5804635plg.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 01:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FUmJbGGhJ0M8BOof8LnXQJFcnuGvgG4sMjXT3YiPkS4=;
 b=tWWjc17CwkjTu7PLrTye0AARaJrJSAObQBbyUVq5qn/DG/aZm9LaaBgVWrIR1Pcg4V
 LEIu3DaRdLNHNyBJbINXKfuRXtJCAb+vGDsECaCoYZP5uj0b3egrAjhfjtmZqU+CFttS
 WbimF8Ko3WiejsftdeZNEL0Al/OEDzBvWU38Ej/sNyuxkaTBhVQ8T4RpljBvY90fRyiJ
 Bai8eCzP4efucCLRCLoZQwA1MjFUYUzkMgw66TVPuCQAxee6so91ncR/qXEgh+jldwQb
 X71uxSm8VlVvvzaIZ1AOY0hCkQSHSD/PHfrjj1vMHuezODgcp0yQdZBKme4qZy3nWsUi
 /utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FUmJbGGhJ0M8BOof8LnXQJFcnuGvgG4sMjXT3YiPkS4=;
 b=VwDcW+BBrWSwGCa2M4Fa73vSIbbXlRKWx7x4dk9GImZ9n3L1hG1aXfq9VPCzdvDrgH
 5F9b7yvqDdcMDat2RXboCJ0+ETGEStY6q2yOkwEjhoGRHv+3CXqLXnBMV5zdOjiENYR0
 jzxCe14XHN7kZTMgunIcgzz+dTET2Q7h29O4RPotWF0ywgmoRdQAJlwGLXBf+6Q/q72P
 3+iKvs8T8wHVfLC8001zbYLOpHwAst22qsqNhDhAAOKKZq1kk6kYb9IhCP2gqZk8bnzn
 lYLo8jTC8D+l5c8MdW0rwBpR0fXnWah0v5mQhWYEXbkJAPRScxttDJ5onyge4k/2Hl6o
 BZ3g==
X-Gm-Message-State: AOAM531dADyVbprnfq8Z2LYwbUqnwTMMZK4eACA1ejIkraxdctkrqamw
 jGsfdRAR6UD8paDLs7ItSRay3XMgNIVggZoW
X-Google-Smtp-Source: ABdhPJxoK0LnTrxg0IQQDSduBRY1DwM9p7bY7psUqjidgg8DbkkuBfvtcB4b+hXzvtpQJpZA6pKOpg==
X-Received: by 2002:a17:90a:cf8f:: with SMTP id
 i15mr3343412pju.22.1617094732561; 
 Tue, 30 Mar 2021 01:58:52 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id y8sm20952642pfp.140.2021.03.30.01.58.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Mar 2021 01:58:52 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com
Date: Tue, 30 Mar 2021 16:58:23 +0800
Message-Id: <1617094704-10040-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
References: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v8 5/6] ARM: stm32: Add a new SOC - STM32H750
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

The STM32H750 is a Cortex-M7 MCU running at 480MHz
and containing 128KBytes internal flash, 1MiB SRAM.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v8: no changes

 arch/arm/mach-stm32/board-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index 011d57b488c2..a766310d8dca 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -17,6 +17,7 @@ static const char *const stm32_compat[] __initconst = {
 	"st,stm32f746",
 	"st,stm32f769",
 	"st,stm32h743",
+	"st,stm32h750",
 	"st,stm32mp157",
 	NULL
 };
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
