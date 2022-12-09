Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C57649F1E
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Dec 2022 13:51:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8B3EC69047;
	Mon, 12 Dec 2022 12:51:20 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8890DC65E4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Dec 2022 21:54:20 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id c15so4706070qtw.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Dec 2022 13:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FtMrmlc95PnCcPVYPyv6AphCDyoFhdBGfMeU1wU5s+s=;
 b=dnPGm+Ea6IJzbYga/myO6yYgHn0eOdbGEIM4N0FIXXIKzApv8en5HLVSziFmlqe5oy
 xNmzQAxW83hQ10+srOm/83LgF0a1KiWagRfyCSNMTzTW+RSj0QfowpqSgYOyS1Obk+mM
 1+9buMHZE1n+k+XCUbCf2holRLYGfGLZsl7jxPLKUi8GVtg2OCZDn4Y3KbKN3Y1zroBg
 yhLHIg55cDs7zQ120c7WTKI3jaVfhciCTZNfPlJZnfMernXFwerbeOI2Fg7wVOpE6uWx
 UhQ600Ii8hzrRwVgvsVHTHlKnVvLdkmaX5rbt4dkrFrIGWwCEsg2/F75X8l5s56zeWaw
 ydkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FtMrmlc95PnCcPVYPyv6AphCDyoFhdBGfMeU1wU5s+s=;
 b=SooM4d/Ktqh4c8snnGO4xzvb/BZfufLqoEfVuwyXf6racuf3kyHULpc8LjHrRnUXV7
 WtrD7ynpBjVQOpZFOBcYuSWxohlwuBqwFL2lL9S/9+MwFmVhrTAeDtltxAd2TAfw0spc
 Njl4dn8kQo10LbeC1w566jp7smRYBH9L760b7BX2PcFZiaoZNPpSJkbCjPHWWLrkKLHV
 UF8XQ3A7o11Cnbomg7QFi+TD1FNEzq6wvgAQWoN8ZMmGC8PAD2QFiLQSM7fEkarvTjab
 NGyJ6VvU5Gs/LL6AtOzpXAZTMC7giNGR3QjLF4R9xm4P9WQrmyFzJp/Ysuf2URf9OjoQ
 HZoQ==
X-Gm-Message-State: ANoB5pmt72uPlknasSmPFOeKgjnVf6nbRaBs1XDSZBR8u/HveN1TQz1H
 OzW/ajb8ttd1+CKwhe8L0bnuaj633x9A5Q==
X-Google-Smtp-Source: AA0mqf5yU1rF1S/0Ku2uEBfm3PaqSjKArEAu/l8197FIy40qUKmMLAMi4jAE6ymNd0Kmmm/MAJ6aHA==
X-Received: by 2002:a05:622a:488c:b0:3a7:ed31:a618 with SMTP id
 fc12-20020a05622a488c00b003a7ed31a618mr11349946qtb.7.1670622859382; 
 Fri, 09 Dec 2022 13:54:19 -0800 (PST)
Received: from Dell-Inspiron-15.. ([2601:18c:8380:74b0:e8e5:f40c:d741:8f07])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05620a057000b006fee9a70343sm712718qkp.14.2022.12.09.13.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 13:54:18 -0800 (PST)
From: Ben Wolsieffer <benwolsieffer@gmail.com>
To: linux-stm32@st-md-mailman.stormreply.com
Date: Fri,  9 Dec 2022 16:48:13 -0500
Message-Id: <20221209214824.3444954-3-benwolsieffer@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209214824.3444954-1-benwolsieffer@gmail.com>
References: <20221209214824.3444954-1-benwolsieffer@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 Dec 2022 12:51:19 +0000
Cc: Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Ben Wolsieffer <benwolsieffer@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND 2/2] ARM: v7m: support undefined
	instruction hooks
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

Call the common ARM undefined instruction handler, which handles running
hooks to enable ptrace breakpoints and other features.

Signed-off-by: Ben Wolsieffer <benwolsieffer@gmail.com>
---
 arch/arm/include/asm/traps.h | 2 ++
 arch/arm/kernel/traps-v7m.c  | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/traps.h b/arch/arm/include/asm/traps.h
index 987fefb0a4db..e4253f4a86e1 100644
--- a/arch/arm/include/asm/traps.h
+++ b/arch/arm/include/asm/traps.h
@@ -19,6 +19,8 @@ struct undef_hook {
 void register_undef_hook(struct undef_hook *hook);
 void unregister_undef_hook(struct undef_hook *hook);
 
+void do_undefinstr(struct pt_regs *regs);
+
 static inline int __in_irqentry_text(unsigned long ptr)
 {
 	extern char __irqentry_text_start[];
diff --git a/arch/arm/kernel/traps-v7m.c b/arch/arm/kernel/traps-v7m.c
index 5fd9943448e9..b324499e1010 100644
--- a/arch/arm/kernel/traps-v7m.c
+++ b/arch/arm/kernel/traps-v7m.c
@@ -20,6 +20,7 @@
 #include <asm/linkage.h>
 #include <asm/ptrace.h>
 #include <asm/system_misc.h>
+#include <asm/traps.h>
 #include <asm/v7m.h>
 
 enum fault {
@@ -49,7 +50,6 @@ static const struct exception exceptions[] = {
 	{"no coprocessor",			FAULT_USAGEFAULT,	V7M_SCB_CFSR_NOCP,		SIGILL,		ILL_COPROC,	UDBG_UNDEFINED},
 	{"return to invalid PC",		FAULT_USAGEFAULT,	V7M_SCB_CFSR_INVPC,		SIGSEGV,	SEGV_MAPERR,	UDBG_SEGV},
 	{"invalid ISA state",			FAULT_USAGEFAULT,	V7M_SCB_CFSR_INVSTATE,		SIGSEGV,	SEGV_MAPERR,	UDBG_SEGV},
-	{"undefined instruction",		FAULT_USAGEFAULT,	V7M_SCB_CFSR_UNDEFINSTR,	SIGILL,		ILL_ILLOPC,	UDBG_UNDEFINED},
 	{"floating point state error",		FAULT_BUSFAULT,		V7M_SCB_CFSR_LSPERR,		SIGBUS,		BUS_ADRERR,	UDBG_BUS},
 	{"exception stack push error",		FAULT_BUSFAULT,		V7M_SCB_CFSR_STKERR,		SIGBUS,		BUS_ADRERR,	UDBG_BUS},
 	{"exception stack pop error",		FAULT_BUSFAULT,		V7M_SCB_CFSR_UNSTKERR,		SIGBUS,		BUS_ADRERR,	UDBG_BUS},
@@ -95,6 +95,12 @@ static void traps_v7m_common(struct pt_regs *regs, int fault)
 	writel(hstatus, BASEADDR_V7M_SCB + V7M_SCB_HFSR);
 	writel(cstatus, BASEADDR_V7M_SCB + V7M_SCB_CFSR);
 
+	if (fault == FAULT_USAGEFAULT && cstatus & V7M_SCB_CFSR_UNDEFINSTR) {
+		/* Handle undefined instruction hooks */
+		do_undefinstr(regs);
+		return;
+	}
+
 	for (i = 0; exceptions[i].name != NULL; ++i) {
 		if (fault != exceptions[i].fault)
 			continue;
-- 
2.38.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
