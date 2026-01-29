Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OxyNNjzemnDAAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 06:44:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD0AC01D
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 06:44:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19C43C5663A;
	Thu, 29 Jan 2026 05:44:56 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADAF9C56603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 05:44:54 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-81e93c5961cso501876b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 21:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769665493; x=1770270293;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aTFAexCuRXSrudUiKudGOgw1r1B/c2BvxqH/opZ6WS0=;
 b=f+ahZFnova9kRWXOkJVJqZsemNSmjyZ5skUb4ykQ/QwoVzd/FodchjgozJhGgyj+VE
 i1qwfDN3ZkWTCWmga+usPLHyeBnjUQqXQ1N8hBtUwuta89ERPQ5EjOeicDx8QscfioBo
 uOIQq0u+ftmMqqWd3jS25nKJMoh7KUX+eVirisNb3ZfUKsFf6mYXcvCm0ZcRip+AcCf9
 jYjch9an0ss+v8GhusPvXlV3YJlIs53tffi8lKysR6bxeNtkar8F4Jo1FnHkap560J8W
 LtNEdWoJrZLohn41NfGJvuMamnVHWB8WYboF3/nGGFzMQ0xMs4pNNx+ZPdCbOayFNGoM
 /oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769665493; x=1770270293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aTFAexCuRXSrudUiKudGOgw1r1B/c2BvxqH/opZ6WS0=;
 b=CSm4DL93QSOiuGTU9msML6ZCNY14TvHdD/avEH/TPVY88qPYcQ72a/QxancBBRfE/D
 jvv1vU+wpyargCXJt1gKKV5PZi2cUXU0Spxl0TISCPTkszazW7jPUjo0rgG/cllP6Zkx
 3+xjqsLbrU5FxRSLk5xxPxwILFC9b6WYXLfCYok2LcUkMNqwULilYeibths6ds8Cz9Yd
 A91RWHje4KQyy0RV6tcbj55C7U2SzRB5iNedCp1P1lZAZj8ixcrmzYrd/5zQfEqyX9+z
 sV5iS0eTyU7v5AB1VIMZnBwOPxv2dvWkYvjc7zMeQjGSePiPzoh6G/f/JqnUocepABS5
 I85w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJeCfjc4ZRu9e92sFCb2FOv1Uq8UGtsojQV9vQeS2f/pTVMS6NPCgZde/PZE5JZCbGY/4IFlo0RYUBhw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzFYbVCt40iEQStM+8n/bYY3tQ856FZ/FpMfT8OkMy5WHA4bTP8
 JuoPcVYD1ZeoLk1AaBjA+UCPC3QleoOXsodOuQdUNpwogKaZKBqUTi7X
X-Gm-Gg: AZuq6aIMXx5f4rP3FngTw3KwGTv+7NVj434qkCmcMg33kX/j6fJZNGZUgyA1wfS/cNo
 5K571gW7ZRtCs9tC9YkLayvC+n1hnu8pGW7P7B92BLSUhG8R9QtI15BULSKsNptttknB8Zk258E
 fSdtwufogtEOj7k1vgvfc7Sd/yQ+Z6K3G8rHvJPKF+yCFU0Okhh5RYfRSdeqogUEnm7weAoEQ2q
 EdDRZ6o75QwQAsmUvduMsMexWYjIa8goX4w1zZ1wJLiss2jk/ioUADWmygRFBYjyVffzVYqQtgc
 bKQcCcMCO+FgiVo+GyICZpebp26WUTuEvrW3eCLBE3vBkYiY95Kv0h7MiBp09NH5uOu05z6CkdW
 e9ybm/CuG3FP69kQi646TMsYtJ5b2tGLQgNl783sftZoic+Vi3RpBV6edUt3YkliwfWpyNevRf/
 JI8ACQdD/T9wExYMisPcJ5uiZ69YVRuW6nVmSZuNq5ICZaimMNcf+6W4oUGae8cARZg5BHXtpT
X-Received: by 2002:a05:6a00:1ca9:b0:81f:3f88:89ee with SMTP id
 d2e1a72fcca58-82369173829mr7391460b3a.12.1769665492885; 
 Wed, 28 Jan 2026 21:44:52 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379c227c2sm4108364b3a.53.2026.01.28.21.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 21:44:52 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Thu, 29 Jan 2026 13:44:42 +0800
Message-ID: <20260129054445.416242-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v10 0/3] Add support for Nuvoton
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
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 7BFD0AC01D
X-Rspamd-Action: no action

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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 +++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  25 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  24 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  44 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 174 ++++++++++++++++++
 8 files changed, 407 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
