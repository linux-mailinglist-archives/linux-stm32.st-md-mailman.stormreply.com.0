Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A3B942C43
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2024 12:44:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FEB7C6DD96;
	Wed, 31 Jul 2024 10:44:31 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9291C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 10:44:29 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-70eb0ae23e4so3970045b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 03:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722422668; x=1723027468;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DPGHY6v5CIr+Eb9z9smFgMyzujoybq7sK/FaJAiXSc0=;
 b=Uans5yHxI3pTIsC9PD6uDvmkaFYs0wTxP8FB6ih4d9aUQiH4qaiVQ2cWeDoJLdK238
 YVjrkbMsqJn9aDc/sVlcVJa1Lqk+9D96Hgk563s9zwI3Qlb5DAal7Qaw4eLDRsT9jmvm
 gvjhOSZ3NU9FAz4IIKNtJ77wRxSMAsIdSrz/kkHhg99nuU+jnlHVFHgyzfpxYB88BW3F
 7/qbkIaBbKTViKcKKA/PcLewcFudgCpBUzz+2XSU6QPPPIclvwN4lESURedDW22DlDZg
 Zs97Dlph06YNQ+CUMTwKZ5/Gb28/0ebMc8buNRDmOh1FVSfsa/b+ZdJ6U9ATNV53foLq
 1dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722422668; x=1723027468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DPGHY6v5CIr+Eb9z9smFgMyzujoybq7sK/FaJAiXSc0=;
 b=Qf47lDmzhZEHWTHc+sjV1BmZfb8p38kfPvx/yOqUiVbRhR0i0iOBPMPbntFdvbS9hs
 Kyb5ydDqT90LG854/YSz7KNY8r8zxSULQ4bFSmD99zqrXHiOmSwzfumCaabjA/s8RXmg
 zmhLTvZqfe8/yuVyl91UPhNLwJ3j6vu4Wi2u8tMAN9CM62cFvTcFgaC1zemJf1oOqNqs
 9JupuzPekSm9Hiek8HyRe2gJh06ndMqEHSVAlLoBj293NCZ8AtqmID4d6SBo2M1hqtiA
 JYZPoRSty5HNrocAbrb5WJqrEVYZwm8+vBg/fouHhTSb0ZG1c3sZcQeSvDJYQnRALgKI
 qCrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg5r1l3k0Qmp1PG7BUrXO3qBVnjOW6Yl7DwFZPssaIuFAseCSl7nWO5s2B+9ZXZBpvg7J4XbC5VFbPY9TVZ/HSrK/OsEdXA8AlML8K5c5NENGO2Na8zc5T
X-Gm-Message-State: AOJu0YzyTZy7yIpVxP+YNf+deCNxyNgiGOf2QiJ/hqww1C9W9Ql0vs0n
 OUTqbhm9Mo80EadgUquc1PRuH2m7X/aUHoLi10phLKIX4NxzV3PJ
X-Google-Smtp-Source: AGHT+IFTctTZ1qQ55uQCVBFKWaKO8LVEq4OqBYk1wWdf3UiDgyEsaVyIy02DJQJqJ0/PrRnYWTUxGA==
X-Received: by 2002:a05:6a00:21c9:b0:70e:a4ef:e5c2 with SMTP id
 d2e1a72fcca58-70ecea30033mr13327588b3a.13.1722422668091; 
 Wed, 31 Jul 2024 03:44:28 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7a9f816da59sm8791375a12.29.2024.07.31.03.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 03:44:27 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Wed, 31 Jul 2024 18:43:15 +0800
Message-Id: <62d2b178672ced64f98d51bff17006728e77dea9.1722421644.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722421644.git.0x1207@gmail.com>
References: <cover.1722421644.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 4/5] net: stmmac: drop unneeded
	FPE handshake code
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

FPE is configured via ethtool-mm, the hardcoded way shall be no more.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +-----
 include/linux/stmmac.h                            | 1 -
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a5e3316bc410..fba44bd1990a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3532,13 +3532,9 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 
-	if (priv->dma_cap.fpesel) {
+	if (priv->dma_cap.fpesel)
 		stmmac_fpe_start_wq(priv);
 
-		if (priv->plat->fpe_cfg->enable)
-			stmmac_fpe_handshake(priv, true);
-	}
-
 	return 0;
 }
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 707a6916e51a..66eb4627bd47 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -157,7 +157,6 @@ enum stmmac_fpe_task_state_t {
 };
 
 struct stmmac_fpe_cfg {
-	bool enable;				/* FPE enable */
 	bool hs_enable;				/* FPE handshake enable */
 	enum stmmac_fpe_state lp_fpe_state;	/* Link Partner FPE state */
 	enum stmmac_fpe_state lo_fpe_state;	/* Local station FPE state */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
