Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E27111E0554
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 05:41:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACCFDC36B24;
	Mon, 25 May 2020 03:41:51 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79C34C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 03:41:50 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f4so8104959pgi.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2020 20:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Eu+Ho/X9r7MZN52F/RomcQQtgjiQ+X/m9AkGhdRXtC0=;
 b=PmqbvbjfQbPp8aCgYV4adtOizlxzzoYkkP3BmW00smgp2fP0Bgb6gdyaUQ4hSIboyv
 v17woXHMmCbO+WITpNoew3ZTtwk+GINDY8hwKAcYqbhKR5mfY5n8Sx6wOC3DKlVsJ254
 LC94GQMZAP7XMrauRY3joLeFA5EyYlu3MTIORwdh5K6lKQ4XbdESZQCBS+FTPbumlf4A
 WElSv97Cre7PEAgs33dgrOqpa7Caw6r+g2WUAH+gf6a6dTsV05j64XII4l4nOrXjlXB5
 lVAnOeQ9wLz5J4uOpLCjlTipqGfMETbFE4vqCnbX2n8GsVykhRXpzBRU8Xuzqeu9NO5H
 w0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Eu+Ho/X9r7MZN52F/RomcQQtgjiQ+X/m9AkGhdRXtC0=;
 b=YkAuNchegyiqfo+yjsaVcfDYWiKvERy/CKwzEGp5CQ3huHcrQatoWAWnz0Hkky/xzh
 khx+Wz18enxFY/rBJg0snM5NkPIDklKA9+sEt1i+DP1jr5tjZGlOz6bZli3FMzQJWDfM
 PlsoNjBIIQn6OblpLIeds/FoSh6yaa0tGtWokpB1WIdIRpoiGWYVKHKm+MOlD0atUpAD
 dJjpWq4scG6WptZYRwqKfYBdow7vi3xeBJdAicGQCd0RYf104EpijrMq55yx4pnaNW+A
 VHGNndOACN8ZX6qvfPxrLvYVlUc5nMSp2vMwHPCs2OtPK0srQNY6Vt5BVLGak7/rKMDO
 IrzQ==
X-Gm-Message-State: AOAM533VFKySg7qRuCar/QviUkm2H1C80q8eK+RHZvfntKwJYBjObhCD
 TkbGvpSCZylf4mtq1MJCS2GNZ9ZZngY=
X-Google-Smtp-Source: ABdhPJxIuHMaJzv5SBEYVh6aGCYw3zkHcCsCQujjuOk1hJAg5OSAvXpvA0RjBvenltA1HqrMvGbYhQ==
X-Received: by 2002:a65:41c8:: with SMTP id b8mr23889318pgq.265.1590378108951; 
 Sun, 24 May 2020 20:41:48 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id 7sm11981695pfc.203.2020.05.24.20.41.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:41:48 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org
Date: Mon, 25 May 2020 11:41:02 +0800
Message-Id: <1590378062-7965-9-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
References: <broonie@kernel.org>
 <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 8/8] spi: flags 'SPI_CONTROLLER_MUST_RX'
	and 'SPI_CONTROLLER_MUST_TX' can't be coexit with 'SPI_3WIRE' mode
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

since chip spi driver need get the transfer direction by 'tx_buf' and
'rx_buf' of 'struct spi_transfer' in 'SPI_3WIRE' mode.

so, we need bypass 'SPI_CONTROLLER_MUST_RX' and 'SPI_CONTROLLER_MUST_TX'
feature in 'SPI_3WIRE' mode

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/spi/spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c92c894..f884411 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1023,7 +1023,8 @@ static int spi_map_msg(struct spi_controller *ctlr, struct spi_message *msg)
 	void *tmp;
 	unsigned int max_tx, max_rx;
 
-	if (ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX)) {
+	if ((ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX))
+		&& !(msg->spi->mode & SPI_3WIRE)) {
 		max_tx = 0;
 		max_rx = 0;
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
