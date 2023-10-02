Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AABCE7B6C6D
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 16:54:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DA05C6C82F;
	Tue,  3 Oct 2023 14:54:44 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7243CC6B473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 17:14:11 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7741bffd123so3366885a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 10:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1696266850; x=1696871650;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2vIApzqx7RSqfv9G4qO6eh847tMk8NOWVGPEc61q9ek=;
 b=Bq8kStVtq1GaJzQd3wTwtXQ7Dyq2muVOgF/ztlfc3uteh2QnRtYxP09Crg2HtcTzjN
 IrdSmYf1o15xE18vk3sXwE8+n1nb3bpJ1Wv6zy5EG1fZDyvrijJoqQcSb4kwOgTX4QnN
 WMiSrBsw7NmRZBKsGT0ved4DGxqK47/fR7LWrOsXX4gLffhp40S8/hFzzS2nsMd80111
 QlOHDfVFEMT/fMhw91ZTnIRrcpEb4hilhnaxaH4FK0cuPNLgNdLSqTSr9BCmoPQ3o3ls
 CkkwfcKkz5KRtm/0Mi4ebDqMkLArbh53li06bLPbx67ZrHXjCw/kfsZLXRjXA8gQMzyq
 lVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696266850; x=1696871650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2vIApzqx7RSqfv9G4qO6eh847tMk8NOWVGPEc61q9ek=;
 b=vX3T/3U/ydE+2pYZdbMAM0uKCIuFFx0NQ68knpHaBgxB7tDcvbpeJ7wNvfPkwy9YS7
 DsC4YSh1Z1g9EsMM6JcZsfgFGJF7t7Q5Wi3EVHE5Pn8niUTmdnsAOtNISO2TE0uNs34M
 HlBQqKxGoIBtDj7Pw9G4d7rtAb1OKuasivEMpTQUxoR3UVAo0dmGGXywRBGnfbR05Yrl
 iYleHUOUi0RZXPNj+mjhLBs5DyFVLN6nJvfYCB+8xVl7PKo1su8psZnFvUhEwOoVDQQY
 1N6LrLwXi1BkqjrndmSIGTU6Phje34URLwZa0Wkh7pnSAEQoe4wsqnJwooiBYCtX9b+1
 24ug==
X-Gm-Message-State: AOJu0Yxdu+VZiQ4D+5mFtIKg8Wqw4TaTkj7Jg0NdrC+upzOIRYDjDLqq
 8w5oTVppnqAwiBV9cYy/LirjbFien+he+4v4K2F9Tg==
X-Google-Smtp-Source: AGHT+IFZurT7JngeQirwA2jtLYPng4babEnnQLl5D2Ptls5BdYYfh6ahjHWl685659a+Wn7KA9QJDA==
X-Received: by 2002:a05:620a:31a5:b0:775:8040:ede6 with SMTP id
 bi37-20020a05620a31a500b007758040ede6mr14551196qkb.21.1696266849865; 
 Mon, 02 Oct 2023 10:14:09 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 dy52-20020a05620a60f400b007678973eaa1sm9132660qkb.127.2023.10.02.10.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 10:14:09 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Mon,  2 Oct 2023 13:13:37 -0400
Message-ID: <20231002171339.1594470-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Oct 2023 14:54:42 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH 0/2] ARM: dts: stm32: add SDIO pinctrl sleep
	support on stm32f7
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

Add support for switching the SDIO pins on the STM32F7 series to analog
mode when not in use to save power.

I don't have any of the disco/eval boards to test, but I have tested
this on an Emcraft STM32F746 SOM with a UCL-SOM-BSB carrier (using an
out-of-tree DT) and our custom carrier board.

Ben Wolsieffer (2):
  ARM: dts: stm32: add stm32f7 SDIO sleep pins
  ARM: dts: stm32: add SDIO pinctrl sleep support on stm32f7 boards

 arch/arm/boot/dts/st/stm32746g-eval.dts   |  3 ++-
 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 22 ++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f746-disco.dts  |  3 ++-
 arch/arm/boot/dts/st/stm32f769-disco.dts  |  3 ++-
 4 files changed, 28 insertions(+), 3 deletions(-)

-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
