Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKGRDmATwWnVQQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:18:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B92C02EFDE6
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:18:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68AD9C87EC5;
	Mon, 23 Mar 2026 10:18:07 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB206C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 10:18:05 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-823c56765fdso5479b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 03:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774261084; x=1774865884;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kHtEe1e7RiyfO6lLZp+boVdOJK0KK9ZEoEY9OocgKBc=;
 b=AZw7QxGCCVbUD9AgZvgq3FIhswmtvZEdBNt4mNdWk8e02A6i+o9BPZbt+xmHfHInKz
 FPNytALqjp1T8B48j8wwvKe+3pCZ/HQ0XTTd9ulpZRi/kUV5Gl19h9Pg/UGDGXq9o32z
 irIBOAG/4GUjdzgutPfvVcXzHXGWdDMNh7PxlOE9Xd/j7t4WLrQWT1RcKgFCCr6fdfzv
 OBcUMXKW09sp6KIa5ftNMkJ10vl/ckehCVHce4wC4v8lWslKDyDIvfGG19AeZ4MMuCgj
 Ag6XNSMjkYHe6dXLEq9OWYlH8sBdRwXLqGFM/+gMB6q7w7I6pljjKv83Scy0MAeOj1UE
 ZgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774261084; x=1774865884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kHtEe1e7RiyfO6lLZp+boVdOJK0KK9ZEoEY9OocgKBc=;
 b=CHW8pFAxiTfCXr2g7w7Sw+FxDU8gvzn1vO3jRoj46U6GG+fqm+mpI21J2huL7zvvuK
 gMFPia+pbi8+iVl2LGA90udg2iYgy2bxRFbC56XxBAzQWwrz5L2ZTWeB6sx/tVe22THB
 pIUI9d6L5F5JRyWVmXquufwMfqEJRzbYzYWDVzWhyJSnHRJPXh1zTThbvU0Nl2RlWZgY
 GXCUeDXBidzE9qvGUxHV5VfIkLLcLKmbe5wat7qgWZsRnnnSTk6bQ1Kr5BlHeMKDFpYe
 KnbexEtaTENDxH1AZ+oghIKFeiEuAv/inBIi8CQqq5WSXUc0YDYvW73Ds8CuHU9aEW4k
 tORQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3v6zKXOundwe8S4vrGMoGSgi5FGJQDGjlFXtkK+3aG+BO7GfQ5u/YQoKo46AaE+NQ1EGe4l+ooVswqQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwIiygy4C9DLAV3rgfFyX3W1X2BRea7IxudObKgLYwUxc2//i4w
 WbqMQCYJyP/4NLckMcUcfpRtLbSD7rAuJYw0ILY53cdZNnSS8SpQIe4W
X-Gm-Gg: ATEYQzxFHttQ08K+9MAYK5b12XLDYiHPddyM9347tZDACCysXuopQQfqWt8LB+VJAm4
 ECcdtukjxBCa+VVT9MuklhYsLPUz0dtxjKrm/3TMsxfLkWi2Cq3w6XSnsp3fy97Q/mMRMVpQyPx
 kJeQe3Qd5B29Xvuuf84OFGvFTpu4RO3Bax8IK58znmYvGynW6rKb7RDGioPjAANyfCLkf7qhzuv
 d/yeqV7z7NsBUPiMde7yE901SzTcUPovR3ijzlL8y52TfMC71k+zwFiSjAxDnM6s8z4B6Sz3WmL
 D4GBiXf375kYCwOHskkLecjMjeSvDDD7f8Y0yHzQh2t8L1xuZa0Cro1l0Yaxo4pepMJbSfvXT73
 KtJ8CvO7fqTuzaKxfpiiYu+CvzAK/K1s+A/PLE3mgik5d8XtaryCiFgAqf3PE2WlaME6PRinwb+
 3bOTbCAEvVdob2UmBHEadANqzTPlRx2UnPuPBQfEa7g+t2/+j49Br9LqtwNoVBg18vNLn+DxpX3
 RM+e3BDH224
X-Received: by 2002:a05:6a00:2195:b0:823:3078:f684 with SMTP id
 d2e1a72fcca58-82a8c35d2bfmr9312586b3a.32.1774261084178; 
 Mon, 23 Mar 2026 03:18:04 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82b04220d9asm8630779b3a.60.2026.03.23.03.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 03:18:03 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon, 23 Mar 2026 18:17:53 +0800
Message-ID: <20260323101756.81849-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v15 0/3] Add support for Nuvoton
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:devicetree@vger.kernel.org,m:ychuang3@nuvoton.com,m:a0987203069@gmail.com,m:netdev@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:joabreu@synopsys.com,m:schung@nuvoton.com,m:peppe.cavallaro@st.com,m:yclu4@nuvoton.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,nuvoton.com,gmail.com,lists.ozlabs.org,synopsys.com,st.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B92C02EFDE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

v15:
  - Return error correctly in probe function.

v14:
  - Fixed dt_binding_check compilation errors in the YAML file.

v13:
  - Fixed YAML with dt_binding_check
  - Added callback for plat_dat->phy_interface
  - Updated PHY-related setting helper function
  - Renamed registers and values to avoid misleading names

v12:
  - Drop private structure nvt_priv_data
  - Fix error propagation to preserve probe deferral
  - Refactor internal delay handling into a dedicated helper
  - Move FIFO and filter configuration from driver to Device Tree
  - Update DT binding to include "snps,dwmac-3.70a" compatible

v11:
  - Propagate syscon lookup errors to allow proper probe deferral.

v10:
  - Update DTS/DTSI files to follow proper hierarchy and port modeling

v9:
  - Fixed file permissions. (YAML, driver, DTS)
  - Moved phy-handle and PHY-related properties from SoC dtsi to board dts.

v8:
  Changes since v7:
  - Rebased onto the latest net-next.
  - Removed unused symbol.
  - stmmac parent driver now reads hardware features directly to support
    Wake-on-LAN via magic packet, so PMT-related overrides in this driver
    have been removed.
  - Update dwmac-nuvoton driver:
      - Update the license to GPL.
      - Improve the description in Kconfig.

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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 140 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 ++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 136 +++++++++++++++++
 8 files changed, 391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
