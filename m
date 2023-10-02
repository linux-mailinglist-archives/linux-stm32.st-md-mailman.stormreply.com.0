Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E40EF7B6C70
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 16:54:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98163C6C835;
	Tue,  3 Oct 2023 14:54:44 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41740C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 18:09:30 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-77574c6cab0so5698585a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1696270169; x=1696874969;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NfCq6MAu8bRwi9TEgatpoY4BVdbPJq248wgHhwcLCxU=;
 b=a5g4Y2UhN97N3WlKX8XRuWgcFuyKCk+jBDzHXO4elZNtTY7HJmHw4bSrME5P5xfPuJ
 5+b1R9MiJOu/6/ckuSdBAzBTimiaVSWm2jZNv1W9ZCDZghr7vm8/SWwSGAJAL2kchD4f
 9s09IBXbmtoPN+G2XDomtRu3acWI7j5WdSOZ8ZAc6uQ+yPfJDicoaLpnehtFJ060XIpt
 AezvB0o1FMhvptRKEWfgA0U9BgeVZjB4Bw9YlgxUqTyccjRonjCFlMYRFhQibC/S895M
 BVtNGAZ4Rf9L8JF0/rodp3Dv2Gx2CkWQTdQncLYIO9wYin53mHLhA4pVb1beKHba9E7X
 41zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696270169; x=1696874969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NfCq6MAu8bRwi9TEgatpoY4BVdbPJq248wgHhwcLCxU=;
 b=KYnt+74Bn8b7bu4pMvJJ6iCtafGIV7y6/VFIoc5s6+Fv8GXt2ROci1NR6nJ6Bf0/4z
 DIkddqmv3Prz2v8B72NXnGlEHKpLbFl1WAXRTy2kYTp+UKuftUVE30ogeOWi+BdBU9b/
 x+iPdzcoa0TG61uA91CTlQpVjKpT3Khv6O6B37NiSPy/PgcEVVYnhcIWiZ5zMk3DQiSR
 Jj9QSmMHeE72ogv2tIB/nXKZ+5PYaHt2G5iBtGMRR1d/g9zauOcyY8bbKBsS0ST91mH0
 ER4FseB0HGtOr2xoD8Fl0OJtctIGWdTpiGYQL/o9G+xyQOiogf2OuoqD9iI6MyuZki2E
 nbPg==
X-Gm-Message-State: AOJu0Yyb0stOxqo1zizXZxj5q+mBWp2jDkG4qEs88pFplYHUihovhHSF
 wYp0RSEwhcXImOptdgpi3cIM4Q+UleY0VxWGDyEY4w==
X-Google-Smtp-Source: AGHT+IHop+Asiy9bLSfXRnllAQF/F67qbTBnzT0eLQO8TWH47NHOTuxYVaMToaBRfrPoZTYvNxMALg==
X-Received: by 2002:a05:620a:40c4:b0:774:1ac2:79be with SMTP id
 g4-20020a05620a40c400b007741ac279bemr16806248qko.53.1696270168810; 
 Mon, 02 Oct 2023 11:09:28 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 w15-20020ae9e50f000000b0077423f849c3sm7390255qkf.24.2023.10.02.11.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 11:09:28 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date: Mon,  2 Oct 2023 14:08:52 -0400
Message-ID: <20231002180854.1603452-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Oct 2023 14:54:42 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH 0/2] ARM: stm32: add clock for pwrcfg syscon
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

The STM32F4/7 pwrcfg syscon was missing its clock, making it impossible
to use after clk_disable_unused(). Simply adding the clock creates a
circular dependency, because the syscon is used by the clock driver.
This series resolves this dependency and then adds the clock.

I tested this on a STM32F746 and verified that syscon writes now
succeed even after clk_disable_unused().

Ben Wolsieffer (2):
  clk: stm32: initialize syscon after clocks are registered
  ARM: dts: stm32: add pwrcfg clock for stm32f4/7

 arch/arm/boot/dts/st/stm32f429.dtsi |  1 +
 arch/arm/boot/dts/st/stm32f746.dtsi |  1 +
 drivers/clk/clk-stm32f4.c           | 12 ++++++------
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
