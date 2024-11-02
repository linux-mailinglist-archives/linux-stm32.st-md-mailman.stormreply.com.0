Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 045949BBB86
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8A94C7A848;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3298CC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Nov 2024 11:41:30 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a9a1be34cc9so48143366b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Nov 2024 04:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730547689; x=1731152489;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=169hA00Pja97h8hm6emVe3dB6p5nrMbDMRco0sdU1HI=;
 b=YnoSV042vaf4DhkLW+gICAc4uccor74HyFPLXlNauf2whZCnhk4HgeUPgqlOkTnJjf
 QEkNKeMMg7txsdVNwQuvXdiH8lZ4z6OqZ9fDodrP0sIwocPBKfL9HomJTm/uaF6HZrWs
 y87IA0FiGYQsT1+Rs69WGSWLBCZ9M1NjqqTl0wKKwtdRVZ/bHJFLKzSRFoE1jMvu1cP3
 KooVgxdTSpajL4AnKOCV3s6z6tkxtQRbAeqTc/AaQNeo3CVyA6OHqQDgto2lIKKVj102
 NmIV+P66nLGtJQNSzvQylYF4a3WcMRCDRmkQfU0qTkw4eHfwAZFoNsWhuCuq3vLqBgLF
 V7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730547689; x=1731152489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=169hA00Pja97h8hm6emVe3dB6p5nrMbDMRco0sdU1HI=;
 b=mXgn1BlFZoEwlzGQWM5fCsHcU4oLCjSKpSepoTwoFzO+rg1wPQSE9++Jr+fDrov5r1
 pyrkSs5moRbAZEFuF275vg/DxS9F7ovFG7sxUHWKzNyksBReJI6PZRDGtFv7Mg4gXMir
 tJwVjOh8RAHkQwY7vLiLNrkvyE1ewMVSlput9KFGhBLUT+WoZlI4aO1oHAL+bCjMH/Yo
 FZKPjX2LkpqErFxENiIRfPYnRbhrffkGrh1cZTXavXUb6GhD9/FkR/qisINA/Fn0OY56
 VutjTinnBBWkb4btmNLxbH+o3yhfNQEWiPtjUIIqJRdQCAPd+qQqQLOAuIWJwmw6QJsq
 GEng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuDvgnEGwXFVfqBG0HuUDOLdQMIAuBEFymwGo7o+imQPk1AFaZ6+bV2YQMmKh+i3LSLDxtXbEME3LwTQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwG7+OaA2AW2QJWwXfDOtp5LSx1w1hSx7kwrOiwEdENvkBuEbwg
 +mSZO68BaYUt/qGZRibjwRCDNIOUgPtjGq93j7yiJEkvDDJaGFOP
X-Google-Smtp-Source: AGHT+IEt4AjndCEebm/9RILvfW4GXYybZJT+5m7LenNVoAJdiLHQQZg3Dh2A1hqqQqIhTQOPSDbaYQ==
X-Received: by 2002:a05:6402:34c9:b0:5ce:cfed:624 with SMTP id
 4fb4d7f45d1cf-5cecfed3330mr136549a12.0.1730547689088; 
 Sat, 02 Nov 2024 04:41:29 -0700 (PDT)
Received: from 1bb4c87f881f.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceb11a7aaasm2224918a12.83.2024.11.02.04.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 04:41:28 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	kuba@kernel.org
Date: Sat,  2 Nov 2024 11:41:21 +0000
Message-Id: <20241102114122.4631-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241102114122.4631-1-l.rubusch@gmail.com>
References: <20241102114122.4631-1-l.rubusch@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, l.rubusch@gmail.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, krzk+dt@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 1/2] net: stmmac: add support for dwmac
	3.72a
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

The dwmac 3.72a is an ip version that can be found on Intel/Altera Arria10
SoCs. Going by the hardware features "snps,multicast-filter-bins" and
"snps,perfect-filter-entries" shall be supported. Thus add a
compatibility flag, and extend coverage of the driver for the 3.72a.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c   | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index 598eff926..b9218c07e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -56,6 +56,7 @@ static const struct of_device_id dwmac_generic_match[] = {
 	{ .compatible = "snps,dwmac-3.610"},
 	{ .compatible = "snps,dwmac-3.70a"},
 	{ .compatible = "snps,dwmac-3.710"},
+	{ .compatible = "snps,dwmac-3.72a"},
 	{ .compatible = "snps,dwmac-4.00"},
 	{ .compatible = "snps,dwmac-4.10a"},
 	{ .compatible = "snps,dwmac"},
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 54797edc9..e7e2d6c20 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -522,6 +522,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	if (of_device_is_compatible(np, "st,spear600-gmac") ||
 		of_device_is_compatible(np, "snps,dwmac-3.50a") ||
 		of_device_is_compatible(np, "snps,dwmac-3.70a") ||
+		of_device_is_compatible(np, "snps,dwmac-3.72a") ||
 		of_device_is_compatible(np, "snps,dwmac")) {
 		/* Note that the max-frame-size parameter as defined in the
 		 * ePAPR v1.1 spec is defined as max-frame-size, it's
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
