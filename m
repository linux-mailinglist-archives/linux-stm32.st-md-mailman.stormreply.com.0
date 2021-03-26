Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E36D034A63C
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 12:15:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A969CC58D5E;
	Fri, 26 Mar 2021 11:15:37 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5A57C58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 11:15:33 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id ha17so2409227pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 04:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5k4LK0I779i125dqLNMdZVaDSPCul1nXlVCzLiWx3OY=;
 b=mSql5w0CLSZnU5mD6lil6aD/NIEUDLGO2y24MmPkZo0MVPGHSVz5Q9+Ido++F74gqD
 YnKrRpJsfL4WXR9nL5FCVIV7sRhHFskLJ/SfwtBkgDJcoA/lxPenybRp39i9EjmpVnm3
 Wfl7RnKo2En+6/vUjUmGbtDvOpcg9vcJ5MDERQ+eIzJIcz6BihqtHRzcnqWuuRBnezTF
 ceHCzv6ZDsLa0vqgxEzS5OwNCjazNyyOWeerq1plhmTK5IwEgU8rqG3hyUfgGL4t8JI1
 ZhS7Qi+OeRKqXQ+juZT8TMaPZlcO0wX26tw54cg0FaMpVOiPYnIZxewMW88gf22x+bVA
 LQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5k4LK0I779i125dqLNMdZVaDSPCul1nXlVCzLiWx3OY=;
 b=XP98xxgXPPXGL3nAuTeRepfKYtQNSJRAYSJ/5iPCC9fS2TtrBmcQPMCAm8NMA62Nzd
 a3XFufP5KkJFXZ1nCY3DqoSoTJF6K6hbV+L4ZXRv0dFAp+UsJHwAOXqkqSPzp7gSkFxI
 Hi1CBZjKB9CYBbk3U1a9vCOlAfkZ0jy4gg3YD4oOjN9Ns/qibJFSvmXPSGc16Mrgii10
 ki3S3YZz1zoaFETKkhIc0e6Q2Vx33OkEOEca+TF/cdfaSWO0wasDu2/BN0N+kkJDyGq9
 uo7TgjKzK7zE6lmZqVvqwF8k3ZrDHUK5D2z4gT4UlfMLmwH041jMwFCq9JvXw1ybZH+o
 z7iw==
X-Gm-Message-State: AOAM530OygmiqPddPJlT07TJbOtFCDApURAZOaWQmEx4cpNU0WO7LO2U
 e+A/8EEqpercGQCNofUvg+w=
X-Google-Smtp-Source: ABdhPJwhvZ3EnfuZurA9F+HEFqVEOtBWHOterQqdMDBaDF+RggY+HEjblwBMwUmgjopNGp7vt/ULnA==
X-Received: by 2002:a17:90a:3ec3:: with SMTP id
 k61mr12950361pjc.125.1616757332479; 
 Fri, 26 Mar 2021 04:15:32 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l3sm8108414pfc.81.2021.03.26.04.15.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 04:15:32 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com, erwan.leray@st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Fri, 26 Mar 2021 19:15:00 +0800
Message-Id: <1616757302-7889-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616757302-7889-1-git-send-email-dillon.minfei@gmail.com>
References: <1616757302-7889-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v6 7/9] ARM: stm32: Add a new SOC - STM32H750
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

v6: no changes

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
