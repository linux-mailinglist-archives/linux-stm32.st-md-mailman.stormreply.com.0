Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E298A3548
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 20:04:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31434C6C859;
	Fri, 12 Apr 2024 18:04:08 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71E84C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 18:04:06 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d8863d8a6eso14511351fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 11:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712945046; x=1713549846;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cN13xKrisJWzHEEUXlM2Kj3W0urUTpSnKk1qxa6jOEk=;
 b=MW24Q0crVjclDW5kH2aFBozpDC/TDdKtOVgpLdtzmSQrJLdeHqCt9+GPk+jcp52b17
 N/SF9TyFviAevXe7CJDuQlWL1EaZWbuooqGni20nds+dxxYWaIIMTrIg2T8rZ+NyzcJI
 q9v0fcvIqp9zbBAMILlrOhvVT7frUpBxfXiihxq3zxvAN7ssPUR0Y/HiX4xGBAk8ZHNn
 6SgbzrvQG61U5NIjkwI1fAEscNAU+qAtzUAV9nGTzyb+9WQC1oXxP2tF0A17NtT3mBh/
 SgE9f1HnyhX9cwLK5hYYPW9zNFeOXm8JnpMY3CC3HOVbVB4DtWmg94aw28LaG+PEMGzS
 jEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712945046; x=1713549846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cN13xKrisJWzHEEUXlM2Kj3W0urUTpSnKk1qxa6jOEk=;
 b=BVNQX5xt2uVqR+Io464VNfsR2HQtRD9ZvCaNeBUK+Vn852Df4UPQOJZFZIFsjopraM
 wiSTvea85TIlNrX7QvHb4h+shk2zbMEtBJDSfUnEJBm7fAFVtdXvVrVAaAAA4VcnPIk/
 TzC/4L3megpITs9nWbVn5t55fQa4vTnbTtluiGKOCJaQxJdkgZtq+g8gXhaM8KyV2MzE
 V7iMjEPj3pN3WQjovvs0LLDSZShPFnTFUNad6MLugzHLG7bRcV3g6qhmfq5Ob09mlnSC
 x79sEr4VxNSDG3GcVcVO9foXZhuRCTTmEOPX/pNdpgwQg6dXa3v/hUnSg6980qGijjmD
 N7gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVevigQmm2Mp4+UzjN1vLy3s3ql/zpXphdHRvwhTKXqcPv8vecp+29LU1ueHZfow5MrShPCXX2Sd7w0kp1E3tcOoZYnrUlXDgsLeYprgEDoxAYMtnrZ8gu4
X-Gm-Message-State: AOJu0YzkAoAHhdfYoZI6J1C6+U3Sd8aWHkULgBpQ9N5Uf066bUzbhJE1
 ck57voTD9oHdAV8Jiuh92um7f+O+QD1CKIKIaXKxPEySG+VCwLyV
X-Google-Smtp-Source: AGHT+IEOHDnXn4A0X8osVWAoYeNfoKuOFh0OduIqkCo7A2A3nIvR3DQ2+Flg9QxnlP2QZA+Omg958Q==
X-Received: by 2002:a05:651c:b0b:b0:2d8:3e07:5651 with SMTP id
 b11-20020a05651c0b0b00b002d83e075651mr3195379ljr.34.1712945045603; 
 Fri, 12 Apr 2024 11:04:05 -0700 (PDT)
Received: from localhost ([95.79.241.172]) by smtp.gmail.com with ESMTPSA id
 f28-20020a05651c02dc00b002d2dfe8a36csm560225ljo.96.2024.04.12.11.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 11:04:05 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Yanteng Si <siyanteng@loongson.cn>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 "Gan, Yi Fang" <yi.fang.gan@intel.com>
Date: Fri, 12 Apr 2024 21:03:15 +0300
Message-ID: <20240412180340.7965-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240412180340.7965-1-fancer.lancer@gmail.com>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Serge Semin <fancer.lancer@gmail.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 2/4] net: stmmac: Fix max-speed being
	ignored on queue re-init
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

It's possible to have the maximum link speed being artificially limited on
the platform-specific basis. It's done either by setting up the
plat_stmmacenet_data::max_speed field or by specifying the "max-speed"
DT-property. In such cases it's required that any specific
MAC-capabilities re-initializations would take the limit into account. In
particular the link speed capabilities may change during the number of
active Tx/Rx queues re-initialization. But the currently implemented
procedure doesn't take the speed limit into account.

Fix that by calling phylink_limit_mac_speed() in the
stmmac_reinit_queues() method if the speed limitation was required in the
same way as it's done in the stmmac_phy_setup() function.

Fixes: 95201f36f395 ("net: stmmac: update MAC capabilities when tx queues are updated")
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index dd58c21b53ee..b8a1f02398ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7328,6 +7328,7 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int ret = 0, i;
+	int max_speed;
 
 	if (netif_running(dev))
 		stmmac_release(dev);
@@ -7343,6 +7344,10 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 
 	stmmac_mac_phylink_get_caps(priv);
 
+	max_speed = priv->plat->max_speed;
+	if (max_speed)
+		phylink_limit_mac_speed(&priv->phylink_config, max_speed);
+
 	stmmac_napi_add(dev);
 
 	if (netif_running(dev))
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
