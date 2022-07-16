Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7417A57721F
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Jul 2022 01:08:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29614C64106;
	Sat, 16 Jul 2022 23:08:13 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AAC8C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 23:08:11 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b26so11851838wrc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 16:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AcH9xqJ0k/4jByViDRihM1a2jjuLTRujm9Mqh/y4WfU=;
 b=Gfcogbmz3/K65c3EnnUC1lbWrysiwjn7PTvEVGPFELRoym4ssg/p1VDUPd8z1VQs/2
 IPCagCFhuGEoQFsFa6usAmm+P8l4tK+MdcYMeVcxwg9GpHfNO+Hxamf4VFXlGsGLSVrZ
 RIQOCOS/qam6UbXgIYcHkiUFlY1c5s2MXcqnt3zEBZwESv2mJ/NX2Lw5pVfxq3KTJ2gt
 qpndMGJewN28lhy0vfDGjQDXpf10nJcZVs0GKQBcFjA3gXq3ad+fkPsUL0uvlPxujyA0
 HV2hssNImYnmKbyshYVQnsfEfj4lnJwEb1EPQKjBQXI7A5jaxecPtqlVJ/JWifihk8uU
 W/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AcH9xqJ0k/4jByViDRihM1a2jjuLTRujm9Mqh/y4WfU=;
 b=U7CMjHgRO3wqlI35o9zOBRHcHuJ+xJ3T7ES4nGE2GeOBH7FoPUkvLNGxHw2cxM6cXc
 J5fhzADJbGP4/m4Z5gojZzfcnjEuO1DQypqBc47yBcoL8hfuafpaKi1HMwUs+VrteI0u
 gYDEN9gTaekwuWe4kx9Yv3mDISPF80M49iTZtEixRxVLuyi30gEVo7JvfGajMKjuSV6I
 SvlJH/YZjtQlE6jyXndztZ1umeb1Qv74m+Wer5oh0LAh6i0nGO2BZntxqkLerdLMt4Pb
 9f1upMpcPIHaPcABvw1dBmZbQ9jnONR5BYYHj2+p2Hoaju+/vBtZvdcxboFRSKRWkchD
 aLng==
X-Gm-Message-State: AJIora8LQHUbt3FsG3xydTqSa+/uL1T2OQLZAvmA9UtUSSaZeAC1IPGQ
 GfjSp/o4GXPs47IXgfeuvaY=
X-Google-Smtp-Source: AGRyM1tP2PAJFpt2bHiFsNgLLbCwK7Qak01U2580Nyv+iEK/GVTVb7lSi0R1YMZOoK2qrWWj+Mnn8g==
X-Received: by 2002:a05:6000:15c8:b0:21d:babe:e75c with SMTP id
 y8-20020a05600015c800b0021dbabee75cmr18627124wry.32.1658012891127; 
 Sat, 16 Jul 2022 16:08:11 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 l13-20020a05600c2ccd00b003a2f2bb72d5sm15150755wmc.45.2022.07.16.16.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 16:08:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 17 Jul 2022 01:07:59 +0200
Message-Id: <20220716230802.20788-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220716230802.20788-1-ansuelsmth@gmail.com>
References: <20220716230802.20788-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v3 2/5] net: ethernet: stmicro:
	stmmac: first disable all queues in release
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

Disable all queues before tx_disable in stmmac_release to prevent a
corner case where packet may be still queued at the same time tx_disable
is called resulting in kernel panic if some packet still has to be
processed.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5578abb14949..1854dcdd6095 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3758,6 +3758,11 @@ static int stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
+	stmmac_disable_all_queues(priv);
+
+	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
+		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
+
 	netif_tx_disable(dev);
 
 	if (device_may_wakeup(priv->device))
@@ -3766,11 +3771,6 @@ static int stmmac_release(struct net_device *dev)
 	phylink_stop(priv->phylink);
 	phylink_disconnect_phy(priv->phylink);
 
-	stmmac_disable_all_queues(priv);
-
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
-		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
-
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
