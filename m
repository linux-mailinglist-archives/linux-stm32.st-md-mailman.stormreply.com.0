Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C8EA08CFE
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 10:54:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26A69C78011;
	Fri, 10 Jan 2025 09:54:17 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CCF1C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 09:54:09 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2166022c5caso28759045ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 01:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736502848; x=1737107648;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nFjtc361L1m3WrvhcILanOsHvqG76+wLYkWt5yxv28I=;
 b=FvB4PUPdYqqutseuSQ9hWM2OKdY17RYvaO0UFESHtEN/P6q3PhS9Go3nj3qpwiqQ8o
 2wWBCssoPWmii7hEQwasllj3VzR+kXalHuoVe6waDJRLwG2bj8IXgBSaOUHHhmq11DRZ
 W6lmUq80hoPm1/OVEHOYCjQan6taUmREQvCP6DCC54o1cNo6TrrqbEViXALdiHAvB3YZ
 Ks7CEimkiIde2JG3TwyoPTHRDEXy/vxSaMXNgNnmlKRgdYKOTLpRNSSwosE7S4j4E5C4
 BWW8DQGDUye/8/Ko7qylkZV5Av5wyqMTPk5PNHP/l+aGunkP0cQE2+vs/QGLDs8IRS2Z
 2UAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736502848; x=1737107648;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFjtc361L1m3WrvhcILanOsHvqG76+wLYkWt5yxv28I=;
 b=FVBB/bCvgAepYY31MGVTUkXCNMQqM9nZUP5N4JeJZ/SeLlOp9nQAKdUnYTXkKLWXn1
 94aRXt901WOvqh6C7VC1R7JmEKoXvH+8Yph5peE7NpFJyl5xbtsjWbK1ttvMivglJs/Q
 DNby3lq/FVOTZ14vTX9u0YtdqUMwWVkGQ38GO1+KIvDT2Q3OVF3yQ3tGlS3HSQTtHKWr
 ibTsUZaIVwkR59epyuMbaIbJlApZIALSCesq/CbLZ/MxpNr6++3yiX8gTsAR/QLEHprk
 k+yVs0qATEiZUTHtDzvZiHFUClojpvN0RGXuhK/Z2XBZ0Uu1LGkUXj+1BWsGcAUFDsU8
 069g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5QMhlbIgu+3POyzvNZI+MM8RKyeQFKXNOLfPjbZ4z7Lv8zZ86dk0WBAAq5RrfIetxE133M1m02umayg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz8WInlc/3bBbiOm2sk1QcU4Y1HvH8DVHwVuyW8Y/VQgIrBu7lP
 3xagcwI6Ps8I/SPAUUGEZByyZFrCCoPUjkut57LyVaK5LdDEVCGf
X-Gm-Gg: ASbGncv8EJAtKLlgc+Ayl2ltdlcVvMJc5giMWQVXlJtZeziDkJOYtH6L8N36VLgLLQ+
 Bw6GqKGRmAW7dGGNwWk2V0W04nCRh59r0CRDlOKyN7Kpf4WdAaczK3ra24apErq4oaYmeQ56LPp
 EmwiwzeVbvLnJt+nSXzU60nE6Gp5HPNKnZwHoT/Gbljxe5jLbqceOSYGwJsx16dOHPX40v17QnM
 I/qKoKVXnd0S2RoUApON8kH45du0kp2P01Kbwt1dcBsVS5ZyA+pZDpxGCX70oT1VIXf0w==
X-Google-Smtp-Source: AGHT+IHidL4NMTe1WTqflVHXmcGk6gO9iCsHE6DEmrgSOMzB5+zgj5qg5pxONnHGy9PfSNiUkL8Uog==
X-Received: by 2002:a05:6a21:4a4b:b0:1e0:cbd1:8046 with SMTP id
 adf61e73a8af0-1e88cd28733mr15562582637.0.1736502847835; 
 Fri, 10 Jan 2025 01:54:07 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d4069217dsm1186183b3a.151.2025.01.10.01.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 01:54:07 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 10 Jan 2025 17:53:56 +0800
Message-Id: <cover.1736500685.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1 0/3] net: stmmac: RX performance
	improvement
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

This series improves RX performance a lot, ~34% TCP RX throughput boost
has been observed with DWXGMAC CORE 3.20a running on Cortex-A65 CPUs:
from 2.18 Gbits/sec increased to 2.92 Gbits/sec.

Furong Xu (3):
  net: stmmac: Switch to zero-copy in non-XDP RX path
  net: stmmac: Set page_pool_params.max_len to a precise size
  net: stmmac: Optimize cache prefetch in RX path

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.h  |  1 -
 3 files changed, 19 insertions(+), 15 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
