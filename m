Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBC17A727A
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Sep 2023 08:04:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF35BC6B477;
	Wed, 20 Sep 2023 06:04:11 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F4D8C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 19:20:01 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-770ef96aa01so393866585a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 12:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1695151200; x=1695756000;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Eyh1KouBtG7Iy09LS9HXsGpQo6L9jAzzmaZyqdFSGZk=;
 b=XNLk6F3ma0IDv7+ZD5GmwTIwkpQhonGA77KTu5q15u/Lc0HhNq+dhcqffX76YpYgYb
 5ky4MMpuKE4M1iLkMzNcBUUGMEGMWkbmOreQbDnB8pWobzJ/86RxHuzmMjfLM3cY+wPT
 w4jjEPH5oR1rAmknQGX6HRRac0AiTdLf4dc5N/oWOjNkrR1glu3HtCoz15mJcYT1In6K
 kyIYGhlolKUtGn1TuMjoaH8zeS1LW8MButhqxJMrCWscBJvRM8A23hJnCaaYcCPLG0PH
 xbKYvuAPhTj9p2y7PiXgpaHcF+rqy3bbNtWWgy2kG0U+dSnyIuQndOc6WMt0auvQvHQn
 sqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695151200; x=1695756000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eyh1KouBtG7Iy09LS9HXsGpQo6L9jAzzmaZyqdFSGZk=;
 b=imSyAe5vGxz/GAxZ8afiYnI/W7tIkn3Mg8I6wDGSZfKIMq0wwpInab3fyPQPQ81N0o
 e6UAIrz5/UKwarqX3XhST0sWV51Qoq6X3ig3E/l9PiCeIa688b1GiO+6Rqj/1AsxtVfi
 LkTfj6PL/XeDFRNVxpKyjRU5Ga6IH7TD0VrRhEcfrxMgNCM/5flX7NiYlLt2nJJ7LXLc
 6e0e+Dm2kagGMCV6vhkKRSuBmItf743+gf58/t6sigvxd3l+zrPUhNIF0Y2RHvulplDR
 H7AP5oLZo1qDT2Nl+dw+B4kfEYPRiLCsCIvoUolV047cczOQyuBPwAHhvinrnnQrlEBL
 jGBw==
X-Gm-Message-State: AOJu0YzoEpbiAfqdoWT5iuoUzN89sv1n5vFUCT4a3nG8/QknhNRQxQAV
 V+RfrWNJeBVKtcVlAyuC0EWb2dYsoP77Guuc+v8BjQ==
X-Google-Smtp-Source: AGHT+IFIzlQgbfEYm0jO/4QPXVzoFCq4BxIA1q1xLtcSRQPlfowW+Ybgvv+50FIj+ScdvLKfPVI38A==
X-Received: by 2002:a05:620a:ec7:b0:76e:fea0:3f40 with SMTP id
 x7-20020a05620a0ec700b0076efea03f40mr562362qkm.8.1695151200597; 
 Tue, 19 Sep 2023 12:20:00 -0700 (PDT)
Received: from dell-precision-5540.lan ([2601:18c:8002:3d40:df77:9915:c17e:79])
 by smtp.gmail.com with ESMTPSA id
 x12-20020ae9f80c000000b0076c60b95b87sm4179704qkh.96.2023.09.19.12.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 12:20:00 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Date: Tue, 19 Sep 2023 12:45:34 -0400
Message-ID: <20230919164535.128125-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Sep 2023 06:04:11 +0000
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH 0/2] net: stmmac: dwmac-stm32: fix resume on
	STM32 MCU
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

On STM32 MCUs, Ethernet fails to come up after resume and the following
errors appear in dmesg:

[   17.451148] stm32-dwmac 40028000.ethernet: Failed to reset the dma
[   17.451266] stm32-dwmac 40028000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed

This occurs because clk_rx is never re-enabled during resume. On the
STM32MP1, clk_rx is left running during suspend, and therefore doesn't
need to be enabled during resume, but this code was mistakenly applied
to the STM32 MCUs as well.

The first patch in this series applies a minimal fix for the bug, while
the second refactors the clock configuration to make it easier to spot
such bugs in the future.

I have tested that this series allows Ethernet to come back up correctly
after resuming from s2idle on an STM32F746. I don't have STM32MP1
hardware to test.

Ben Wolsieffer (2):
  net: stmmac: dwmac-stm32: fix resume on STM32 MCU
  net: stmmac: dwmac-stm32: refactor clock config

 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 116 ++++++++----------
 1 file changed, 48 insertions(+), 68 deletions(-)

-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
