Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E19C92B20F
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 10:23:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7C9BC78014;
	Tue,  9 Jul 2024 08:23:51 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF65CC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 08:23:44 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1fb4a807708so38676045ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2024 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720513423; x=1721118223;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETQ1Az9wlQRIwVfJaj8s9DEGWwFkHYmCUfhq50YE6H8=;
 b=MaozxmW/BjaX2qzoyzmUqVx0C8M+xVjkZtOoN9Z25dnKVmfyZBbyM8ExZmt8GuOtus
 aRdmd/VWjI3MUxcLtF/d6l7utlobmA2W9lArnkPlfMVM64emzz4yb37R9V9efCOjBHhL
 0us0BGgpVFb2jLjhnzs51Kcrbw/zYKHx+GpxVXx/zFR7xrFx+E24C9TImR5fGJdHZY7L
 eOHi1RgNH6tV1sotKr8Bs3GcpnH8e0w23lY0elWZIVr5quog4qZVQEUGcK175En+zxuu
 hq6oX3oFe4xT/7f05VoSkDnKvzE3lYyE8aRgrLwCpfHdi3g+FEYG4KsQIlBRbnOXKbcv
 bv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720513423; x=1721118223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETQ1Az9wlQRIwVfJaj8s9DEGWwFkHYmCUfhq50YE6H8=;
 b=d/WHNzqkZ5QfDBPHArUgfzTHIokH4Q2fd/V/Ez39zhxEoQDcDPmYVbgKqVP0gUm/iT
 fZW6Duut8GQ4kZTgV6XKOILdqPBimAl14OzgrSofWr5CpY+U/lG1OKJVR3M7yWQ4rC6G
 JSpQQIS7vzQu6VEZnLUJMunAlQJaYOdotxn0WYdo/GjxIaEoFK321YIffiDgqDddCfNj
 jglSYEsRCRyYZlFmEvuFO69fQHhNQ8gRPdLhgN3EwxuojWDapXo7lwLMnP0LmYFMGV4Y
 rn+kayg5ZaWDSNqXIumLfIUOw7NL+hkKd9CS/sai0PV5JBqxceB5TLE1Z9LhasmCC/Kh
 CYwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz418OyajlGtnpkxmsidGKoh9wHR/I8/nelLwHZwWIAlN9midKg5uJJ6RzgSkji2BHCWG0oZnU3nki868QrL10Ry3/PfGERDLp8Il541Jx05iAoZki0/0p
X-Gm-Message-State: AOJu0YyN15UE1Q4g4PR3QfP89sl8ns8VW5yEtLML/vlpUXEADPBmfNmR
 3E4GJ2GaZINUsoxhuTnL9uDNEaCrMCFVWm79y050SMOAZd/zcG8C
X-Google-Smtp-Source: AGHT+IEVYnLUHa1kgLdWSapSU4Nr9l01XJ3I7VWvMs6KV7BVQGoIhoK6qMFuFZbgFcihFFyg/q6Bbw==
X-Received: by 2002:a17:90b:110:b0:2c4:d00a:15cb with SMTP id
 98e67ed59e1d1-2ca35c69723mr1851012a91.21.1720513423275; 
 Tue, 09 Jul 2024 01:23:43 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c99a92a430sm9588929a91.4.2024.07.09.01.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 01:23:42 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue,  9 Jul 2024 16:21:25 +0800
Message-Id: <fc69b94aad4bbe568dcf9ef7aa73f9bac685142c.1720512888.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720512888.git.0x1207@gmail.com>
References: <cover.1720512888.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 7/7] net: stmmac: xgmac: enable
	Frame Preemption Interrupt by default
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

Frame Preemption Interrupt is required to finish FPE handshake.

XGMAC_FPEIE is read-only reserved if FPE is not supported by HW.
There is no harm that we always set XGMAC_FPEIE bit.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index c66fa6040672..f359d70beb83 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -96,10 +96,11 @@
 #define XGMAC_LPIIS			BIT(5)
 #define XGMAC_PMTIS			BIT(4)
 #define XGMAC_INT_EN			0x000000b4
+#define XGMAC_FPEIE			BIT(15)
 #define XGMAC_TSIE			BIT(12)
 #define XGMAC_LPIIE			BIT(5)
 #define XGMAC_PMTIE			BIT(4)
-#define XGMAC_INT_DEFAULT_EN		(XGMAC_LPIIE | XGMAC_PMTIE)
+#define XGMAC_INT_DEFAULT_EN		(XGMAC_FPEIE | XGMAC_LPIIE | XGMAC_PMTIE)
 #define XGMAC_Qx_TX_FLOW_CTRL(x)	(0x00000070 + (x) * 4)
 #define XGMAC_PT			GENMASK(31, 16)
 #define XGMAC_PT_SHIFT			16
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
