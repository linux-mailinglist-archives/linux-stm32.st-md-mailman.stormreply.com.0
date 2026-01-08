Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C33D02778
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 12:43:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD37BC8F284;
	Thu,  8 Jan 2026 11:43:15 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30E48C8F264
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 11:43:14 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7ce229972d9so1779377a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jan 2026 03:43:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767872593; x=1768477393;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLl2yTmIyk/u0fY0OTkeSRaVcVv4cgEfyMzNgksSQTs=;
 b=Zo3HrvkovbHvJmNQe/gvDcEk+72EHTPL4hcUq6v4S/K+EPeQS3siFDm+GxEtUo4Z2y
 /YV/V1Ui+y0gmFOFJZrewtIQRKiwFMyY6qLDsLGfuGL1HF4cz5f/AFEVyxfLwR1CWfhv
 wAgT30rFaW2HuBxadjRPlOpx/7sozNLbHh1WYlcgXiSt0azddx5wmoxYV3DPGeWdcdmM
 CWkNHF+mKK+/dXMIBx+F7mzdQ3hsGllzHQkWfW4aOjB4eWakqn4H6vaLX1G+EXds4SYz
 BLg+TLDD4cFUk2IMMlo5qKufMMp6PGgw7+WbsBeqKz3cDK4lfH0Y2mR6wsr0cCqrWsOG
 qzcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0eaKvs0L38UNcJjvjr1oGhrw6h61XS2TuUz/5hk73fHMBvY+25ZcWvoO5nD4wZIB+M8WJdByy1szH4g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUKVbM6KI/l/rSY92g3OjosTu3sSwLtno4/ptrqNM2sC8dFyMj
 93Tfy+vti+XgXrRi5sWE+gTyYyQf30/aHfM/+pEjCRa4k4fWq8AG6Q6D
X-Gm-Gg: AY/fxX6D714B11+WdslDpqLJ5S8hasJO8tlmEyi7ZXvL9n6F/TTHpFk3jfEpxRjznKg
 dBS/ceqqtHK43zOR17GGmAcC3aVOWumJv5J6viLU7ZyJmORSPo0/7zybPNPvpZFdtR1qlCcqlF2
 LFvbYbRhXM0o3745Ac+zWYsTGfm+KQCO3rmyhNOWSwoq1sp88w8yc5DKd0FzCxI01OTHJ79O67d
 ffhd+keiG4mQ/DuHwkf24/vclzcAL/LfqNHG+icls2Ehiyv1AEu0w15FlGMlGh7P0bFwp9/h57v
 vNZExFtaPwPb/IV2z6+HhyTM9bIgnFJQmxEQNjQ7wzpPFZ6rSVb2Dk9NKh6XMJNJOP5m8ZPS65D
 Z4cn/fJhFyaGCfIDGLvbwLUadOYYf+74eYU6xkouTPfHQuRhsSQo5SJpON2iMsweb3Ucggh67u2
 nNWQ==
X-Google-Smtp-Source: AGHT+IHMFL4AvJOQLr+1gng3or268k0qffkqrhBJ29oEiScsZeINaFbiTYzQwVXPvQ6mp+IzqqnIIw==
X-Received: by 2002:a05:6830:3497:b0:7c7:53bc:54a7 with SMTP id
 46e09a7af769-7ce50b8d191mr3288912a34.20.1767872592742; 
 Thu, 08 Jan 2026 03:43:12 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:40::])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce47802551sm5246754a34.1.2026.01.08.03.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 03:43:12 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 08 Jan 2026 03:43:00 -0800
MIME-Version: 1.0
Message-Id: <20260108-gxring_stmicro-v2-1-3dcadc8ed29b@debian.org>
X-B4-Tracking: v=1; b=H4sIAEOYX2kC/3WNQQqDMBBFrxJmbYoJUcRV71GkxGSMU2hSJqlYx
 LsX7brr//57G2Rkwgy92IBxoUwpQi90JcDNNgaU5KEXoGvdKK21DCtTDPdcnuQ4SVOP1rWTs75
 roRLwYpxoPYU3iFhkxLXA8Fvye3ygK4fvYGfKJfHnbC/qfPzLLEoq6WvVWWVaY2xz9TiSjZfEA
 YZ937/b7rXEyQAAAA==
X-Change-ID: 20251222-gxring_stmicro-40bac6fcad86
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253; i=leitao@debian.org;
 h=from:subject:message-id; bh=8E1ysSUShJ8p6nlzz4eEEoUf1cDKgDwOfnAJUPcBZHs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpX5hPLU4cUiB//lWOugf+MGfu+cH0iHAC/Z9et
 5lX/HdKFiOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaV+YTwAKCRA1o5Of/Hh3
 bfCWD/9SXn9wXZKcp9wRbju5Q8fSyNgRaLkqW8m5h2LlEGgOqu/ilvXA9i5lX0JnbrP0/O1keli
 JUSr1cH4l5PpOmv286HitihXQvP7lt8bJoZcy5hltW0wLcb1K+/JWMFo1VzmdYsSCG92+qJwSCE
 PJbNgYaTga9E3FZ/aT7zzWhnzGc9Uqmw61WG6CGb5j3izsECWhanLtzE8DF/EZy9Aa38zyKL11u
 lXjQW5YNTcEq2Siny2CHUq7ASWTD1PHOOch+65QgCoORg/h/lt9x0KX5vyBM6EmRr8+m/tqY6JY
 /+wUcCJuY+e4CZt6RIroC36WXI3mi0sn4I39ck67tx4QKCP7tBhZWAi3BMdBOy9TVnCMJY7th9J
 K6kjKS9fGGPjJAfvMlZFPC7y4Lg4Z7GYjLLvvzswOEhUwreNwCX/blmjqoQoLMqS9Plx1AfQxDp
 CvzgnEZRgOuRaC0Z7CBq4Pe58i+hCOGKUffcPGTU5lI4+zfpu2LexEm/4ncw9D0SIEcs1FL2L3D
 Njeitufk7bAe/KWYISJ0krP8Hom1kf0zev/wz4BGBz5C5T5h3s5eeiHFB8GCFXblnAs8VP7J+lJ
 f0bAfn17p0Q0fYxyk61dOhFvjq4+RR34v2SQLSM3P3AgqSbvSJJSrv9GBv1lEzdcLe2/ThWPzmq
 1jcp/YE2frbDlew==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
Cc: Breno Leitao <leitao@debian.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: convert to use
	.get_rx_ring_count
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

Convert the stmmac driver to use the new .get_rx_ring_count
ethtool operation instead of implementing .get_rxnfc for handling
ETHTOOL_GRXRINGS command.

Since stmmac_get_rxnfc() only handled ETHTOOL_GRXRINGS (returning
-EOPNOTSUPP for all other commands), remove it entirely and replace
it with the simpler stmmac_get_rx_ring_count() callback.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- no change from v1. Basically resending it now that net-next is open.
- Link to v1: https://patch.msgid.link/20251222-gxring_stmicro-v1-1-d018a14644a5@debian.org
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index b155e71aac51..c1e26965d9b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -914,20 +914,11 @@ static int stmmac_set_per_queue_coalesce(struct net_device *dev, u32 queue,
 	return __stmmac_set_coalesce(dev, ec, queue);
 }
 
-static int stmmac_get_rxnfc(struct net_device *dev,
-			    struct ethtool_rxnfc *rxnfc, u32 *rule_locs)
+static u32 stmmac_get_rx_ring_count(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	switch (rxnfc->cmd) {
-	case ETHTOOL_GRXRINGS:
-		rxnfc->data = priv->plat->rx_queues_to_use;
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
-
-	return 0;
+	return priv->plat->rx_queues_to_use;
 }
 
 static u32 stmmac_get_rxfh_key_size(struct net_device *dev)
@@ -1121,7 +1112,7 @@ static const struct ethtool_ops stmmac_ethtool_ops = {
 	.get_eee = stmmac_ethtool_op_get_eee,
 	.set_eee = stmmac_ethtool_op_set_eee,
 	.get_sset_count	= stmmac_get_sset_count,
-	.get_rxnfc = stmmac_get_rxnfc,
+	.get_rx_ring_count = stmmac_get_rx_ring_count,
 	.get_rxfh_key_size = stmmac_get_rxfh_key_size,
 	.get_rxfh_indir_size = stmmac_get_rxfh_indir_size,
 	.get_rxfh = stmmac_get_rxfh,

---
base-commit: 8e7148b5602321be48614bcde048cbe1c738ce3e
change-id: 20251222-gxring_stmicro-40bac6fcad86

Best regards,
--  
Breno Leitao <leitao@debian.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
