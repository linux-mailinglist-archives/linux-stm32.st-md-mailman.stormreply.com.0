Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6941F579003
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Jul 2022 03:49:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF022C0D2B9;
	Tue, 19 Jul 2022 01:49:31 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E799C03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jul 2022 01:49:30 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id z12so19532071wrq.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 18:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NRlQ3mxg3RzKLJEGPG1n3tE2Reyt0PmZbkS9Sk9bMTs=;
 b=I7xGQX4QrHDZwh9zLKLOg9R55Dz23nFRbAU+JW9KAV99wmpuzTbVctG72+amjQ5Zzw
 tZ4wbHPrtnnViOPfQ7SiQPjReHaBxnVGlTQ7GjKNMVIyx84+AgDRZ4/Nxuk7AimnMNst
 xqkGPM9AiGMpLeBFsacUWDmFPMS+ocjBx9QynIdO/h/30vdeEM9VRh1pyR9n0UPUyV4w
 HOmqAPiDnN8d0eIf4zBEGgMgcFLaZONHiDokMYrhwc/dRqKd2JNfAcjSQVIu4ua0XUvH
 LOVBI3lVHTXrzHx2hcRz4SI1XTO2+T49wm0+XQCuriIebz2Dx7535QYHyhmBdREnE3jr
 rBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NRlQ3mxg3RzKLJEGPG1n3tE2Reyt0PmZbkS9Sk9bMTs=;
 b=lIL4Z17VpgJ2tdhuWsBN7Y7CZ5t+XmLx0+F1eUfbWIrvkwFJXN3GtyrzB6I40R0Trh
 +QisfKZPWZNcwvEcqTnw+pm+ByJquvJSW6qShs/3iGkDnTXMmZpsMYF0CITUY/fXq3Lm
 47E0aAfWNGz/C9sJ4mO72PS9cp75k9i6ENC0WURnH4Hwh8IP00JN08z3GcPBddKO/b23
 6jRor17jdFTmj890iuuquppgz3gZXNh7JYt4+nq+QGqftfs0JFTo+Uz03u7wbzRLSTXB
 1CCDAoVpoMRBxM7JUXpCJVPN2R/ApK9thqLAFWvb4b8XYtHApmRaTrttNpehfncP0BqM
 VEwg==
X-Gm-Message-State: AJIora9Wjxz657na3fS9fnXB8UaokF2INSAozRt6l1OgESubk4ziezNg
 wOegx18DJgWJNGI2yhmltYI=
X-Google-Smtp-Source: AGRyM1sgPFrzN1+aui8l4wS4BVl7j70f+1Uo9TEgTIrEo9LFJKayW9/hAmm/cUeLt51/PEU8QtbbvQ==
X-Received: by 2002:a05:6000:1367:b0:21d:75cd:5ae8 with SMTP id
 q7-20020a056000136700b0021d75cd5ae8mr24932292wrz.282.1658195370030; 
 Mon, 18 Jul 2022 18:49:30 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 v10-20020a05600c428a00b003a2fc754313sm16193600wmc.10.2022.07.18.18.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 18:49:29 -0700 (PDT)
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
Date: Tue, 19 Jul 2022 03:32:14 +0200
Message-Id: <20220719013219.11843-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v4 0/5] Add MTU change with stmmac
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

The first 2 patch of this series are minor fixup that fix problems
presented while testing this. One fix a problem when we renable a queue
while we are generating a new dma conf. The other is a corner case that
was notice while stressing the driver and turning down the interface while
there was some traffic.

(this is a follow-up of a simpler patch that wanted to add the same
feature. It was suggested to first try to check if it was possible to
apply the new configuration. Posting as RFC as it does major rework for
the new concept of DMA conf)

v4:
- Add additional stmmac_set_rx_mode after stmmac_open
- Disconnect phylink first on stmmac release
v3:
- Fix compilation error reported by kernel test bot
  (missing dma_confg changes to tc and selftest source)
v2:
- Put it out of RFC

Christian Marangi (5):
  net: ethernet: stmicro: stmmac: move queue reset to dedicated
    functions
  net: ethernet: stmicro: stmmac: first disable all queues and
    disconnect in release
  net: ethernet: stmicro: stmmac: move dma conf to dedicated struct
  net: ethernet: stmicro: stmmac: generate stmmac dma conf before open
  net: ethernet: stmicro: stmmac: permit MTU change with interface up

 .../net/ethernet/stmicro/stmmac/chain_mode.c  |   6 +-
 .../net/ethernet/stmicro/stmmac/ring_mode.c   |   4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  21 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 720 +++++++++++-------
 .../stmicro/stmmac/stmmac_selftests.c         |   8 +-
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   6 +-
 7 files changed, 457 insertions(+), 312 deletions(-)

-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
