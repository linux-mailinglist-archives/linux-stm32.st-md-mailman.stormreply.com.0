Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64E1E053D
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 05:41:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 757C6C36B24;
	Mon, 25 May 2020 03:41:18 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45694C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 03:41:16 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 145so8256297pfw.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2020 20:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=fkNPpMGzjaKpCW8iTYQCQix1C73P0vGeCYEgEBtczSwFoYfS6ni4XDVWMbiLhqvrO+
 YQj1kVsq45Hc7FyzZIQdm03WipH/XllIaDcseSWpV/0g8Dh5ICZ411BaDbDHMWQSa4/f
 0SZsJz3GhwaxVeJopKZG7Wr9Udxdp7O5jxlUFebkd5DVx+GUCmFSnusnoEtRoAeJoN6b
 1PPD3ek7v1TS/KhPcSh6Cd8UCWgt+Ml2QlTTMP/Zn+LAFKaiE7+6Z+D7BUwhr9wPfmmB
 v51sXUdOj/KwHwZ+bMdKThHsEWDk4MrX533ednxTMem3JkkuUJgODw6aLxV/+tjZJPAV
 3poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=STuSyGO/SfkcGFSauy0QHw5IqCNUH9D9huZMTiB2y2k=;
 b=nP++RkOYnT5Q2+mVZRUQijc/Gg3SwJc3SGNY2zqk9zKz37AXplBpmXD44OG9VYpq76
 uf2XAi5QPHB688it9hYjz6ZgYn5nP3YszxhCyrEEV1tg4tBqSz4nyRsYbCQCqpRRz01/
 CAiUhgwYmAOFnpWWpZMYKtRolX4axTMdw7rjxB0Z3q3kI2Rc7QzQbRijZvsJDc1tg1+Z
 VgczPjkLsoLsy/n70PKkeOSCawROO9L8v2zuTD4pCB/kEj0sAZeHB27Oe4T2vTOMAxil
 U5e4qVvWqFRICz3fm49aGzEST2j2AisI9iG01wt9w7dM9r+LlSCKbq2gP8kzvb1TJMhn
 bkgA==
X-Gm-Message-State: AOAM530V2wU2KJMXj6FRvNyZdCSfTZ9Ew7u906T+rifqIpEiLGObLNHY
 18EuvrOemmg5Ii+iKZ9tlqw=
X-Google-Smtp-Source: ABdhPJweb2OFp89IGu0IqbpvrgVH1AIHqBr5JqD5/OxEMbC2D64IA8gZsH2OyXyZNWnB5ONkhP2T9g==
X-Received: by 2002:a62:1407:: with SMTP id 7mr15471826pfu.103.1590378074875; 
 Sun, 24 May 2020 20:41:14 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id 7sm11981695pfc.203.2020.05.24.20.41.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:41:14 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org
Date: Mon, 25 May 2020 11:40:55 +0800
Message-Id: <1590378062-7965-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
References: <broonie@kernel.org>
 <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/8] ARM: dts: stm32: Add dma config for
	spi5
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

Enable spi5's dma configuration. for graphics data output to
ilitek ili9341 panel via mipi dbi interface

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index d777069..5820b11 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -660,6 +660,9 @@
 			reg = <0x40015000 0x400>;
 			interrupts = <85>;
 			clocks = <&rcc 0 STM32F4_APB2_CLOCK(SPI5)>;
+			dmas = <&dma2 3 2 0x400 0x0>,
+				<&dma2 4 2 0x400 0x0>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
