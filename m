Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8CF7E1CFA
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 10:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41E9EC6C85C;
	Mon,  6 Nov 2023 09:08:31 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C7F1C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Nov 2023 19:37:58 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5a7c011e113so16186337b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Nov 2023 12:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1698953877; x=1699558677;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uogr7zU4t34ibaqbgxGWB9r8NXGxVylxADwS2sMjoTc=;
 b=ch0spQQ/zMQbeJsIyH1VcOPKCFp7bJulDRcaoNBquIV1AvJ09dZ+uqWrFESTUPQC3p
 fpoBpNIG2A9a50TA+PqLMjNqpuYJzDmN9zLDWbdrWyPgKa+LYBXNDcbgryVirBT9mG8D
 ZLwXT0988roWB8nS0EEHBk2ML0HwIvJd4WQO6R1gfy2MOIB49gRb9VA5DPKIPyPBuzWC
 cNtaB19ISfwdJvfw6UoUwPnHw8pz40lbefy2XXg4sDEyrtK5qLdFO1Jy5Au81lTCD5aT
 wjIDzXDVY+ecxGrn57TbyPF1QG4mXFCU2VrcUfmsm7srrxuakHxeuaPXdMHPSO1MdsZc
 FdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698953877; x=1699558677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uogr7zU4t34ibaqbgxGWB9r8NXGxVylxADwS2sMjoTc=;
 b=CIrh33Uk7c4FQTJIo/bjvXiXX5QBUZtvrXjhQeENOuTTIDCtX3dLd08Iy3uqgQOSt3
 V7+924Ck9gw7IsPWp3jDH0lNvg46fGmhFZaRQfbDAgYKwnwf8/+iI8LfW6gmI1cgojR4
 tWFMkCteYsGrI4Lq50TF40XDu8lUaHNZC7B/NVQR8z1anHFRAgaj5yu+NKLwy8epBGnM
 yEAn9E8qfnOQ91gBsL7/fzGbYpb7Nyrsmx7ZJjB0vxdUsYw63VyjbXEhzhAog/1mF2/z
 l7e1f1jC5v8HL4htSZxsps+8ujgqh1jL6eigC22U2fPE/DgpuCoNY7SnuLhwPVyugJ8p
 zkaw==
X-Gm-Message-State: AOJu0Yx9lLdzhtwgMMBOWWxFHgpK+R4fjpDKoUfivrkLYaulZ7wrUDTF
 i4oAXvHaj2U8Bd6hapYc6aKwSA==
X-Google-Smtp-Source: AGHT+IEGxFcOOrtvJ6cU9BZ2CGnOOPvIjlvXGVkgaylmcuyrz36fI4KJRg2FJQTlw2ceemhfetI4zA==
X-Received: by 2002:a81:4a02:0:b0:5a4:3e67:35a3 with SMTP id
 x2-20020a814a02000000b005a43e6735a3mr664848ywa.49.1698953876935; 
 Thu, 02 Nov 2023 12:37:56 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a0ce90a000000b0065b260eafd9sm30654qvo.87.2023.11.02.12.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 12:37:56 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  2 Nov 2023 15:37:17 -0400
Message-ID: <20231102193722.3042245-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Nov 2023 09:08:29 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH v2 0/5] Add STM32F7 SPI support
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

This series adds support for SPI on STM32F7 processors. The STM32F7 SPI
peripheral is nearly identical to the STM32F4, with the only significant
differences being that it supports a wider range of word sizes, and the
addition of 32-bit transmit and receive FIFOs.

v2:
  - Add missing commit body

Ben Wolsieffer (5):
  spi: stm32: rename stm32f4_* to stm32fx_*
  spi: stm32: use callbacks for read_rx and write_tx
  dt-bindings: spi: add stm32f7-spi compatible
  spi: stm32: add STM32F7 support
  ARM: dts: stm32: add SPI support on STM32F746

 .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 +
 arch/arm/boot/dts/st/stm32f746.dtsi           |  60 +++
 drivers/spi/spi-stm32.c                       | 455 ++++++++++++------
 3 files changed, 367 insertions(+), 149 deletions(-)

-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
