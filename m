Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E93919F6507
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 12:38:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BFB9C78012;
	Wed, 18 Dec 2024 11:38:00 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B190C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 11:37:53 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2ee6c2d6db0so5539970a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 03:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734521872; x=1735126672;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d4nGgzN+PLoX+DtGKu6QZhwKkrW+RWGU8KNUJKfHD5k=;
 b=efiFPhIEHr6Fsxf/++BzAxjWv5MxKNxmhBJgutkhHvN+mMpQnraRoPByTVAHcsBjQl
 nRGMVdwfnMFM6gfbqGWcTU5PFV3yNGeGIm66+PJCiiQG/lqgqSQInxS7oOGcBKKNsIwI
 k3syu8mWHr5W6FWsgUxl7fH91eIz8yeug9d/Dp4cKC+vVu1zkqAsVJgJOJTySBYr5eZJ
 hbYt2kPGYCtF8fkIUiDyK8vjYeQmO/Mb1TJAQ2tnZUUVvG2ksd02/PdJvoOimaUeo9Xp
 l1mAPsZgq4GpukwhJTQg98T0De8oFCJTI4lCugT+D2SBhKYrgeHonJyV1F8/p1oH9xU3
 73vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734521872; x=1735126672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4nGgzN+PLoX+DtGKu6QZhwKkrW+RWGU8KNUJKfHD5k=;
 b=qW1Qeadpd7Gd2oQ6xeCzI5+kM9OkyseVIesuOFNPJnYbTYKENEKcN09E4znrgDe2jJ
 H8Cpa1XjQe+V7W13afx+CCySBJxDYN0+jNjLmBf52iIl8/fUl5+BDuhDE/3WRADgBK+T
 SsdX71leh2SK7jpRfs4eJhHF5bvvzzxd9Gwmpf0ugKClTKlG48TJl6QT0CuIk/6kgZVZ
 i5Plqi/lexAG1qEQew5tyNfg0Nl6Q9FaH/Qay5OMWzEO4C7dWKWW0l5D+jIkKM7yT31R
 JaaHDzzhgiWeS5Y+SnN0WFCWCDkbx7rV2vTkAdjrdwrdhA88Lx/a+aHIx25bVY/lmbNr
 GTGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcoeEtc58W75tXrb64XypCC9bHmnZk5CdwXpUF3NqyPDm6EJRtcQmg8LRHl0y83xO+ZOqb5f/3iS/7Kw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2CYSoKrEY4mw6PZcC3CJvopwlxhfZXhSSkPf+CuJL8y5wpixo
 aBS66Yh6ZMHfZM/qZXruGkCxNy/lJs8hBjYQjQypAboymEchlNmh
X-Gm-Gg: ASbGncvFPqIP52F0PxPVhbQ4Q9iSVMXoqyLfTWMhQaaK9nFbLNpNLdfFSiVp2NCuXbV
 +qkOGvkwRAekE9KPrzMoeBI2BIgzKCeo8GGbL6orlGLANoBwvlJqyuwGGk1UKCiM0dhu70PRhsW
 GMDMDfcU0kjFZDJYa236xYuteGy+XqkBd3n7zdFLsuebM7NqxHUjWsj1Gy2n5P8aOHJtb7BAdxt
 S1YOxG4g1y5L3BStfxmlN4SDC5acCEPoj5GWeS8QJgXaizl4ltjkw==
X-Google-Smtp-Source: AGHT+IFBGhYjjpAE0oXnnXnxBVHrfx2nI3EfADj8QvczSv8I5fWLimmdInMDqXwJQC+cnnxzTSbD3Q==
X-Received: by 2002:a17:90b:2dcf:b0:2ee:acb4:fee0 with SMTP id
 98e67ed59e1d1-2f2e91d941fmr4373626a91.16.1734521871854; 
 Wed, 18 Dec 2024 03:37:51 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-218a1e72292sm73745605ad.273.2024.12.18.03.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:37:51 -0800 (PST)
Date: Wed, 18 Dec 2024 19:37:43 +0800
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <20241218193743.0000521f@gmail.com>
In-Reply-To: <20241213030006.337695-1-0x1207@gmail.com>
References: <20241213030006.337695-1-0x1207@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: TSO: Simplify
 the code flow of DMA descriptor allocations
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

On Fri, 13 Dec 2024 11:00:06 +0800, Furong Xu <0x1207@gmail.com> wrote:

> The DMA AXI address width of DWMAC cores can be configured to
> 32-bit/40-bit/48-bit, then the format of DMA transmit descriptors
> get a little different between 32-bit and 40-bit/48-bit.
> Current driver code checks priv->dma_cap.addr64 to use certain format
> with certain configuration.
> 
> This patch converts the format of DMA transmit descriptors on platforms
> that the DMA AXI address width is configured to 32-bit (as described by
> function comments of stmmac_tso_xmit() in current code) to a more generic
> format (see the updated function comments after this patch) which is
> actually already used on 40-bit/48-bit platforms to provide better
> compatibility and make code flow cleaner.
> 
> Tested and verified on:
> DWMAC CORE 5.10a with 32-bit DMA AXI address width
> DWXGMAC CORE 3.20a with 40-bit DMA AXI address width

One more DWMAC core tested and verified:
DWMAC CORE 5.00a with 32-bit DMA AXI address width

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
