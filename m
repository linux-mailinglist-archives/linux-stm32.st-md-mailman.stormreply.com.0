Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B8EAEE3EE
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 18:14:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DC3CC32E8F;
	Mon, 30 Jun 2025 16:14:54 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8146FC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 13:27:32 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bW6L95Wqlzdb8p;
 Mon, 30 Jun 2025 21:23:29 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
 by mail.maildlp.com (Postfix) with ESMTPS id D451A140156;
 Mon, 30 Jun 2025 21:27:29 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 21:27:28 +0800
From: Gu Bowen <gubowen5@huawei.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, David Howells
 <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Lukas Wunner
 <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, "David S . Miller"
 <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Ard Biesheuvel <ardb@kernel.org>, Tianjia Zhang
 <tianjia.zhang@linux.alibaba.com>, Dan Carpenter <dan.carpenter@linaro.org>
Date: Mon, 30 Jun 2025 21:39:30 +0800
Message-ID: <20250630133934.766646-1-gubowen5@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-Mailman-Approved-At: Mon, 30 Jun 2025 16:14:53 +0000
Cc: linux-kernel@vger.kernel.org, Lu Jialin <lujialin4@huawei.com>,
 Gu Bowen <gubowen5@huawei.com>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, GONG Ruiqi <gongruiqi1@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 0/4] Reintroduce the sm2 algorithm
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

To reintroduce the sm2 algorithm, the patch set did the following:
 - Reintroduce the mpi library based on libgcrypt.
 - Reintroduce ec implementation to MPI library.
 - Rework sm2 algorithm.
 - Support verification of X.509 certificates.

Gu Bowen (4):
  Revert "Revert "lib/mpi: Extend the MPI library""
  Revert "Revert "lib/mpi: Introduce ec implementation to MPI library""
  crypto/sm2: Rework sm2 alg with sig_alg backend
  crypto/sm2: support SM2-with-SM3 verification of X.509 certificates

 certs/system_keyring.c                   |    8 +
 crypto/Kconfig                           |   18 +
 crypto/Makefile                          |    8 +
 crypto/asymmetric_keys/public_key.c      |    7 +
 crypto/asymmetric_keys/x509_public_key.c |   27 +-
 crypto/sm2.c                             |  492 +++++++
 crypto/sm2signature.asn1                 |    4 +
 crypto/testmgr.c                         |    6 +
 crypto/testmgr.h                         |   57 +
 include/crypto/sm2.h                     |   31 +
 include/keys/system_keyring.h            |   13 +
 include/linux/mpi.h                      |  170 +++
 lib/crypto/mpi/Makefile                  |    2 +
 lib/crypto/mpi/ec.c                      | 1507 ++++++++++++++++++++++
 lib/crypto/mpi/mpi-add.c                 |   50 +
 lib/crypto/mpi/mpi-bit.c                 |  143 ++
 lib/crypto/mpi/mpi-cmp.c                 |   46 +-
 lib/crypto/mpi/mpi-div.c                 |   29 +
 lib/crypto/mpi/mpi-internal.h            |   10 +
 lib/crypto/mpi/mpi-inv.c                 |  143 ++
 lib/crypto/mpi/mpi-mod.c                 |  144 +++
 lib/crypto/mpi/mpicoder.c                |  336 +++++
 lib/crypto/mpi/mpih-mul.c                |   25 +
 lib/crypto/mpi/mpiutil.c                 |  182 +++
 24 files changed, 3447 insertions(+), 11 deletions(-)
 create mode 100644 crypto/sm2.c
 create mode 100644 crypto/sm2signature.asn1
 create mode 100644 include/crypto/sm2.h
 create mode 100644 lib/crypto/mpi/ec.c
 create mode 100644 lib/crypto/mpi/mpi-inv.c

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
