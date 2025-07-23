Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB4B0F525
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 16:23:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF0D8C36B3F;
	Wed, 23 Jul 2025 14:23:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E86D7C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 14:23:37 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2352400344aso62272505ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 07:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753280616; x=1753885416;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UxwHaK6YDUmdrsdUjFROIjJz+2g48h51kQ60Ua/P8/U=;
 b=GVtqqzSLUP4w9tmbJb6BcKWkGoANi3RK83wUltcRBWN8O2SEC352ykhPBSuRRp/bKt
 7tBvnEfJa93Exlpa/YwbQDFQSQW2Az4033uU4PK6mGWtyyRb90SRAH6YIsaoK3Q+NyAQ
 DUi9pmLGk9nT4itGbJNqmq76LVoiG5K2C2GAceFPMTkbKT4VrTXT7UGoNv/gVTXVPbiO
 OskPPAA2u5sP4QFv9HgwyFyzrMJ0u4JAHmeucHD86oCS5fek61m/Yuvc+f4Pip9JmQ5L
 lz8Crbox3HQ8/Nk3LqjecTgFYKY3LWlq7Ye4FitKcL11RpVCN1Onmt+Vv9bk5BwMOxQj
 MK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753280616; x=1753885416;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UxwHaK6YDUmdrsdUjFROIjJz+2g48h51kQ60Ua/P8/U=;
 b=vH9YhrBbqeBG4QbpxCrjc5gmGbfJAWVsLGgnzgiCoulzGPpXjocsEBBcqRGXkGpUMf
 OFvVKsOImIWtM4YOSWISDf5tSwY2L5cdgZAvTeBwYf1gHRBmlS5M4VNVbEYadsG1XD0I
 RtwrkSrJParx2B5HhlOZ9KRrxaZNi1TbpcPIdX4cKj9lPF/x/Z0Pe0sSfmxAnovxUOom
 J65b/g4XZKztHo2JwR7REX4yUn9lCs9p78UphVXECekumquprzw7+Yf+1Xv71MhLBOZr
 hUhitOOJHPwL/dF8fB1lJgNoZU/t8yQiIWhTBM0SmLJRzuAJWti+lAHNPfPb3nBcgHrz
 JQvg==
X-Gm-Message-State: AOJu0YxA3YdUM3F9QiPgDgtRRB3yyWRQAog/jbntnAzqgKrEcIGwpulj
 /AX6GwZeHUel6tx7oBKDgyYW/6+t76NuOQ43eUX4jteU+h4mSgDv/Xv/
X-Gm-Gg: ASbGncsRUHXUH4Ma+rP7ZNA7bewYnkKmQ1IAZHbHMwP+vJTswHDm96IviKodWaxD04g
 0FQPGmdTqOpQfL627zcm4OdHR84RqTXWed5ptAYyaQJeW/Dlprud4fNAekUGrEmAG4U1V68K1s2
 NAwSfxqw0EYN6WThfvUivqJy/aCmsHvlXbA3G7oMlbvnbI4VV1tFaf2kB5mvVHg69ejTxCrCjJt
 xOAaljPcfScX+R8GjSf3pApCVqSAptzKRgHS4OX1f6lyExoU9zq0f6VQAc50RJgQM8TLc/4N0Fn
 YE/4L3uauG86x48gfbUUpX5r3nUNA/Gu5JZZLgMppnCP7imw9soPTuL5dWCNIsNqsP2lYDma/sI
 da3r8nDTOVJhgMjiY9665+z+N1EqGYvAgp35RDIIMrnvuQu8am9Tzs2sW7BKvvpL4LLchRA==
X-Google-Smtp-Source: AGHT+IEd0wy3eDFLecrSHW0WlQqhyyQ7MxV95sUDV+ufUcT8vx5C+vZm/dLJytY/egk/pAWS9HDwiA==
X-Received: by 2002:a17:903:230c:b0:234:a66d:ccf5 with SMTP id
 d9443c01a7336-23f98235191mr55549135ad.49.1753280616283; 
 Wed, 23 Jul 2025 07:23:36 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([111.201.28.60])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4a9esm97929595ad.93.2025.07.23.07.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 07:23:35 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bjorn@kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Wed, 23 Jul 2025 22:23:25 +0800
Message-Id: <20250723142327.85187-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net v3 0/2] xsk: fix negative overflow issues
	in zerocopy xmit
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

Fix two negative overflow issues around {stmmac_xdp|igb}_xmit_zc().

Jason Xing (2):
  stmmac: xsk: fix negative overflow of budget in zerocopy mode
  igb: xsk: solve negative overflow of nb_pkts in zerocopy mode

 drivers/net/ethernet/intel/igb/igb_xsk.c          | 3 +--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.41.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
