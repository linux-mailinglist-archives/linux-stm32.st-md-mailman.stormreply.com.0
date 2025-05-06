Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9C3AABF93
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 11:33:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA297C78F83;
	Tue,  6 May 2025 09:33:23 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D24C4C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 09:33:22 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6f0c30a1ca3so58366206d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 May 2025 02:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746524001; x=1747128801;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oX660r49SMPlsIsK7beVHLYMkPYM6F+6v7W4PhVK2ks=;
 b=Cg51ylP7XbKmCQJ32iALToOFaAjw5YoZ5S9MosKtf+KwtYRAY36yX9ti06kfIpW7Xv
 Rb2Dzd0JpEx+63xx8dVRig25TItk7l5F+Wt77w+mwTt6P4rG1OqCcEZv0Kia1CTYiN82
 86FenX7VB3XOlo4vai+aA9ZumQ9rlebOekxnOs+KUchx+c8rEhlkH9awbv4p77xK/bFY
 KiN/mNqsJKGk5ECA5eEJFuPrMB4SI++DX6536Su+rzfavQYurBSUV9xKKSFTD9IOTTEN
 r0U0CqqSKrekbTDOx8V/lihwcdz+UoxvgQ/9gCnp7LEmPPEgq9yfXJqEA2L9luaghoMl
 MfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746524001; x=1747128801;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oX660r49SMPlsIsK7beVHLYMkPYM6F+6v7W4PhVK2ks=;
 b=HMF8hnluJuHVaqp90Vk/V7j0YZl0vv2UQey7syjPxNfZf3qlv3lNX5DvAV6jg0JCc9
 jSCmXbibQgzA5NbqTrtxYzGAmfph9DtE/QU/MRxVowHIiA51+vnMjI/ZpqBPfcmzitBD
 2Jqg0j7g7dAnFSUrdANBEgjKGsvvTUbl3dVKIQ/Oo4q+gP1QrrX2HpWDGE9NRxxcJVT1
 y6xBrmAfEtS86/D4vcBvsnFPlzXQ/RKAr1mHAaVuDO3hAHAiq2uNTvauSVTGEI9Z4FAf
 xC/iC7DiuM/Pj8MpKA97oR56A9Q73AtxkxcXrV6VUVc9j29ivie1QS0xnpPapErJTZru
 e9KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPJIeeraSpHJz/eKBSTB/mIj0AzjRKLka38rh99gWVIhBaGXGBI5u3G3Vjf/09ZQd2GN+dzSZxcscoDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx81Y6XYYyDank2dEFLh1nT7R+RafX6fanavYkjmhVJ5mT5yCRS
 IITNpxBPICsdWTZ4S53YZzWo/SLfn/073f8meVg74D9R4oHaU79h
X-Gm-Gg: ASbGncsWVscyWzn4yBnXNOcCpGdv+WADAt1oI3fwSqaqWX0sqhn7DwsakLm3qsTdTy9
 X8OXbT9EiX7pNxHzWF8iF7EM6PIJJL70OeoXwABRqeEPXEGtkHl9EuIGSiTftkqdKKdmUp4ojJ8
 nfs9zGWe0kl1dkEc3SskIuHDQzZUizbHldqWIiPHhyfiKafjfd4SKiQxKB/dcC//SmhdtRS8JUl
 LWISP4L9Fepk2xeMjVO3UjLiV/SxtycIFQwRch0HhBgB/kjQU+6nEs+lWvDpDl1dm/XNfnhYM3h
 Dp+OHPYevlB4TZad
X-Google-Smtp-Source: AGHT+IG0tpbViwqp9IJzfEAZpGJYiDuvgoMTMj0cgQ10I3tT7p2nWJKoF5IKgXDVmrvJ8d3QbJqUDQ==
X-Received: by 2002:a05:6214:20a3:b0:6f4:c824:9d4a with SMTP id
 6a1803df08f44-6f51574c329mr249376586d6.13.1746524001422; 
 Tue, 06 May 2025 02:33:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6f538316c12sm6219536d6.0.2025.05.06.02.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 02:33:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  6 May 2025 17:32:50 +0800
Message-ID: <20250506093256.1107770-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/4] riscv: sophgo: Add ethernet
	support for SG2042
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

The ethernet controller of SG2042 is Synopsys DesignWare IP with
tx clock. Add device id for it.

This patch can only be tested on a SG2042 x4 evb board, as pioneer
does not expose this device.

Inochi Amaoto (4):
  dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042
    dwmac
  net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
  net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string
  riscv: dts: sophgo: add ethernet GMAC device for sg2042

 .../devicetree/bindings/net/snps,dwmac.yaml   |  4 ++
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 11 +++-
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 62 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    |  1 +
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  1 +
 5 files changed, 76 insertions(+), 3 deletions(-)

--
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
