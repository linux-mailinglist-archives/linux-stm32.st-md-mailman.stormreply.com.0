Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C72A117C7
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 04:27:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3611C78F65;
	Wed, 15 Jan 2025 03:27:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86DC0C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 03:27:48 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-216728b1836so108900315ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 19:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736911667; x=1737516467;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vrnZOWuzbTsFJQSfUdSJAVwNu1OpPEJIPOluJRIjDnY=;
 b=M/AJXC/CI09M+dO8DrplA4z9cvZKcj43LCg53tgDQEcJKE/kyAaNghv4xlgUa/5d+X
 mBYvmcAgjrGcLhDMt6YE9AIzVt4n3e5oGnUpW3pu7UTU2PioKI0wc7klelHmpdDpinmf
 cXJmOide54pGeunO9mkJapMLjy70iVyty67FdRngWutHLtZdrfymY4pWkZs+k6ZpJmze
 dLLFi6ATwVmX25myoQRA0gTGr16IyhmRv14ZJX4+OOGouKvVhs/BauzyPrwCL+4BweY8
 84tdOW6Nbqeebz1ipB36A63pWFmEbYQGQy30JdcmYD6ZIwZ8evo6/ZCLsvEhLD5YqdOK
 aRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736911667; x=1737516467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vrnZOWuzbTsFJQSfUdSJAVwNu1OpPEJIPOluJRIjDnY=;
 b=XCwVmk1fHIvU/HhZZYaE1v+Mza+NG9GZkVG0KLVHVRNsN+uCt3JbJKgHS+mNpeM+hm
 0cq0C6YGZKRH8mVnNCMbnhEjxjNNJz65ImsWQx5lWQ+TKAR1/ov8gioX65/eqNhsdVKS
 vbiNDfxsH0jsO9E6Ta8/OIcpd/6Qo5v3ZHRJSBi+PSZ6STuJr/U0JTLmQhPFR7ykvoxJ
 tCcYMvxkXvD0Mh9JhYx15IILkafBcmfsuxUmmTJThJO7Nd25kG3rK61o/l1ty0SmvaU1
 QjewOhDVBait2hV9zKPUzFkA/jF9HhUGDu2caToOblub+/qtc912Jru+ECL946SvWZsv
 A63A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWve465dvTcjSV0FMv2Z7PjHj1FcyHNZDgo9C1ncLHcfq210uShhAxftZx5qOiuI9xE0hoKS+CFtalBCg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSaCZJodBteMXWR5c6+eqImmbQJgEhLlTKvw9qeeInDLdI5jzq
 YhJwN3gMNz8S0PPxiYHqRAVpR8SASWJ2/yyVt7pcRXlPSXbwPnik
X-Gm-Gg: ASbGnct+sHsyqXGOlCGUmlf0PNsotUBF6XVIrcYlyTX5Xq4e1mnekNlmKRQxRYMdn7d
 cuEZYOgVOHWLBdBGFG47Cqhkxx8ZmOaDfYO9ywTxniELRtHS9uW5UmbS7jn7ubF0+5lWho1iFVS
 8KaFzLB5y1AW3og+bn6RyvQaWZ0eOxXTkWdtcIAjiWQ6g3rQTFa879mue+ttFXSbzF/ONXqx+O7
 f4OTN+en1XHlB+sYgLDZYX1FbLVJNVGbYynjZFNoH7FgnjsDGw59nP0fJiH0OJxkvLyhg==
X-Google-Smtp-Source: AGHT+IEgvbbedPhMmlQrROuWhBJEvCl3rJhkcO1ll2KbOYDFwCkOh7dbSjQ3/MMG4kA76MxUXWGidA==
X-Received: by 2002:a05:6a00:39a7:b0:728:e382:5f14 with SMTP id
 d2e1a72fcca58-72d21f314e9mr32614582b3a.9.1736911665971; 
 Tue, 14 Jan 2025 19:27:45 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d405493basm8166452b3a.27.2025.01.14.19.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 19:27:45 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 11:27:05 +0800
Message-Id: <909631f38edfac07244ea62d94dc76953d52035e.1736910454.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736910454.git.0x1207@gmail.com>
References: <cover.1736910454.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Joe Damato <jdamato@fastly.com>,
 Furong Xu <0x1207@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v3 4/4] net: stmmac: Convert
	prefetch() to net_prefetch() for received frames
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

The size of DMA descriptors is 32 bytes at most.
net_prefetch() for received frames, and keep prefetch() for descriptors.

This patch brings ~4.8% driver performance improvement in a TCP RX
throughput test with iPerf tool on a single isolated Cortex-A65 CPU
core, 2.92 Gbits/sec increased to 3.06 Gbits/sec.

Suggested-by: Joe Damato <jdamato@fastly.com>
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ad928e8e21a9..49b41148d594 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5529,7 +5529,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
-			prefetch(page_address(buf->page) + buf->page_offset);
+			net_prefetch(page_address(buf->page) +
+				     buf->page_offset);
 
 			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
