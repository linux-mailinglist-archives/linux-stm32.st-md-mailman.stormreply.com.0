Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C94263488E6
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 07:19:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9150FC57B5F;
	Thu, 25 Mar 2021 06:19:52 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25D1AC57B5E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 06:19:51 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id f10so755416pgl.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 23:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X8oRWWuPlCAw0yNFLdz89qGD/soNoAofvNQ+OkW3A5s=;
 b=SWPqxDvQ3eNKCCSXGcrmuHHK0VJUnRUCBt9MfO+97gkk/nmowld9MWuhIztHD8d88b
 hsTWhkTddKAj6/OEgESo0qpwkrknR7nFZndH2/SVbkqDzPYEJaiCRoqUPEjx8BL5l2GC
 wNp/eu5+KNrvfjHCKXnBG5yFlYad/CtR5Pdv1QmdnRD+c5PASswz/6Te+EvjsXcU+zSY
 aKip2Leie1GV3LS5kraQN7b94ahqjQVVtefoJr6W03EV82KiwV7ptrMGOUw/69PALao1
 5EfhbTzMX/wXF4LEJMff9nSif9J6U1Yq2XyZaPmDar8Ei3HxNGwLFBClOAKT+qT2YLbu
 bEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X8oRWWuPlCAw0yNFLdz89qGD/soNoAofvNQ+OkW3A5s=;
 b=GllyaRfLNyzIBikZ0x/ZSiEcadIYCeeicw0YXtPDIl9/gDejOMozgv4FxLAdRMVTRC
 dDECPiBtR+EUOZCTIiTSwhs4QN3YR4UWzMGQPjElT7o0fu/ekfChOOBZAywX/HX1HzJ0
 9GoUfHjUT9qk/ib/3/2Wrp6Zg0qlTFv3bR/bVaESUCaLJTRzUyW7P3XnIMPWjLLvDB9E
 wB9nwv1SuJ/SyziAQ/+dDh4UptOuPirpLMYSRMGwlsyOr9tZdlcdnQJzkd/RfEDq6sP9
 z/MrYsK8aBAsD1tZ2SLwmF6yN1nD+gM8X/dsC5q8u9Rs6VTKfYpv7AeYfwooe4WoxWfU
 6GqQ==
X-Gm-Message-State: AOAM533f4Gx1mR6DMip0NlTVmHmOVHI9Z7B5ztOcMkVCsQPNGDaxgak/
 EltaLEkYxL0Uj7ZXrK+ws1U=
X-Google-Smtp-Source: ABdhPJzvIiGb+AchLmsneF41VvHj51SYIXzqCKG/aa1VPiwzvdJk4BB0Vx6Defk8BpoMpfkn0hhb2A==
X-Received: by 2002:a17:902:b20c:b029:e6:cef9:6498 with SMTP id
 t12-20020a170902b20cb02900e6cef96498mr7771027plr.56.1616653189761; 
 Wed, 24 Mar 2021 23:19:49 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id b19sm4393086pfo.7.2021.03.24.23.19.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 23:19:49 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com, erwan.leray@st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Thu, 25 Mar 2021 14:19:20 +0800
Message-Id: <1616653162-19954-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
References: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v5 7/9] ARM: stm32: Add a new SOC - STM32H750
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

v5: no changes

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
