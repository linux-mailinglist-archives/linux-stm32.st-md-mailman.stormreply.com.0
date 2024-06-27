Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B00A291A571
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 13:40:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D7B9C71282;
	Thu, 27 Jun 2024 11:40:04 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 255E3C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 11:39:57 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec5fad1984so65825681fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 04:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719488396; x=1720093196;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbI7/sd74idfi/XMipln9/gNNA6hsJvdqtzVYepkGFg=;
 b=P6ABIyZ0O8FpGnHf6oFSDD0l90GOpIm2ajmGp6pXy7rXxij3eLXhdHGFSnwuydCnL4
 UM65syZuon+7HrYL/eKJ30C2Be2NEcXI4HiuYzL2G6J/K9LCl6lNF3KsCs4wgGSiTEdY
 46DdzAcYHPAVPqUzzG7B1FVN9QiTKADViNsGMjk77862gR5Xqqe4WDOxpaSWKs4LvnHZ
 VOnUn7napvkw7OAijWpJzRhUoJFt+2AE7FCack4dOphUDnXDZzVwUQpda8rSFizrhY7q
 xJ7jwej2w1Nw7bg02kG4xgvCLmsEd7Tw5GVFXkF4l4S/BDptqf9YGAKXbBVWN+gbxSaD
 QOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719488396; x=1720093196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZbI7/sd74idfi/XMipln9/gNNA6hsJvdqtzVYepkGFg=;
 b=mAU7v8O9Vqrio3FSethZ9z/zsRWt/d+fSaCyJu0wpnTIcv4x8ZUFbaO32apZtsSYQp
 9+yNOLkKrJYPa3qLprJtvpmY7ZMtErzk6kPY9HAfCJwle7TlHmZdDW7WZBaw9DbheLHp
 4i0RINyXdaZEhT8/Y3JgTlYbfgf6Bkm+S2LWnid6BtiZn+UZH2DJKSHYnx8vIf+EOQxa
 xhgcXZwOsyGdMVO/GQIR34M14zJ2kuBi/skBCtTSw7+jbiW9n6qp/AmvcAuyDxTN5YDa
 6ixfQQRSLj+hnnq+3NsW6w+jKrk1Ak0ppPD1IFEUgcs3t12oj0BYpSzNhbsaz/E8bNLi
 b9LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWScG2Dg08O7wO/PsoVBiIexG8gxNYmRxgK+VSO/6Edn0vuJC2Tyd4cByt8/QVTqehD2oaCvgUO0Y0G/3inb9cZD4B3TjWonZWfzlN3/O1fguDqQQGp1NPW
X-Gm-Message-State: AOJu0YxUIISeANOzH8jaXLFAQdgyxWna4LurfDLvpleu0WMjpUTO8XRH
 bxaLrUH9GnoHczv+fWlMWFqnfrDyMsZym4wGxl0IYg7zmTiONe4quYhCJ10ueRI=
X-Google-Smtp-Source: AGHT+IHFDzARAto2HLAI3TxjHyub50L0O0Jnjrz9yXwhDePCwserMcflGKVLOY5zTOX5jsXXhqzpcQ==
X-Received: by 2002:a2e:a442:0:b0:2ec:5019:8fa4 with SMTP id
 38308e7fff4ca-2ec7278a341mr44969421fa.49.1719488396147; 
 Thu, 27 Jun 2024 04:39:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7fe5:47e9:28c5:7f25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8468613sm62081815e9.39.2024.06.27.04.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 04:39:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 27 Jun 2024 13:39:45 +0200
Message-ID: <20240627113948.25358-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 0/2] net: stmmac: qcom-ethqos:
	enable 2.5G ethernet on sa8775p-ride
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here are the changes required to enable 2.5G ethernet on sa8775p-ride.
As advised by Andrew Lunn and Russell King, I am reusing the existing
stmmac infrastructure to enable the SGMII loopback and so I dropped the
patches adding new callbacks to the driver core. This no longer has any
build-time dependencies on the PHY changes so sending it out separately.

Changes since v1:
- split out the stmmac patches into their own series
- don't add new callbacks to the stmmac core, reuse existing
  infrastructure instead
- don't try to add a new PHY mode (OCSGMII) but reuse 2500BASEX instead
Link to v1: https://lore.kernel.org/linux-arm-kernel/20240619184550.34524-1-brgl@bgdev.pl/T/

Bartosz Golaszewski (2):
  net: stmmac: qcom-ethqos: add support for 2.5G BASEX mode
  net: stmmac: qcom-ethqos: add a DMA-reset quirk for sa8775p-ride

 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
