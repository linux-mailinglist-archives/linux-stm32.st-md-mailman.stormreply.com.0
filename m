Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 219E27877E4
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 20:33:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5222C6B456;
	Thu, 24 Aug 2023 18:33:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47084C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692901981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MENyLQ2N3cu7YkwE8woYh2Uz3htsa5ND2UWg2HZ3684=;
 b=VTpENyx+XDuRdT/rrBHRGb/yE9qBGrwB2XGjhZOoXKvPCvXDdv9QuyzpqcItMSVR3KM5Ze
 lVQ2elYO6MU6Cpvho0okIJqrATGfiUUbac9xvCyi2HchN39vLSych3rcmnVXgtuf9EGGDu
 3RRfEzw0WBFmrdaai51NTsQ0aQwhSuw=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-wi1A9J-MOAWseXF0_BM3WQ-1; Thu, 24 Aug 2023 14:32:58 -0400
X-MC-Unique: wi1A9J-MOAWseXF0_BM3WQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-79983fb0afaso46739241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 11:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692901977; x=1693506777;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MENyLQ2N3cu7YkwE8woYh2Uz3htsa5ND2UWg2HZ3684=;
 b=C1CS9a04rLC4U3uRx28RQ2IEDH48O5xFnRi755B9u6pW0yjOw25OyaR/ft2BSz2fs4
 S1pJPN+gQim4m+ZY2mLMw7+HJ+19oQnI97p0mQp7iMc+2L58SQBSZMOMQEgAYMUmsIb6
 oNE4Kk9wjWx0MtvUc6toBefYuCPWpdBWMYcy+oUo3Hg6sW1YOIJKi/+HRLM2wRTTYOlb
 houh+lr45wHHH9DGLJX6DDbJarTCe7pw6ahrhi+Qt8BvelPQgfrO+ufHGcZ0Fxa/5zSH
 71ySTXa1SyXaZMF73wT7dGMBJzYpiRnALRDbwkEEooi4MM/uIjyF13VK40Mc4K3fcCX4
 rIcg==
X-Gm-Message-State: AOJu0YwtMXEcEOQxYn0umymFA6UUo44hNrOtP+mKrdWtMW5gsAzX1NTt
 ST2Mzgy8JFwWCM4TfzlULkBWN1sYxYXSz/gTlD+dTaeYZdNS69TxTGXYCaguygZ5EW2BFHYX9bi
 CE9R4ya0IxMmOMM/p5dn583T0L8dE+n2ooqKA/YR9
X-Received: by 2002:a67:e403:0:b0:44e:8874:585a with SMTP id
 d3-20020a67e403000000b0044e8874585amr4528617vsf.27.1692901977579; 
 Thu, 24 Aug 2023 11:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgMO96NWiKDcYXf5IRr9AXBP8x7ijYPK4xRhHHkKJy0v9wR6V9lgxekYM8Ssryo0WjBBvQqQ==
X-Received: by 2002:a67:e403:0:b0:44e:8874:585a with SMTP id
 d3-20020a67e403000000b0044e8874585amr4528610vsf.27.1692901977351; 
 Thu, 24 Aug 2023 11:32:57 -0700 (PDT)
Received: from [192.168.1.165] ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a0ceb11000000b0064f77d37798sm4209qvp.5.2023.08.24.11.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 11:32:56 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 24 Aug 2023 13:32:51 -0500
Message-Id: <20230824-stmmac-subsecond-inc-cleanup-v1-0-e0b9f7c18b37@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFOi52QC/x3MwQ6CMAwA0F8hPdtkbororxgPoyvaRApZByEh/
 LuLx3d5OxhnYYNHs0PmVUwmrTifGqBP1DejpGrwzgfX+QtaGcdIaEtvTJMmFCWkL0ddZgzuGu4
 3ail2CWoxZx5k+/dPUC6ovBV4HccPlXRkO3gAAAA=
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.12.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 0/7] net: stmmac: Improve default
 addend/subsecond increment readability
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

This series aims to improve the readability of the calculations
for the default addend and subsecond increment values.

I recently had to understand what the hardware did by reading this code,
and it took me longer than I care to admit. These patches aim to make it
more self explanatory.

Suggestions to further improve this are very welcomed.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
Andrew Halaney (7):
      net: stmmac: Use consistent variable name for subsecond increment
      net: stmmac: Use NSEC_PER_SEC for hwtstamp calculations
      net: stmmac: Precede entire addend calculation with its comment
      net: stmmac: Remove a pointless cast
      net: stmmac: Correct addend typo
      net: stmmac: Fix comment about default addend calculation
      net: stmmac: Make PTP reference clock references more clear

 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  5 +++--
 .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  | 14 +++++++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 22 ++++++++++++----------
 3 files changed, 22 insertions(+), 19 deletions(-)
---
base-commit: 9f6708a668186dc5b38532fc1d1ff2f5311722d6
change-id: 20230824-stmmac-subsecond-inc-cleanup-305397c6ca8d

Best regards,
-- 
Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
