Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580F1E3A51
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 09:27:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D33F4C36B21;
	Wed, 27 May 2020 07:27:48 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64279C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 07:27:47 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id x11so8830458plv.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UETiT/+hv4pHR/FxQpN8ElBZpgtWRVFOPMtYdets/m0=;
 b=adRZeb9Lm9Mw5bBmtIfv6dbOePFDu2sMfBHHzfZKYcv8RFY4FDsx76Z2h7qVYFEcFA
 SiAtTZRpKiu6ZGk28yBVC+DlKWd/LxQaSRsvi1xHYD+8SldaaJZSs3WvbxZpflRB0qJ/
 K1psQWI9snmWeyfED0jbFki2a2fiRcYvv8DPDMY2QdjMmij/oQmu7PB8aXeHhCbsto+W
 5BBXh/bQMYCLbQHkrl4NdUaBr+/5rI+/dkc2oxIch/OhpNYLJoF4GzDi5/UtkfDwYSdQ
 LZHeiRvVNBWyAszvLuEfCkcnjKxTn767Co+SsHu0pNEh4sS1CsjP7Ydsad+v7/0w7nhs
 P6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UETiT/+hv4pHR/FxQpN8ElBZpgtWRVFOPMtYdets/m0=;
 b=T52mX9+bEbRi5VN+W1uMcTp4GxIrMTE4KQqDVxPcg3TMAk0e/wSd/j4Pt1a0uHr0Us
 v4MgbZGtYXM+M+A2+E8rj5foUDrYv2er2FM0EGr38LKQmnDeMi6wMDlyzh4hMBWrxh9P
 0J8lG9Ux6YI1Y3PvFRnXRUqFV6cGqJ0PgFJeSDC8QAiMpC7knu0eIbiaSXzpwV0v6Kg5
 9tCS/0wWIa02ipdn+vDUhpK+l9d+ze8lrzuF4CwYLZ/mQpXhV2Tpb2TNm4KihIbfwO4R
 IKsm5cDkhNRURFjG83HlmuykKW+xGPMg4qWje3mU+7/OsObHOIuTIpdcKH/OQTN8ezG0
 niqw==
X-Gm-Message-State: AOAM530dZCuEmS5T/4O+oCxJuXYNeGzBP91iJh2BjbgK4vYnmkBkFUjm
 vnDatoc3KkRpvOCqhFGq4E0=
X-Google-Smtp-Source: ABdhPJz5gbkJ79n4grpbJ62IF8L3aiqo8pVw26w3l2Nkc2Ney24Q3/bI3BZNPFN2Svinwt0qeTx7Ag==
X-Received: by 2002:a17:90a:a017:: with SMTP id
 q23mr3572709pjp.4.1590564465807; 
 Wed, 27 May 2020 00:27:45 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.27.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:27:45 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Date: Wed, 27 May 2020 15:27:25 +0800
Message-Id: <1590564453-24499-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 1/9] ARM: dts: stm32: Add dma config for
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
index d7770699feb5..5820b11e7365 100644
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
