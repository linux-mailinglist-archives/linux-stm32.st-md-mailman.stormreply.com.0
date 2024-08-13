Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE0695040B
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Aug 2024 13:48:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60234C71289;
	Tue, 13 Aug 2024 11:48:13 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3E6CC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2024 11:48:05 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-710ec581999so2401819b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2024 04:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723549684; x=1724154484;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+7d9iEhLFGEdBGoEWb9zLkjiEjssEK611mhoRerD7SA=;
 b=m7DpYalP2KojvKAJXT4kOU8WCkLB4XdpNZR02uVCzpxZEETvSc7IJUJ5tkEUfTI6OT
 hi1AG9z2DzbeMeqeRFDLNrGYIgCt/l3BnWh+C/IzgtiVQ3v6lgoJuHdwwSBOCyEt1adG
 4uefJZ6ZdMk+n7UULsVWMQ3Z+C6BihgmsDCSnUjbuZb7lMwumXv6sWS1Mp8sDcFc1QRe
 AP80oQ4xZxkd4Cuzdevsy4hTJBiv9SNdt9xMUjwfFlJOxVk8pLgTAmvix2yIuS3c6HMX
 7jHHUw/a94Pv/05eiCT3McNwIZzGY5vLBu0tHM6gKxYtAE+hOHT636MxsLNiR3N2QtzB
 LUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723549684; x=1724154484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+7d9iEhLFGEdBGoEWb9zLkjiEjssEK611mhoRerD7SA=;
 b=WUhiJlS+UMsSQLiuNROmd63/22f0UUncTRIph9jhRcjwDOn2219eF6aE++nJqd19zg
 7z+o9zftFca2j5JmyyRa0UxWbAJqBtf7ca+ntlGU8fojDHcE6QRjswRObmnZ8ty/CTVJ
 xtBpCRKPXxKt2A5EpBjQp6v2HeyXgCGMtNs4dLCXgUU7VrT3iA9yTQXcsO/uHoZyrXuP
 qR7ADBQURnHLAGQtEc4VlSD27SHJ9bzDEALkZH83QUQ7B9JNT0pg21pDwDh+4Its5yH2
 UMmu/AeP1h71kDcEBJ8VnjOOUxjtL2q6Z3yCtrZdK/cSpL3RxNFtHt15/TiAI1dPSZ7D
 Fv/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXBsnJ7YZ33VgpelXnI45ON2PMBjrgsiK5qKZjUyML2sS6kjGh6cBDgDETdQJTzRbm9IyW6MvJrRKgrGzegfnEQSAJ1yuYCG8MLHjS77bOwcbu1KHWIQ8H
X-Gm-Message-State: AOJu0YzX6xHLNVMLwZfgkIFypg1//ps8MhmATVKyAi2IVRVzvrRh//4T
 g+poZZAXm1GiUT1izJ/Pm4bw1KbgXYrmTbVfRegN49hhOZQLk5Na
X-Google-Smtp-Source: AGHT+IElTSvIrqpk2wLbRPBuuMsOrLa4kUNZ+aiMqa058Bv7NV0CVIQB6r/9vCRUrMVdnEYlCMWSFQ==
X-Received: by 2002:a05:6a00:390d:b0:70b:2233:f43b with SMTP id
 d2e1a72fcca58-7125516c61bmr3696505b3a.13.1723549684205; 
 Tue, 13 Aug 2024 04:48:04 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-710e5a562bbsm5548755b3a.111.2024.08.13.04.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 04:48:03 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue, 13 Aug 2024 19:47:26 +0800
Message-Id: <cover.1723548320.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/7] net: stmmac: FPE via ethtool
	+ tc
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

Move the Frame Preemption(FPE) over to the new standard API which uses
ethtool-mm/tc-mqprio/tc-taprio.

Changes in v2:
  1. refactor FPE verification processe
  2. suspend/resume and kselftest-ethtool_mm, all test cases passed
  3. handle TC:TXQ remapping for DWMAC CORE4+

Furong Xu (7):
  net: stmmac: move stmmac_fpe_cfg to stmmac_priv data
  net: stmmac: drop stmmac_fpe_handshake
  net: stmmac: refactor FPE verification processe
  net: stmmac: configure FPE via ethtool-mm
  net: stmmac: support fp parameter of tc-mqprio
  net: stmmac: support fp parameter of tc-taprio
  net: stmmac: silence FPE kernel logs

 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  |  96 +++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  11 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  20 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  22 +++
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 103 +++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 173 +++++++++---------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 115 ++++++++----
 include/linux/stmmac.h                        |  28 ---
 10 files changed, 416 insertions(+), 166 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
