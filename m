Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 520AE57721D
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Jul 2022 01:08:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECF9AC640FF;
	Sat, 16 Jul 2022 23:08:10 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9B69C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 23:08:09 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id l68so4966982wml.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 16:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zH/D31uMSDW0xhMnNPteLenGrNsKNhRXe32KFuNIx54=;
 b=iZCU+4efLqXnq7Fn8jro1X0cVxj0VBLooeeeXriBNAUQRJ5KyBA2M97X91wmiG/oaL
 6Ut21qKdcF3a0p5Uqc/UVkYgeS84GcfXye5rZeyGzGjuWg+wVDoXmyI4Meotz/12EfN8
 GzJRq8QRMMDyKmALey0oX7mGQO9SMu7tXjAKYhrF8mms5VwoKIQv2DjxGzJ7nIS/veSX
 m3QDvSsBYTncKjN0+v4DFsUW87Wds72GcdkSnDxH5+/EPVj+smJYjvecznd+ogMch6fQ
 Zfro105mmvsVXvpD9sVKJ9dMJvydQ4Prar2hUcpy6PL4PGgwpuyCN2FEPEqinp0I0lQy
 iRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zH/D31uMSDW0xhMnNPteLenGrNsKNhRXe32KFuNIx54=;
 b=d4ygEuv1Esue8yxxAkiYcwnuH+//g7itj/HPCLZkt+v/xI2Ha17Cx10x9T1KV9k2Mg
 u1XZK360SAOs9dlmFOr5IG8Q3xB6R16D2/aV1WCyyM+Jd1DzMZqc8idpTo+5gMMPyrCa
 t99+fQE75wa0sbUlG0D6/yWTzlJnjncIh6tW715z2bIpsDWZmKF8sqPz5zoOMf2BN31U
 M+iVnld+EaOxOQKK0sL6KkJ8Q0xPjEhw8x2WzbbTfaFRVb5KOaEa4nCNEcKOOYohG7uh
 Ph9PMLNtmsgnrBtuag6/w/A1VFbaaWe4EDX7bxvebYGQqzx36/TXoViNflzzFBI1XSOw
 Afwg==
X-Gm-Message-State: AJIora/n+dXsO01S0lf/j33UYNB0mSBl1JzZlZhthgiF9Ut2PXMsjhXC
 PYnLzYDCIdx7Mswm3dTfG+s=
X-Google-Smtp-Source: AGRyM1tX5E+vmOz3erLPVIca2091fu8LsjFwOgXT2gVUO09ywIM7eSr9s3eFBZFtgcMVYQtNmeF5UA==
X-Received: by 2002:a1c:4b09:0:b0:3a2:ff2a:e543 with SMTP id
 y9-20020a1c4b09000000b003a2ff2ae543mr16170708wma.93.1658012889078; 
 Sat, 16 Jul 2022 16:08:09 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 l13-20020a05600c2ccd00b003a2f2bb72d5sm15150755wmc.45.2022.07.16.16.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 16:08:08 -0700 (PDT)
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
Date: Sun, 17 Jul 2022 01:07:57 +0200
Message-Id: <20220716230802.20788-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v3 0/5] Add MTU change with stmmac
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

v3:
- Fix compilation error reported by kernel test bot
  (missing dma_confg changes to tc and selftest source)
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
 .../stmicro/stmmac/stmmac_selftests.c         |   8 +-
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   6 +-
 7 files changed, 457 insertions(+), 314 deletions(-)

-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
