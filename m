Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1462890F652
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 20:46:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D195BC78017;
	Wed, 19 Jun 2024 18:46:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA6E7C78017
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 18:46:09 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-36336aa7ca1so79204f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822769; x=1719427569;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQB6Cx2g3Hd80tsoqIkz/xMhmvkJf1bvi8aoKUzsHuk=;
 b=E8GW2k+twaUMKc7/M3HuHdq46LsYOn+nqm/C9WxZ2dnKhAFfJMJO3T8Ok9QRemDxm7
 IKlTWZJWftlBqEYGdBeOy6EQstHkHclnSHmbn0QdFZFFTsAh1m4QMKBaols90cSmCol6
 unyJ+5L7IASe4ySactft+vsUpg60Y8vTJg4zomtBwNfG7TZGu6SyonNwBER/ddSGziXC
 r+FrjukxIvU0KSVKtWMugn6GZvsyfyRWb06yV4dYYHEuKbccMstqslMLFUl2C+QWpMmI
 nhmeQxBz7PNdMFcn1hXnTg0AQ9PK2UJuTTBPsCMuZev4vy3ojnfKGX0n80xlp7sxWpEA
 weiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718822769; x=1719427569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DQB6Cx2g3Hd80tsoqIkz/xMhmvkJf1bvi8aoKUzsHuk=;
 b=euL8Vr2U2QjecZAUQq+8yGR/ly3rz/S7fZQhNwrCPDmVIkjvZ3/1Ap/nQOglI0KnwY
 Cbo6rlmx5skJo5Q6YimQLZfLscVa4WclVjlbvOGra3oQEy46mQGqXP51BEr+0TQHRJIU
 LxgTY5HR/KggwN/AVF0daEEJgA4yI5m6kgsJkGEO8pWXKbXaR+UzpAtMzOctUPh8G9Fs
 0QeZ8/WjETPaOkRqKbYXvg40wCA4hY63sTdvCjHAKt7GJi7o18j6wzPlIQXyytW/vBaw
 G0ZVs9H1+GzVBfPlpkTEkXftLDBScpul8ePj60VAe1bWtDXFAPB8E5gUqqBeoqGGkwDf
 fhYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsX3yvIGu/924xKgDpGGdD4M/q6D01plmlr0/SZksMzXTAcN2bS5cwnVrTdtfdDCbrh7j8eqMBfuF710G00gCThA2QHUtjuhlpiGZFvDxYASfAiJMt6ER5
X-Gm-Message-State: AOJu0YxCq9nS6Waplt4UNvWOBIJNaxwBI7fh0Qcxs4nUy8SXceEdc3Lu
 viGCoLRj6RUWCy0cILZ17ayhV0UkQX1kH/nH99o6qsZkqncArHzEoFEHTDpIzKw=
X-Google-Smtp-Source: AGHT+IFc10tmtmw3xb52p2cInNEHf/dEPq+PJZ9vw9EtMnLBEOS8Dh29bqwtYNyT87EfbHfTnNwe9A==
X-Received: by 2002:a5d:4902:0:b0:35f:2002:3033 with SMTP id
 ffacd0b85a97d-36317d75626mr2704226f8f.37.1718822769540; 
 Wed, 19 Jun 2024 11:46:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 11:46:09 -0700 (PDT)
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
Date: Wed, 19 Jun 2024 20:45:48 +0200
Message-ID: <20240619184550.34524-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619184550.34524-1-brgl@bgdev.pl>
References: <20240619184550.34524-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 7/8] net: stmmac: provide the open()
	callback
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

Provide drivers with means of injecting additional code into the
stmmac_open() function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 include/linux/stmmac.h                            | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 644bc8a24661..5f628176d994 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3953,6 +3953,9 @@ static int __stmmac_open(struct net_device *dev,
 	if (ret < 0)
 		return ret;
 
+	if (priv->plat->open)
+		priv->plat->open(dev, priv->plat->bsp_priv);
+
 	if ((!priv->hw->xpcs ||
 	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
 		ret = stmmac_init_phy(dev);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 9dc54d6d65ae..59991b38cadb 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -262,6 +262,7 @@ struct plat_stmmacenet_data {
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
 	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
 	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
+	void (*open)(struct net_device *ndev, void *priv);
 	int (*init)(struct platform_device *pdev, void *priv);
 	void (*exit)(struct platform_device *pdev, void *priv);
 	struct mac_device_info *(*setup)(void *priv);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
