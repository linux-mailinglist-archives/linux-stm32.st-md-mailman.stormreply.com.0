Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E033AF08
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 10:45:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B1F1C57B5A;
	Mon, 15 Mar 2021 09:45:23 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A732C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 09:45:22 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id q5so7473994pgk.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 02:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vc/r1SZf2IZ7nV1bAr2irLNTXEi+St+bipRP8ivkBr0=;
 b=mAwko/Z2vttz/Z6QGP81Nm9mRMZycCrh0cJU/W1l/tMAvyHH6f8BBYq5Vn8O4/Wmbt
 6m0FyMXpe23+7h2gHSfMpGvs5F/sDDxr8LPXh3gyFZUJ4wYT0/iDKEbYL9IlSHs4eDfK
 5NbRlrt5SWhxIRRzb31cUIYHgA17f3wiLDeqiUp0gsnKTDnpErDDLH0gTlXB3Oc3EMob
 L9aQrtGuFkT4ChJouVsk7JXTleFUoKjWofxCewTknChsU6NWl4mVDCTK+jsRr3fBHme5
 XeMgIBFGxlWot1gDkj5FwXVPBs/u2BrM9KWEKzkgZAvsOyDpjVQ1rJ/YDnAIWG4f1KgI
 LU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vc/r1SZf2IZ7nV1bAr2irLNTXEi+St+bipRP8ivkBr0=;
 b=DprH7n/ieEq6kve668HZ+pDkI7ZfLZPTVOdjOSgC652iScg2D50JakTn05aZ8fkrHP
 5DS1jxTlAZTGzXK1kumtxrT1wtP4/N8MmKI8JXoFGwQLpzPjOmdUWtX8ILQYnGWcMUaY
 FT45PmMYOYNoxj1IPxOlGZTLJcxuQG3TFYDnBOIsLMx1cBpaog4wQ8lomWYsoHFmB6vR
 wROwqfDBfQzfdD6OBCVKt932xSHvybxBtrZ4+jNtObpwejhob0oTgv6Os/VIKZE31C6x
 E6T4JsjFcwzrDb//vKdhIbPiOsWpIis1rBsQOKKEvQb+XnEOi5JlgPQgTSLG/51z0Npd
 WVFQ==
X-Gm-Message-State: AOAM531NAcjUR3XCjN6bHLYKELrpY3MvzOfNf4+qnUAgQwWP2ScnpJLQ
 5wHDbP+98y2PDqfzuYXPc+8=
X-Google-Smtp-Source: ABdhPJwnxFoUd14+ss2MjGW9SbdJHcFT0w85HPSLEIKgurPZyn3MyEfV5upYi00EnPgwQ7Ehb2sMwg==
X-Received: by 2002:a63:c4c:: with SMTP id 12mr14612152pgm.320.1615801520863; 
 Mon, 15 Mar 2021 02:45:20 -0700 (PDT)
Received: from localhost.localdomain ([120.245.122.54])
 by smtp.gmail.com with ESMTPSA id 14sm12780811pfy.55.2021.03.15.02.45.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:45:20 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@st.com, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org
Date: Mon, 15 Mar 2021 17:43:54 +0800
Message-Id: <1615801436-3016-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v3 7/9] ARM: stm32: Add a new SOC - STM32H750
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
