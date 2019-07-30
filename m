Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 484257A7C8
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jul 2019 14:10:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF5C5C35E01;
	Tue, 30 Jul 2019 12:10:23 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1980AC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 11:38:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so62182951wrm.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fNgx7LSZsCgbXKdsyr24bMY9+rQUrrZFZQRC4AZtF9c=;
 b=UzuA4+3dWD5gJ/bdWkmp+oOn2TquUqRLyhTvpv71pz7iZ2sw04Dfi/dVMU4rPFxtYF
 zcafGzR25HcoGTuB2y6cMFwz1ybVu1AguN6miO5wUzRZ7j7sRtem7g6Q6+auwoAhpzVz
 qCzhMOWs34dfxcAg2dx64MnMRAdLen7WE1g38sa22lJRwwiHHlk7KZ35yq1lrK5aWI66
 l1c7ytZfhr5kiQrJ8s/w/amYJf5nkGFW5IYYdh5xMogGWyEQQ3KamGRmD/GrgzgrvAJ2
 52WnysO1TMySTSb5Z3nGjpIdG+YdE/b+LxWVdczZ9H9YUb4eM9+Gk9uN7YCn/zx3Uq+y
 M0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fNgx7LSZsCgbXKdsyr24bMY9+rQUrrZFZQRC4AZtF9c=;
 b=eMW37TQhuoKu3xR+lkjQ1ZAhcnEQf624f5UdfS3XvX/fjgwtnlb5mdSK+Zg4c5Au72
 CBMOS+VvPT24hDOd9uloQneew2/FSuy6l3jQyT2RMhwROn35W1II5EiJA2LSLV/Igp2O
 3G6obmLJcW/JCBd+mNfilF5Jr3AQyS5g59C1mYPiuppGV6iHkJqpLZISMZ6tJ1EgVGGA
 NGV4T+nrmuoc8K3kZxK8R2ryZO3SGSNwfbNwicIKKtTeglRYJLEeG41n1bw9i+DH9ND6
 AjL4A4ZkY+p32uB/kFfqyruSHcgR0y39vX5RVyRyGZg3qKOgt2idpwleQHe3X89RwX70
 u3uQ==
X-Gm-Message-State: APjAAAUE93TW5I4Wm99WiJ0tsn+SnGBs7H7fM3bLO/vsXsZS/itR88Zo
 ZsRNTnTjXQ4ONAKmZJDmx3I=
X-Google-Smtp-Source: APXvYqyrOWXJtJJE/Z8rh0NjaFzqXq9A4xuhHNIQKEOvXvJTncEPAOI8h6PfJJZs4V3dUopUN741Pg==
X-Received: by 2002:adf:f646:: with SMTP id x6mr134917936wrp.18.1564486707429; 
 Tue, 30 Jul 2019 04:38:27 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:e921:c4e4:a1d5:45d1])
 by smtp.gmail.com with ESMTPSA id r11sm99600810wre.14.2019.07.30.04.38.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 04:38:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 30 Jul 2019 13:38:14 +0200
Message-Id: <20190730113814.13825-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jul 2019 12:10:22 +0000
Cc: Frode Isaksen <fisaksen@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Use netif_tx_napi_add() for TX
	polling function
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

From: Frode Isaksen <fisaksen@baylibre.com>

This variant of netif_napi_add() should be used from drivers
using NAPI to exclusively poll a TX queue.

Signed-off-by: Frode Isaksen <fisaksen@baylibre.com>
Tested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 98b1a5c6d537..390dad5b9819 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4313,8 +4313,9 @@ int stmmac_dvr_probe(struct device *device,
 				       NAPI_POLL_WEIGHT);
 		}
 		if (queue < priv->plat->tx_queues_to_use) {
-			netif_napi_add(ndev, &ch->tx_napi, stmmac_napi_poll_tx,
-				       NAPI_POLL_WEIGHT);
+			netif_tx_napi_add(ndev, &ch->tx_napi,
+					  stmmac_napi_poll_tx,
+					  NAPI_POLL_WEIGHT);
 		}
 	}
 
-- 
2.21.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
