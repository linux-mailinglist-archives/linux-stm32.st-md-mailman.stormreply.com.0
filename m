Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4234D7B5D
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 08:13:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BEC9C628AB;
	Mon, 14 Mar 2022 07:13:36 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D5A1C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 01:27:04 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id 85so11614748qkm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Mar 2022 18:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DH4p6xL9ZALjUBJZZxpIP/BlhTX9TFFyaunISoFtdWs=;
 b=mo4gcsynOk+f0EnaMFXzZexIo8pFqbMWvElk5v1wYqQeoEJXmY6KjRk+GKFQcNuNgV
 6cvPTyq3Loa2l/eu0spwxavOzBy2ARH+2Hv90Hal3g55y4qVADLxL8YYiNF9y6LJrWU8
 0iMXlDhfb7PbUFVnyW0CEORvWjkuN0sum9IoeoBH6Innp4veaMKmopijBgvw5DF89rAN
 9GOP97gbT6SiYqxzVNLJrNQbhBoy//lYOW6kaATPhLrMpGTaZH/VtQKZNbQMRz3fQmrD
 8po7RwaXSzR5f0s6Gg01A/kbEI6JQ/BLHmTiqNfYMzrhK9++fmXTWtpR/PR8Njt6u4Qb
 tQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DH4p6xL9ZALjUBJZZxpIP/BlhTX9TFFyaunISoFtdWs=;
 b=UwhxXGAoDpJZjNgG/+uDR/Ea3hxMr+fL1cPfsuuxrDgCclELYK1pQ/NAumNXFif0jp
 K0M6au3t04tTUbkerlddCZjVm8AFf/+gwwvGLtiBtsbrN09PuDKblRRROonLkL+YOAFg
 Sa6Xvl76O6Rg1lWNGlfXMVAuxHE/3KjRRVTc2uwHrcT8/jqffcG0wWbUDFyNhuu2/yDm
 ggHXZGlqS38fOB9Hcho6aMQ5w59qsPNo7NG6qzhohOsjvpQuB3wj2IIqfln+FuC3Nk4X
 x7pySYTGtbmagsJR+QYXcM7m5sf2EwFN6CvMmPF+EAHJNa8Y5cPrJ8bG1vDpE+i+T7XO
 G8ug==
X-Gm-Message-State: AOAM530wUybQXpjkyjjeKFRVAx0fcnDQQGNZE3/MrUgrB5uOhYMBAZMI
 KR/SXLjRvPHq16ZBBymdUR4=
X-Google-Smtp-Source: ABdhPJyNZzJlg6mRYYuIEx44zMB5qnJerrmZw61OHd3kYu5Den3pc2HPFMeGQtgdFEMvkVoY3e0MDw==
X-Received: by 2002:a05:620a:16c5:b0:67d:47db:8b50 with SMTP id
 a5-20020a05620a16c500b0067d47db8b50mr13410968qkn.77.1647221222965; 
 Sun, 13 Mar 2022 18:27:02 -0700 (PDT)
Received: from grrm.lan
 (bras-base-mtrlpq4809w-grc-17-70-53-205-21.dsl.bell.ca. [70.53.205.21])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a05620a03cc00b0067d370e414esm7021467qkm.15.2022.03.13.18.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 18:27:02 -0700 (PDT)
From: Yannick Brosseau <yannick.brosseau@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 13 Mar 2022 21:26:33 -0400
Message-Id: <20220314012634.1176231-1-yannick.brosseau@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:13:35 +0000
Cc: Yannick Brosseau <yannick.brosseau@gmail.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] clk: stm32: Fix typo in comment
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

s/Documentatoin/Documentation/ in path to the doc file

Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
---
 include/dt-bindings/clock/stm32fx-clock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
index 1cc89c548578..e1ee08055a65 100644
--- a/include/dt-bindings/clock/stm32fx-clock.h
+++ b/include/dt-bindings/clock/stm32fx-clock.h
@@ -10,7 +10,7 @@
  * List of clocks wich are not derived from system clock (SYSCLOCK)
  *
  * The index of these clocks is the secondary index of DT bindings
- * (see Documentatoin/devicetree/bindings/clock/st,stm32-rcc.txt)
+ * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt)
  *
  * e.g:
 	<assigned-clocks = <&rcc 1 CLK_LSE>;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
