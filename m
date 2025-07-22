Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03588B0DB98
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 15:51:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BF15C3F93F;
	Tue, 22 Jul 2025 13:51:19 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4124C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 13:51:18 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-74931666cbcso4467021b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753192277; x=1753797077;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfSN2l4c7VqJYrvavlefqicQxHjGsCFmso72HdHciEk=;
 b=GgZNIuY7nEqS9R/4ZtD93d9Ie6J19pe83NXBmt0L/sztp69Zz5CRoKq9eL2UMQRBcn
 ytYGoe42H8mhcC8/EvnDO+gBAFLWmeQjBxz/4ssGUjFgBxXvlBuARqVs34RMX0HgRsxY
 BAgLI4uXgOVYRxLSYtAVpCaZQCe8JknIU87sdN9CwMTCFvdTbd256K+ZVt4WCgDMoEi1
 zNRSGfuoyVZafyRhp+SUl7deVZYSTLSZRgf3MRAcGxR22s5J2vrK48zmVESOAsB/ySw3
 58fFHALDee1u7kVcu+mUrlD3/3oZ15WW9qb/fPqyGtjkhYrBjAulTsmCziGsSIThIqqD
 Z8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192277; x=1753797077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfSN2l4c7VqJYrvavlefqicQxHjGsCFmso72HdHciEk=;
 b=eYWIAFClyIYjEpTPH2IMGEQqSiJACcWQGMYW/F3D7KvHeE0jalUK+v2lLm8y4MvBL6
 4bXZ2t5B/tOrqNxWVIAQsDYEpOGX05yY8fnD6xRu53U6dXkHqRInETtzxE0QhWkOGVR+
 LMlZYd0kvpPCHNdVEtO4OF0dvai1Zmk2YAWCSyuDnGFc9+mbNLRKg8EkyXIE3B0KHytQ
 6SWkmlseWjgaVKBUu4C6Ik4UtDmoynZnVHZTG+J/m+WHP0wd/lwc6nQukOJk2l3mn4qo
 7ZXQOhrbWjr/jOl/vIw8kgDsj7bXowzAuI/JJSpLTE7xypzxepZgdQXYe+Q6HfSYZlX3
 LlGg==
X-Gm-Message-State: AOJu0YwLXBBkbsnEQmRPeiDmYR/BrvbfXDSlnf0p1peOXC7gKZ9qy+Jm
 fWE3qgfIWACLm2MYUry+Q00NDBVQVczMbv3gof8XwLeGwx6sT9e1cl1d
X-Gm-Gg: ASbGncvD7K5jrAS6LWngBv35L6yEgJ9fEjpYwLk4ZQDWfrUOMMVOnguYomZZrupcKOv
 HT5RJEr7fAS82gCsbokjTgSs8WzihH+pThb1E6T8908AuWAhUNKXvZPJt3bLeSmLfSRG3nAtETC
 UonkpgpjKW2n3vMsNdi19m/YF07TBEzM1edk9Fxs7R5iEU/ahATrqTw2ZFsET03WJuJNyjalTVx
 T774luJJL7NlR8LzHSgNTS7xbgqRKrhXlKMZNQcO4akws0E4kMPyJZCs9Lk+Wozl62ubCIJwb7F
 MZZM3cEN+YBRd8ofLmmErEipLVKkgnSyQ6CUGbL6Ev1o6BfeAjF64prYbRCM9xLGjPZgaxZANOB
 6bVbpjCStJcIOaaQUbL2gRYzlRWQXnVyvGtfkamEhcfXG8StWt6DgTAc8H3A=
X-Google-Smtp-Source: AGHT+IF1txECS8N2+rVOMQa6ZXA3/XztzaqWOOy2pOPBvGSGpz/Xa4Hvd3Atqdn/nx9Z2GxJpZQmWw==
X-Received: by 2002:a05:6a21:2d8f:b0:232:7628:9968 with SMTP id
 adf61e73a8af0-2390da51452mr32513911637.1.1753192277309; 
 Tue, 22 Jul 2025 06:51:17 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([111.201.24.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d3190sm7612924b3a.39.2025.07.22.06.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:51:16 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bjorn@kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Tue, 22 Jul 2025 21:50:56 +0800
Message-Id: <20250722135057.85386-2-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250722135057.85386-1-kerneljasonxing@gmail.com>
References: <20250722135057.85386-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net v2 1/2] stmmac: xsk: fix underflow of
	budget in zerocopy mode
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

From: Jason Xing <kernelxing@tencent.com>

An underflow can happen when the budget number of descs are consumed.
as long as the budget is decreased to zero, it will again go into
while (budget-- > 0) statement and get decreased by one, so the
underflow issue can happen. It will lead to returning true whereas the
expected value should be false.

In this case where all the budget is used up, it means zc function
should return false to let the poll run again because normally we
might have more data to process. Without this patch, zc function would
return true instead.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
v2
Link: https://lore.kernel.org/all/20250721083343.16482-1-kerneljasonxing@gmail.com/
1. target net tree instead of net-next
2. revise commit message
3. use for loop to replace while loop
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f350a6662880..c4cd4526ba05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2596,7 +2596,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 
 	budget = min(budget, stmmac_tx_avail(priv, queue));
 
-	while (budget-- > 0) {
+	for (; budget > 0; budget--)
 		struct stmmac_metadata_request meta_req;
 		struct xsk_tx_metadata *meta = NULL;
 		dma_addr_t dma_addr;
-- 
2.41.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
