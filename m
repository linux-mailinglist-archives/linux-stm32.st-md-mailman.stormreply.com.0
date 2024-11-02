Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA99BBB88
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3396C7A84A;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30F2BC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Nov 2024 11:41:26 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a9a2068f348so45110366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Nov 2024 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730547685; x=1731152485;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ODXSKIPM8Xa+YaYVLc8WanEICuRtJG6U7jSPf/7hZw=;
 b=H6JKCXnjyV1r+cjuLqG1mRxl6Cpw8Zflz196kOJ7z5LAYJyOb17Gh0F0frnGAZbgUL
 vCIKjmZL2y5tOyP/PZLecdSIDmhUgwxhPIqiRudPatgs0xYO8g0uFML+ocRHrabvWlHt
 n8n6r0Psg9cmwCfgd2qbqIUfjCK9oc08X3zrVqvf6PNFdPqrlJcYeCIwxMuzca+FxV6T
 sGlP9PUJoKCfbgpYR/8ERwMLseLVh7Pf9PEy3ZuaY68KUz4JC5pIzjFMmp5ibQbO5PIs
 YXahH4uaA53PaAENVqkgJZgl28B0xcVyKm/sD+BeWiNo0fjV8havlF3QnE7mOlG2BmdT
 s7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730547685; x=1731152485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ODXSKIPM8Xa+YaYVLc8WanEICuRtJG6U7jSPf/7hZw=;
 b=kJPfMOAza7SoIeh9P43uBUCBqNv/035dpGlyDs4B0/7SA5QCmHuaoUdBl3AHyES7a6
 Zuaa6hgH9BEB7rizuGqsTGxthm+VZEnkESA3ybKAcEfV5WaEm3I9BCXuV/iXI6Z23KHj
 66sEJ3t1JoGukKtp0yppGJmNpWWu8oWFdvEMzOwWKJ5AOw9AUGWLtjLwdG2IJ24oblou
 Pq28VKmxMmYgm+DOnJPRMpSk+7biMObMyBUSgyN3F7mYMAFH0epOatuWtmlvJ5dXIev4
 aO511Byie1agaC0Uo51CeSN6zF/CI3h66bH8ZntUXbitiuleGLM/DJCuyXw16X5iLQqY
 ZYHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1J1Q1xv0QoN3Dr5GQ+/1mb65BSWI1ierC/WFBzdVu5+s4r+mwE1+tqXZ/ceaXaoXtl2zdAgz8gfSL7g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4AIF2y6pSddPzgTEy+zqXm4q8j+ubO3xbZOMOS6x6v8iiowTz
 CScYvQMfUD4LZPTKVsRGSzzwMut2U7ZuMQN83dlcTfvDlXkIpjMq
X-Google-Smtp-Source: AGHT+IGP63fQoQMFb/ObB1eGQudz2/rh/yY91dTuFfLQmvqaGKroFryYsgP1YkjTo2qDjj678icCdA==
X-Received: by 2002:a05:6402:3546:b0:5c5:bebb:5409 with SMTP id
 4fb4d7f45d1cf-5cbbf88efbemr8731768a12.3.1730547685210; 
 Sat, 02 Nov 2024 04:41:25 -0700 (PDT)
Received: from 1bb4c87f881f.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceb11a7aaasm2224918a12.83.2024.11.02.04.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 04:41:24 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	kuba@kernel.org
Date: Sat,  2 Nov 2024 11:41:20 +0000
Message-Id: <20241102114122.4631-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, l.rubusch@gmail.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, krzk+dt@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 0/2] Add support for Synopsis DesignWare
	version 3.72a
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

Add compatibility and dt-binding for Synopsis DesignWare version 3.72a.
The dwmac is used on some older Altera/Intel SoCs such as Arria10.
Updating compatibles in the driver and bindings for the DT improves the
binding check coverage for such SoCs.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
Lothar Rubusch (2):
  net: stmmac: add support for dwmac 3.72a
  dt-bindings: net: snps,dwmac: add support for Arria10

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c   | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 3 files changed, 4 insertions(+)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
