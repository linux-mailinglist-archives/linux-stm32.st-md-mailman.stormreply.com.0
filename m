Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCCA942C3A
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2024 12:43:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0A63C6DD66;
	Wed, 31 Jul 2024 10:43:52 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A98AFC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 10:43:50 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-709485aca4bso2225149a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722422629; x=1723027429;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yITlV2EmP04/pdfMm5rgZ7lDN6+U5nqKkJKbXuYj7Jg=;
 b=MUUSPy9RHB9ke3pgYb0+Up20/y3DgOVntbLC/oINjC7TYO4ZlGMSFx/AxP4/2+0y/C
 OQ5GhKMp63G/WvN5UDI0YelapJna3oPRWBbQAeF4aLoXEk1cBZDN+aIzQJ1r225LtQmv
 /pHnJhtF/PZ88DdhYZQYgYli+1bvqQ5ol5lz3t/Ed+vLIybQeaJ/v/GQpXxjbVxcawwY
 RfBTQpj82+JHdYwyONOSGi0YQ5qbYcfbJ4B6a1Qb0CXvXP84vFFbEv3kgD4NEQ4oqMu5
 y7b+p5EjO2ZpN1LK0Csja4vRdhGbbKxZqKSlsxgXtRiQSF4sUeBUUW/FIy2t7iaMeVZ7
 k69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722422629; x=1723027429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yITlV2EmP04/pdfMm5rgZ7lDN6+U5nqKkJKbXuYj7Jg=;
 b=iwGVL0JlAKZJiS+ykg/oNVWv9E7p5gWxgQwFSXeaV93mWCY4TXUcU4B3mMxMqvvuTU
 KoEU5hefERz5QvL9TtP0RKXyYmEZ9wrDBzTkH8+kNEBn5ycZGQ5bi150+pGsjU9D8n9h
 6/AFtFrtLwBVTq7o15WXyNms3fHbtDRirsiyleTO5LyzjQ73FOsDFuZ3HhSZa0growL4
 dl4D6+r9uy0xnC2tFfKxjGcbbi3S6KIb5ONltWovqBlhs65k52Phk+Uql1dXiG9aWD2T
 ggFzUo4MNAmm5UhIi645ku03YbFCLDfUOac8zjICO0zI+dqb+4EHT32dttHqkKEk8EsW
 mDmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/AlAulP6KJ/DwP4SRFzXtqR3Zub3XYI2qCweLTlAe6DlvQfiAjtH+b2MelxxsA9u+Ie5TGaOuGiKbOA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLZQdDMiG/xEXpoayCd1DeXlI0AhL6NuZ1TYdi4afJrIuk5WuG
 sPovOzukTBLxKxURfag0Ggs7xZyQ5kePg1L9L7FuOIOJ/kGsZANh
X-Google-Smtp-Source: AGHT+IF7lo5715caiO5yQuVUS/Wxz7nFOFtJwBaZnI797vwpaHgFj3G+ha2rUkQ1l3bkOpJG6N5crw==
X-Received: by 2002:a05:6359:b97:b0:1ac:f3df:3be1 with SMTP id
 e5c5f4694b2df-1adb243f94amr1301149855d.4.1722422629214; 
 Wed, 31 Jul 2024 03:43:49 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7a9f816da59sm8791375a12.29.2024.07.31.03.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 03:43:48 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Wed, 31 Jul 2024 18:43:11 +0800
Message-Id: <cover.1722421644.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 0/5] net: stmmac: FPE via ethtool
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

Furong Xu (5):
  net: stmmac: configure FPE via ethtool-mm
  net: stmmac: support fp parameter of tc-mqprio
  net: stmmac: support fp parameter of tc-taprio
  net: stmmac: drop unneeded FPE handshake code
  net: stmmac: silence FPE kernel logs

 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |   6 +
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  |  37 +++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |   7 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  14 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   3 +
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 111 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  25 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |  95 ++++++++++-----
 include/linux/stmmac.h                        |   2 +-
 9 files changed, 248 insertions(+), 52 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
