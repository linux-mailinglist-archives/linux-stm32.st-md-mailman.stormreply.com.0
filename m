Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 253DEB0BEF5
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 10:33:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0477C32E8E;
	Mon, 21 Jul 2025 08:33:54 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D474EC32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 08:33:52 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b2c4e46a89fso2963822a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 01:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753086831; x=1753691631;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9fsE2sNuXpdXdhRH0OAvRrhIA0vlIXlgXbN8nwt6iNk=;
 b=XjaXutJsW2jeV4eVHOueuBPQys77MvKwPAiwoQ8OR9zsvm/tazzmDO8rB0N8d+T4S2
 NgliC2zrQCYjc96V61qsOlAadMzkeIq+hk7QLEDjnh+57uka7egk9ZOGXR+mQ4AatJAq
 WkANJAe55Kf+RUURJuvVw/ayaOYOjdorNOV4+SGUvrSwy5CTDFx6vFKyjo64TqFDuuAr
 kg0TnCVIe2Bc66Gkx/7gdGnDlRQ8z2rKDhavF8kwln+f1QRL1V7euUXvu/a5NtTQNr4q
 AKt5ccevK6Wazjdi/W9Zj1YyB9HF6BZYxhN+TrUaVUMgAuuEKmWNVo2mgZHfy/pRl6Rf
 IWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753086831; x=1753691631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fsE2sNuXpdXdhRH0OAvRrhIA0vlIXlgXbN8nwt6iNk=;
 b=doUfgxeyR5ITAy61hAQzz5iikIK1mUNswfVf894pekj6BRXEXzHEzpoN88S1dx6eE5
 NkQD34K7y/CmYEb3P84Efunt5skV4pa4dFKxvD6QbTXROg+iObapubp/x5dOMMu6fhN7
 skDVp80IFb88FEbEtWyQ/km48MUvb90RVf5Ftc/DFuO034nugHyNNNPnl17BRuBNPAMT
 +g9y8Y26M0D37GO9BHPG0h9WwTEJaOZf5jihs0FmZkoN+YHerlArJleU3fBGhsKdi30I
 xXXMO6w6qD/GiTyoh9YTsPOivw8UTnxiToYzgGvxN0E163u4B0Lsd8i4TTkd0stbdLoo
 2fag==
X-Gm-Message-State: AOJu0YyH1sj34p0SG+G+0HyY19pMVbEeenzCebZ1l54v4vSkRKHsBbip
 G/tajDr3RrF+x3FhPKi1JodVxZdyk5oV95WztAq2UsJ0yZiSNe+BBPNg
X-Gm-Gg: ASbGncvmNJYDccS9El+rHZqsUiqYDPPzNb1N97O0YD4M0BOesWAIedg6i/Q+uuzUeT4
 QH/JWaTjF7AO4tNc70S3NKdg5iGGi/KgYSJY1eAb5HuOTXRHp63Klw70iinyLXvzOKxNm9o0lKC
 JNDdzU4Ors50VTE9pHYIdN0tIfPdnnouLb0KSb1ZOsZS4Jp62V7GJhXaM9OGUHRhRZnJi3KDNun
 OXSVpTRCmrd4PrguLnvog4Eifxzi7U43raM0Vf8ZIRpVB5QkV4k7Kigvq9iiDl+WnEP1HSUFYZd
 5u/fAKItVt8YpqA4RGHiO0yEVIQ7QVpBYEtJhxXHbdUN+LMIjHRuOu5mPcBTD0G76LUOJqw8rEs
 Sox/Lvq8++h4A8/CuWb38T/W5WlUGATW3xOW5J5lJJgrUkZ2E8NSyPLkj8vg=
X-Google-Smtp-Source: AGHT+IE8NhryGKMJDsH4u3alU+wk4yQjNrEdlHvCXHsLOGmQ4xHKQNG4+AcSzLJ7hhq8981ot0Wbag==
X-Received: by 2002:a17:90b:50ce:b0:312:f2ee:a895 with SMTP id
 98e67ed59e1d1-31c9f45b0abmr26601296a91.31.1753086831079; 
 Mon, 21 Jul 2025 01:33:51 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([111.201.24.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cb7742596sm7082116a91.27.2025.07.21.01.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 01:33:50 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bjorn@kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Mon, 21 Jul 2025 16:33:41 +0800
Message-Id: <20250721083343.16482-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net-next 0/2] xsk: fix underflow issues in
	zerocopy xmit
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

From: Jason Xing <kernelxing@tencent.com>

Fix two underflow issues around {stmmac_xdp|igb}_xmit_zc().

Jason Xing (2):
  stmmac: xsk: fix underflow of budget in zerocopy mode
  igb: xsk: solve underflow of nb_pkts in zerocopy mode

 drivers/net/ethernet/intel/igb/igb_xsk.c          | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.41.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
