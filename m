Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1988CEB99
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2024 23:03:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0847FC6DD94;
	Fri, 24 May 2024 21:03:29 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 451F2C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 21:03:22 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2e78fe9fc2bso57294431fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 14:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716584601; x=1717189401;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfTzYX+duGMsU7h/VpsgnG4SbDyXgyQ9P7UXQAwHfVg=;
 b=PXL9fEoFKS1ZiPmwNqP9DtyFh2cx17aBofuMZJtKElBOu5JbtzkkSThSasS+UJZhJ9
 o+uytr4/L7vXzsHYR+ObJnXcawpApHKk756hCjGm1PgatEBlSmOVQ4nI+Mm89dsAIm/E
 pGPH28T3c/p8cUTYQIpliieM6nz7g51qZhwNSP3x12yOYesMhDr7eck+P50I18aYJHmg
 24oQJIhqRXmZhKc2oH97f+gyvVOyGW4GJ79HRQ9B3beA5TF/fR/kZSpIr/r2epA81nAq
 q1njPM6NxvFlZ/J4MpuANWrNO1CffQKHOgVMEfR9hhoEmeYLhL23Ap7tmjULSM6PqOeJ
 avjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716584601; x=1717189401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfTzYX+duGMsU7h/VpsgnG4SbDyXgyQ9P7UXQAwHfVg=;
 b=cmXUyvb/jeId4q/74X7sCdH2fzVtHQRUOirafBtwTIejSzBNwczc88mk0IdnOuMpM8
 0juy4VEAgq8Fe7iFbcfaOeMOIEKpZrbfyMjp5C+7bYAfn2isRfV1OOyUQML3J3jY3ckW
 PtpJg/IvRv7xYVk62xJey8V9iK7lXnXVGf9VIm6cgBaATo09G098WjZCEkyvcxfLjrLD
 SVwhDbsB3EPdcd5r1c8kUpRi3MOMwJodBC7D9rRr0A6s7wLFCPQ80i2fzGJSy77hJMYI
 EO/9+75ecOqOHtvoV37tuKbzmswV75Ntm4tODDJwtKjoS7NcDlBua8a6bZHUGun42R6b
 ADoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz+YOBQSEAsVchdtsPstGXZfyqwCMvzNRT4ZoK5ePpaEjGOUe41DWLh7GdEiQgWDJ3AlyPXIp4fmUDSAiq5jjKQ551N+yMgZI6nmpevi2bvi7GiTF7wvWr
X-Gm-Message-State: AOJu0YwtSInju2tvJ9uNn5laI9W8pluKcSIObz131ofgUTrPcE3hhu9f
 oVZLDfQKbrnS+1HgNWhD+ZtIsuAfIwpenuNz/D+BKIhtRreCZXjV
X-Google-Smtp-Source: AGHT+IFsvg+3eW+uFt+8zbMHGOvvmM7wbkkNlpRI+IgIK/fpNCjG+0mt4y0mWAeB+ZHjQFEWsw7fgQ==
X-Received: by 2002:a19:381d:0:b0:523:889a:ebd with SMTP id
 2adb3069b0e04-52964ea947bmr1972965e87.24.1716584601070; 
 Fri, 24 May 2024 14:03:21 -0700 (PDT)
Received: from localhost ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52970e1ef56sm236078e87.228.2024.05.24.14.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 14:03:20 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sat, 25 May 2024 00:02:57 +0300
Message-ID: <20240524210304.9164-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 1/3] net: stmmac: Prevent
	RGSMIIIS IRQs flood
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

Without reading the GMAC_RGSMIIIS/MAC_PHYIF_Control_Status the IRQ line
won't be de-asserted causing interrupt handler executed over and over. As
a quick-fix let's just dummy-read the CSR for now.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index adb872d5719f..2ae8467c588e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -304,6 +304,8 @@ static int dwmac1000_irq_status(struct mac_device_info *hw,
 	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
 
 	if (intr_status & PCS_RGSMIIIS_IRQ) {
+		/* TODO Dummy-read to clear the IRQ status */
+		readl(ioaddr + GMAC_RGSMIIIS);
 		phylink_pcs_change(&hw->mac_pcs, false);
 		x->irq_rgmii_n++;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index a892d361a4e4..cd2ca1d0222c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -896,6 +896,8 @@ static int dwmac4_irq_status(struct mac_device_info *hw,
 
 	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
 	if (intr_status & PCS_RGSMIIIS_IRQ) {
+		/* TODO Dummy-read to clear the IRQ status */
+		readl(ioaddr + GMAC_PHYIF_CONTROL_STATUS);
 		phylink_pcs_change(&hw->mac_pcs, false);
 		x->irq_rgmii_n++;
 	}
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
