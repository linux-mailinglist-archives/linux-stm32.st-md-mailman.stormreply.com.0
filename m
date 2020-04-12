Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA71A5C5F
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Apr 2020 05:49:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E40EAC36B0B;
	Sun, 12 Apr 2020 03:49:38 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4974C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2020 03:49:37 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l19so976862pgk.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Apr 2020 20:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AZDILVGrcKvmYChqNYehZ2onRDlNxnDquPgS6AG9YkA=;
 b=A42g95LqGNwYhESYqnGpreIG4EbnfwMkhHJSaQiGA575hBn/pQPQWgMYj0tw7iJFNj
 rN3AssDNxaB4zrqX0Dx6dZgALJ5CPwKGVnaACxGSk7OdopRaUn5y1EATMmvWSrH/t9Uu
 sVajcAdhvlVkgtP93uksvkAJX7WHNPCNpAZX4HJ2MZyn/GV61aY8oUhJMzYtu+YtzdsR
 YhiIaEcgpa2zwdEe00uHupW2c2aOL1AMMJ5FCXAdHzYAPik9ZClWgNqEjKTz9cdCDkW4
 VapuwljUPCa8x0v+nPFyY7MWhscbaCHQW3VsKmqAy3cjpznvKHab6lD8k1J2fOkIefbP
 GupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AZDILVGrcKvmYChqNYehZ2onRDlNxnDquPgS6AG9YkA=;
 b=TVaVfFb5tMlaqWZK87E+nXs+YjV8iTbpcJT3eFZVQR524ePDyiox/3tkp9COZIj8FI
 GdgAiTL7C1bkORcn3CgFt3iWHu9l35T/LSlR47wGXCCwQ8qf+6qWUVX+RerBx7WfAVQR
 H77M912RiGwgKGM5NroxqbG22l/Kfp1VI9UPRcn8gpC9Jx+4gRwiIkJxMqZ9DfzjUWTj
 n81s3/MJyQwMPZrJa/DneZPzJ1AyXcWx4AMw39moPueivgzX4yQKjdbea/bvfVlykW92
 bFufOLahSo2cawdVWSk0X3oxXOttDhJQBTcqG/l+Ujf+sjIkIOZit8HkfsRgiJwe0tJX
 jwVQ==
X-Gm-Message-State: AGi0PuY2YI4uCuqP3VSzKnNWf443oO+WHLMMCN5C99tIrrAeXo/N44nZ
 l3jIBe7QKLZgruC0//COAlI=
X-Google-Smtp-Source: APiQypLO0t3hZTP5D7PcbbjFaFd4Pb6oPXH1Y5G0rR7sLuG1LsgDyAfFcEQ7c5W57vgyzeVogfVHXw==
X-Received: by 2002:a63:c44b:: with SMTP id m11mr11839604pgg.313.1586663375996; 
 Sat, 11 Apr 2020 20:49:35 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-84-250.oc.oc.cox.net.
 [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id t7sm1841024pfh.143.2020.04.11.20.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2020 20:49:35 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Date: Sat, 11 Apr 2020 20:49:31 -0700
Message-Id: <20200412034931.9558-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, mripard@kernel.org,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, olteanv@gmail.com,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH net] net: stmmac: Guard against txfifosz=0
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

After commit bfcb813203e619a8960a819bf533ad2a108d8105 ("net: dsa:
configure the MTU for switch ports") my Lamobo R1 platform which uses
an allwinner,sun7i-a20-gmac compatible Ethernet MAC started to fail
by rejecting a MTU of 1536. The reason for that is that the DMA
capabilities are not readable on this version of the IP, and there is
also no 'tx-fifo-depth' property being provided in Device Tree. The
property is documented as optional, and is not provided.

The minimum MTU that the network device accepts is ETH_ZLEN - ETH_HLEN,
so rejecting the new MTU based on the txfifosz value unchecked seems a
bit too heavy handed here.

Fixes: eaf4fac47807 ("net: stmmac: Do not accept invalid MTU values")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e6898fd5223f..9c63ba6f86a9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3993,7 +3993,7 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	new_mtu = STMMAC_ALIGN(new_mtu);
 
 	/* If condition true, FIFO is too small or MTU too large */
-	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
+	if ((txfifosz < new_mtu && txfifosz) || (new_mtu > BUF_SIZE_16KiB))
 		return -EINVAL;
 
 	dev->mtu = new_mtu;
-- 
2.19.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
