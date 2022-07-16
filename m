Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 243855770CC
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Jul 2022 20:47:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADD2CC64101;
	Sat, 16 Jul 2022 18:47:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20018C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 18:47:55 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v16so11112051wrd.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 11:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0H4SZGJGUqTZkEbdcEov2Q3qqoTqkSn+ntdBtnS/KM=;
 b=WTP+PwRdz3/NeNA3azbbdQYgZuEHW+wCcX2zlJdgKdgCavP8KQVX7cgpbz8xbvg9dT
 CVCAjaCCKXsI51eH04MoxFh9pYCNiprUc+6DB/upF+ts+HmJYWsJ8/n4jL6prVfsPgwC
 UJkJQY9TJWWP+85XiJJIV6loYx1w9jSI/8wYw1KIUuZKQMNTMyJO9lVC4e2fA/tMW/Dk
 z6K7wkAKoSw9NJuSGNCJUZdiuzNcYV4WCuuXaJCnotrTC1qX4PsXAtefwndQM9RQNutl
 2iZwuMppDNyTDakxaANhHlHz/33xeYlZtmWYmHPA7uIBBL4cHP1XBjMATBLmrFNX3x19
 4fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0H4SZGJGUqTZkEbdcEov2Q3qqoTqkSn+ntdBtnS/KM=;
 b=eX5kyFkSgYgbiuJf8GozT+HurboG7geDUjqYIg+G1c3Eof3apIHBKiTvbTQmH/zZP5
 mVBe9cn++r66gWVtak+DMrAYqXuHuADF1B2kqHrCAQO3k+EspDGI+RAUGKCw0/f0KRRd
 L4j1baxbc20yCyib1HB7t8IUIDp9qPeonYXq2X+dgkNRM2K5QVtN4Om5et3KFNi3gaGD
 H0X3nubkwJ1lxFuQoqq/rWlE8r3e8rZT+rjOyuvT2AvGjo2M/3dc0NnFE3Mrk5lORkiN
 gL8pyyaJdE2PlDtbJA+KnrE8TqTPeLshNaf8LixyrcxwJDHtusCGfdzxr3mY2HzKU1DE
 vP7g==
X-Gm-Message-State: AJIora/Hga+VmUSm137Sn6L5UfLxJ2HIj7DVsy+8yey4MnfmS8F6BDwv
 Xudi1QK6XrVqXDyjcX+c8SM=
X-Google-Smtp-Source: AGRyM1vxWmXVZdIyvKjsfCiLfQST70cTYy6Zs18aWyI1GzP13g44mwZBjouRPWLAxAgn0Di1wM0E3g==
X-Received: by 2002:adf:e604:0:b0:21d:6ddb:d0ec with SMTP id
 p4-20020adfe604000000b0021d6ddbd0ecmr17520358wrm.177.1657997274381; 
 Sat, 16 Jul 2022 11:47:54 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 u18-20020a05600c19d200b003973c54bd69sm13649961wmq.1.2022.07.16.11.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 11:47:54 -0700 (PDT)
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
Date: Sat, 16 Jul 2022 20:45:28 +0200
Message-Id: <20220716184533.2962-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v2 0/5] Add MTU change with stmmac
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

v2:
- Put it out of RFC

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
