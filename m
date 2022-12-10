Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF49649F1F
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Dec 2022 13:51:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDBE2C6904A;
	Mon, 12 Dec 2022 12:51:20 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6CDEC65E61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Dec 2022 13:46:14 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id q6so1243044lfm.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Dec 2022 05:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SOpPPmLDqJRTyYLaP8xxRj41YiDFLX4ctufztbQrUmk=;
 b=UwqZ1nPDpvweqV6v0TwtlOlL/c2KI51y+8NZ0qz34khy5HB0gmlyBL+JsJpBCgi9/l
 O52dixnzjC0pZgv53iFc+8lil8rmlpjvef2c7yZYColfcMI5v+PP1yDE0M3uDHzPhGko
 AqDiyaC6RoEZErpBOuXkOUB+q5vkIEm68/ZWLBjpDFeFn+y6f50DILpcNfUiRkZH9qPi
 9mPpNN7p/b6bwwdazk0Rwdv6wDLYgK8QHRvSkPza4SCTpnbICDeR2OwY64sQETvq1xAI
 70tR+o5ihKGp37jL+HxcydWYpAgzcsFDUQeOysZiN6xN8ksLUXKnKH5eLbCjCj7Bd2bg
 J6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SOpPPmLDqJRTyYLaP8xxRj41YiDFLX4ctufztbQrUmk=;
 b=Mj+gQbRRF0XddAbHqTzbWk5bhw8u3zymAXbpHNBpP++4Mn5znPIXkA4pzYXb712Lxz
 WAgwlwzaRmFBYfn9UaMBxGd42trxjYMdY7CuOmCtrDMWpsKiHEdmilmUyiZeQbU7aSsV
 5MxgGjEGyThrbGCxnEyxM8XWoN8CpUmg5ScfSGAcIWE43MbbYjihQu6+hy6WPQqDemfB
 vdglA4BGYQLzrLWA+S8Ig8o6Hw3Lo6h+QkJSVIdmOIZKB+LRTuEiUm19jwsxKzBlwFvp
 G07uRjBIe0wrig26Rw3MOTy/XwYL0yyqqSw7gARAkgVnaShA55uojo4yWXYG0RkHvA82
 WtYQ==
X-Gm-Message-State: ANoB5pnM1dI1psMjM+XIPlA0IbiOdzUDqiuXRnJkW3azSSo5KP/W4nAM
 s5YBeI68XiLM6Or3YBuHxVh9jZWl9CrfaH6Y
X-Google-Smtp-Source: AA0mqf5gFIWUkXs49eMO7MYucarojrFRzL5C74/EWqmPPidTqtxMWVI8ay9PrNuMfh9GcX6XF34i/A==
X-Received: by 2002:a17:907:3e91:b0:7c1:13b5:c434 with SMTP id
 hs17-20020a1709073e9100b007c113b5c434mr12280469ejc.35.1670679471987; 
 Sat, 10 Dec 2022 05:37:51 -0800 (PST)
Received: from gvm01 (net-2-45-26-236.cust.vodafonedsl.it. [2.45.26.236])
 by smtp.gmail.com with ESMTPSA id
 lb8-20020a170907784800b007812ba2a360sm1017548ejc.149.2022.12.10.05.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 05:37:51 -0800 (PST)
Date: Sat, 10 Dec 2022 14:37:51 +0100
From: Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	David@gvm01.st-md-mailman.stormreply.com,
	"S."@gvm01.st-md-mailman.stormreply.com,
	Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Julien Beraud <julien.beraud@orolia.com>
Message-ID: <de4c64ccac9084952c56a06a8171d738604c4770.1670678513.git.piergiorgio.beruto@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 12 Dec 2022 12:51:19 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 net 1/1] stmmac: fix potential division by 0
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

When the MAC is connected to a 10 Mb/s PHY and the PTP clock is derived
from the MAC reference clock (default), the clk_ptp_rate becomes too
small and the calculated sub second increment becomes 0 when computed by
the stmmac_config_sub_second_increment() function within
stmmac_init_tstamp_counter().

Therefore, the subsequent div_u64 in stmmac_init_tstamp_counter()
operation triggers a divide by 0 exception as shown below.

[   95.062067] socfpga-dwmac ff700000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   95.076440] socfpga-dwmac ff700000.ethernet eth0: PHY [stmmac-0:08] driver [NCN26000] (irq=49)
[   95.095964] dwmac1000: Master AXI performs any burst length
[   95.101588] socfpga-dwmac ff700000.ethernet eth0: No Safety Features support found
[   95.109428] Division by zero in kernel.
[   95.113447] CPU: 0 PID: 239 Comm: ifconfig Not tainted 6.1.0-rc7-centurion3-1.0.3.0-01574-gb624218205b7-dirty #77
[   95.123686] Hardware name: Altera SOCFPGA
[   95.127695]  unwind_backtrace from show_stack+0x10/0x14
[   95.132938]  show_stack from dump_stack_lvl+0x40/0x4c
[   95.137992]  dump_stack_lvl from Ldiv0+0x8/0x10
[   95.142527]  Ldiv0 from __aeabi_uidivmod+0x8/0x18
[   95.147232]  __aeabi_uidivmod from div_u64_rem+0x1c/0x40
[   95.152552]  div_u64_rem from stmmac_init_tstamp_counter+0xd0/0x164
[   95.158826]  stmmac_init_tstamp_counter from stmmac_hw_setup+0x430/0xf00
[   95.165533]  stmmac_hw_setup from __stmmac_open+0x214/0x2d4
[   95.171117]  __stmmac_open from stmmac_open+0x30/0x44
[   95.176182]  stmmac_open from __dev_open+0x11c/0x134
[   95.181172]  __dev_open from __dev_change_flags+0x168/0x17c
[   95.186750]  __dev_change_flags from dev_change_flags+0x14/0x50
[   95.192662]  dev_change_flags from devinet_ioctl+0x2b4/0x604
[   95.198321]  devinet_ioctl from inet_ioctl+0x1ec/0x214
[   95.203462]  inet_ioctl from sock_ioctl+0x14c/0x3c4
[   95.208354]  sock_ioctl from vfs_ioctl+0x20/0x38
[   95.212984]  vfs_ioctl from sys_ioctl+0x250/0x844
[   95.217691]  sys_ioctl from ret_fast_syscall+0x0/0x4c
[   95.222743] Exception stack(0xd0ee1fa8 to 0xd0ee1ff0)
[   95.227790] 1fa0:                   00574c4f be9aeca4 00000003 00008914 be9aeca4 be9aec50
[   95.235945] 1fc0: 00574c4f be9aeca4 0059f078 00000036 be9aee8c be9aef7a 00000015 00000000
[   95.244096] 1fe0: 005a01f0 be9aec38 004d7484 b6e67d74

Signed-off-by: Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Fixes: 91a2559c1dc5 ("net: stmmac: Fix sub-second increment")
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h      | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 764832f4dae1..8b50f03056b7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -47,7 +47,8 @@ static void config_sub_second_increment(void __iomem *ioaddr,
 	if (!(value & PTP_TCR_TSCTRLSSR))
 		data = (data * 1000) / 465;
 
-	data &= PTP_SSIR_SSINC_MASK;
+	if (data > PTP_SSIR_SSINC_MAX)
+		data = PTP_SSIR_SSINC_MAX;
 
 	reg_value = data;
 	if (gmac4)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
index 53172a439810..bf619295d079 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
@@ -64,7 +64,7 @@
 #define	PTP_TCR_TSENMACADDR	BIT(18)
 
 /* SSIR defines */
-#define	PTP_SSIR_SSINC_MASK		0xff
+#define	PTP_SSIR_SSINC_MAX		0xff
 #define	GMAC4_PTP_SSIR_SSINC_SHIFT	16
 
 /* Auxiliary Control defines */
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
