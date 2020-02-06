Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B3154600
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2020 15:24:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 348BBC36B0B;
	Thu,  6 Feb 2020 14:24:23 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CF6EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 14:24:21 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id fa20so49249pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Feb 2020 06:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ujphz3B+s46aEe7JvGGM1Ne2ZXEsoldLhyDrK7xK9Ko=;
 b=r2fc3qi/9oNBxawfqNV0KXua36nCnXKLMdct8mDNook6eYV55lHztSV5xJ90MWYldf
 GQDjpa2pqjDN/R6JQwv933Zfvw/ePlhJandlvdwup1MujP/V4rd0jVWQErbPOdC/xghr
 IXDkRz0Qfw2uuZO9HEyg5aOlSMidW2brqKSnkLkFZIeh6dIzQCNCB8ZbPqVqA0s1DS6m
 yKcqYX3Qvo6bdZZmQtrz/tLC/u1qH5MPBtlXeWqx/zXLlLNyZ4zaxTtbPCmqTZMacg1Y
 yMiZypbiuqU+5hShOi+yn7yKlw/zZ3beb2KBtcTgZieAKFb+tvG7XgWGtbvmXtrjgoFD
 vKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ujphz3B+s46aEe7JvGGM1Ne2ZXEsoldLhyDrK7xK9Ko=;
 b=LE35Hbqyy8DdyDLerZrMusUR4HP8tQwTot2NZLjF9oksPGWlpO6/Vc1mdWgnn06429
 fe2ErrcBmn5qNApfHejPI/gwO4f3irJ2uc7RWz3t2fwHDldaVF14YfjhBBHJVi4Y9hBl
 tdkKbT8HLnVWH2IInOFMT0z0LNOR1zTDDALC89KAJqZIAF4rbjvP1kQinu7MtDvELXOf
 pUZ2eII4kyin4aghcHtHVv2mG1oYvBatQrinTZTqwWj6BBI+9iXsgmFNFde0iD+K3dqm
 OAp/CZRPi1H7o8lzegrYX1bnvJRzuz7icQc4B8HPWEg3zMmPpeh8MSxWIb58CzNCJcHw
 XfcQ==
X-Gm-Message-State: APjAAAWAKA66jXuLA/25ENTfoB05xCSHR+GLTpFnIxvaNO3bYyXaISbr
 qMgYmgb8DZWYHRIzW0pjqLI=
X-Google-Smtp-Source: APXvYqy8U1nUa1UlxJnp4Ytp6VfhI1JzoIDrTHA7gjaGrxTdicYH6ucP96q5P+GGXmwsw8HEJLwNKA==
X-Received: by 2002:a17:90a:7784:: with SMTP id
 v4mr4688042pjk.134.1580999059559; 
 Thu, 06 Feb 2020 06:24:19 -0800 (PST)
Received: from localhost (104.128.80.227.16clouds.com. [104.128.80.227])
 by smtp.gmail.com with ESMTPSA id q66sm3942259pfq.27.2020.02.06.06.24.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Feb 2020 06:24:19 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org
Date: Thu,  6 Feb 2020 22:24:02 +0800
Message-Id: <20200206142404.24980-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2]  use readl_poll_timeout() function
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

This patch series just for use readl_poll_timeout() function
to replace the open coded handling of use readl_poll_timeout()
in the stmmac driver. There are two modification positions,
the one in the init_systime() function and the other in the
dwmac4_dma_reset() function.

Dejin Zheng (2):
  net: stmmac: use readl_poll_timeout() function in init_systime()
  net: stmmac: use readl_poll_timeout() function in dwmac4_dma_reset()

 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   | 14 ++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  | 14 ++++++--------
 2 files changed, 12 insertions(+), 16 deletions(-)

-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
