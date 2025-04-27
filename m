Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FECA9E07B
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 09:44:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C417BC78F95;
	Sun, 27 Apr 2025 07:44:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6F5BC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 07:44:12 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso23519815e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745739852; x=1746344652;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKsx1Y0DBxO5LiUGbdeLz4euTGTr3L8Ie2JztiqIkG8=;
 b=nrvwUUQDGbjBKZxWCLJEPWXxIRkwrbhza1A0bdCzbqg1+Hi2O2SHjLDvdvNSFtR44n
 n2Wpx5oPXyq2e6vhr7pmgxnKBp7AT4i8wmmO6Flyz6hpdH3u8iPcRgnIJ2/9YBmkW3D6
 DTwHOe0TqTaBPVO/X25qK2n/fVf7iBktQHY88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745739852; x=1746344652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tKsx1Y0DBxO5LiUGbdeLz4euTGTr3L8Ie2JztiqIkG8=;
 b=Ge8SBKMOrsrXbAySDZvVD3iJCTWm4HiBT8nTO7q2nc8VzAPZj9oFqxtNscC7vwmuie
 pTmBpH8fjX2yGuyfmJ1VRRTmV659Q2DY6uk2sBzDyubzwKBMFu3j5P9MzBzOZ3Yvu/Gq
 T+1V7aw2z2Pva/8HS2seVCVOlJ+IAwcFmDK23KcfCy/WaW+QbQNnxIEb/p+Z/c6wzrkD
 LnJKXFhBHQDwXiCSfGZV+huFfrPG7D15ZGaJ4nlWFEF2jUxfHCEr9t3SkyR193nGR3kV
 QbMuU5mCWjMz3iduh0E8y3vroCHQRV/w5KEDuH9x7W7a6HLWlGVM/auU73CpZe0XimYl
 gwdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJyo0S0ckuWCSvMhtYjQLv5zFLdTyXG7hNm5QsByeuFEp+NYUqWqiQV2lZhsO/ktLWM5BMlIwhZli3Kg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzkqeplHWV2yxkMCmGEtVYjbeW9KE45DlooLbDNZN5imyn1WUa+
 9z/9xp2OSvYBS07wymZ2CQxwUUz48RU5IXAfOC0y+iDLidbUOK2DU04n8Ear8R8=
X-Gm-Gg: ASbGncs2HGiClPEry22WwQOQu4uQLtoV/lNR2cyuljVZ7dEEd4WoDLCKh8xEPVcvSDn
 6pu/3ueXWCz/jomv/NRQxNrhIuN9aXg69CqMikiF1G0zF8nOL0ScCtXaUac9ugE7tdIajwT7fJB
 lE+EcCmjke2FTpaXcUtkREo4ms/cHT+NRqC7BtMKcy2T2/KjV+iIbBfNoyrBk1YAEW9RK5NbdcS
 4WRDAchuFKJdsxcUz3zZfS12yzPcwA2Ki4YMrCMfM2Ilaj0mKX7VKsqmsYJu3xzlsbI/JxU8SEy
 w7kEzVWAcZiBI4yoBMp2ry8OLuoatd6/troPf3pzm61Wwjib4oJS0+zbhVrcfZo/JVyg8E4ry9C
 o2E0bhw==
X-Google-Smtp-Source: AGHT+IFCEy8x0o5oo3zFYyMXFfS94FwDsXqBWsDjwWzSNdIUrFG48zSXY2rcjCPvG2HDuHNuAL8VeQ==
X-Received: by 2002:a05:600c:1c18:b0:43d:8ea:8d7a with SMTP id
 5b1f17b1804b1-440a66abe22mr49622795e9.28.1745739852516; 
 Sun, 27 Apr 2025 00:44:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 00:44:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 27 Apr 2025 09:43:22 +0200
Message-ID: <20250427074404.3278732-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/8] ARM: stm32: add a new SoC - STM32H747
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

The STM32H747 is a dual-core MCU (Cortex-M7 running up to 480 MHz +
Cortex-M4 running up to 240 MHz) containing from 1 to 2 Mbytes of Flash
memory and 1 Mbyte of internal RAM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/mach-stm32/board-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index 5dcc4ddd1a56..e6233c8725ae 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -17,6 +17,7 @@ static const char *const stm32_compat[] __initconst = {
 	"st,stm32f746",
 	"st,stm32f769",
 	"st,stm32h743",
+	"st,stm32h747",
 	"st,stm32h750",
 	"st,stm32mp131",
 	"st,stm32mp133",
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
