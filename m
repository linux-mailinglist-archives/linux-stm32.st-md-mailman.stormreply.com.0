Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9576334FB8A
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 10:29:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C2D2C57B5E;
	Wed, 31 Mar 2021 08:29:24 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D366C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 08:29:23 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id f17so7522771plr.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 01:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tMbHlMOQBksugwXBraiPexKO3Alo10XSX/pY8DpNjzc=;
 b=O9WJJ3ruoiqLzVNW7uPCFBfMEyso1s+K1/uMHnwhvj2kc016TSYf1hD/xl406Q6GQZ
 mKz2bWnbJkIhNir8G7jFBYAVrPS2ZDlVKcsIZbbp1nWwm7hQdC61BOmBp+I68kVUWI0x
 G6dTVBjCpB995gEgLY2+eTtMCb7ZJ7svX+mIiaetO+3qStIoK1sY6o27WEo4/pN86/Ng
 R4HdqRJY5Nw7LrJnc0nuyiSI/y0GupNdNZ82so1ACQ5MSGQa0XL6qs1EMYd5gVO2RaYT
 8Nf232Q4XxManJB/za08xAENqjHeJVzktwe5JaULRwW3h4HOOL59vqWbqR61BwxAkS2z
 0PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tMbHlMOQBksugwXBraiPexKO3Alo10XSX/pY8DpNjzc=;
 b=r2ruoCBQg8kv88hb56LPBaBnwPcjt89k42B0F4Vef1jZ3T5R2J981jk4YgoXv5ISCH
 TardLkrJJK0lGqs71AGIuVX3UN8cm+cUG5/yEYRYcDfk7RRypLAJHhlokL9vIj/BfbL2
 gMhOprg0BtwTvgEd/O6CzpqcwWDgBCIlrTECnvcYQB7jwlIm8xv0rqwyXhSTmi0ekGjK
 RdGQRWkAkACn3FBdeGq4R/Ik92Wp38et6jShevuy4CI4WPULbhmwOOqHJFAnNtIed6ft
 iQIQwCWN37aKlXx7M70hcScl9lvA6iS2SIlQSdathrsXsxRlmInzIGZE06FWVGvP2IqJ
 Vp3A==
X-Gm-Message-State: AOAM5308InMGMlQ48FEL90MTDwLeI1L+y9WtUSi7sXcCb0tS3Jgmzazv
 n68QDQIkLUMDGzdO3BlZFII=
X-Google-Smtp-Source: ABdhPJwPtt7oyAheZL9ldgtU5oBOVHSeZHN7Uv0gqCjbJJ6ZtWHCMvSvPYH+wC+K6bEGkWHGVN41Fw==
X-Received: by 2002:a17:90a:e64a:: with SMTP id
 ep10mr2463653pjb.105.1617179361933; 
 Wed, 31 Mar 2021 01:29:21 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id v1sm1420991pjt.1.2021.03.31.01.29.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Mar 2021 01:29:21 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, pali@kernel.org, mchehab+huawei@kernel.org,
 andrew@lunn.ch
Date: Wed, 31 Mar 2021 16:28:44 +0800
Message-Id: <1617179325-6383-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617179325-6383-1-git-send-email-dillon.minfei@gmail.com>
References: <1617179325-6383-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v9 5/6] ARM: stm32: Add a new SOC - STM32H750
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
v9: no changes

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
