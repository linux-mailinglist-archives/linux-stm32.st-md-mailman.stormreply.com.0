Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8024C9B2366
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Oct 2024 04:08:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCB96C78015;
	Mon, 28 Oct 2024 03:08:11 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FFE5C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2024 03:08:10 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-7e6cbf6cd1dso2435892a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2024 20:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730084889; x=1730689689;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kn52y9HQNLKC2nRbhsI1WecpIBp46gjHfUlvO0bwqrs=;
 b=AQTpNMvhVsgVoV+MaKPaZZlSXeF3opohHA/XKH7ro/ncpXn4vSfA9DYFTHsV0H7qd2
 qYYLn/uhnDy0Lw7WioP5YycGZ2LFbHOtE4Fb+E/I2NXSfZsDGxqJvOS2muNK+lDuAVF+
 mAp7+K3znFvyp3p4AanQm3j9fQthfxCV0mj4SApMVsUVzN9oQLvgYBIu3UXo3djg5hJF
 d1cWbburmMjoI8Hq0X/f5hvZWmF0RilNb2b0VcpuPFh8PnSBDMh6BPGQrQqJwim0BmEy
 ckfDit3fPfxfu7THPH1HNtiphanc3mDPPR2rRTCjNL7htFYzI0DVXyN3lc/Ang4l+lPY
 iRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730084889; x=1730689689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kn52y9HQNLKC2nRbhsI1WecpIBp46gjHfUlvO0bwqrs=;
 b=jHrB27yuxkZKJ450Cds/Swq1KPT4I7GXPOny8vTiD/Aq7vWM8LeK5e/qZZKIr6r0o4
 dDLjG31Ovs7ezwfRVIjFHoT3CpOgluYqadBiWWeLj15sPBG7LO4h5r6j8Bhdqv/y7fE1
 X67+v+xzKfl7fAONCJT3HuQ0y4uj5qaFsByTHr6AxKuNcOzLsgwvMQztARuIFMJgFCy4
 OSkN9XTZk4x4jdfvhR+FgrLFGT+Ft8vybi60FDqE41c52WZ0nVMdPR7k680ixaLPS75g
 Oya8yYxHaTTNbPzR0mZElrLsK0Vz2i1St4TCuGlrKmuHc/nonETFxtiIYPaq8dhiGp6F
 vssQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgoJlj2+NnHPG/mQgrYeNRc/qZWzUutxCWmz0xSz43SfaIYknAgfp2DJKZyTNVOYi6dJSSI0czsDFegw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz140JSPAGEAv9jYllcnrLu8H/txBZVdQRTMUiP08qlIxErCWlp
 0AuDyVKc+ck/9eb/oH/JYsm9o3gm98IFMzX1wh4CkJ6XbwTwS5p5
X-Google-Smtp-Source: AGHT+IFEzrmGRpALAGVKconvFr3R884KqP941Fdm7RrIlzyHNj9gSTRob3wsZU6po/99rAkn3RP7Sg==
X-Received: by 2002:a05:6a20:b58b:b0:1d9:d04:586d with SMTP id
 adf61e73a8af0-1d9a8533e06mr9963979637.38.1730084888563; 
 Sun, 27 Oct 2024 20:08:08 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-210bbf6d327sm41414155ad.67.2024.10.27.20.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 20:08:08 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 28 Oct 2024 11:07:27 +0800
Message-Id: <b6f701f7618b8dd659c0cf6e1c81e3d9cfbf131e.1730084449.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730084449.git.0x1207@gmail.com>
References: <cover.1730084449.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v5 4/6] net: stmmac: xgmac: Rename
	XGMAC_RQ to XGMAC_FPRQ
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

Synopsys XGMAC Databook defines MAC_RxQ_Ctrl1 register:
RQ: Frame Preemption Residue Queue

XGMAC_FPRQ is more readable and more consistent with GMAC4.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index efd47db05dbc..a04a79003692 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -84,7 +84,7 @@
 #define XGMAC_MCBCQEN			BIT(15)
 #define XGMAC_MCBCQ			GENMASK(11, 8)
 #define XGMAC_MCBCQ_SHIFT		8
-#define XGMAC_RQ			GENMASK(7, 4)
+#define XGMAC_FPRQ			GENMASK(7, 4)
 #define XGMAC_UPQ			GENMASK(3, 0)
 #define XGMAC_UPQ_SHIFT			0
 #define XGMAC_RXQ_CTRL2			0x000000a8
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 05a0e1a22155..ce5dc896f9d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -363,7 +363,7 @@ const struct stmmac_fpe_reg dwxgmac3_fpe_reg = {
 	.mac_fpe_reg = XGMAC_MAC_FPE_CTRL_STS,
 	.mtl_fpe_reg = XGMAC_MTL_FPE_CTRL_STS,
 	.rxq_ctrl1_reg = XGMAC_RXQ_CTRL1,
-	.fprq_mask = XGMAC_RQ,
+	.fprq_mask = XGMAC_FPRQ,
 	.int_en_reg = XGMAC_INT_EN,
 	.int_en_bit = XGMAC_FPEIE,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
