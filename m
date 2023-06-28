Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB55C7418B9
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jun 2023 21:12:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C2E7C6B454;
	Wed, 28 Jun 2023 19:12:52 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C94EEC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jun 2023 19:12:51 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4f8775126d3so8931005e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jun 2023 12:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687979571; x=1690571571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=loBTjqMQzL1qOkM4fTRAj5saj6jNoXL7fSZ6/KpKw/s=;
 b=um1qB32YpWtr+RfO3SmTUmqVpN2dw6Ml2eKQRlQtAz95z7bLxFKBS+5BFrQ4YB45KE
 PAnZ8kynAqfrvkZgAzeO6ub3QQxM/xx5P7o0dvzsRjNI+lUldLBR5LpmOeEBxTQIj+bV
 NME3x83pKxZamo/XV4feUD7Niz5Wpzk97rXb7JEhHz/oB/DqLPBWv/48fcuyDMNt1pDd
 ZfB0EkTLXHdESaGh0qRH3rGslAgZ6nW5V0PHl+CN9NH5Hli3/n/inbOe34JZzHgXt5+R
 ER2UMDCluuKmKfAD0vWX86p2ma8sCDx2N61lHe1GpRk5jxZQdyXZzbPKBNM25vDegp7h
 BQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687979571; x=1690571571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=loBTjqMQzL1qOkM4fTRAj5saj6jNoXL7fSZ6/KpKw/s=;
 b=lHStixEbHrkZyXzcFS7QVybgKz8SEyjFVJqmV/qlF1NFKkEENhGRUTCNoxVLEfiAIb
 JTCCq2X7xqogDz1q2O1ipZmLDpmjhIsWGqOODqxpsN3pszZj+DvZNEGYu41/Qc2Tb9wh
 4CdN/EBWVfHyKmdcXJ6M7awc5353K0CLWftYZv0dxoMomQHcK0h21PaGHHAc34ofMFIF
 eGy4sCDOucQQ1qL5vFu6x7TlEzwZeq9rkwLtwiFOa/T+wtZDcTOcWPGIa+TH5a00PRto
 2SUeZgxwWqO/BlX++KGqDtlTcd8SiQLdui4MbxRt4YL71sgj4rI265rXyCkIrmswHYIS
 EnGg==
X-Gm-Message-State: AC+VfDzHshWNRg69HlXvywMEVeaWrwMlxi1TZ3ZRcABj65eMCddbk2vf
 +juTvn15QMBCR5s54NLlu5imrw==
X-Google-Smtp-Source: ACHHUZ69Ai+7MyojdQtWcZuzs5axrPhCMssnMDvTiePKF39XhLLQDZaCiIq8rOAdUypP6yVcDVmvew==
X-Received: by 2002:a05:6512:39d4:b0:4f9:607a:6504 with SMTP id
 k20-20020a05651239d400b004f9607a6504mr17192132lfu.29.1687979570877; 
 Wed, 28 Jun 2023 12:12:50 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 w25-20020a19c519000000b004ec84d24818sm2031624lfe.282.2023.06.28.12.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 12:12:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Date: Wed, 28 Jun 2023 21:12:43 +0200
Message-Id: <20230628191243.3632401-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] mmc: mmci: Improve ux500 debug prints
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

To conclude the ux500 busy timeout fixes, this improves the debug and
error prints so we can see a bit what is going on. Here is a typical
dmesg with these new debug messages enabled:

[    2.648864] mmci-pl18x 80005000.mmc: mmc2: PL180 manf 80 rev4
     	       at 0x80005000 irq 81,0 (pio)
[    2.662750] mmci-pl18x 80005000.mmc: DMA channels RX dma0chan4, TX dma0chan5
[    3.480407] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06
[    3.487457] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06
[    3.998321] mmci-pl18x 80005000.mmc: timeout in state waiting for end IRQ
     	       		  		waiting for busy CMD06
[    3.998535] mmc2: new DDR MMC card at address 0001
[    4.000030] mmcblk2: mmc2:0001 M4G1YC 3.69 GiB
[    4.008361]  mmcblk2: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15
     			 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25
[    4.017700] mmcblk2boot0: mmc2:0001 M4G1YC 2.00 MiB
[    4.020477] mmcblk2boot1: mmc2:0001 M4G1YC 2.00 MiB
[    4.022125] mmcblk2rpmb: mmc2:0001 M4G1YC 128 KiB, chardev (246:0)
[    5.791381] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06
[   10.938568] mmci-pl18x 80005000.mmc: timeout in state waiting for end IRQ
    	       		  		waiting for busy CMD06
[   17.982849] mmci-pl18x 80005000.mmc: lost busy status when waiting for
    	       		  		busy start IRQ CMD06
[   18.683563] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06
[   19.385437] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06
[   20.493652] mmci-pl18x 80005000.mmc: no busy signalling in time CMD06

We see a lot of lost IRQs and the timeout always occur while waiting for
the end IRQ, and then the busy status is *low* meaning the busy indication
is already de-asserted.

So busy signalling is missed in various ways for various reasons,
sometimes it appears that IRQs are simply lost.

One hypothesis is that this happens because the events happen so fast
that they are transient, and since the MMCI state machine in effect is
handling an edge trigger (rising or falling signal on DAT0) the
internal logic will miss the event, because the state machine in the
hardware is sampling the line, and will at times detect only the first
event but miss the second, fireing only one IRQ.

We print the second timeout error with dev_err() since it is pretty
serious, the other events are so common and simple to handle that we
can keep them at dev_dbg() level.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mmci.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 4fd28eaadc07..5d05269a8567 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -734,7 +734,8 @@ static bool ux500_busy_complete(struct mmci_host *host, struct mmc_command *cmd,
 			}
 			retries--;
 		}
-		dev_dbg(mmc_dev(host->mmc), "no busy signalling in time\n");
+		dev_dbg(mmc_dev(host->mmc),
+			"no busy signalling in time CMD%02x\n", cmd->opcode);
 		ux500_busy_clear_mask_done(host);
 		break;
 
@@ -756,7 +757,8 @@ static bool ux500_busy_complete(struct mmci_host *host, struct mmc_command *cmd,
 			host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
-				"lost busy status when waiting for busy start IRQ\n");
+				"lost busy status when waiting for busy start IRQ CMD%02x\n",
+				cmd->opcode);
 			cancel_delayed_work(&host->ux500_busy_timeout_work);
 			ux500_busy_clear_mask_done(host);
 		}
@@ -770,13 +772,14 @@ static bool ux500_busy_complete(struct mmci_host *host, struct mmc_command *cmd,
 			ux500_busy_clear_mask_done(host);
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
-				"busy status still asserted when handling busy end IRQ - will keep waiting\n");
+				"busy status still asserted when handling busy end IRQ - will keep waiting CMD%02x\n",
+				cmd->opcode);
 		}
 		break;
 
 	default:
-		dev_dbg(mmc_dev(host->mmc), "fell through on state %d\n",
-			host->busy_state);
+		dev_sbg(mmc_dev(host->mmc), "fell through on state %d, CMD%02x\n",
+			host->busy_state, cmd->opcode);
 		break;
 	}
 
@@ -1503,6 +1506,20 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
 	}
 }
 
+static char *ux500_state_str(struct mmci_host *host)
+{
+	switch (host->busy_state) {
+	case MMCI_BUSY_WAITING_FOR_START_IRQ:
+		return "waiting for start IRQ";
+	case MMCI_BUSY_WAITING_FOR_END_IRQ:
+		return "waiting for end IRQ";
+	case MMCI_BUSY_DONE:
+		return "not waiting for IRQs";
+	default:
+		return "unknown";
+	}
+}
+
 /*
  * This busy timeout worker is used to "kick" the command IRQ if a
  * busy detect IRQ fails to appear in reasonable time. Only used on
@@ -1522,9 +1539,15 @@ static void ux500_busy_timeout_work(struct work_struct *work)
 		/* If we are still busy, let's tag on timeout error. */
 		if (status & host->variant->busy_detect_flag) {
 			status |= MCI_CMDTIMEOUT;
-			dev_dbg(mmc_dev(host->mmc), "timeout waiting for busy\n");
+			dev_err(mmc_dev(host->mmc),
+				"timeout in state %s still busy with CMD%02x\n",
+				ux500_state_str(host),
+				host->cmd->opcode);
 		} else {
-			dev_dbg(mmc_dev(host->mmc), "timeout waiting for busy IRQ\n");
+			dev_err(mmc_dev(host->mmc),
+				"timeout in state %s waiting for busy CMD%02x\n",
+				ux500_state_str(host),
+				host->cmd->opcode);
 		}
 
 		mmci_cmd_irq(host, host->cmd, status);
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
