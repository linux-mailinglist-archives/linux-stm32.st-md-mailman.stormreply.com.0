Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4756D456A9F
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Nov 2021 08:03:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBCE9C5EC56;
	Fri, 19 Nov 2021 07:03:35 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFEB6C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 21:42:51 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id f20so7584701qtb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 13:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=bozUgf/JVDF2e98+kGGhI0ahPdp4o4xUb4tT8hjMa9U=;
 b=fH70x1KjXkm8uy3kmKPOTiZnE/rXw9bnp9IGFoT6JpzTna6lLNGEUDXFNUA5+k6CNR
 vNiFUuAD3BcGAXp8eoAvx0jtcU+pftXPljd4AOMGOjyn/QOb2ICo7/Qfa8DYFSV+OLuA
 CgQGXdEmZ7S8A9PcSGOT++N8of31R4Hki9/k0OeUZ+MaECZ3AX3jLkRLONiDCXGcr5A6
 uAHhw/js1ZOfXHwBvAbFyoFZAJ3Tp/lfQGxu2HJP52DG6M3aIboV82ruOOQm+PWJ5vSl
 vjhe1VAW2DD1Ip7q6PP/YgdwW8RY+987CoCdaVGO/FTgXGdDPpDdvkrKM4pv3cHkOKGk
 w6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=bozUgf/JVDF2e98+kGGhI0ahPdp4o4xUb4tT8hjMa9U=;
 b=yrX5GOp+B4kiKp8QRCmSb0V6ZVnKzi26UB/n7S/W0rVsMmcOy7c32DE4bec4V6jdLe
 lH+RsSD139yFe2QzfAlqrW64uJXoEiLeRU+X98Zl6p9J1hnD5MfZmurwP+R/VnK3QBkh
 VNlCq2k1JrKGxu88Kr/TVYdZzmwLh/Bn0vpK4Aqrph3Tc2x5yE0JHHglopiOVja9UZv8
 WoPt4fa9ou8nhBokQKsEEy6bzEqk6ESCxPWA1ChR0Ui+G1dYPUWwKZKTB4DuCU8qCKrH
 aHRkFJpx0QKmrhshzqNje9RCDFm1La3w1jqxTtusbD4yEY/GDx2EdQUtlkv+NkcGfytC
 D6xg==
X-Gm-Message-State: AOAM531vC1RO2HAWLmhh0+WspaGfmEe2BVcJ8G5kKos5P63vothcH4TI
 OM12P8Ai8a2bKgksyy/+Gk0=
X-Google-Smtp-Source: ABdhPJx2j983TdsJHGBzYG1RBGVSh/tKIu6Ok29h5ntWsS4UxYP0c+eQXGFl2kzxAVfPBqMiMLLOHw==
X-Received: by 2002:ac8:57ca:: with SMTP id w10mr830467qta.88.1637271770675;
 Thu, 18 Nov 2021 13:42:50 -0800 (PST)
Received: from a-10-27-17-117.dynapool.vpn.nyu.edu
 (vpnrasa-wwh-pat-01.natpool.nyu.edu. [216.165.95.84])
 by smtp.gmail.com with ESMTPSA id t11sm528153qkm.96.2021.11.18.13.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 13:42:50 -0800 (PST)
Date: Thu, 18 Nov 2021 16:42:47 -0500
From: Zekun Shen <bruceshenzk@gmail.com>
To: bruceshenzk@gmail.com
Message-ID: <YZbI12/g04GlzdIU@a-10-27-17-117.dynapool.vpn.nyu.edu>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 19 Nov 2021 07:03:34 +0000
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 brendandg@nyu.edu, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] stmmac_pci: Fix underflow size in stmmac_rx
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

This bug report came up when we were testing the device driver
by fuzzing. It shows that buf1_len can get underflowed and be
0xfffffffc (4294967292).

This bug is triggerable with a compromised/malfunctioning device.
We found the bug through QEMU emulation tested the patch with
emulation. We did NOT test it on real hardware.

Attached is the bug report by fuzzing.

BUG: KASAN: use-after-free in stmmac_napi_poll_rx+0x1c08/0x36e0 [stmmac]
Read of size 4294967292 at addr ffff888016358000 by task ksoftirqd/0/9

CPU: 0 PID: 9 Comm: ksoftirqd/0 Tainted: G        W         5.6.0 #1
Call Trace:
 dump_stack+0x76/0xa0
 print_address_description.constprop.0+0x16/0x200
 ? stmmac_napi_poll_rx+0x1c08/0x36e0 [stmmac]
 ? stmmac_napi_poll_rx+0x1c08/0x36e0 [stmmac]
 __kasan_report.cold+0x37/0x7c
 ? stmmac_napi_poll_rx+0x1c08/0x36e0 [stmmac]
 kasan_report+0xe/0x20
 check_memory_region+0x15a/0x1d0
 memcpy+0x20/0x50
 stmmac_napi_poll_rx+0x1c08/0x36e0 [stmmac]
 ? stmmac_suspend+0x850/0x850 [stmmac]
 ? __next_timer_interrupt+0xba/0xf0
 net_rx_action+0x363/0xbd0
 ? call_timer_fn+0x240/0x240
 ? __switch_to_asm+0x40/0x70
 ? napi_busy_loop+0x520/0x520
 ? __schedule+0x839/0x15a0
 __do_softirq+0x18c/0x634
 ? takeover_tasklets+0x5f0/0x5f0
 run_ksoftirqd+0x15/0x20
 smpboot_thread_fn+0x2f1/0x6b0
 ? smpboot_unregister_percpu_thread+0x160/0x160
 ? __kthread_parkme+0x80/0x100
 ? smpboot_unregister_percpu_thread+0x160/0x160
 kthread+0x2b5/0x3b0
 ? kthread_create_on_node+0xd0/0xd0
 ret_from_fork+0x22/0x40

Reported-by: Brendan Dolan-Gavitt <brendandg@nyu.edu>
Signed-off-by: Zekun Shen <bruceshenzk@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d3f350c25b9b..bb35378d93bc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5164,12 +5164,13 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (likely(!(status & rx_not_ls)) &&
 		    (likely(priv->synopsys_id >= DWMAC_CORE_4_00) ||
 		     unlikely(status != llc_snap))) {
-			if (buf2_len)
+			if (buf2_len) {
 				buf2_len -= ETH_FCS_LEN;
-			else
+				len -= ETH_FCS_LEN;
+			} else if (buf1_len) {
 				buf1_len -= ETH_FCS_LEN;
-
-			len -= ETH_FCS_LEN;
+				len -= ETH_FCS_LEN;
+			}
 		}
 
 		if (!skb) {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
