Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5817260F0A6
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Oct 2022 08:55:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB825C04003;
	Thu, 27 Oct 2022 06:55:13 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA92EC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 06:55:11 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0VTAEORJ_1666853707; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0VTAEORJ_1666853707) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 14:55:09 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Jussi Kivilinna <jussi.kivilinna@iki.fi>, Ard Biesheuvel <ardb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 27 Oct 2022 14:54:52 +0800
Message-Id: <20221027065505.15306-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Cc: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: [Linux-stm32] [PATCH v3 00/13] Optimizing SM3 and SM4 algorithms
	using arm64 NEON/CE instructions
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

Hi folks,

This series of patches uses different arm64 instruction sets to optimize
the SM3 and SM4 algorithms, as well as the optimization of different
modes of SM4.

patch 1-2:   NEON instruction set optimization for SM3
patch 3:     Refactored and streamlined SM4 NEON instruction implementation
patch 4-5:   support test for new SM4 mode
patch 6-8:   Refactored and streamlined SM4 CE instruction implementation
patch 9-10:  CE accelerated implementation of SM4 CTS/XTS
patch 11:    CE accelerated implementation of SM4 CMAC/XCBC/CBCMAC
patch 12-13: CE accelerated implementation of SM4 CCM/GCM

v3 change:
  - As Eric said, remove the code for ESSIV, including testmgr and tcrypt

v2 changes:
  - remove ARMv9 SVE acceleration implementation
  - rebase onto v6.1-rc1

Cheers,
Tianjia

Tianjia Zhang (13):
  crypto: arm64/sm3 - raise the priority of the CE implementation
  crypto: arm64/sm3 - add NEON assembly implementation
  crypto: arm64/sm4 - refactor and simplify NEON implementation
  crypto: testmgr - add SM4 cts-cbc/xts/xcbc test vectors
  crypto: tcrypt - add SM4 cts-cbc/xts/xcbc test
  crypto: arm64/sm4 - refactor and simplify CE implementation
  crypto: arm64/sm4 - simplify sm4_ce_expand_key() of CE implementation
  crypto: arm64/sm4 - export reusable CE acceleration functions
  crypto: arm64/sm4 - add CE implementation for CTS-CBC mode
  crypto: arm64/sm4 - add CE implementation for XTS mode
  crypto: arm64/sm4 - add CE implementation for cmac/xcbc/cbcmac
  crypto: arm64/sm4 - add CE implementation for CCM mode
  crypto: arm64/sm4 - add CE implementation for GCM mode

 arch/arm64/crypto/Kconfig           |   47 +-
 arch/arm64/crypto/Makefile          |    9 +
 arch/arm64/crypto/sm3-ce-glue.c     |    2 +-
 arch/arm64/crypto/sm3-neon-core.S   |  600 +++++++++++++
 arch/arm64/crypto/sm3-neon-glue.c   |  103 +++
 arch/arm64/crypto/sm4-ce-asm.h      |  209 +++++
 arch/arm64/crypto/sm4-ce-ccm-core.S |  328 ++++++++
 arch/arm64/crypto/sm4-ce-ccm-glue.c |  303 +++++++
 arch/arm64/crypto/sm4-ce-core.S     | 1205 ++++++++++++++++++---------
 arch/arm64/crypto/sm4-ce-gcm-core.S |  741 ++++++++++++++++
 arch/arm64/crypto/sm4-ce-gcm-glue.c |  286 +++++++
 arch/arm64/crypto/sm4-ce-glue.c     |  575 ++++++++++++-
 arch/arm64/crypto/sm4-ce.h          |   16 +
 arch/arm64/crypto/sm4-neon-core.S   |  630 +++++++++-----
 arch/arm64/crypto/sm4-neon-glue.c   |  172 +---
 crypto/tcrypt.c                     |   21 +
 crypto/testmgr.c                    |   19 +
 crypto/testmgr.h                    |  977 ++++++++++++++++++++++
 18 files changed, 5478 insertions(+), 765 deletions(-)
 create mode 100644 arch/arm64/crypto/sm3-neon-core.S
 create mode 100644 arch/arm64/crypto/sm3-neon-glue.c
 create mode 100644 arch/arm64/crypto/sm4-ce-asm.h
 create mode 100644 arch/arm64/crypto/sm4-ce-ccm-core.S
 create mode 100644 arch/arm64/crypto/sm4-ce-ccm-glue.c
 create mode 100644 arch/arm64/crypto/sm4-ce-gcm-core.S
 create mode 100644 arch/arm64/crypto/sm4-ce-gcm-glue.c
 create mode 100644 arch/arm64/crypto/sm4-ce.h

-- 
2.24.3 (Apple Git-128)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
