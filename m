Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA1C977BC
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 14:08:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 766CEC628D3;
	Mon,  1 Dec 2025 13:08:20 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61CE7C628D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 13:08:19 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b72bf7e703fso727787766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Dec 2025 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764594499; x=1765199299;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jmWOE8tsVdZV+/3MWOEyJyy+ZPffvlIHcvjJiju9iok=;
 b=wwW25npSu/5QDNQUikuFvbDnDZ1DiiGXlqTT9sd3My0kjiN/6ms8VyB13uXJDCYOH1
 JwGXCkWGCh4fUHamMCN6etptX7EYgauRKMDzIajPEOR0hia+xtShuufYcxS4apHvf+wf
 2ZJcSBwMq4AL2DL3vT4tY/31FNeZdm0VBiY0ZanzIjPFa3fUjM2uyaOuTg5ButOQQgk1
 +J8wYIXDFmnfgmDaMQxvmiptbwBwIyYYObRS1zn5AANvVZDunFSptIPtzv8mIi4qZ27u
 0E3pgoJpuwW3FbLrJzZ96b2kCI6pTJ94rfTTLenTHZoj0hH2tJFytYAxDLp5y5i+ujeC
 mzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764594499; x=1765199299;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jmWOE8tsVdZV+/3MWOEyJyy+ZPffvlIHcvjJiju9iok=;
 b=Utk1nL3xL2p206LZyZuqSi+TnwDeDIi9LPFQAqfBWn90vBEmc57RKKtX1EHHNUdZNb
 MSILR8VqPtI/UKFyEw1plipZPrUMvc8TQRSdFPy22SHv0Cu1kR6lIhNaLbxPv/nkL6XR
 UKflxP1Ayq7uEwAgJWI+AqJ5F0kY7Y0jz0wpnPrdMRbR3tz8zXJ/g1cSF4s3IIrsWNiO
 OrtIDjve5KaSQa4U04Ugi0l+JxVo63t9taAw746lXl3vsCOCUEEXweA3qxrthxVorsLB
 WnlFFml52nlWNCwGmZONnOzefva4XsDRyXr7S3H+Uibw6f5iAcBPMMgRI12M9DwZZ9ME
 YKBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSFJMtu9iWxE04PJlO3zhFrA7ZRM3DukAamft/sGPTB2EsJAV3BiTftHDWzLCq7T8S4jlaJIjJnATbqA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyRUzfdJQ6+MgeGc61gTPcmDbChomc2dW628og6NGb8lw5uTR7h
 ZjuRMvG3HbUgNMIL9BALCvnc4+nVwvVaD+FkBjGPy+fDJtfmLSsc0Eg1/FfQYDPLDtw=
X-Gm-Gg: ASbGncvhVww1TwHtZ9iirT7vPJo5CUWvYAIx8Zh/hDFwt21OLZ2tpWcDwcIt2+UjjZQ
 XWRpFaUOBT1VVT4z9j15uDj5uxd2bw7Cr0FKRYTQAp34lxmHPOglOradxpCNgjgv4iWRVmvkVog
 k/Kzh0P+Hco88AF/7Rw6fGeIoNPfelT4dd3dwXG2kg/uDmlJwTqJmEivpU/8BB9rUiFrzgCktU7
 UAUGxL1nran5ghK6ZFOzfepSagPuDpjM46sbWSvfWnXZO4lupY3zL50aV/CaqHgfc39BpstPvPi
 0P2x7RxBBOrL5kOor6IPwBCzvkxJNjvLUHZvy3aLSt8iZu5WLGZenWWpF/lqmJidZ39xs3K44J+
 WNsJQbtkLAHorSl3sbe1B12BjCVoJjcxlS34mihC6ulco62tkLvxArJ9d7ezKoQPFvjeECco/1D
 EKGsnjL8CtZzMmQQT2
X-Google-Smtp-Source: AGHT+IG+9MCSjBtPt6W2+zBUhes3WpovLtX4vLeIrokTyK95t4Xc4QrjoCg1IRxwpvpD0DbH6J0bKQ==
X-Received: by 2002:a17:907:e8c:b0:b72:eaba:aac2 with SMTP id
 a640c23a62f3a-b767173c3f7mr4361122366b.26.1764594498454; 
 Mon, 01 Dec 2025 05:08:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b76f59aecd4sm1238751566b.44.2025.12.01.05.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 05:08:17 -0800 (PST)
Date: Mon, 1 Dec 2025 16:08:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Message-ID: <cover.1764592300.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linaro-s32@linaro.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH 0/4] s32g: Use a syscon for GPR
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

*** BLURB HERE ***

Dan Carpenter (4):
  net: stmmac: s32: use the syscon interface PHY_INTF_SEL_RGMII
  dt-bindings: mfd: syscon: Document the GPR syscon for the NXP S32 SoCs
  dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
  dts: s32g: Add GPR syscon region

 .../devicetree/bindings/mfd/syscon.yaml       |  2 ++
 .../bindings/net/nxp,s32-dwmac.yaml           |  6 +++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  8 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  8 +++++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 5 files changed, 42 insertions(+), 5 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
