Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C4D3385C3
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 07:25:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BD34C5718D;
	Fri, 12 Mar 2021 06:25:07 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0B31C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 06:25:04 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id s21so4663082pjq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 22:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5MyPBmk1C8ie7jP7O+6glrmTm0KIKY96spBPNQzghLQ=;
 b=ex0cOuUANAFDwsEUj7ZGRvRlguns98be6ws3vdkZJN0au3/3kuKzaQqr+xd7eGPOki
 uo+ZlQvhHpXoWRXGktNreXjgWBA3JeGijlV77SQZi0UmN1QhjR1y0fw2g1lyFc+tXqKh
 CiMxnGmRRUUu7lV0GL3oRwRP9aKUY7ymtr9l2B5agwRhHw9/WfOY+rN8d1hiZ7uJH+cF
 9fP3mFnFkgNCyX/O31ss51JX1CiaPoUi+ybRHIdR0VMoggigcIRMoRPvEJCtx5iHp4Ny
 KWdT1iJ1RMLPOtYGoz8lh5F7IbOYBQWdIfG2KuS76nGahojITkjkRAvJDg8XmUmYX3wt
 SlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5MyPBmk1C8ie7jP7O+6glrmTm0KIKY96spBPNQzghLQ=;
 b=pV0Ndp5Ic/56RCv5bAiN4Dq73CaTGubkKjzjVD8gzOi/bWcKfDK+/HFrBSruncurix
 viFrTmcE6SuI02+NXTKOXWe791jgrrYGfifvq5PbN+oA8B4Ku4QgA0VR4BJAS8TtisCD
 2k63JZKo2FgHEBBCjT1JRq6dPiu7zqXk9mmw1KBrH+CgZDx85aGxuuo0/xsgVqcO3oLR
 bemOKvrPui43RwRIJhhiwmlT0IzzZ1+el4Z3qhpfvrGJ1Djfbp2O6ewnk1CktRctaVX9
 vQsV2FKvMABQl5ZkowER71o+SshAMt2gxw/sY+/CrWzlGvSLTzArixdheFkeGdyg9FBv
 sfwA==
X-Gm-Message-State: AOAM533v0Rcp1oNck8zJcOYF7IL+oYhtm179ev6mAVnY0iNTf5ZMO8QK
 HNpvcPG1Vl7TLFSpcSWykGI=
X-Google-Smtp-Source: ABdhPJzm5Z0nHh00gpWHKeoBmdB9evTXPx/W5Kbpwpegz8oOONb0Cx4COufEeadnwTzvbsfLLUMljw==
X-Received: by 2002:a17:902:cec8:b029:e4:a497:da8d with SMTP id
 d8-20020a170902cec8b02900e4a497da8dmr12138708plg.16.1615530303365; 
 Thu, 11 Mar 2021 22:25:03 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm4048406pfb.157.2021.03.11.22.25.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 22:25:03 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Fri, 12 Mar 2021 14:24:33 +0800
Message-Id: <1615530274-31422-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
References: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v2 7/8] ARM: stm32: Add a new SOC - STM32H750
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

The STM32H750 is a Cortex-M7 MCU running at 480MHz and containing 128KBytes
internal flash, 1MiB SRAM.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v2: no changes

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
