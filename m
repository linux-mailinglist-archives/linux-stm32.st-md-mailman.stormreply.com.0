Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC355BCF9
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 03:34:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAD21C04003;
	Tue, 28 Jun 2022 01:34:07 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21845C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 01:34:06 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id ej4so15454824edb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 18:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y+PHCtYFQjlFqTy7xiF2BYO3NjlRKVCp7efVO+mj96g=;
 b=aF8Gc0nBYIqf+kRIRnA4wyxA7nSyQDUbC2F9DsBhQhe93Arz8CmKm9qj/XvtRX10jJ
 1jwHvjBc/b0ATfNMt84xwCHJCfOwazM3TZ4Gy1Db94WbS8M+EHAItGJ1x7Ievvv9VyOf
 WpAUKHJjBZNvYMCmTYjrYUKUxLp42i4pUnz27/MEuccDg6kX8VFDy+HexwlKT+0AekIt
 VTs6ndF3+D8fEIa+1uwRMX0KmR+Dkxf+e2gAjz9QfhV2RmzVVatX769GU8lajXSrx4D/
 NL7i4G2amGuxKpyDLdg7LzlkCQYe29gfbDYDdAmZWKUGxgOcls7/rFUM2iNtIPT/HjvV
 F+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y+PHCtYFQjlFqTy7xiF2BYO3NjlRKVCp7efVO+mj96g=;
 b=vOJ57kOmM/xtfSsy10eZuec9TB1XpgVmdDa0HyYUp97OFVfpfIt+aeCtOY+9/vuU/n
 nAD+9ti5TbbEfQBZ7U2D5CQ+Nn1aSQ9FEjhPv9IgntKcBpOQZmlVpNEboy9DgVEOQ/A8
 TUlDSDxfMzu+Yel8BqZuiaIjIFYW5lbjllj24mOr7lDt+lcUd5X6bk87Lu/E7PQTcBef
 cuywYI6wmd5tnE7TN5GS7IoUtB1QE+A7kpVJLzO60v60T9a15xPlKb+kvt65RBHZhSb+
 PxFfNj7feeEogrbHpEQrj+/UVDw2BSzpSEVPtFRJnAXiQzs0mQD5JjtWY18bzqy/zT7R
 3QlA==
X-Gm-Message-State: AJIora80KB8JVv0EzkLQOqoVeGFzv1Zxq513z/PMZwKW9nwy2KwcuMqy
 V7L7+GW+103FnPV+CBtuEtI=
X-Google-Smtp-Source: AGRyM1sCM+8fBV9YLUq2tUBXlkuFyobvH2oa3NoRsTecMQqItiGnuJdbUwnCH3hGeHYNXPr62e/mdw==
X-Received: by 2002:a05:6402:50d2:b0:435:8c44:8715 with SMTP id
 h18-20020a05640250d200b004358c448715mr20239193edb.49.1656380045367; 
 Mon, 27 Jun 2022 18:34:05 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 x13-20020a170906b08d00b00724261b592esm5693492ejy.186.2022.06.27.18.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 18:34:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 28 Jun 2022 03:33:37 +0200
Message-Id: <20220628013342.13581-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH RFC 0/5] Add MTU change with stmmac
	interface running
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

This series is to permit MTU change while the interface is running.
Major rework are needed to permit to allocate a new dma conf based on
the new MTU before applying it. This is to make sure there is enough
space to allocate all the DMA queue before releasing the stmmac driver.

This was tested with a simple way to stress the network while the
interface is running.

2 ssh connection to the device:
- One generating simple traffic with while true; do free; done
- The other making the mtu change with a delay of 1 second

The connection is correctly stopped and recovered after the MTU is changed.

The first 2 patch of this series are minor fixup that fix problems presented
while testing this. One fix a problem when we renable a queue while we are
generating a new dma conf. The other is a corner case that was notice while
stressing the driver and turning down the interface while there was some
traffic.

(this is a follow-up of a simpler patch that wanted to add the same feature.
It was suggested to first try to check if it was possible to apply the new
configuration. Posting as RFC as it does major rework for the new concept of
DMA conf)

Christian Marangi (5):
  net: ethernet: stmicro: stmmac: move queue reset to dedicated
    functions
  net: ethernet: stmicro: stmmac: first disable all queues in release
  net: ethernet: stmicro: stmmac: move dma conf to dedicated struct
  net: ethernet: stmicro: stmmac: generate stmmac dma conf before open
  net: ethernet: stmicro: stmmac: permit MTU change with interface up

 .../net/ethernet/stmicro/stmmac/chain_mode.c  |   6 +-
 .../net/ethernet/stmicro/stmmac/ring_mode.c   |   4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  21 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 722 +++++++++++-------
 5 files changed, 450 insertions(+), 307 deletions(-)

-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
