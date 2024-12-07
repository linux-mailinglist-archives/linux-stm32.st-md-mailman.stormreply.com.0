Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E959E7E9D
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Dec 2024 08:03:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10A67C7802D;
	Sat,  7 Dec 2024 07:03:25 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EFCCC7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Dec 2024 07:03:17 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2161eb95317so10728545ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2024 23:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733554996; x=1734159796;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7VBksAF/T3d2c5+s8Bg+ubv6vEd7NOr/os/9LSHT35Y=;
 b=IQ6+fFUWxkNFQ6DJkpXnduuYzJ/9mm5x3LlXqTB5t0Bits+NU5t7WkCoMGBE3gR0+L
 OqQeSi/LBWEHK75P9bjb4JvMbCH+yrprT0mvqXl0N4xvN7Bb1oAvZY/G0Lvf/DLQyb+S
 ep6X20N2CNfz36FM5PLDnpZdvF05x0aRWXMU+F+SOBSiZcjMuKXiWEAPTynmEdbAtRxy
 2oWsRdqSOKFx87bV5Uk2MxkT4iN5aYVGZLRVG/59dziqhBngsc14n0YD6FxCd3ET6ky2
 0NQJwR/SwdrU9au/vqxfI9UzoNqIBkkMis9ppsiaOQMKiMUYwOwHbysairJgzPyxTJDO
 9uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733554996; x=1734159796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7VBksAF/T3d2c5+s8Bg+ubv6vEd7NOr/os/9LSHT35Y=;
 b=tzvepjV447E5/cbhl6owuvzqziDmE/TUR2ZW47koao8bv3zu5mqYn+16qmXkzy6SUB
 SQRlGFkzjGhOtyV6CZuVbON7fP7WzDF45GqHSh2Pys2CtZwfDoGCjClX9nCKtvxTd+ya
 atCHd16YrDL3BVrXLeIdEHCU0DEFshQSnWvKx/9fqW12DhJj/3RowR/bZFDBp7Kk+Ndy
 +lsv+8QBXs291oC2ffWvLyQ5Meb1N/71eZS+om5P7tPRbmf/Bj3oX9fFK777RIatFnND
 teNyHxJjWW1hQXeVe3biw6K8f4xa+c62Ay2iOyR4VVJbxXlLl7PfAJ0n1ja5Q9sXNGLI
 DZkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxhjy5lRUwtCnxYxzztEaC1ygeNRGCh/bQWI1eGGMgt1cySPXytMHsjVgv8XNbQDv56eQH2arpKhJkSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+ROEkz34z4tlHwzJwbZgUbKzlS1MV47Uzb78eW7pEvJ6ASCin
 Zy0AugixLKpH8840mpg7cIg2ojvm/vUjwxoJ0On0PRGSLbkmtzUD
X-Gm-Gg: ASbGncuBslnDmKHmeeBsTyuxspNCBNVZJlPLrqCvq1a5vpHAvl4hicqa76yoNIaBb5+
 KqBN1EoKDA+/uS8jbPuNpTqg+Dj9TlKObmzfRAYUMRon5UuCcTYO/w1zdsBFVYg2klUP9wTAvkm
 yZTKH+13a21fUabpZwX/Br4p3kf9N9GlDBJNPZXQ87veNBrf7nxrAIDTbYKD6Gu8Z6ISw6mbtZd
 e5yzomUrLNlfM9CzZPmD5BjMHRl85RjTB2slysJWzOXHowES6kz831lVaBDcYc=
X-Google-Smtp-Source: AGHT+IGRLV9tlr/2SHhgZD19JnwDMG0W/wwF7xuVg/N9Skwvi9GkZLfzfL0GTpIhC8/5P3oAOgPTeg==
X-Received: by 2002:a17:902:f542:b0:215:a60d:bcc9 with SMTP id
 d9443c01a7336-21614d1ef83mr97323535ad.2.1733554996066; 
 Fri, 06 Dec 2024 23:03:16 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-215f8efa2aesm38395105ad.142.2024.12.06.23.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 23:03:15 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat,  7 Dec 2024 15:02:48 +0800
Message-Id: <20241207070248.4049877-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: Move extern
	declarations from common.h to hwif.h
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

These extern declarations are referenced in hwif.c only.
Move them to hwif.h just like the other extern declarations.

Compile tested only.
No functional change intended.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h | 14 --------------
 drivers/net/ethernet/stmicro/stmmac/hwif.h   | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 1367fa5c9b8e..fbcf07d201cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -543,18 +543,8 @@ struct dma_features {
 #define STMMAC_VLAN_INSERT	0x2
 #define STMMAC_VLAN_REPLACE	0x3
 
-extern const struct stmmac_desc_ops enh_desc_ops;
-extern const struct stmmac_desc_ops ndesc_ops;
-
 struct mac_device_info;
 
-extern const struct stmmac_hwtimestamp stmmac_ptp;
-extern const struct stmmac_hwtimestamp dwmac1000_ptp;
-extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
-
-extern const struct ptp_clock_info stmmac_ptp_clock_ops;
-extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;
-
 struct mac_link {
 	u32 caps;
 	u32 speed_mask;
@@ -641,8 +631,4 @@ void stmmac_dwmac4_set_mac(void __iomem *ioaddr, bool enable);
 
 void dwmac_dma_flush_tx_fifo(void __iomem *ioaddr);
 
-extern const struct stmmac_mode_ops ring_mode_ops;
-extern const struct stmmac_mode_ops chain_mode_ops;
-extern const struct stmmac_desc_ops dwmac4_desc_ops;
-
 #endif /* __COMMON_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 64f8ed67dcc4..58a962e0b768 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -665,6 +665,20 @@ struct stmmac_regs_off {
 	u32 est_off;
 };
 
+extern const struct stmmac_desc_ops ndesc_ops;
+extern const struct stmmac_desc_ops enh_desc_ops;
+extern const struct stmmac_desc_ops dwmac4_desc_ops;
+
+extern const struct stmmac_hwtimestamp stmmac_ptp;
+extern const struct stmmac_hwtimestamp dwmac1000_ptp;
+
+extern const struct ptp_clock_info stmmac_ptp_clock_ops;
+extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;
+
+extern const struct stmmac_mode_ops ring_mode_ops;
+extern const struct stmmac_mode_ops chain_mode_ops;
+extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
+
 extern const struct stmmac_ops dwmac100_ops;
 extern const struct stmmac_dma_ops dwmac100_dma_ops;
 extern const struct stmmac_ops dwmac1000_ops;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
