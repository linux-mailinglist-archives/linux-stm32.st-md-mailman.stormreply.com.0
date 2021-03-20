Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DF63429BE
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Mar 2021 02:57:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4803C58D5C;
	Sat, 20 Mar 2021 01:57:03 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C13BC58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Mar 2021 01:57:00 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id s21so5519527pjq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 18:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8FTVU3LWtPn+X8DSzdXj1PWQwyL9r/ZJgzNh2Y8x2JQ=;
 b=N4ffAJyFhchEB9erJdyTbYkCV7fliK1eaTj8SSzIoqTM96hCNNzHOOyyhGSlEp324g
 tTSX+zx1HHGkxFj/dIq3AfobJrcxn25EC4ntuSe05yO8y9EYtsrCFQuLN69I+DpWGTTP
 R+JSYrAV6prz7dj0sBoOj24pRFoi0T+FHWp9o5lIL6ZsLoNS4LJb0JQ2e8e4EvdNeXaf
 X3DpOfixb/K2Zsb2D4fX9jnEbm2laabpibfj0rk/Tj5+0jMlnG2kRHodxJIoRoruG3nb
 U075xRBivMpvnvnDxUrCjU49UYQijGJkefwNdvqrLT9SGa0fF0R/iF+pHNzP0mv1LoSo
 th3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8FTVU3LWtPn+X8DSzdXj1PWQwyL9r/ZJgzNh2Y8x2JQ=;
 b=NJrrxv/Ar3mDli881MfnGzrCCKxkeB+nzn0+wDQF7u2PxSlQ4UZlRVUYbIy9wAFtj7
 NWCgLBgYQniyHRBu+SY4mujmplXJrXpW3rOS2qC7n7KfuQJCRyxnZBLmbivDhl2uKTgw
 o6a5b9bOPNS/JYTX/BP/mZgllDKUxkz4c8/F9rLTw/3GgQiLwL/e77L/OWB2NtUrFX2p
 +QvkrBTbWb8y/wnopIEf7mjQXN2VDP9uo+QAj6QyBa4Eop95HbExzpRbLYFGt41yHNgJ
 UWp1WQLjSwD9xxhEt198w6ndiNbWeEajztbt5DWm+doFca1WsorSpD03lfTEN3ADq5nb
 u5Zg==
X-Gm-Message-State: AOAM530pDRoWYVNcFn9EgUwRngn00wGFgLY/PqKMh2nIsEC+7pmjZT07
 1OV1L4R9qxtp9MiCgdx3e1Y=
X-Google-Smtp-Source: ABdhPJxTphiaQnw5fxGiRHrAbaU/EVBReiXVAXwkfAT8d8Q6KR/qIc9IIz10+kKQ/fdVMlelOpcdVQ==
X-Received: by 2002:a17:90a:ff91:: with SMTP id
 hf17mr1430826pjb.34.1616205418820; 
 Fri, 19 Mar 2021 18:56:58 -0700 (PDT)
Received: from localhost.localdomain ([204.44.111.4])
 by smtp.gmail.com with ESMTPSA id y7sm5755904pgp.23.2021.03.19.18.56.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Mar 2021 18:56:58 -0700 (PDT)
From: dillon.minfei@gmail.com
To: alexandre.torgue@foss.st.com, rong.a.chen@intel.com, robh+dt@kernel.org,
 a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Sat, 20 Mar 2021 09:56:21 +0800
Message-Id: <1616205383-24114-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1616205383-24114-1-git-send-email-dillon.minfei@gmail.com>
References: <1616205383-24114-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v4 7/9] ARM: stm32: Add a new SOC - STM32H750
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

v4: no changes

 arch/arm/mach-stm32/board-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index 011d57b488c2..a766310d8dca 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -17,6 +17,7 @@
 	"st,stm32f746",
 	"st,stm32f769",
 	"st,stm32h743",
+	"st,stm32h750",
 	"st,stm32mp157",
 	NULL
 };
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
