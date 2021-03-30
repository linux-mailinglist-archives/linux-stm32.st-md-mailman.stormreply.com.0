Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D0234DE64
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 04:29:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75311C57B78;
	Tue, 30 Mar 2021 02:29:30 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AC11C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 02:29:28 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id s21so6970815pjq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 19:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZC7OsJDitwURS7yQv21Tqa62xwQC02uZmH02f7XnvdM=;
 b=ZMDEApQI7isg6vY98cwN7EKN0hFbkKliHzcvx4tJLy9YSb1vFLx3oKDaruXdXkQI9p
 EEMt0K+Q8jhqbXTkngijL08KxUzIYpPG9tISDqG2GbDicw8k8H43IrVBdAw70y4txkj3
 1vn3SBNsOmAql2S78jNx7X6Kh21zHfw1CBALq+szWBs+JK0es3Wpr2r0PtVWmxHQZnnB
 ZJKJUGxZxm/7uUK328q+bd8KZmzn2XbCId1weMgckVrputIVNCuexxgjUb2EnuzYFasz
 lLKw3CtlQWTnJEfkfylj2bGs7f/mQtYVBLRSim+BTZJeLzq93ItcDnBIv4RgwslexYZY
 5deQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZC7OsJDitwURS7yQv21Tqa62xwQC02uZmH02f7XnvdM=;
 b=VZM1KzXkxiEoZh3iJ8+GPvoqXjx4FwhhjfakaUFoP/MbgsI8LjWpqILhjx5YWFA37U
 ZaBkz92D5GzgM6/sdTZsqefxGeksDwpkfAp2RGQVatKAFYXC63Up2nYtyH/T4Y/INAqb
 lMl7Vr7Yu+DHz/c1vooryz5pE3ICjx1HTzCHnsKfoSIvKfK2pvyUF0YPadhgxP6gfQ/p
 IFGTTEobjrepPEzvIsKhfgghCfO4cB4oO6zqcLheoSyp1I0TWjStAjSwzG6qodTad0jO
 D6Vz2Q6lj1j2pJiZSDZm1YEx5479lsYc9strfwwK/xDlT4/0LvIE1Pl+1/AEJav4XjBy
 DaTw==
X-Gm-Message-State: AOAM531WhgySK+GqjrbaFjLHnI2oXXDemJaaoIYojsXkAuxNHPM/Q33k
 /e8MIjgczObFeUn7CbpY62w=
X-Google-Smtp-Source: ABdhPJwetibVZU5KRDLAzy+ulEXTyr3gBVWCsEo78h4LF3Gg2xL2QGuIbH7u0kMZgnT99MafHPx9+Q==
X-Received: by 2002:a17:902:a610:b029:e6:5eda:c39e with SMTP id
 u16-20020a170902a610b02900e65edac39emr31678090plq.11.1617071367006; 
 Mon, 29 Mar 2021 19:29:27 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i13sm17681385pgi.3.2021.03.29.19.29.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Mar 2021 19:29:26 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com
Date: Tue, 30 Mar 2021 10:28:57 +0800
Message-Id: <1617071338-9436-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617071338-9436-1-git-send-email-dillon.minfei@gmail.com>
References: <1617071338-9436-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v7 5/6] ARM: stm32: Add a new SOC - STM32H750
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
v7: no changes

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
