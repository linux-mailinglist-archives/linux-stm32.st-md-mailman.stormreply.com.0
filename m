Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11232B5D5
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 09:05:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C69BBC57B72;
	Wed,  3 Mar 2021 08:05:28 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64DB5C57B71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 08:05:27 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id t29so15694539pfg.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 00:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OkO4sPesb67a4Xc+NzgJGhYGkM0gLKx9VTeWnyCxw08=;
 b=t1wSFc3pRt6x4Dk83aDZFNEHm7OzrtTRlVPD3Jq3GD8O7BS16lMjBJD/6GOouKfl/D
 oVnRukngWEvhAH3VZH1x/C5UgfimvsiwqwFihvpzCz+vO29moeHTXBvJVWNciTHepFaK
 nunuTwLdJK+EUlZhOl00JMRs8fNoRtdqKJz5O+MOdiPkjLi2LhHt7i4JTzSAYjtRlbCT
 tpWkdm8gyQTQ3Ii2JO7/4YjU7f0bUpuiSSkpXjIgcyWMkodun1VwbKTSHSz62WbrBUoK
 SpobWKx0wj6t4jlnLeATeQ6mVqM9D0A1NRMrrloY2R9P2OA/YHhGxffHTwt7RHe3HSUF
 z9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OkO4sPesb67a4Xc+NzgJGhYGkM0gLKx9VTeWnyCxw08=;
 b=RYK/umK09Lox8MxQSR1AeEE9J/xGbFVCgHM+LUAqOPxrS9LZOsJ3NKkjfWRT4b+HxR
 yyKLYPjPwjtrul5DR50RKgWtbg6Zle1/H+pGbEOyMr4T9mnR4JR1A9+B2lCGArF8sSul
 N9yDIOaZCK0w5XHHv7gsWZHcRsL2L9ryb5+2aWcqjDy8LG69U96KJsqw3Sp5v7SHWdBA
 zbNs0u3dl5Ov77ooBPj+3zjn+Kpfx5r/3SLzOHlVmXNQWiMCu5RIj9Wa7h3MLP+R02BF
 QoMag2EGc82V+cLJ1AD/XBh5WZTxDz92gF1GBawQN4LNsh0fI+SXD/4hfDVd18Js4dur
 VB9Q==
X-Gm-Message-State: AOAM531oh8cRlVZpDR5m2FMkoVdcDP4MYMCQH8WdPMnY0++oQFRmRiw7
 dIIE8TM6rx/h9tAJjO/kg4E=
X-Google-Smtp-Source: ABdhPJyf71nlJOfyEEHvdDqtGzsYD3u82366/KdOqD3tkSHDPb7h349QjuPxaUgNYnp2oTLjAv2nKQ==
X-Received: by 2002:a62:5ec5:0:b029:1ee:186e:121c with SMTP id
 s188-20020a625ec50000b02901ee186e121cmr7023016pfb.54.1614758726010; 
 Wed, 03 Mar 2021 00:05:26 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm22260887pfv.84.2021.03.03.00.05.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 00:05:25 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Wed,  3 Mar 2021 16:05:10 +0800
Message-Id: <1614758717-18223-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH 1/8] ARM: ARMv7-M: Fix register restore
	corrupt after svc call
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

For some case, kernel not boot by u-boot(single thread),
but by rtos , as most rtos use pendsv to do context switch.

So, we need add an lr check after svc call, to find out should
use psp or msp. else register restore after svc call might be
corrupted.

Fixes: b70cd406d7fe ("ARM: 8671/1: V7M: Preserve registers across switch from Thread to Handler mode")
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/mm/proc-v7m.S | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
index 84459c1d31b8..c93d2757312d 100644
--- a/arch/arm/mm/proc-v7m.S
+++ b/arch/arm/mm/proc-v7m.S
@@ -137,7 +137,10 @@ __v7m_setup_cont:
 1:	cpsid	i
 	/* Calculate exc_ret */
 	orr	r10, lr, #EXC_RET_THREADMODE_PROCESSSTACK
-	ldmia	sp, {r0-r3, r12}
+	tst	lr, #EXC_RET_STACK_MASK
+	mrsne	r4, psp
+	moveq	r4, sp
+	ldmia	r4!, {r0-r3, r12}
 	str	r5, [r12, #11 * 4]	@ restore the original SVC vector entry
 	mov	lr, r6			@ restore LR
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
