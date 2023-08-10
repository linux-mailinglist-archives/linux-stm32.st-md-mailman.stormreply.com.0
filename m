Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB8F78472D
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86940C6C844;
	Tue, 22 Aug 2023 16:25:20 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48581C6B468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 19:29:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37AJTTZ2001573;
 Thu, 10 Aug 2023 14:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1691695769;
 bh=z+/O/oJEzBl6XJbUbJ5i2E5EgCmgXxI/5YsPmBtngIE=;
 h=From:Subject:Date:To:CC;
 b=ykTkuXWCaxSY2N8vzYZyxhnQJzwRdH9+VStVZWpLYPv/ei6KDvtqL45AZ+6lG95pf
 Vwwc7IAbge4NzkEfgSKAYAt7CBWi6ByQL8CG6qkoXSJrXvWxejY9+q7CFfgkF9g2wZ
 y0e81aUAt8J9RtAGBgYT0f7ePvVokgTGYJ1wfs1A=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37AJTTVO027942
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Aug 2023 14:29:29 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Aug 2023 14:29:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Aug 2023 14:29:29 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37AJTSeW002155;
 Thu, 10 Aug 2023 14:29:28 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Fri, 11 Aug 2023 00:58:47 +0530
Message-ID: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG861WQC/3WNMQ6DMAxFr4Iy1xUEqkAn7lExGOOWDAFkp6gV4
 u4N7B3f/3p6m1EWz2ru2WaEV69+nhLYS2ZoxOnF4IfExua2zF3RQCAheC8ahTGAQ27Q3Qj70pn
 k9KgMveBE42EF1MhyHIvw03/O0KNLPHqNs3zP7loc67/EWkAOA9WuqdFWVLk2+ivNwXT7vv8Ad
 3v6JMAAAAA=
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691695767; l=3032;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=LWqG7WYZ/paBwbFSp816khIcJHbId0/YeHLEz1IDBiU=;
 b=iYk5pAb85XLs5Klt2bkUeSJNIOB7CmIuI1EPgQsM7rZfDSZVI0F/OW7/m/KAgIXAqx5AQZaLb
 sKT2A/5OJpEDjQvuVCREMZkbRlshuk4cDCvPNLN5LjE3igJThAj3ycJ
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: devicetree@vger.kernel.org, Kamlesh Gurudasani <kamlesh@ti.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/6] Add support for Texas Instruments
	MCRC64 engine
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

Add support for MCRC64 engine to calculate 64-bit CRC in Full-CPU mode

MCRC64 engine calculates 64-bit cyclic redundancy checks (CRC)
according to the ISO 3309 standard.

The ISO 3309 64-bit CRC model parameters are as follows:
    Generator Polynomial: x^64 + x^4 + x^3 + x + 1
    Polynomial Value: 0x000000000000001B
    Initial value: 0x0000000000000000
    Reflected Input: False
    Reflected Output: False
    Xor Final: 0x0000000000000000

Tested with
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y

and tcrypt,
sudo modprobe tcrypt mode=329 sec=1

User space application implemented using algif_hash,
https://gist.github.com/ti-kamlesh/73abfcc1a33318bb3b199d36b6209e59

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
Changes in v2:
- Add generic implementation of crc64-iso
- Fixes according to review comments
- Link to v1: https://lore.kernel.org/r/20230719-mcrc-upstream-v1-0-dc8798a24c47@ti.com

---
Kamlesh Gurudasani (6):
      lib: add ISO 3309 model crc64
      crypto: crc64 - add crc64-iso framework
      dt-bindings: crypto: Add Texas Instruments MCRC64
      crypto: ti - add driver for MCRC64 engine
      arm64: dts: ti: k3-am62: Add dt node, cbass_main ranges for MCRC64
      arm64: defconfig: enable TI MCRC64 module

 Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml |  47 ++++++++
 MAINTAINERS                                             |   7 ++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                |   7 ++
 arch/arm64/boot/dts/ti/k3-am62.dtsi                     |   1 +
 arch/arm64/configs/defconfig                            |   2 +
 crypto/Kconfig                                          |  11 ++
 crypto/Makefile                                         |   1 +
 crypto/crc64_iso_generic.c                              | 119 ++++++++++++++++++
 crypto/tcrypt.c                                         |   5 +
 crypto/testmgr.c                                        |   7 ++
 crypto/testmgr.h                                        | 404 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/crypto/Kconfig                                  |   1 +
 drivers/crypto/Makefile                                 |   1 +
 drivers/crypto/ti/Kconfig                               |  10 ++
 drivers/crypto/ti/Makefile                              |   2 +
 drivers/crypto/ti/mcrc64.c                              | 442 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/crc64.h                                   |   5 +
 lib/crc64-iso.c                                         | 126 +++++++++++++++++++
 lib/crc64.c                                             |  27 +++++
 lib/gen_crc64table.c                                    |   6 +
 20 files changed, 1231 insertions(+)
---
base-commit: 21ef7b1e17d039053edaeaf41142423810572741
change-id: 20230719-mcrc-upstream-7ae9a75cab37

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
