Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C69A0AEF5
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 06:56:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3634BC78024;
	Mon, 13 Jan 2025 05:56:22 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A751C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 05:56:15 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2f44353649aso5189608a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 21:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736747774; x=1737352574;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B5kSRwp/LQmi9TB9FOxDQuTUZ2FNweKukw5dyy4zYRQ=;
 b=I7U3sIHzEntPgV5bJ7B947t7uBOYzu7xykMlgMSa4gFQjMzqCzZH3RsrNPdSUf0xTp
 sr4FnGKB1ZC7tXBoLzazajbfBngsQeA013bZ02EpdZtgJpkUszbjiD7TzvLNF0kdjPw1
 jGVcZjQR5JRBdXQv81Wi+KcaP992EXBfF/oOL93qqWQc1wLdzVeqAxpOfZv/oinfWlfv
 N8yfNGfQzj74FvSWAzVa1ONYZdZg1DZBmXo1HY1xmCZBB5Do3jdmwuvk4JZXWvHtNtuR
 wd+F+o1n57W+pNSzFUZCCvuZjR0GcAa+GyVXvdlcrCNd7C7pU+yhm/I4Hp/vm8JFv/j1
 cmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736747774; x=1737352574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5kSRwp/LQmi9TB9FOxDQuTUZ2FNweKukw5dyy4zYRQ=;
 b=TMycRDpZdzjyTF5eENLbhvQ0oSOblKD/oY+/HKqzNhJChQlDvSOwWXU/Fa6nTrmGuP
 GkWNUEFOMu4GZ+MgvJB/BzchE7fyZLbFDlgC5bHIpM+FDT/LsYvE4LnbT1qAvRHtQw5v
 Ji0a/i/6Vim2o8a1xwrAmUm0HPNQ9lYz6vSXUAMlCx5OWvWRxNxJIFRBcwYwkZOkF2/z
 aGwuOronqQqOQ/H5ZToDI1NBnPMdWaB0DgnbZ3+XVlofAhT1tT45G04rHCzQCw7VatLm
 aZMD5+G5glz8A8bLAd897lyk+mC5tP0ZK4ksiMlObOYaUjJ5hodsYQmr5h9tT59d73LX
 REug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKcxrZ9Qe7o8wJRMFXhgc59H+XHfl/noBZ1He1eKbMdPoQe4Yn5A1HjfZxaIgyV43bYtPh3Y/N4Io3Nw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywz3lQePEm6htbtEBbR0nCzhgELgI1t92mt+1p2CtNkjiDXPj3s
 zpjTiCNYMec73bgvLrrTIH5KCm0rvvl+Rc3m8/VZ0V3DJsWP7Nnh
X-Gm-Gg: ASbGncsTsxp0LZzsZ0PzqJGqbX1hQUfRrJwrgRNEUMFd5LpQts58hx9nWa3eynVSEGX
 LewXLIBy9YjOEddVKiEEFvjd8VQ4o8s8eYDblDBPYkAl3YMeLLE6BWFpVxqxsv+jRMXEo3L1CwI
 EVwKFGVdjU1+7hh5ldJOzAuZzJbRlrXejGtYakA3MpL8aR2x7gVzDxIRaEejGVClAPHkCXgVx3U
 0ULYPbJ/teF6YDtK4aYz3ZugFWwWEdM/UktjKonUUIxxzdzysgzFKh3w6QDqFTgl5n3eUkiFLzF
 hs6y++xEIBVD0lbn2SXTJw==
X-Google-Smtp-Source: AGHT+IFmIR9Ae+L9E2pmOyCcc+X8PWxnJne3SU6MtRQ2xXHY6ezLUBmNIufZB6pkQGPkrrzXMSDgtQ==
X-Received: by 2002:a17:90b:51d1:b0:2ea:7fd8:9dc1 with SMTP id
 98e67ed59e1d1-2f548edf181mr30621775a91.18.1736747773860; 
 Sun, 12 Jan 2025 21:56:13 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f55942188csm7768806a91.23.2025.01.12.21.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 21:56:13 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon, 13 Jan 2025 13:54:31 +0800
Message-Id: <20250113055434.3377508-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 0/3] Add support for Nuvoton
	MA35D1 GMAC
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

This patch series is submitted to add GMAC support for Nuvoton MA35D1
SoC platform. This work involves implementing a GMAC driver glue layer
based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
interface capabilities.

Overview:
  1. Added a GMAC driver glue layer for MA35D1 SoC, providing support for
  the platform's two GMAC interfaces.
  2. Added device tree settings, with specific configurations for our
  development boards:
    a. SOM board: Configured for two RGMII interfaces.
    b. IoT board: Configured with one RGMII and one RMII interface.
  3. Added dt-bindings for the GMAC interfaces.

v7:
  - Update dwmac-nuvoton driver
    - Update probe function to use stmmac_pltfr_probe instead.

v6:
  - Update dwmac-nuvoton driver
    - Use NVT as the previx for all functions, structs, and defines.
    - Remove unnecessary comments.

v5:
  - Update yaml
    - Remove the properties already defined in snps dwmac.
  - Update dwmac-nuvoton driver
    - Add a comment to explain the override of PMT flag.

v4:
  - Update yaml
    - Remove unnecessary property 'select'.
    - Remove unnecessary compatible entries and fix items.
    - Specify number of entries for 'reg'.
    - Remove already defined property 'phy-handle'.
    - Update example.
    - Modify the property internal path delay to match the driver.
  - Update dtsi
    - Move 'status' to be the last property.
  - Update dwmac-nuvoton driver
    - Use remove instead of remove_new.
    - Use dev_err_probe instead.

v3:
  - Update yaml
    - Fix for dt_binding_check warnings & errors.
    - Add compatible in snps dwmac.
  - Update dtsi
    - Update dtsi to follow examples in yaml.
  - Update dwmac-nuvoton driver
    - Fix for auto build test warnings.
    - Invalid path delay arguments will be returned.

v2:
  - Update yaml
    - Rename file to align with the compatible property.
    - Add an argument to syscon to replace mac-id,
      with corresponding descriptions.
    - Use tx-internal-delay-ps and rx-internal-delay-ps properties for
      configurable path delay with corresponding descriptions,
      allowing selection between GMAC internal and PHY.
    - Add all supported phy-mode options.
    - Remove unused properties.
  - Update dtsi
    - Modify syscon configuration to include an argument for
      GMAC interface selection.
  - Update dwmac-nuvoton driver
    - Remove redundant device information print statements.
    - Remove non-global parameters.
    - Retrieve GMAC interface selection from the syscon argument.
    - Parse Tx and Rx path delays by correct properties.
    - Update configurations to support Wake-on-LAN.

Joey Lu (3):
  dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 8 files changed, 394 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
