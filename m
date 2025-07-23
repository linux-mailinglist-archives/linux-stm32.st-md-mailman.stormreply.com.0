Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD33B0F52B
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 16:23:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4C4FC36B3F;
	Wed, 23 Jul 2025 14:23:50 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A23EEC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 14:23:49 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-23f8d27eeeaso18495465ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753280628; x=1753885428;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fj5WqG0SJ2Uu2EiwaVSrVFDSkAPLmbdJzZnTerK4rAc=;
 b=mws0rAufmTJGy+y5bX7dROXdnqOcynsTJhGI8CgUzISbAAOSCiRzY/RfwGtFrXwNyg
 532XwFdC0GNfIy+uDkGghk2HXEQywi4FlHyXPuGdZUpy5T08xpdnbRo33R7l7mma1lnr
 6hK+1/GSqp0WjB1seKuutb+gWz5KESQMs53tQVTGqh43GXVQYJh7B4ZsCHHitl6krOPa
 ou2ONNM8COsnZZDlI53uHeJaakWVkpRb9bFHD9jQCNODMoCVnjlFRH5477sBv9iXwvlT
 8Vbwq8StpwTPX7Jh45gePJGbFIs9ittmBQguWyVDci39vpnc/gdoxYy5j8pDlJ0fax/Z
 Oadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753280628; x=1753885428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fj5WqG0SJ2Uu2EiwaVSrVFDSkAPLmbdJzZnTerK4rAc=;
 b=RWQ7tQ9CrbiFi39V3Hi5HxEvfi7iMyqHZ4L55mYXIEH52tlGLXbDios1VKIBdjOr93
 BrT51TvWWe0SQGLTZDLi83bQQi+qyuxracCVllwnaVuxyDi3luu0GrpIsjiVuoSOLiNo
 8insilD4QEOXAy1MEc6g/CkL4m/t6FuTM/AyhSpZO3CFFc8bUupDt40aBpJq0ig/hWHO
 PWMC4f+UoED9hP9RYJBSWHvwkxkEMW0azMcHGbSBwnDGOghkgV2INzyRkjnfsHmfvYc2
 WNFYRIJH7a7eawdwCIxxqIixB8u70EwNglEF6l/Ldm1C8/QtRZ1WvewOHHJccmSnE9u3
 3EWw==
X-Gm-Message-State: AOJu0YyujbTm6Cd7PwqhgKUfZDhzzc+vVlgz1EqLn0prgHGply7XcnRL
 L/dcq2hk7AdIH+S8nERMk+9bmhSOSlpDQVT7VQH0vFjoHwpbrTm2O4HL
X-Gm-Gg: ASbGnct1WR5/PhuAqtRy5KlqqaR4j9stlLeer5ZvTb2KjkkPXCbZKsARmAdDbw4cLVF
 XdsiDWptZIMlqi/dTnKbX+ZUcbJpFCscLJ/hftYthxqOqASD0GfthoapPMe0LHvLPOzVuQwEUnM
 CVa0+o4cRAAlQ8jvBYos13iS/aUHEjhvFq5uAJQInZXDf/yyD8HAV0w7rRxuRQ0DXhee0OVxi3V
 FMqFhhR25ZMSLhRcwdauJcdjFGacxBs8gfgXmLI+P28GWdz6lXM90xY5i3vwq+WjvLTLtj/Ml36
 A5RCSvRbWTP7tQCdQPtbqm1H2t4KHHb779Fb5oCQGkZwj+ann7/an9Gv3SFjUeX0BN4va1pyHzg
 7kY7mdgtY1CJJK075sLZ+xvpcpxTWx7NcsHYWnlRMBUeAITdTjhXqtyy2tq4=
X-Google-Smtp-Source: AGHT+IEnG0E7oKJq09UZhheN56FjJBTTkrONfklWiZ/yow6qAsYP7nD7qZdnI57JncC+db1EnBFkKA==
X-Received: by 2002:a17:903:1aa6:b0:235:f3e6:467f with SMTP id
 d9443c01a7336-23f9812b4bamr50464715ad.2.1753280628189; 
 Wed, 23 Jul 2025 07:23:48 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([111.201.28.60])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4a9esm97929595ad.93.2025.07.23.07.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 07:23:47 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bjorn@kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Wed, 23 Jul 2025 22:23:27 +0800
Message-Id: <20250723142327.85187-3-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250723142327.85187-1-kerneljasonxing@gmail.com>
References: <20250723142327.85187-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net v3 2/2] igb: xsk: solve negative overflow
	of nb_pkts in zerocopy mode
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

There is no break time in the while() loop, so every time at the end of
igb_xmit_zc(), negative overflow of nb_pkts will occur, which renders
the return value always false. But theoretically, the result should be
set after calling xsk_tx_peek_release_desc_batch(). We can take
i40e_xmit_zc() as a good example.

Returning false means we're not done with transmission and we need one
more poll, which is exactly what igb_xmit_zc() always did before this
patch. After this patch, the return value depends on the nb_pkts value.
Two cases might happen then:
1. if (nb_pkts < budget), it means we process all the possible data, so
   return true and no more necessary poll will be triggered because of
   this.
2. if (nb_pkts == budget), it means we might have more data, so return
   false to let another poll run again.

Fixes: f8e284a02afc ("igb: Add AF_XDP zero-copy Tx support")
Signed-off-by: Jason Xing <kernelxing@tencent.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
---
v3
Link: https://lore.kernel.org/all/CAL+tcoAnB+8ZLPyWQ3XsvWTa=JO1yCKWvrKVp+2WCP=kGpfSPg@mail.gmail.com/
1. collect reviewed-by tag
2. replace 'underflow' with 'negative overflow' in a technical way.

v2
Link: https://lore.kernel.org/all/20250721083343.16482-1-kerneljasonxing@gmail.com/
1. target net tree instead of net-next
2. use for loop instead
---
 drivers/net/ethernet/intel/igb/igb_xsk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igb/igb_xsk.c b/drivers/net/ethernet/intel/igb/igb_xsk.c
index 5cf67ba29269..30ce5fbb5b77 100644
--- a/drivers/net/ethernet/intel/igb/igb_xsk.c
+++ b/drivers/net/ethernet/intel/igb/igb_xsk.c
@@ -482,7 +482,7 @@ bool igb_xmit_zc(struct igb_ring *tx_ring, struct xsk_buff_pool *xsk_pool)
 	if (!nb_pkts)
 		return true;
 
-	while (nb_pkts-- > 0) {
+	for (; i < nb_pkts; i++) {
 		dma = xsk_buff_raw_get_dma(xsk_pool, descs[i].addr);
 		xsk_buff_raw_dma_sync_for_device(xsk_pool, dma, descs[i].len);
 
@@ -512,7 +512,6 @@ bool igb_xmit_zc(struct igb_ring *tx_ring, struct xsk_buff_pool *xsk_pool)
 
 		total_bytes += descs[i].len;
 
-		i++;
 		tx_ring->next_to_use++;
 		tx_buffer_info->next_to_watch = tx_desc;
 		if (tx_ring->next_to_use == tx_ring->count)
-- 
2.41.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
