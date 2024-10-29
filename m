Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E26779BBB63
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FC8AC78F71;
	Mon,  4 Nov 2024 17:18:37 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C9ECC78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:23:53 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-37d58a51fa5so503449f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233433; x=1730838233;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rm8BK0uAln/RMAZHBbXqzd3kfEXu0sK1tEB93lCjSg=;
 b=FZyfEChJgdjtO9sI/U442w9aqkFjaG3HQWhsouF+KmXwsf27SeQ6gZGHcB2IM98Re4
 jYNVFkMbE40PQN1LR8/J0x+P3iuRSM6Ch2Z+Bm6uFy+vko/H26lF6ndXI1hUcbCXj4y/
 bpCVd3G7FeAc6yMdfgpz2ik/xatxEmQPUMBSFIaQdfNYiW0hcAbHZawQwFlta9PNfCvl
 DnKwFO6cQcL5dniQ7/gz0FAPHt1wuJ7NPy2/ZbFHPeF5eRiMNqhFrC+jAvfEGz6LP663
 sk5VQ4EOcb1/3nRoKCd53QZBPWLD6EHn5N2g2pmz5YGofYuh1+ub3JN3BumYkl8n7oCK
 +LwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233433; x=1730838233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rm8BK0uAln/RMAZHBbXqzd3kfEXu0sK1tEB93lCjSg=;
 b=LTpwNejPPA5jo0XpgOPIthzfCZusE/E/TnBhGr5WB38NWiBNtg3/H74K00hZeFscXb
 w/JP4SVFC4721+v3yASMVtdL3RVuX/lGtblUbPHcMElhddON5hYtPAYcpuW1CtrEeybH
 3H6Nvn4+7NPyukguElbuYFSPT+mLmp+PGf/G2/UW0JosTmcB7vCzGqLW5Ew0KU4mFscY
 QkO2/O4Gec0Eb1HUTJGyu20HNRn+zIkxNnUR5zdRqGibCiA1xX2zDw6cPsqajjVTyDAn
 WFadNQDFH8sU81/ud/8/7jz8RDE6jJ6VZNuUbmJRdA0R+66tRxVnk2BiW/p/lg17kuMW
 h2hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3lRcGogw/LoF+H1OsgL/+QuCpJM2IlyQk+buHxefRL2PpaKho2HaHBcbNx0UK6wYxp4v0e5NCT8ZV+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz3O6QjD5zoLDAFhsyrwemDc4+43CW9cmiLVuWpb7VoK0tLzMI6
 A+WEpvkt7BmD/cga2S2lg9UFIuOI+6EF3LtU9zCnSkKRib8CI7Oj
X-Google-Smtp-Source: AGHT+IFAOSYhcWWlGhxWeEteuXlA5hTA/tp8gk7Qdph168pUN4cvZcDVaf+e059elXUz5M5LLZtYDg==
X-Received: by 2002:a5d:588a:0:b0:37d:4aa2:5ce8 with SMTP id
 ffacd0b85a97d-38061206f90mr4581741f8f.5.1730233433082; 
 Tue, 29 Oct 2024 13:23:53 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:23:52 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:27 +0000
Message-Id: <20241029202349.69442-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dinguyen@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, l.rubusch@gmail.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, s.trumtrar@pengutronix.de,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 01/23] ARM: dts: socfpga: fix typo
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

A semicolon was fallen off the wall.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 6b6e77596..7113fe5b5 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -169,8 +169,7 @@ main_gpio_db_clk: main_gpio_db_clk@74 {
 
 						main_sdmmc_clk: main_sdmmc_clk@78 {
 							#clock-cells = <0>;
-							compatible = "altr,socfpga-a10-perip-clk"
-;
+							compatible = "altr,socfpga-a10-perip-clk";
 							clocks = <&main_pll>;
 							reg = <0x78>;
 						};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
