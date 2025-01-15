Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF932A117C3
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 04:27:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7165C78F75;
	Wed, 15 Jan 2025 03:27:35 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E95FC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 03:27:28 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2166022c5caso97562495ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 19:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736911647; x=1737516447;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OA13Zni3URzGAidEIRgBrp/qP4ozxw97b88r2lO+YJs=;
 b=cX6l8IIfLc9cmF2kIuEAFjd4rSMheKRHs1sRyymmtNPz64qodoVVHMXU/42laHSXwC
 kPglMbsc5PhmRNnJlH3L8DLt+kxlgrEXenX8702lH4eUkMcACrierUYC0HAF4f5h3+3l
 5KONfp2o+TL/nR9vh91N/LiQIZjn7U4mOKf6s7UsaJB75vAglrnKXeDI26Jltl++Xu+H
 bdRnng8s/zHwaIa4DlhHKaJR4F1luurB25VYDudI0M5Inzv3GHkp0GfcKJdijMzTfKzo
 lQDCqqLNye9AqyPGFow4EdNNC7BqhCqD42Gz3Ccy616hjVYAgOKmZC5RGIyIRG/ww/5t
 wfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736911647; x=1737516447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OA13Zni3URzGAidEIRgBrp/qP4ozxw97b88r2lO+YJs=;
 b=WT1P1boEmwFijjT2DNo3T6GK6g/cI8FcF/AgOdzJNw48rTAz2VCYdr13J7NtcNph22
 dQcqNRxjKJOuFG1VKW+S2SUOqOj1xkZHyBBfiQPiqpSVnqsvCSznuGfv41vn29YDZjff
 fX6ltehFwmKgx5kMfKDzkwyA6Q3+vkuJ1HynxqlC7AlE8k2SdkBP4WLfaxDv7n61B/G2
 zqs4/hI4/OZ+tVwpihQNteSxog3MpHThL7qnpdD2n1Jta+CoKdzBIO9JnhguUOji2Ydh
 OAkvWjj7f0yv86HQTDQdiByLq/rDVAB5lqcFHcUAiBzQo+Ak/ETp2KKtMHXQ7kj/4njw
 5ovg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzMeuv46wEwRvPjFeY4QAehy1bzSjk2r+Oz0XxTYJlUCba067d56PoWuYbspjk6h36Jk/8liPFyYecpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNMXQYVOSFH4NtIZs5BFGvCbODFHH48SuE1niQYF4aMZAqj+N6
 v0Da2eJ7EMzppsEwiS38pCBN/BZX0q9MvlZVbHi6Gr5wISTRqzb0
X-Gm-Gg: ASbGncsxUWmmOyPOZTzYilX1R83Bkl9ibuZyY8XLlt8uXt0HAO4eTHs55Se4poVfXFR
 sfG5Bc8x+AJGVqCNuZq4QrRGJK/MC9EfXmXROVM4VMeZc/Uduv4H+pvXK0C0e1AXvoHK3XQIiFj
 a/5DdMtWn+WW3lOrBwSJK8h7Z+WbmuxF3dOAGf7WVp+QV3GwoaUZaS9ToXXejar7Z3EYweT09EY
 sSv/XD6NS461m5gbJJUzP7onXozxK55osqIl35beRbCjX+JItU7ztJbPT0Yl+PeVAk7Jw==
X-Google-Smtp-Source: AGHT+IFlSEMkAXEPqWgqCAfQugdN95Q538mq9KIKYO4zUWWbGb5CTB8WHYGyQSp6aFpnsVw3r4VLzg==
X-Received: by 2002:a05:6a20:6a11:b0:1e1:ad39:cc5c with SMTP id
 adf61e73a8af0-1e88cfa6a52mr49396788637.14.1736911646648; 
 Tue, 14 Jan 2025 19:27:26 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d405493basm8166452b3a.27.2025.01.14.19.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 19:27:26 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 11:27:01 +0800
Message-Id: <cover.1736910454.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Joe Damato <jdamato@fastly.com>,
 Furong Xu <0x1207@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v3 0/4] net: stmmac: RX performance
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

This series improves RX performance a lot, ~40% TCP RX throughput boost
has been observed with DWXGMAC CORE 3.20a running on Cortex-A65 CPUs:
from 2.18 Gbits/sec increased to 3.06 Gbits/sec.

---
Changes in v3:
  1. Convert prefetch() to net_prefetch() to get better performance (Joe Damato)

  v2: https://patchwork.kernel.org/project/netdevbpf/list/?series=924912&state=%2A&archive=both

Changes in v2:
  1. No cache prefetch for frags (Alexander Lobakin)
  2. Fix code style warning reported by netdev CI on Patchwork

  v1: https://patchwork.kernel.org/project/netdevbpf/list/?series=924103&state=%2A&archive=both
---

Furong Xu (4):
  net: stmmac: Switch to zero-copy in non-XDP RX path
  net: stmmac: Set page_pool_params.max_len to a precise size
  net: stmmac: Optimize cache prefetch in RX path
  net: stmmac: Convert prefetch() to net_prefetch() for received frames

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 34 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.h  |  1 -
 3 files changed, 21 insertions(+), 15 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
