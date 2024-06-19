Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6A690F651
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 20:46:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8953C78013;
	Wed, 19 Jun 2024 18:46:13 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55F65C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 18:46:09 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e724bc466fso626961fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822768; x=1719427568;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuxLK+Kt4TA0IWlhERRNrzNbAxkSoJre0Y5sVJZCXq0=;
 b=xv72HiWGV3JBjtGNKz2bIwMllBzPbsVEiskqp3Li7JOjLXXv75VTOUk8fEvxHDmY64
 Ihyz7thfEa5B3OvvfY2d6Vq6IFTqtas/tuYHRSy5Y1ebRxgpj923SkUbZwyJ1nC8er26
 TObwCLm6Y43j6lrJeUrWvilZaE2dm/fzSUQ8b/Hx6mcObXiP/MXrw/C6Xz5wy8GRuIze
 ePBgamtxyyUtdnfmFut7SRsEk/pUME7ZAGh9aDNvibHefGeReNrbZctdwro94jKysPen
 4Y/hoIqu2gstdQTCDwbPkOSeg3ef4SEslpGwfs4E69/p3GLaqlv0jcdN77CX+TeuM5mo
 knKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718822768; x=1719427568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IuxLK+Kt4TA0IWlhERRNrzNbAxkSoJre0Y5sVJZCXq0=;
 b=vy4wrb42UQHYIs2+jXjWPnCyuOiMpZCn/OtLFqm5ETnJVLQrtyVvKay1MGZBJ7HuGI
 mD3AztwinC131q5nrGqmjaJgK6gdXJqtF0pNGi9M1q3eAwkCgHU3/szNVFfHGBKAJkkW
 B8nc64ql4M9NG7joQH3UhlG0A8+ecap5gzrTR/h3l4E7VtDh0wDaU5IuAdIobqCZfTxs
 MPRHeN+/Dl97IhtLp/ATfQ+ywfMQ1XVBTYJhHo2DzFAAEmu07OQqtPTG99FM86dY0J1s
 9DXUnNRBR3utYNb3QEwcAqkjNaEaaYP7H+Kkr2SubPkhcqKmA8HLx1FuOOX31qfvPy6S
 pW3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTdNSO2NEe8rhSoQ2IzOuvG7XWrIysb7xRLtkRyxncXJSlEBSZyqYnfNWvkLx1/1Z4iuDehC3m9Lz3L3mlp8vtR5lshk5wLy+A78XFvxmMI75OG464O0qF
X-Gm-Message-State: AOJu0YxjmEamk6S/q0ethn/X9U/zA/DteGu8pQu5DOhOPFBsMkx+NV+Y
 +D1QoQkD6wovNYzSVioRRZuqjpS0xRdRLrc5ZQSifPWAD32maDZj3N0osQCpBtU=
X-Google-Smtp-Source: AGHT+IE2yoi8eN59Efp4Zw4hc/t75lfTyLZp0Zgl91poYr5lN48FBw2FLHnhRe8TwdlAiWGWq9mpew==
X-Received: by 2002:a2e:9d05:0:b0:2ec:efb:8b66 with SMTP id
 38308e7fff4ca-2ec3cfe12acmr21926691fa.53.1718822768357; 
 Wed, 19 Jun 2024 11:46:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 11:46:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Date: Wed, 19 Jun 2024 20:45:47 +0200
Message-ID: <20240619184550.34524-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619184550.34524-1-brgl@bgdev.pl>
References: <20240619184550.34524-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 6/8] net: stmmac: provide the
	link_up() callback
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide drivers with means to react to link-up events in the form of
another platform callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 include/linux/stmmac.h                            | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5ddbb0d44373..644bc8a24661 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1006,6 +1006,9 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 	u32 old_ctrl, ctrl;
 
+	if (priv->plat->link_up)
+		priv->plat->link_up(priv->dev, priv->plat->bsp_priv);
+
 	if ((priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
 	    priv->plat->serdes_powerup)
 		priv->plat->serdes_powerup(priv->dev, priv->plat->bsp_priv);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 9c54f82901a1..9dc54d6d65ae 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -271,6 +271,7 @@ struct plat_stmmacenet_data {
 	void (*dump_debug_regs)(void *priv);
 	int (*pcs_init)(struct stmmac_priv *priv);
 	void (*pcs_exit)(struct stmmac_priv *priv);
+	void (*link_up)(struct net_device *ndev, void *priv);
 	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,
 					  phy_interface_t interface);
 	void *bsp_priv;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
