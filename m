Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E3AA0A991
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jan 2025 14:33:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F28B7C7128F;
	Sun, 12 Jan 2025 13:33:04 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44922C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 13:32:58 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5d3be7f663cso642977a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 05:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736688778; x=1737293578;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qagkZ/LU4rtTQes27vALssH2ImJamgS/6MR4uWjQHuc=;
 b=VlXHKE62z2ftsNrC/ojCyAxI8XvWeAbl4wTGrXn5KsKwhvQMP2XGLGWC6O7DyYP2Qn
 Zipm803Qtx8nVh/yoC6iaxxhk7Dw8Ysu1Ukt9iQdRAQwBt4GWWrUT0M0G6w+7Y1qcsq/
 EEi9lACAYhw63dfiqigIW0UGseiD/Sb7erkVk8b0x4FxcPnSDkwmOISR2PXFUIyWopoM
 b3s10QCS9rFUnyn2+oZsX/hQH+DOonWXOkhSaWDsqnmuJvRmvSh+ZAZQ28My3Q9ziurv
 U17tXkGug45GBEY9YMwrQuS/yVRT60aRtm+WW0ex+kFY4F67brfQWrF+6ds+UGQB3Vf0
 EUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736688778; x=1737293578;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qagkZ/LU4rtTQes27vALssH2ImJamgS/6MR4uWjQHuc=;
 b=GU4ccl61wHJSG5SD8L6kgppFRoSA3Scz4s2Nne27U38tqfrb4Qi89pAji1ojVhKPwD
 IyYHNsUIXB0ij9MFZxv4HIWtyqxhkfyj5vmeuJ7+MUpp3Kg1ruoTSQtSJP6ODe0rUiXg
 iM8fiBqHmBnJ5u87rGQEuoeLCQQC3LjPYiypPQY1iYDfgCQkTBRP9JsVfy0nhuG4gNSE
 wq8+CvsL+tLwwDFGZog1Czv2t1e3KWtvGtYQtSr1PTKKvAKwx3jv1q9WPplUhT0jObUL
 4EXFI3kwzYqq0HGCC5wEZ42qOy+JoGmUk5FNis6b+gcA+7HGwMWL+tQJzcPTPdj0hHJb
 laJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUpc+TqLQ5epIjVwJ7ULLKb12yzE2GagmmkRY1+AeoQtRbiX23N9YdLQQC5qoBmgc533qcs4rSyI0+aQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YztT/MSzKxhEK0HeTHk2Iz/Tr5Z/gjRHr+cbdO3IbEPj/FjMHKL
 rf6UanpJULuO6KhPK971LZi4Xv6GKV+EOFs17hMa9g9jwneDmYVHE2xbiI3dk9w=
X-Gm-Gg: ASbGncsewg5C50BQtCQWYHSakaEpnzAQvW0i+I6lIZ3W8T1NkYVyjveDP1xD84NzRtu
 NKMyWGI2mtYLnP19UItiJs3H8YSrueybT/288JSNIqHFdPkXSLS3u/OrFI1oaGv4gL3HHtvwdnU
 BY4mRlTGLPvUd4S8l+dGttGq7zZgjuRDckMhTPa5ChBaqcjZJVZBiEXq1FHRtnUz7Fy4ahJo+ND
 XRgcdZoRCATFn+1CiEikShLCTn5M+bzDtlxfhl7Vj6x2jnjS7vXmFgR0o23VWpiyHwbJ7A6
X-Google-Smtp-Source: AGHT+IHGPI5G9xAGCnu9erfmrPb75d7mnwukM12RbyFiKbkogF5yX4joUi45dN7aTJobJQAhBKZ7tA==
X-Received: by 2002:a05:6402:1e8e:b0:5cf:f39f:3410 with SMTP id
 4fb4d7f45d1cf-5d972dfaf04mr5579529a12.2.1736688777399; 
 Sun, 12 Jan 2025 05:32:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 05:32:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:42 +0100
Message-Id: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHvEg2cC/x2M0QqDMBAEf0Xu2YMkoi39leKDJKselFNyUhTx3
 5v6OOzsnGTIAqNXdVLGV0wWLeDriuI86ASWVJiCC63zPrAdFhfltYzpAx7yZKzYuHl2ybUIMT1
 A5b1mjLLf5Tf9BcW+UX9dPyiJad9zAAAA
X-Change-ID: 20250112-syscon-phandle-args-net-386d05e2cd7e
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XKxgPXkqRoVDNfOxWtITwzSpA1j1CzTTW6TU8zpRG9Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SAA643Zo2cp/l+bcjvA4yh2jmRGdEETJsAm
 Enhfy8ebEeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEgAAKCRDBN2bmhouD
 16MrEACXZ72WUcShffV++I09qMxK0HXHtn8vUtnKitu0FCIocOPj/7yXCn5UNkwMiowlUD/SJU2
 eJcDaunCkjH8J0KQfk7GFxGX5vk93eYQxv0HlD+RMRxaKnL9IJJFTwy7UCU53xCeMtLDPVo/iO8
 GHcTw4W6rf9JhAdFzQAzZCXIyih19x9F+wejqS6Q1gbhTzpQdH0zpZ2eA5iOE9U/D1m5rfzBZDk
 B4CBqgq+Km8WkZvkDsFtGQLV8vHiL8OxkQa9UFtrUOzVTyLmgh4iuCLXVz4qgeO/AoojroJ6UD9
 UqyQTPPbEevML2onTmd6zO8u8P35sCy5mei8XuP6tTx/9xY4zj8vUBmIgNnDJTd1cdWIRpCaG2j
 ASmSe/phuj/0Yn7KYirpKOECOZkvSWcwS0ScdA4DTLxpnwGyacg3B+7MZc2TcaLQiNtfKO26d5j
 vaQiFJ75DmoCxwQabf+RYQ9umr+3c6yKY+pO7BC5z5DTLPv/NXBa8xTJNI03dK8YQMIC0dDCkpl
 qxGQp/Vb4x8lv1ftODbrjU03Z4MWTeI6ahuBLX5mJC+L20oY2fVmZ1vIL6n+9noDROXO/WrRhD0
 DlJiC2bxqKx7hcdSoCThDAzy30sDLBihn08oRSXZ0t9wxIhbCZYyeVSq539LUav3T/PLQgdIMwh
 6aN+wRTr39PFWGA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/5] net: ethernet: Simplify few
	things
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

Few code simplifications without functional impact.  Not tested on
hardware.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      net: ti: icssg-prueth: Do not print physical memory addresses
      net: ti: icssg-prueth: Use syscon_regmap_lookup_by_phandle_args
      net: stmmac: imx: Use syscon_regmap_lookup_by_phandle_args
      net: stmmac: sti: Use syscon_regmap_lookup_by_phandle_args
      net: stmmac: stm32: Use syscon_regmap_lookup_by_phandle_args

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   | 10 +++-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c   |  9 ++-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c |  9 ++-------
 drivers/net/ethernet/ti/am65-cpsw-nuss.c          |  9 ++-------
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  2 --
 5 files changed, 9 insertions(+), 30 deletions(-)
---
base-commit: 8a7b73388d7ab9aed82d5b81f943cc512ee54e9e
change-id: 20250112-syscon-phandle-args-net-386d05e2cd7e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
