Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC70C92B20A
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 10:23:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9443C78013;
	Tue,  9 Jul 2024 08:23:25 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D28B2C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 08:23:24 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-75e15a48d6aso2576319a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2024 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720513403; x=1721118203;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P8/7znqqkBhNFJlanRTa4ag0D5o5jL152q+Urfiz2A8=;
 b=OZeF3lF5iYb6nEbNm8UVBkVJSvvB7dDVOycZpnF9m5HQwy9TOpW8fmA3b5b4jsc8Ng
 zy1F0iy+0a+y6mmF0gJPIKBAMzXUL516GvR7WcSfoBONtlhKang5ma5huaGLkVGqB/MJ
 4tmBpAFu5c1DQ2OAc3TaOTcy3m7uueFwdvptsm7XK5Q5R0OdK9M0RMXVBNB2PJDUfFAt
 FrZJrD9A/sIb3stvsnaB+XTKi69WPymAXmpRXdyV55gngjnhFGQL7i0JOdk2vIOXdcdo
 /qJrhhE1VEIUTv+YWHE6UbwzTopLKCawlFG9cCbevXDyYSQ9NZ4fu7+1KCh6g58+5ReW
 lB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720513403; x=1721118203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P8/7znqqkBhNFJlanRTa4ag0D5o5jL152q+Urfiz2A8=;
 b=jyfLtG8oQM0rlvG0KqM0MqG1fS4VZpwaxLKM8+RQoPYukZeeca3iYD4NxaK4LE+jbV
 89r7lPplU7ZIRtgqnMrWCbfCPbuJMuZRKiVGdxIj2kBrGIRyd5gaft4hBIMHd3OE2lXs
 hcHy+/tjhMHxDO+zOkdaZwgTyBp7nQfJWhB1XoFweJGdidKKkRetgHQXxVKAV+vS0Noq
 hDSC8/PMU6Ff18c/WBRLs6rmFGvnG+/kzMBRndqakRlVQMCFAqJ0UHmXK8ZnwL+7roMa
 HPjcdLYpjliJGWNz0dd0bVd5tQOfe0NYCYaLZLbOJmhnwrECg9+CUhjWM3U1b4ZceB3Q
 Cz/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5WXUaAvHF8Hi9oxqQEA32sIJJ5sNgR8jx7TDIyC6xJTIaGhU0of6JMmKoZE0u/vNUKBdiGKf4shUore7lpti3gcf/wKkHfloog08lsZENB9XOPytbvXAW
X-Gm-Message-State: AOJu0YwBiqinUIVKI2Jj6jGrtAuMJpHeIRGO0pX6JRoebJdYJXxfNHGK
 cZFw37q+P2e8yAAh/+mA8hA6gITKmTdb9R/NQIrIg8+toDqKq0mo
X-Google-Smtp-Source: AGHT+IHsqtsn6gyOtXLL7y6Rzws8PcIlR1wfJvphBhSBBRCCn9DI8cbMl/kEnHnZ4m8DDm7Ae1Wzhg==
X-Received: by 2002:a05:6a20:2588:b0:1be:ffe4:b2a2 with SMTP id
 adf61e73a8af0-1c298203941mr1960899637.7.1720513403354; 
 Tue, 09 Jul 2024 01:23:23 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c99a92a430sm9588929a91.4.2024.07.09.01.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 01:23:22 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue,  9 Jul 2024 16:21:23 +0800
Message-Id: <8e719b6c4c1fad64eedb0faad15d7920f708b736.1720512888.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720512888.git.0x1207@gmail.com>
References: <cover.1720512888.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 5/7] net: stmmac: xgmac: rename
	XGMAC_RQ to XGMAC_FPRQ
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

Synopsys XGMAC Databook defines MAC_RxQ_Ctrl1 register:
RQ: Frame Preemption Residue Queue

XGMAC_FPRQ is more readable and more consistent with GMAC4.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 917796293c26..c66fa6040672 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -84,8 +84,8 @@
 #define XGMAC_MCBCQEN			BIT(15)
 #define XGMAC_MCBCQ			GENMASK(11, 8)
 #define XGMAC_MCBCQ_SHIFT		8
-#define XGMAC_RQ			GENMASK(7, 4)
-#define XGMAC_RQ_SHIFT			4
+#define XGMAC_FPRQ			GENMASK(7, 4)
+#define XGMAC_FPRQ_SHIFT		4
 #define XGMAC_UPQ			GENMASK(3, 0)
 #define XGMAC_UPQ_SHIFT			0
 #define XGMAC_RXQ_CTRL2			0x000000a8
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
