Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA759BBB6E
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 294D1C78F89;
	Mon,  4 Nov 2024 17:18:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC595C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:11 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-37d5231f71cso685512f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233451; x=1730838251;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mg56kOzcgZYyfjxOgtlPIecLk2wzzp7fMeuBDM37L6g=;
 b=HVMYov73vQ4Mn8r4tFq705HG4YAFU2rrd/WRTfK+hN1awuFX9VOzPXa4cv1XlV2m2p
 cWjz3ILdQLDnBj5kmJcXa2JD4CQ9NF621A2948YFg4buJQy+i4BH/w3BJ2iSvQvHGSx7
 Xk1VFQUPnpYmDCX0nH4oQ6sorjpB0C28skgfaygkAOx8oI12I1nIv66kezMk2JKi0hwx
 d1fSGiNF9NJX+5My0apOxnYSek6BIh3PSmMSkm1VUyfNVKZMrCCtJtu396LLka/Uc++m
 xLI8OSOiUuiAsQFKazpeHKjvR3br6ZGrMHC0yRQhQUQxwji7/M7H3SS32aLjwJlRZelw
 ZFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233451; x=1730838251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mg56kOzcgZYyfjxOgtlPIecLk2wzzp7fMeuBDM37L6g=;
 b=JuwNv57ZlGlvPwQNEYYwYBXywhy8ej4BCQS7O2stJvaBx1y3KkOIK36IKDyzcCiis/
 Sp8JOsQ0W19JC35w2jA3bB0M6v7IHIdFfZQvVJw46bmte+Qd/+y8USfqKKF+TvKpUJDB
 FOcOAgQyPUtyCzIsW8tDaSPcCEQ9Xqf4e28n9aK1AXwxIy985rxIgGq+1d6efDOha9AI
 aeEvLtGh0HCbKMAwNt/iCTBdljI0Eqlq2jnbfBRcuRtBnfA071wtV6vA4odPjs857dK3
 bcncVAp9tF0pjR5UjvL8FgAc8dMwAfaV4l8UwjKvJND32SN8rTjaIklWcf3+d5CY4Lgo
 FUTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOBUGiqmQI5jqjKZw8OnRZ4QErbuKBHC8e4Ktug0Pae9JfD/aDWrF3J6CfqujyJtqdLh64BMkirCA6XA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwE9A33wFMyTp28Ilxm3/CkKo1CtSaDrmH3B4UjQqcED/n08OAO
 38Ct/m80xbQ99iCqmx+Fadk8be3ZhckGxPhehfwUpbryWtCERnSj
X-Google-Smtp-Source: AGHT+IE2SE7Pl9hETa2QNaY4l2Zh1J8tx94HJ1BeI0oGFH/nw6C1/hbm9Btnw9C+KXluDRBZKD/PmQ==
X-Received: by 2002:a05:600c:511b:b0:431:558c:d9e9 with SMTP id
 5b1f17b1804b1-4319ad24126mr50500815e9.5.1730233451009; 
 Tue, 29 Oct 2024 13:24:11 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:10 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:37 +0000
Message-Id: <20241029202349.69442-12-l.rubusch@gmail.com>
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
Subject: [Linux-stm32] [PATCH v4 11/23] net: stmmac: add support for dwmac
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
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
