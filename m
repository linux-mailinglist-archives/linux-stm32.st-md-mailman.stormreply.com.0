Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E60A0992872
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:45:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A7E4C6DD94;
	Mon,  7 Oct 2024 09:45:22 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F18FAC6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 18:16:18 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-205722ba00cso12242165ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1727374577; x=1727979377;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BafvbNIW0TpRsFlOtdIQQkficdW6Q756VnEt7t1F6Gs=;
 b=QVU6R9WaLYE8kQsJ9EYm+tyBp8kXxJp2glVyHXJM+Y8xurLna0Cn3ZtQ4V0j8uHl4r
 xqJVRvkbsR8Y6TJpVj7ZzPh94A67oM/yBU8vtdnJe8rclQPNXR+CThAhLyPHTLCQA+5Q
 BBaMEv6YHyzQ5IASNKpt0ev6oE2V2NKCyC+mHu+I1wNCgV3MNmTsOb6Izrs72hKb6lTL
 B2fwvFaECrZcpQxcOJXxLt8ocV1yk4Tik1y5YkeSeAAv+z1LLz3k260kvMWvB7zJEUuW
 GLC71yVKNEKG7Npqof7Wr1XPlhLy8WLi7twVFx2nfCg0IthhIWnI4nJnlRtU2F1fOEpb
 /o2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727374577; x=1727979377;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BafvbNIW0TpRsFlOtdIQQkficdW6Q756VnEt7t1F6Gs=;
 b=gtF4K9NoqQEe/Jb6EtfuabPr4uNFDrqDyzlLF7ESpDjOTszGbhw72M3hIHbMaH3D8y
 Hw28u2mU/wi2a50FwvxOawLh46mx2u+eVB0z3B7G35mv2ie5nVVT0kJxn8evPQVRtVeM
 nCqMZXkP6JaT4KH1H+lshnoHEYhQitccOkHABQfGYhWTLQV0kpPULn9/ImlhFN8gwY+E
 RBRUai/uSLXUrzSv2pldps3Rqa4RILXnBqZ8SXwrWMIzVxZCXHoPsBJk5ejmxENhWjzR
 gs6UEoSIk0H2tdyP55koksFeaorXddHnZb44bJhzpJywviXATJH8l+11eMOXpmlgpDxi
 1JRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUTuIP8RrVpWLA3Ov4FKR1amZ7XYSscgQGSuKZvJgoSYwOzsoNjPWiJG+ortSlNCElWll5dYaqr6WSrA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx+2NtIJqE2bc3NIZyUhzyaKXvfOCrGO+PgwKIx0NtcKnhT0ybF
 8byiUFYFPvSi0mSDFxw8bFm5bIfzt6b6AQrZP3N313egG+m7bpScIZJua2EXrbqJi0+xToqJUfO
 C
X-Google-Smtp-Source: AGHT+IEyzkN+DIrx1wACmvKc5dT19k6znIBitdGcdcuefU2qZ7VOn0P7BZP4KJHexxJOOBaRiDJ4Qw==
X-Received: by 2002:a17:903:1c9:b0:1fd:5eab:8c76 with SMTP id
 d9443c01a7336-20b37b74f55mr7481515ad.41.1727374577120; 
 Thu, 26 Sep 2024 11:16:17 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37d5ef5dsm1454145ad.32.2024.09.26.11.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 11:16:16 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Thu, 26 Sep 2024 11:15:49 -0700
Message-Id: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANWk9WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDSyNj3ZIMQ1MjA92U8tzEZF1T00RjI4PEVAPDRDMloJaCotS0zAqwcdG
 xtbUAQM7eAl4AAAA=
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:45:20 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/3] Add the dwmac driver support for
	T-HEAD TH1520 SoC
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

This patch series is based on linux-next which contains the TH1520 clk
dts patches in my v6.12 pull request:

 https://lore.kernel.org/linux-riscv/ZsWs8QiVruMXjzPc@x1/

This patch also depends on this TH1520 pinctrl series:

 https://lore.kernel.org/linux-riscv/20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com/

I have a branch with this series and the dependencies:

 https://github.com/pdp7/linux/tree/b4/th1520-dwmac

Regarding clocks, the gmac nodes in th1520.dtsi have the "stmmac_clk"
clock set to CLK_GMAC_AXI in the AP_SUBSYS clock controller. This
corresponds to the enable bit for the GMAC axi4_clk gate which is
handled by the clk-th1520-ap driver. thead_dwmac_fix_speed() does not
modify anything in the AP_SUBSYS clock controller. It only writes to
GMAC APB registers. It seems unnecessary to create a new clock driver
just for the GMAC APB registers. Refer to section 1.6.2 in the TH1520
Peripheral Interface User Manual [1].

Regarding rx and tx internal delays, that same section in the manual
doesn't specify what unit is represented by the delay_ctrl bit field in
GMAC_RXCLK_DELAY_CTRL and GMAC_TXCLK_DELAY_CTRL. It is only 5 bits and
a max value of 31 seems too small to represent picoseconds. The vendor
kernel [2] uses properties named "rx-clk-delay" and "tx-clk-delay" but
doesn't indicate any units. I see ti,dp83867.yaml adds vendor specific
rx and tx delay properties so that is what I've now done in this series.
Note: the hardware default value of 0 for delay_ctrl works okay for the
TH1520 hardware that I have.

There was a question in my v1 series about if the phy required a delay
after reset in the BeagleV Ahead device tree. The board has the Realtek
RTL8211F-CG phy [3]. According to this datasheet I found [4], the reset
pin must be asserted low for at least 10ms for the internal regulator.
Software must wait least 50ms before accessing the phy registers. I've
now added reset-delay-us and reset-post-delay-us with those values.

[1] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
[2] https://github.com/revyos/thead-kernel/blob/lpi4a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
[3] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/blob/main/BeagleV-Ahead_SCH.pdf
[4] https://www.lcsc.com/datasheet/lcsc_datasheet_1912111437_Realtek-Semicon-RTL8211F-CG_C187932.pdf

Changes since v1:
 - Drop the first patch as it is no longer needed due to upstream commit
   d01e0e98de31 ("dt-bindings: net: dwmac: Validate PBL for all IP-cores")
 - Rename compatible from "thead,th1520-dwmac" to "thead,th1520-gmac"
 - Add thead,rx-internal-delay and thead,tx-internal-delay properties
   and check that it does not exceed the maximum value
 - Convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe() and
   delete the .remove_new hook as it is no longer needed
 - Handle return value of regmap_write() in case it fails
 - Add phy reset delay properties to the BeagleV Ahead device tree
 - Link: https://lore.kernel.org/all/20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com/

Changes since Jisheng v2:
 - remove thead,gmacapb that references syscon for APB registers
 - add a second memory region to gmac nodes for the APB registers
 - Link: https://lore.kernel.org/all/20230827091710.1483-1-jszhang@kernel.org/

Changes since Jisheng v1:
 - rebase on the lastest net-next
 - collect Reviewed-by tag
 - address Krzysztof's comment of the dt binding
 - fix "div is not initialised" issue pointed out by Simon
 - Link: https://lore.kernel.org/all/20230820120213.2054-1-jszhang@kernel.org/

---
Emil Renner Berthing (1):
      riscv: dts: thead: Add TH1520 ethernet nodes

Jisheng Zhang (2):
      dt-bindings: net: Add T-HEAD dwmac support
      net: stmmac: Add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 109 +++++++
 MAINTAINERS                                        |   2 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 ++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 135 +++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 319 +++++++++++++++++++++
 9 files changed, 719 insertions(+)
---
base-commit: eb9913a02c55913317dcb4797026f958ce2c97d5
change-id: 20240923-th1520-dwmac-55a320ae01a6

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
