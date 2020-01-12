Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1989C138758
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jan 2020 18:28:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7D8AC36B0B;
	Sun, 12 Jan 2020 17:28:35 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E96BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2020 17:28:32 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k197so3544694pga.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2020 09:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mWAcq9bb+JndPzUhrr5Pb2HRZwmhGDpzE1gJ4Awh0iE=;
 b=VaPlFfdOq+DlRixUbvY7uOaKV8x9tGYxMk/mMIztPXQ90iS7bPhb2v8tDfQ1G8ONNE
 EVCuFCVVFxt3Ic6pf6M+20qRjGABhGbYQDOSNKApv4NWmyc9Beb6njFrMqb0Bvv8fN1E
 lSYrIMWksLS9w8Bqb0JECSgxyuE8nL+DujYGRZ3pWPR77ZdTBFmAI1+yNKg960Ad6E7P
 +WZzexY1l34yY7/VuU1OUXaxh01vY15l+N5P1J+shALFh/kjVsOSzkUYffhAjnWPIBX1
 V6XdTGoL87JnCf+haztWChVF9/PwNVgEXSJGU6cp3q+XE5O+GY177IHscpCGy7E5+/LP
 gy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mWAcq9bb+JndPzUhrr5Pb2HRZwmhGDpzE1gJ4Awh0iE=;
 b=V9s1GN1k5A21ng7ufw2/SGfeYx5aGeZjgGSAGEpYC9+UMqUiv/bT8LFpoHoe+/xGCz
 Hpvm64uHo5YWr49Fa97teOgNcCog+OQwO4pcLFE5bO2WG8XL16vk6IW7lDEk7mp5C4Eh
 WohJkdP/1s8C+eTQzGOV32VpNriRAuy1QLHWZdIPmUPcnJodFbzMCI7Q1WgxJEUPo/QY
 XqS/dKKPWjpeV4w8XW07hQNQCAwtzEam6nMipLzYUMYkYAQvV4Xs5Ef5czoXUDUsNbF0
 MhaOfyyibT77XfzHyE+rVqaGyAeirnVA35XP2KxhRd0iauWh6bW5xCyD1ZkLyn/cZe8C
 KGMQ==
X-Gm-Message-State: APjAAAWiED9RnKIDbx3MlKQidyr4cDW0hLXnDRmADQE+3psatlzXgJcL
 1H1k09RFwRJouYQDZffKSUg=
X-Google-Smtp-Source: APXvYqzqWp3rd2E4Gh5ieMTKf/wQ6uq1DjhlX73ZEhRTeq9FbLjUfguGvxj3jMgwUU37ZVdRyuGCUg==
X-Received: by 2002:a63:a555:: with SMTP id r21mr16539281pgu.158.1578850111207; 
 Sun, 12 Jan 2020 09:28:31 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id w187sm11114777pfw.62.2020.01.12.09.28.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 12 Jan 2020 09:28:30 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: kishon@ti.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 p.zabel@pengutronix.de, yamada.masahiro@socionext.com,
 gregkh@linuxfoundation.org
Date: Sun, 12 Jan 2020 17:28:28 +0000
Message-Id: <20200112172828.23252-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] phy: stm32: fix using plain integer as NULL
	pointer in stm32_usbphyc_probe
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

The parameter of devm_reset_control_get should be a pointer, so fix it.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 56bdea4b0bd9..8cf24c330f5e 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -340,7 +340,7 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	usbphyc->rst = devm_reset_control_get(dev, 0);
+	usbphyc->rst = devm_reset_control_get(dev, NULL);
 	if (!IS_ERR(usbphyc->rst)) {
 		reset_control_assert(usbphyc->rst);
 		udelay(2);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
