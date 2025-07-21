Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 129F4B0BEF8
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 10:34:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5032C32E8E;
	Mon, 21 Jul 2025 08:33:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70CBCC32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 08:33:58 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3137c2021a0so2990300a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 01:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753086837; x=1753691637;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P7UTJT8lT4wXm+7/izafM3LkSsGFsZ5F3TgOwU6IHtI=;
 b=mZ3yetgQLg/zTzTYC0z3u4N5E8ry7m5qhffkn2PQBH83DQh6L7WzYuW/+gNE6Of6C+
 fXEXQtv8k2NVsy8S0JCzw8Jq1+4RmHpZ6mI66KHG5UkGecCDdwIAqUcecS8BTmJUxp4H
 yrsfaxwym3LwKUOEaksBgRt5RVBUbpeVaX7pJU419185JvBgvICf+qK8FEVqkHVL3WiV
 CwIFJMMwYVHEtf0j4sMdmOYcT7i+s2DRdDoYRrzK+zeLQyLkm6aptk2om4Xwwlt5iGcg
 zchK9z3nD7jLi9XK9p5oSAOeN3RJv4KNUSeMIrCeKcfjwNBs73f9ktu9xv3zapxFlP1d
 FO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753086837; x=1753691637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P7UTJT8lT4wXm+7/izafM3LkSsGFsZ5F3TgOwU6IHtI=;
 b=lVzGQJXvymfp/ZEJ982WfSDgwrDtpH58ixYJpwbCZT2n7vjK7dUkrSQWq9sko1Nxv7
 KtZl/+27q1FyK9pZULIgUVooZibJ3+T20ayaJztjp6nirrMNjEMIElNBHS5I1HIcn5gn
 DPSVeXTHx0C1WPGMZw405Le1Z6BC6zBFKQr0zUyOOFwu9ZWgxDCxVCyz4YypI9ADWMuI
 Biyp3ukTNGf7g3cycyVmONdpnUaTHy0bJYiRqBQVsXYU8u6OZQihmpB50n+aiSfG4/9h
 tbnPi9PHrU9L/vw6MgiBZYLFGYhEaddIb/7uDQfVo3X6eo/EeRELWE+wbyZQwqB7UU+8
 gGjw==
X-Gm-Message-State: AOJu0YwDoVFJYa0GfWWjf7fbtsUynVFE7MnXSh/SmQ1d1Tc+Fvq0cOlu
 Bg+v3s5kpEp/q9b+Bmzed1WsSt7H2DmsOOLAMBIRaB3wMQBO+AkJCru8
X-Gm-Gg: ASbGncucL1LJYZB+epcc7fDWQaS0CoI8uwV2aAVOxB0jRUJU/D5sNwJTgp59G1Xbsqc
 /GwYuSSYDoe4hDk3C2FUxwx7o1NMiszYNW3rkONRt/hkpk8JeHTrxKmQQL1WBcmFMYypUNjsLnb
 Dpamd3DnsnYJtyjbaQRi9LyenpfRf5CNbrF+qJ1eya5tDziQMEYiQVdt8F2IURyXMdO1LexGXh6
 brW2f4fN0zW7dxhoc32y9jJxsDMqnGvn3w9d/c+bbCXl+BJRz5zmkqOI4V09ynHw1lm4xEZhzNM
 HWHsIib+gn4jRToMbsddVHf2wIUlRlm1wAdo36WPpLQkKLzS87TsVNCrRVNVETbhTSOzdlktdVr
 QL3EWxVjsC9tEDqLX/OzQhg8+5Rf867q3VvOIv7Azm0MJMhkqmm+qCYmZXys=
X-Google-Smtp-Source: AGHT+IF8Hz+/t/2gY/ArGAcHrkTSl0567NOaqn1eqgYFznb2pekdZjDkcc5903EJP9BByp6s3l8uNA==
X-Received: by 2002:a17:90b:2e4f:b0:319:bf4:c3e8 with SMTP id
 98e67ed59e1d1-31c9e75afe6mr30594397a91.18.1753086836826; 
 Mon, 21 Jul 2025 01:33:56 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([111.201.24.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cb7742596sm7082116a91.27.2025.07.21.01.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 01:33:56 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bjorn@kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Mon, 21 Jul 2025 16:33:42 +0800
Message-Id: <20250721083343.16482-2-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250721083343.16482-1-kerneljasonxing@gmail.com>
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net-next 1/2] stmmac: xsk: fix underflow of
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

The issue can happen when the budget number of descs are consumed. As
long as the budget is decreased to zero, it will again go into
while (budget-- > 0) statement and get decreased by one, so the
underflow issue can happen. It will lead to returning true whereas the
expected value should be false.

In this case where all the budget are used up, it means zc function
should return false to let the poll run again because normally we
might have more data to process.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f350a6662880..ea5541f9e9a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2596,7 +2596,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 
 	budget = min(budget, stmmac_tx_avail(priv, queue));
 
-	while (budget-- > 0) {
+	while (budget > 0) {
 		struct stmmac_metadata_request meta_req;
 		struct xsk_tx_metadata *meta = NULL;
 		dma_addr_t dma_addr;
@@ -2681,6 +2681,8 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 
 		tx_q->cur_tx = STMMAC_GET_ENTRY(tx_q->cur_tx, priv->dma_conf.dma_tx_size);
 		entry = tx_q->cur_tx;
+
+		budget--;
 	}
 	u64_stats_update_begin(&txq_stats->napi_syncp);
 	u64_stats_add(&txq_stats->napi.tx_set_ic_bit, tx_set_ic_bit);
-- 
2.41.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
