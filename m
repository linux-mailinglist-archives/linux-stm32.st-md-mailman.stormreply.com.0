Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AA6846049
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Feb 2024 19:49:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC435C6DD68;
	Thu,  1 Feb 2024 18:49:16 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4525C6DD68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Feb 2024 18:49:14 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a350bfcc621so155293866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Feb 2024 10:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706813354; x=1707418154;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UZ2BNxl4CuX+CwL0Q0MM0vOQQgkTfsFjivCQCX+8Vok=;
 b=EvYS9J7H/mPlDX2HbRZJDFU5BoDd5SAY0fKpd42099cJGYu1h3DAXIArVaQM4VUD2H
 IoqzF5SUqrpK24zEwfKT4m7NydAGDg2fYO6/G6v6r+aLN2Zp4rw3pND/rWYWRxKeD+Fr
 eUkiNixkavg66NR93gVpVdwBPZS7RwMN5B2YPYb0ExtHOfmr2FFLer7h5y3mDtwxYUZj
 Dvj7UoIlkfBzh9AYTlgzlJSgNtfCpfd8Me9YCy7r2ROamYWeHr7AHgj7sJFkUs4pORlE
 lD9xUBoWT8g7J+64GA4usfq84NAl45gUpXgJWf80DLXrF63u1Sow8ZrCWGVXxDUmGQu8
 IKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706813354; x=1707418154;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UZ2BNxl4CuX+CwL0Q0MM0vOQQgkTfsFjivCQCX+8Vok=;
 b=M8ubEHClXzdvdbKTCoywaiY49FyWrgh2ZSx1yI6wUIyFuw5xR8yu+1nLJlDur4AxS9
 uWif+LyMI/LgTeG5F/X3ayjyWZc0jNPopqomlrsbutylVwHTr5T7l4CNaoGgXAGjZjqm
 GjlJS35VSW3c1ABaEtQAYfFYCtrr1cKTwMhukLQdkWf005kjWxjDVgHHnWdU5kUCBLIp
 jwMU/54PLPlibuJ6Ei3LSEsb8EF/YtgV4z60fDiZkdJDGnjUIeVebDwbrDQX4U4fXvDI
 zVdSrfjoLx7TS9c5YAu6KW1pftw/bouAAYLITMF24H0I1ILRyUhKuG13kHbqv24eexm3
 R6PA==
X-Gm-Message-State: AOJu0Yyg8KkjIfOgselsYqzGrDBHmKI5uv3YAriO58MguzqLeXL9ecKC
 otIiS8KC++HKQb65Z+zDlJLNg76cB6FagzD7U6eN56otgfhcUjlv
X-Google-Smtp-Source: AGHT+IGGA5qp6wn5ZIQiyD78CL7wjsdqPIfXb8OZBkRJqlut4YHxc8hMsIAnp6J7GpIY62bc0rilfQ==
X-Received: by 2002:a17:907:762d:b0:a36:c478:32c9 with SMTP id
 jy13-20020a170907762d00b00a36c47832c9mr7913ejc.1.1706813354086; 
 Thu, 01 Feb 2024 10:49:14 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVU8v/SCLnQ7LZSb0w8mkEB9nouppO33QaZIRTkg63zkKfHvnUwR8byyA/ehU4WvIaOSLEfS1AnQtY6pDN12rc/YClKddtWhr0a2epLmZakvpUTr8th0VXyE8tQPJhTSLJwwHPcq9GfP6AvjsMFvrjtHSn6jHT3eL+Au5mtYYypiUEDHzsdwqNJG1hIkKcmDEZivoxQ9O9F3ghxR7jpcMFuXy2IW/+54zZJE3UcVwgFqqVbdYBg0hKZQL/CnheCZZ8ODDbsFBdPcJIJkC1+hjTDNsYFt/wtwblJYfHQXXm8O8K81vy2QX6TLgMcmEVmuKKIqlDDcGDqBn8LF9P8jRq8dCTvtfbY6EB5iX83RMThRTig2I94hY18VgJiepPAjsJCu+XCnHWDwOmxMEb9H9p3Ug==
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 cx3-20020a170907168300b00a2cd74b743csm66021ejd.3.2024.02.01.10.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 10:49:13 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 01 Feb 2024 19:49:04 +0100
Message-Id: <20240201-stmmac-axi-config-v1-0-822e97b2d26e@nvidia.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKDnu2UC/x3MQQqDMBBG4avIrB2IoSLtVcTFEP/oLBxLEiQg3
 r2hy2/x3k0ZSZHp092UcGnW0xqGvqOwi21gXZvJO/9y3g2cy3FIYKnK4bSoG08TxI2QN2Kk1n0
 Totb/cyZDYUMttDzPD6w5IFptAAAA
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274; i=treding@nvidia.com;
 h=from:subject:message-id; bh=oSTzOFlxbkYeKTE1fBaJJNw0JiRbh4c461BYCNvcpLk=;
 b=owEBbQKS/ZANAwAIAd0jrNd/PrOhAcsmYgBlu+eouMKBqCqjqHbOEFVUq9JEBc1aaNZ6eBX7v
 soopTeA7ouJAjMEAAEIAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCZbvnqAAKCRDdI6zXfz6z
 oSBMEACd6S+LvgVemvFHdK75JLJpTPtGcLDSQ/7Sk7hUBygC0TW7403tq5t6684qywgS1lXxtrW
 09j9R37CCZMvHlpp1RFdsRRu76P3Wu6B1EQPjupoitMRebpFjpD20jaAkCExwgzLyWEvwutf7y5
 pn6TvLXwgXUk5bhkgh7C7p0OaXdDMp9HMf/N8/2dKkbzZZ6T+5NMt3GE3fcduTnMgM6xDxnhXGS
 8bXvnYLCeeIvGeKcduRK7rcWxZrfqgymErDIM93ILeo2F+md46+NTjFFixPMABrrN/Z49GzvjCd
 3Vieksc4XFJDeXbkP6v39Cd4UHGGxiXXjYJsJ1rcjJIbnW0hp5A9BXp9vrQ3b/EhUcVLR+i9H//
 bXpj5hyCNGJHvMPVaqfo2Aiij8cw3t3AeEr+HTcmpy43I6FG9ROI+WGB6uSW2Rp/CFmveRHoYg6
 cffusiQC8Hft6ykZO6/s+4bJ8OHIiQ7kXXlUWGjFqLKQ1mRZdY++Xr7LTbioY2Itgljf8GOgdfj
 MzKTeKR5JKpxg8wQkdhNdn80oL97L/bfRzXP3Ta63b3Gl4VP/c3VUXK1p2KVIvudI1b3t2Ybend
 2jrqodVYP/HxW3DMfPb4/jNEOifckKicPANmsn6EsCXNHpTgAEm4XBCUJ9HY6OWTbCRJCW5rJK3
 Dj/WUeGdQSOFhCA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: Allow
 driver-specific AXI configuration
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

AXI bus configuration can, in most cases, be derived from the compatible
string, so instead of relying exclusively on device tree for the AXI bus
configuration, create a method for device drivers to pass along a known-
good configuration.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Thierry Reding (3):
      net: stmmac: Pass resources to DT parsing code
      net: stmmac: Allow drivers to provide a default AXI configuration
      net: stmmac: Configure AXI on Tegra234 MGBE

 .../net/ethernet/stmicro/stmmac/dwmac-anarion.c    |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-generic.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-ipq806x.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson1.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c  | 11 +++-
 .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 66 ++++++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.h  |  3 +-
 25 files changed, 77 insertions(+), 47 deletions(-)
---
base-commit: 51b70ff55ed88edd19b080a524063446bcc34b62
change-id: 20240201-stmmac-axi-config-77ea05ea9eff

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
