Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9828D4B7F
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 14:25:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D42EC6C859;
	Thu, 30 May 2024 12:25:06 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 423FCC030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 12:24:59 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44UCOYkl034061;
 Thu, 30 May 2024 07:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717071874;
 bh=9G8DsOOCcxpiOxg/zCDdoC56mB3uq1iBt87Tz0RLNhQ=;
 h=From:To:CC:Subject:Date;
 b=rmIkDzDzqclhxHrg9v17aT6zns2dPJRLcIdmxqLfAuVzbzgTtpxNpFqUAcM1XBbvF
 brZWNSO56d1BFXixdTaWrUUKDlW67/P8tR10wQ+Yn30+WQGsjdhGMA8Sr6CEkPbZJ9
 DXdv2oC++J3ryGKWuHR/Y34sES2RQHrFznxdIFr0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44UCOYAU067738
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 May 2024 07:24:34 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 07:24:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 07:24:34 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44UCOXto070403;
 Thu, 30 May 2024 07:24:34 -0500
From: <kamlesh@ti.com>
To: <herbert@gondor.apana.org.au>, <kristo@kernel.org>, <will@kernel.org>
Date: Thu, 30 May 2024 17:54:22 +0530
Message-ID: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Kamlesh Gurudasani <kamlesh@ti.com>, akpm@linux-foundation.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Subject: [Linux-stm32] [PATCH v3 0/6] Add support for MCRC64 engine to
	calculate 64-bit CRC in Full-CPU mode
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

From: Kamlesh Gurudasani <kamlesh@ti.com>

MCRC64 engine calculates 64-bit cyclic redundancy checks (CRC)
according to the ISO 3309 standard.

The ISO 3309 64-bit CRC model parameters are as follows:
    Generator Polynomial: x^64 + x^4 + x^3 + x + 1
    Polynomial Value: 0x000000000000001B
    Initial value: 0x0000000000000000
    Reflected Input: False
    Reflected Output: False
    Xor Final: 0x0000000000000000

ISO 3309 which came in 1991 define this 64-bit CRC, ISO 3309 which
came in 1993 doesn't define 64-bit CRC algorithm at all, so ISO-3309
naming is unique enough for this CRC64 generator polynomial.

Tested with
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y

and tcrypt,
sudo modprobe tcrypt mode=329 sec=1

User space application implemented using algif_hash [0].

I understand that this is a old algorithm but,
most of TI's K3 based J7* and AM62* SOCs have MCRC64
which we want to use from User Space.

As per suggestions, we did the calculations and it turns out to be we
are saving good number of cpu cycles with HW offload[1].

Also, there are some automotive customers who have a safety
requirement to offload any parameters that are in Linux to ensure FFI.

[0] https://gist.github.com/ti-kamlesh/73abfcc1a33318bb3b199d36b6209e59
[1] https://patchwork.kernel.org/comment/25492483/

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
Changes in v3:
- Changed the name for algorithm from crc64-iso to crc64-iso3309
- Removed unused code from Patch 2/6.
- Updated dt-bindings according to review comments Patch 3/6
- Added option to select SW implementation of algorithm Patch
  4/6
- Added depends ORed with COMPILE_TEST Patch 4/6
- Patch 6/6, added specific devices that will benefit out of this
- Marking patch 5,6/6 as DONOTMERGE as they will go in via subsystem
  Maintainer tree

Changes in v2:
- Add generic implementation of crc64-iso
- Fixes according to review comments
- Link to v1: https://lore.kernel.org/r/20230719-mcrc-upstream-v1-0-dc8798a24c47@ti.com

---
Kamlesh Gurudasani (6):
      lib: add ISO 3309 model crc64
      crypto: crc64 - add crc64-iso3309 framework
      dt-bindings: crypto: Add Texas Instruments MCRC64
      crypto: ti - add driver for MCRC64 engine
      arm64: dts: ti: k3-am62: Add dt node, cbass_main ranges for MCRC64
      arm64: defconfig: enable TI MCRC64 module

 Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml |  48 +++++++
 MAINTAINERS                                             |   7 ++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                |   7 ++
 arch/arm64/boot/dts/ti/k3-am62.dtsi                     |   1 +
 arch/arm64/configs/defconfig                            |   2 +
 crypto/Kconfig                                          |  11 ++
 crypto/Makefile                                         |   1 +
 crypto/crc64_iso3309_generic.c                          | 119 ++++++++++++++++++
 crypto/tcrypt.c                                         |   6 +
 crypto/testmgr.c                                        |   7 ++
 crypto/testmgr.h                                        | 404 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/crypto/Kconfig                                  |   1 +
 drivers/crypto/Makefile                                 |   1 +
 drivers/crypto/ti/Kconfig                               |  11 ++
 drivers/crypto/ti/Makefile                              |   2 +
 drivers/crypto/ti/mcrc64.c                              | 442 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/crc64.h                                   |   2 +
 lib/crc64.c                                             |  27 ++++
 lib/gen_crc64table.c                                    |   6 +
 19 files changed, 1105 insertions(+)
---
base-commit: 13909a0c88972c5ef5d13f44d1a8bf065a31bdf4
change-id: 20240524-mcrc64-upstream-e0ce4aad64ad

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
