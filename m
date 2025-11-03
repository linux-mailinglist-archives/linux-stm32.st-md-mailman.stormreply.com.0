Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CED88C30EF9
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 13:16:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72AADC62ECF;
	Tue,  4 Nov 2025 12:16:37 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4C4AC62D32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 19:45:57 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-63f8a31d126so4035051d50.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 11:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762199156; x=1762803956;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zDgrJGPwTkDqRWUIRmg2o0UWPQlQh5Pa4lWjqQeT3Vs=;
 b=JthiAG7QgXW2ubOqSsak3riEyV1MJnM2v8Bn2u6M6OlROYRpZU1vYPwNfmblg6qJg7
 +swykcd6Hk0rFMifZptk2GUAmlFccb2RKekh/mXL3gjt93sQWxTs0x8GbRvNzERuaG7o
 n3As5PU+4zds7XR5cPdEgFCu0tfrkYKi2CwOhoKkF+ClVppStyFAk7So1IaZGINyhHtJ
 DtgpmOPq/9srJyWHQhVRlGQMBle9EW66X/ZtIe3xseM4j8YCQifzsv6ewW4My8u+kfFK
 SwISBf+AqpWojzovqvss8sgL7FmuYjYE5+up6+EYRXzo4ElKyH4Df5rVWKjV99SsXDIr
 hKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762199156; x=1762803956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zDgrJGPwTkDqRWUIRmg2o0UWPQlQh5Pa4lWjqQeT3Vs=;
 b=pzHlOuP61bXLmGDyvGW29iAe5y1VZtnFuB3mBSd9cw8BxoCoW6hCZcbmirprCXHltI
 1dsyQjdiGQAdjfoQQLXikvildrbsgZRG1RI5j4yJK8QKYwSNdNLYXe6jaXbo7FURHkQF
 +jeYT4s1eeQufHHySrObB+c/LDCLL7C2GnU48699Cw93wgmP5VPeN/Aapl64Q3fl50ag
 X/lMPzXatpcKBmbQ2PyPXA86h6tN2s0xculyYOTBuq2CTARAA7Hg8NXX46kV+p9OvyHm
 7jekvslhwCcaT4A+CdO+dGjea3ddZ2fJ+5y6D//8Dp2UaGX16aDcsscVpWYp27AH/BjN
 yQGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4MmChDR0t5oKLNmgqaKRh1qwqXwW8bV+tVxpy25oAy9voXFtMay8ssW0wa/J4CgB8guK5voz8P39rmA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSuzo+o1GQc162GBehdbj7SumGb7lfs+pLx8Fa0pNrp/ED+MkU
 DvKqWMprSqYDHIFKXM3JwnfwMDZvklXRHUh3FawEI8grMc+v34WcVjbB
X-Gm-Gg: ASbGncsOoh0qRRb8V2KggBzVBhdxI2D+KlrK0QNZbkXRThFAsoPJl2fXmFA/JpfLyKg
 mcaRXsnbw8NIyamAU9fFJ6N6QqgRCZPEKxeh7NWG4D8L++QycdFCsZ0qhd12SGZjE4NAwtlJj/g
 8I8rhzVQab6UJVxWmAiiXeZVVxZ4pVKPvNdmkTBhxWhMg49735OUsW8hciFyPtGQOpLGQiTkQKe
 oAudPIaATEQVFrFxVy9bSktF25+kKQepBvPWyqGMzygg73OSjkZT0wFEEqaGFLixXZWe6V87E55
 G0omzaFVNB3OnHJqdDDTPsisFB8ZBwc8s9p8Kh2YYGlLRtW0xUPB6stUnVfLVDXvyvB5CZ/5Q4W
 /lUt6F0UG5z/ZrJdyMxVaGzBG7br5EfnKiqpAbxdxn/uQ1XKe949yAiOeKPqIW9gM8q4DuQmSEz
 RBf7G/whCDvG53NGHqAiccY8hQIiDysPg=
X-Google-Smtp-Source: AGHT+IGNH0RPJesBeIcKsla8XUDm1bFpyEtjHsBQ6vejr6g2P49YD8AtgFLGMiN2odUrOWMz5ZeYtA==
X-Received: by 2002:a05:690c:6706:b0:786:8dc1:5242 with SMTP id
 00721157ae682-7868dc1591dmr18450727b3.53.1762199156319; 
 Mon, 03 Nov 2025 11:45:56 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:72::])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7869200367fsm3408667b3.42.2025.11.03.11.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 11:45:55 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Srujana Challa <schalla@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>,
 hariprasad <hkelam@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>,
 Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
 Manish Chopra <manishc@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Vladimir Oltean <olteanv@gmail.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Dave Ertman <david.m.ertman@intel.com>,
 Vlad Dumitrescu <vdumitrescu@nvidia.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon,  3 Nov 2025 11:45:51 -0800
Message-ID: <20251103194554.3203178-1-daniel.zahka@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Nov 2025 12:16:35 +0000
Cc: linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/2] devlink: net/mlx5: implement
	swp_l4_csum_mode via devlink params
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

This series contains two patches. The first is a pure refactor that
passes through the extack to devlink_param::get() implementations. The
second introduces a permanent devlink param to the mlx5 driver for
controlling tx csum behavior.

Enabling extack for devlink_param::get() allows drivers to provide
more information in cases when reading parameters from hardware can
result in errors or unexpected values.

The mlx5 swp_l4_csum_mode devlink param is necessary for initializing
PSP on CX7 NICs.

CHANGES:
v2:
  - fix indentation issue in new mlx5.rst entry
  - use extack in mlx5_nv_param_devlink_swp_l4_csum_mode_get()
  - introduce extack patch.
v1: https://lore.kernel.org/netdev/20251022190932.1073898-1-daniel.zahka@gmail.com/

Daniel Zahka (2):
  devlink: pass extack through to devlink_param::get()
  net/mlx5: implement swp_l4_csum_mode via devlink params

 Documentation/networking/devlink/mlx5.rst     |   9 +
 .../marvell/octeontx2/otx2_cpt_devlink.c      |   6 +-
 drivers/net/ethernet/amd/pds_core/core.h      |   3 +-
 drivers/net/ethernet/amd/pds_core/devlink.c   |   3 +-
 .../net/ethernet/broadcom/bnxt/bnxt_devlink.c |   6 +-
 .../net/ethernet/intel/ice/devlink/devlink.c  |  12 +-
 .../marvell/octeontx2/af/rvu_devlink.c        |  15 +-
 .../marvell/octeontx2/nic/otx2_devlink.c      |   6 +-
 drivers/net/ethernet/mellanox/mlx4/main.c     |   6 +-
 .../net/ethernet/mellanox/mlx5/core/devlink.h |   3 +-
 .../net/ethernet/mellanox/mlx5/core/eswitch.c |   3 +-
 .../mellanox/mlx5/core/eswitch_offloads.c     |   3 +-
 .../net/ethernet/mellanox/mlx5/core/fs_core.c |   3 +-
 .../ethernet/mellanox/mlx5/core/fw_reset.c    |   3 +-
 .../mellanox/mlx5/core/lib/nv_param.c         | 170 +++++++++++++++++-
 .../mellanox/mlxsw/spectrum_acl_tcam.c        |   3 +-
 .../ethernet/netronome/nfp/devlink_param.c    |   3 +-
 drivers/net/ethernet/qlogic/qed/qed_devlink.c |   3 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   3 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |   3 +-
 drivers/net/ethernet/ti/cpsw_new.c            |   6 +-
 drivers/net/wwan/iosm/iosm_ipc_devlink.c      |   3 +-
 include/net/devlink.h                         |   3 +-
 include/net/dsa.h                             |   3 +-
 net/devlink/param.c                           |  19 +-
 net/dsa/devlink.c                             |   3 +-
 26 files changed, 257 insertions(+), 46 deletions(-)

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
