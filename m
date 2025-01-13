Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AADADA0B948
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 15:21:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59B18C78012;
	Mon, 13 Jan 2025 14:21:00 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC635C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 14:20:52 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-216281bc30fso90507035ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 06:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736778051; x=1737382851;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yjgJEm+zsHpgnh6MvvlrOCLzGs3HMBzj7m6xU9nO/zQ=;
 b=J7QAYVa6b4ZM11i+nfEZrWLyUtOQTQ9Eh8kRSSdoJBiPzLf4oDKFJHnfGCEp8vTMv/
 YgVTkVIu8zi9ZJJB2pCkgRAjTJ0kmvhC7OCTEc5eVOTKJIKPBW4/KWe2VChMbkjJKCh2
 PPkL2ZmkvHwdBStTK/2OFcqFEtunkmfvnHvdOb2ncUinE3jUxIXZDiaWaCdfFI5SYYBI
 s+ta7TGFICtODg+0xvIvZWiK2p2JQLqpC930I6qcCdMa9SptRRZw+ke34s5S3twcJRRK
 t2TZ5Js3JZjszQ0xS0AerFVwYuSaoQiJbOxKKeKspmVKsdG6wSDDJXhG+s6OE5gHQl/a
 bzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736778051; x=1737382851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yjgJEm+zsHpgnh6MvvlrOCLzGs3HMBzj7m6xU9nO/zQ=;
 b=loWFV+eDrDoMvJsI9rNUOjesdjC4XmfGoyZBOTvkvvFT5RZEqvvT0G4MaTKr6e7HFq
 /E7HFID7kJ7dCW8gKiY+XY1XpHAi6aauCmL8tFbBuX+kPVkis8UsMY6r/7HElgaaelNx
 Loa9mm8noLRFmstqidNMt5Zor6V6ebOqf8wW3dEVfZAauoF35JmggZ4+WqhqgUtLLfDG
 gw7S+hIVX0awYhMpQ1siF7TBidUAVte6zAODbiiFFeJeE0sizngk6tt4UU9JwsvMIyib
 kj84eHIfJ/P2TZHgE2SahgyMk1CDYU/bfg8ZUrBwlYQ/lY17P+ajjBHS9q+d4+QxbvT/
 zjaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsG87Z1TyRuJIdrEhYqY6plnJ+NzpNidWme5e6KI0P4W6JrKQDOeV1UWFex+s5pK7SgrfI+CHYhS2azw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxfn0OMk/XLYFnqGRNgKTylmMNhiM803FdswiCKunGwL+DCb+oe
 9c1/yKuatwb/7+FD8yqRLwMfK8cRSQalRNB57RUPGXCSaRmG3vmd
X-Gm-Gg: ASbGncuyPdYM1A/osuIlw2b8D9FTJZC3ybfU5pBeXTzkJ8r3+zrxq0XcCjFSFXUBwkP
 uqNF4EFIErS1eGYiAduBnX6m4hIN0oIvkyqEL0aXtnjpyHZqX3UMmv3gc3UaAmRV+fhGogTLOGw
 AGrSr/FYH8aw31fKep8fPWwaCNACN4QEcLMYg3ismDxplpLfERDgfatl0MxBkkZ5pL10hlNNxHn
 1dp4qt/dNiNsfgw9bki9rjRMQdKhJ6IubTWNw0aL7DKlRZHFHcmx44PBGsfMsSaOE0brw==
X-Google-Smtp-Source: AGHT+IGOgpQygxHN474HH35BO8I0IxWuOevbbQ53X03NN01ieJAvLtEHwfIjUcmb+msVKrMaDxXj3A==
X-Received: by 2002:a05:6a00:3c83:b0:71e:4296:2e with SMTP id
 d2e1a72fcca58-72d21f4bc9emr28805500b3a.11.1736778051319; 
 Mon, 13 Jan 2025 06:20:51 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d4067f0d1sm6089222b3a.136.2025.01.13.06.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 06:20:50 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 13 Jan 2025 22:20:28 +0800
Message-Id: <cover.1736777576.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Furong Xu <0x1207@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: RX performance
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

---
Changes in v2:
  1. No cache prefetch for frags (Alexander Lobakin)
  2. Fix code style warning reported by netdev CI on Patchwork

  v1: https://patchwork.kernel.org/project/netdevbpf/list/?series=924103&state=%2A&archive=both
---

Furong Xu (3):
  net: stmmac: Switch to zero-copy in non-XDP RX path
  net: stmmac: Set page_pool_params.max_len to a precise size
  net: stmmac: Optimize cache prefetch in RX path

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 33 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.h  |  1 -
 3 files changed, 20 insertions(+), 15 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
