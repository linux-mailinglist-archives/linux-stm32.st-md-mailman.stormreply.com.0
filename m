Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A5AB307D
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 09:29:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB1A7C78F91;
	Mon, 12 May 2025 07:29:26 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F045CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 03:33:43 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-22fa47d6578so1836685ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 20:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746675222; x=1747280022;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BDD4yNEsjszfNYx9lT8DUsAY8Oe7hO3jU9PQmGvxdp8=;
 b=Txnu0VfKT4rCidVbYkvCvRtSjV+GadsgxUZviwG9Pc745VaV67cQ+OXRxcOUQJJb9z
 6nwRTWQMc41PJuHHmU6CosKPkrxJPbk7oN8//c2grUaIeRizoFModkAJj0v8J5BTZYRC
 NiGszdYHDltMPO6AUARcJsZP837HUx166eTZHI9UA7ZRy58p/iNoMvpqWTDGHUN/TX5s
 t4GB30DOH6C7UVDPG6TK0EiJ6edCuW7emXFkekl0O7lG42Ysdqd/0Zlzs+z29AZm4ARk
 x1+K24yhbz780c992ZP/kBL305nGZIQloHXA3LjK7aapmFN2OKcboHBDxjo9xVDMBLVB
 61sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746675222; x=1747280022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BDD4yNEsjszfNYx9lT8DUsAY8Oe7hO3jU9PQmGvxdp8=;
 b=nKY0Zg2KZ0xTZ/mnO58kVs4FxUReWYKAzYDVPzTzWvdzj17ohTXdVyef8gDEP7Jvj1
 Zr2zsp2b+J1KbgxMr0kHIn30g72wqBitP0yEznO3YxvdGuWK3WoWn7KBIanobOr6/FYd
 P0YIeo6qdPk1PUbMmBwW/ayqKa4yJKYQmHYH06SZ0/IBhoYcQTRnDMnrizdFagMB+1EQ
 h4Pz369NBKApOI5Bg6Dmg4oBrtPZPxfJUvS2UBUkeEDxCwJ6h92BcsxJcRw01bJLGjtp
 51nejlm0ZzOYXNSfVZ1Vdd4Xosl9NzB++7XVxqQVISWkbxXBYWPk4YoUfb/rLS3dV9WF
 4e8A==
X-Gm-Message-State: AOJu0YwFtWM0JHs2AgkQWzupVk6fpI5QiFo336kkuAGfNCBQo0pKwXnr
 kUSVjn/UPq3UHC1EZ0pG93dlOkxiUrtaBqxbX3KSLc8FuLLLXCw1
X-Gm-Gg: ASbGncteIHRF+rHGyMLRAg3uOaAIWAaJgWqMODB1UYodmjs2i+MxeqzqOfnGOFo7z87
 e2vgGTub5yFUkCvP1LAibUE6jKFEyZ9Zunf0P3VFsv0cZT5R3yPwtvWHcR6JLwsEeBy+shc0+5O
 JusozchbozZuxman9expMugPvtMd0SarJGIlDdhiQJtk+BO9G4c1i0sCdXTBIVTCsnBzZnaZMq0
 Vtrbo10VX8xC7TYVR7pCDd74XtEFehJ06d7RFqNyHhlIXqaxk6lsF0DaUiT2BSEfM6VXZ/bfOGQ
 tAPVGm5yAtWIuBszVX34pqbFItoWfjccOzwevT0g0t0JpdN1B24ms9SAnbMo85cGjnFDEJn8l/J
 gK7auqmh5guoD
X-Google-Smtp-Source: AGHT+IFDlLNJXygEF1m8UuwcdjVPwP+2wnjTRA4umRjmVjJvM/vrOQRs5VsFbED/owDgYFVHwooruw==
X-Received: by 2002:a17:903:19c7:b0:220:eade:d77e with SMTP id
 d9443c01a7336-22e5eddc7c8mr95430005ad.40.1746675222059; 
 Wed, 07 May 2025 20:33:42 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e15228ffdsm101685265ad.179.2025.05.07.20.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 20:33:41 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: irusskikh@marvell.com, andrew+netdev@lunn.ch, bharat@chelsio.com,
 ayush.sawal@chelsio.com, horatiu.vultur@microchip.com,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sgoutham@marvell.com,
 willemb@google.com
Date: Thu,  8 May 2025 11:33:24 +0800
Message-Id: <20250508033328.12507-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 May 2025 07:29:26 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net-next v1 0/4] misc drivers' sw timestamp
	changes
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

I filtered more than 100 drivers and only modified four outstanding
drivers among them because the software timestamp generation is
too early. The idea of this series is derived from the brief talk[1]
with Willem. In conclusion, this series makes the generation of software
timestamp near/before kicking the doorbell for drivers.

[1]: https://lore.kernel.org/all/681b9d2210879_1f6aad294bc@willemb.c.googlers.com.notmuch/

Jason Xing (4):
  net: atlantic: generate software timestamp just before the doorbell
  net: cxgb4: generate software timestamp just before the doorbell
  net: stmmac: generate software timestamp just before the doorbell
  net: lan966x: generate software timestamp just before the doorbell

 drivers/net/ethernet/aquantia/atlantic/aq_main.c            | 1 -
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c             | 2 ++
 drivers/net/ethernet/chelsio/cxgb4/sge.c                    | 5 ++---
 .../net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c  | 2 +-
 drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c           | 6 ++----
 6 files changed, 8 insertions(+), 10 deletions(-)

-- 
2.43.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
