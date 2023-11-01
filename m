Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 111927E1CF3
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 10:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC5FCC6B477;
	Mon,  6 Nov 2023 09:08:30 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF8F3C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Nov 2023 15:15:47 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-41cc7b67419so49383401cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Nov 2023 08:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1698851746; x=1699456546;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=scSvTq12ck6hKrL81KpyijuxTwLdmUzADFiheIKoCgU=;
 b=XEbnairtUyv24uVriXrhjiSEJ3UQpoACE7pCsoOEK4DgPOTzwycEXegfxa7xO3ADUw
 otYsASOYQA3+Q+rF1oElaiIu5HH46N8GxBAP98LhDO6ozK8OnibbjjN1wn3jDZkI9jZr
 284+6LjO3T+v44boAKMb26xhE0qbIKxF65pZpMftzx/j4iHSb66LU0YUsGZYWhaZy8bK
 MM3WQwUm08+dlA8H92p8TnbwSN2BqvNSfDyFsG4aBhrA0omvetAlssewc4ckwKAjyEZJ
 7624zV+gPtlmLGglrZNCsXcw+nz1WqoT4vAGxNp+4h0+q+2M1kqtib1xoWl85bXvu42F
 ENfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698851746; x=1699456546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=scSvTq12ck6hKrL81KpyijuxTwLdmUzADFiheIKoCgU=;
 b=O6aW4ysbE4qzywF9eB9sATjcVaFZgKpglUdZ2zqNVflNKmLYWxfohUV6kzjLwbf6/+
 esuM9I2xo7Y95wxRe+asa9igWo5pTMhG2DJI3riwQI/pI92AcCUOlUmA1XCJkj9ZN10l
 xAhKPyqwiNZv+VVyZKF6NxTcNUibWy1DdO8iQFNBloY6s7B6omTJUI3zjNB1H+kADyjm
 18GNmoeq/0boyTyne0Qc4fDLg4X/f8SXr/QT93jo62bkKhPuapi0vAkh4ZkWBGsfcwOb
 ZtpGUPdEDkGHaS4sxETtibIUUXl7/yA4gwYZx336EuGfAvg62DjgP6LIN0WfDuHl9rwQ
 NW+A==
X-Gm-Message-State: AOJu0YyW4KFdBxplOEZYKVnsu78zbaSCp3ybffPtFsll6QoaS2DGdKHt
 guhLho32YISjoDvKCvKHrCkSEw==
X-Google-Smtp-Source: AGHT+IGG1RpnEwK+BTs6NWrgE9D/51hktrLMdXeYOhyejbjS26AScKHpDDXPsTpMZl3VpU8YIWQ/lA==
X-Received: by 2002:a05:622a:1aa8:b0:41e:20b5:fc58 with SMTP id
 s40-20020a05622a1aa800b0041e20b5fc58mr18826579qtc.47.1698851746656; 
 Wed, 01 Nov 2023 08:15:46 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 dn5-20020a05622a470500b004181a8a3e2dsm1477165qtb.41.2023.11.01.08.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 08:15:46 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed,  1 Nov 2023 11:08:05 -0400
Message-ID: <20231101150811.2747455-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Nov 2023 09:08:29 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH 0/5] Add STM32F7 SPI support
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
