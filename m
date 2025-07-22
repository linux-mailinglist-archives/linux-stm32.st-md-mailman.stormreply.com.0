Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA16B0DB9B
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 15:51:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE32C3F93F;
	Tue, 22 Jul 2025 13:51:27 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BDA8C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 13:51:26 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-75b5be236deso2201828b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 06:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753192285; x=1753797085;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pD/wWijrKvVTR2o9RA6CvKO4pRLA1Dtb3qzUWgqM4ys=;
 b=P7jWJXF3zlmB5UE9Q9iKF7u4ywIXZpYXiONuMaT8Sk0xSRkOQP6T9guhdLs174JWjB
 QoMDijx19UxM/A2kHrjIMeXJywq35CfVBM6HdE0F0A6I/lRR6ZUmIMoyqefl/Tdbd7wL
 QbX+AhmWkQv87s6gboN6DYS0gxhL2Zgdp1jp+ZJBYNfSbl2uEcHw+QKsTtCpFSIT9V9v
 XLpF7eVfmbZ1d+iJEntJBmOKyannJFgqKNhLaQkqmDrkZDOAwOr2QbOzuf29nUCypTh6
 kwv+rqWjVhyFpyuHTJfnAH8iuxTS1zbGzR4xJ29nG+wkCpEtQa5ErSEei2Mx2lh7VeAX
 d8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192285; x=1753797085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pD/wWijrKvVTR2o9RA6CvKO4pRLA1Dtb3qzUWgqM4ys=;
 b=ndw//wi2rZTLIN7jgu3157Ky7XM4SraufvugrISIEjd9jITeLVP7iIFsYbkVHh9Abi
 lXZxyeN52E0kAEB5vJ7dPN9VEWT2WxKrG/KHI9PSGez9ZvaVUGeBnAjSMu+f3mCIZOEb
 ozbRUSxbPGHOQ94bFpoiCLIL2gQycAMirQTUSfmvpAhniXkuejzKmjze0IPNREmTWfBm
 0TJ3NE8J+7p+E1VDWkI/hHZhZJL3ig072zC6ME2m2bOHSI89/trAztnMDtHmiMq8zJc/
 J0Iu7yCvLE72Z5bTyrr2oS/wBDb6ZIA6KZvGdoSHbc1YWmvUKUc6tZql/V7DSe4HHgdX
 wa5g==
X-Gm-Message-State: AOJu0YwhOCSWbc1KeyUT/s15O8nQkn5w1G8zrc4Op5OjQwbKIkIp/Lnt
 rvZYPEOR8HlN4wOIE824dGUFpHl8aCFu4JH4ikj+9YLwR0e55R/Ma3sMaAnzOzXSFsg=
X-Gm-Gg: ASbGncuVT6J6REuNKF8g/VJsxMOR8FMqmfar4RNud3D5ZZYo28m+pnsAlZnRG0WxBT3
 PIQqLLm0To3A69UNv76jzjZjlb+Tbit0GfY7HgOJ/QhbLkCEynSrzOwD3oPtX5RGd+BRzlK3E6s
 wKFqP5ssOCS2u4jio+9l8qiEOeq2AFkrlrqhL/nuxrFo/qsk9JXhHMQVG02NWM6bQYoyRj68/k+
 5b9S9Kf32Lgn383LJN9De0UPFKouJrkF8njXIia4RAmF52bMMAnjqDiKu6o0aU/jE8Bbtl8hsla
 Ek8+UZjG764XqxavRPu4V3hvPZ+f1UOioEjztyeppKIoLTAYwqfQmNZeBhfTbUl9Q4B4JFlVhZI
 65czYYpSnXoV5b4n7B0yI3ruksAMf/D8GmcSyEqMyjxhvERRJ77pI8+c+ClE=
X-Google-Smtp-Source: AGHT+IHXWDumReUd0Q4eySHgoAYL7xXcdMWiTo0JJ05taBpvZ5tBQBZAd1EkCjnN//6RaGRS96p7Sw==
X-Received: by 2002:a05:6a00:1749:b0:747:aa79:e2f5 with SMTP id
 d2e1a72fcca58-7571fd0736bmr32671103b3a.0.1753192284817; 
 Tue, 22 Jul 2025 06:51:24 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([111.201.24.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d3190sm7612924b3a.39.2025.07.22.06.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:51:24 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bjorn@kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Tue, 22 Jul 2025 21:50:57 +0800
Message-Id: <20250722135057.85386-3-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250722135057.85386-1-kerneljasonxing@gmail.com>
References: <20250722135057.85386-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net v2 2/2] igb: xsk: solve underflow of
	nb_pkts in zerocopy mode
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
igb_xmit_zc(), underflow of nb_pkts will occur, which renders the return
value always false. But theoretically, the result should be set after
calling xsk_tx_peek_release_desc_batch(). We can take i40e_xmit_zc() as
a good example.

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
---
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
