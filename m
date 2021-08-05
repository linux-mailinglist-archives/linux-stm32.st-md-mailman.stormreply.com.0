Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B78893E1A1B
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Aug 2021 19:11:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D4A2C597BC;
	Thu,  5 Aug 2021 17:11:07 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAFE5C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Aug 2021 17:11:05 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id gs8so10669118ejc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Aug 2021 10:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqeDSob7HIuOI4ueZc+RMNusQFLNaSctLWi/bXqPb8c=;
 b=OgDauCHshQKA1nHqefgkWzSoHxDf5Uj7jgpjMRZNARzNyvfdcn0FalreXwhgMI4Dw6
 HDpt9aI3/9NIcm3WKrKezL8sbP+BDz+C/p9f0Ipu4K6yO8o7sK7mbPP8f+YztPeMLBhW
 /9JWpVKBd7iKwffnoNxeZUwj79QZ/45lMm+xESf+7KbW3c+eGSi4Usf53Kl766aAR4q4
 SMUZ9YkaZsmpDGSaS7kEtPcmLvxGL9qPa4QBqMy0P9SODlgqPej0loliY7+HrGUhfKZo
 AHPOL42KmDgAbIRsy7dSFsgC8XXlzhUvYkFO4rJoHD2wcCCjMrDFTSrLS8UxwENn5RpO
 pkMA==
X-Gm-Message-State: AOAM5311GAcs8BE2FAmcKlRngSiNG0Wuu9e9SJGZQmmnH94bNRWDI1N9
 B2BqifuCgGyDG7PbLbSbCpY=
X-Google-Smtp-Source: ABdhPJzOt7h8Ts/rtwH8i//E2eVSSs7njgwdY/EGwSJjuTh+ygS+TwV1EU8xqN6BuKXTaUGjvIbWBA==
X-Received: by 2002:a17:906:31cf:: with SMTP id
 f15mr5978445ejf.272.1628183465438; 
 Thu, 05 Aug 2021 10:11:05 -0700 (PDT)
Received: from msft-t490s.fritz.box
 (host-80-116-27-227.retail.telecomitalia.it. [80.116.27.227])
 by smtp.gmail.com with ESMTPSA id n2sm2592655edi.32.2021.08.05.10.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 10:11:04 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: netdev@vger.kernel.org
Date: Thu,  5 Aug 2021 19:10:59 +0200
Message-Id: <20210805171101.13776-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFT net-next 0/2] stmmac: recycle SKB
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

From: Matteo Croce <mcroce@microsoft.com>

I have two patches to enable SKB recycling in stmmac. Unfortunately the
only stmmac hardware I have behave very bad, so I can't do decent
performance tests.
Can I get some feedback for this series?


Matteo Croce (2):
  stmmac: use build_skb()
  stmmac: skb recycling

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
