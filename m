Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7985025C188
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Sep 2020 15:12:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45046C3FADD;
	Thu,  3 Sep 2020 13:12:58 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F153C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Sep 2020 13:12:51 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01422;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=31; SR=0;
 TI=SMTPD_---0U7pNn4x_1599138762; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U7pNn4x_1599138762) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 03 Sep 2020 21:12:42 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 David Howells <dhowells@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Stephan Mueller <smueller@chronox.de>,
 Marcelo Henrique Cerri <marcelo.cerri@canonical.com>,
 "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Waiman Long <longman@redhat.com>,
 Mimi Zohar <zohar@linux.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Colin Ian King <colin.king@canonical.com>,
 Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 Vitaly Chikunov <vt@altlinux.org>,
 "Gilad Ben-Yossef" <gilad@benyossef.com>,
 Pascal van Leeuwen <pvanleeuwen@rambus.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-security-module@vger.kernel.org
Date: Thu,  3 Sep 2020 21:12:34 +0800
Message-Id: <20200903131242.128665-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.3.ge56e4f7
MIME-Version: 1.0
Cc: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 Jia Zhang <zhang.jia@linux.alibaba.com>
Subject: [Linux-stm32] [PATCH v6 0/8] crpyto: introduce OSCCA certificate
	and SM2 asymmetric algorithm
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

Hello all,

This new module implement the OSCCA certificate and SM2 public key
algorithm. It was published by State Encryption Management Bureau, China.
List of specifications for OSCCA certificate and SM2 elliptic curve
public key cryptography:

* GM/T 0003.1-2012
* GM/T 0003.2-2012
* GM/T 0003.3-2012
* GM/T 0003.4-2012
* GM/T 0003.5-2012
* GM/T 0015-2012
* GM/T 0009-2012 

IETF: https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
oscca: http://www.oscca.gov.cn/sca/xxgk/2010-12/17/content_1002386.shtml
scctc: http://www.gmbz.org.cn/main/bzlb.html

These patchs add the OID object identifier defined by OSCCA. The
x509 certificate supports sm2-with-sm3 type certificate parsing
and verification.

The sm2 algorithm is based on libgcrypt's mpi implementation, and has
made some additions to the kernel's original mpi library, and added the
implementation of ec to better support elliptic curve-like algorithms.

sm2 has good support in both openssl and gnupg projects, and sm3 and sm4
of the OSCCA algorithm family have also been implemented in the kernel.

Among them, sm3 and sm4 have been well implemented in the kernel.
This group of patches has newly introduced sm2. In order to implement
sm2 more perfectly, I expanded the mpi library and introduced the
ec implementation of the mpi library as the basic algorithm. Compared
to the kernel's crypto/ecc.c, the implementation of mpi/ec.c is more
complete and elegant, sm2 is implemented based on these algorithms.

---
v6 changes:
  1. remove mpi_sub_ui function from mpi library.
  2. rebase on mainline.

v5 changes:
  1. fix compilation failure when SM2 is configured as a module.
  2. simplify the mpi and ec code, remove unused functions reported by test robot.

v4 changes:
  1. Pass data directly when calculating sm2 certificate digest.
  2. rebase on mainline.

v3 changes:
  1. integrity asymmetric digsig support sm2-with-sm3 algorithm.
  2. remove unused sm2_set_priv_key().
  3. rebase on mainline.

v2 changes:
  1. simplify the sm2 algorithm and only retain the verify function.
  2. extract the sm2 certificate code into a separate file.


Tianjia Zhang (8):
  crypto: sm3 - export crypto_sm3_final function
  lib/mpi: Extend the MPI library
  lib/mpi: Introduce ec implementation to MPI library
  crypto: sm2 - introduce OSCCA SM2 asymmetric cipher algorithm
  crypto: testmgr - support test with different ciphertext per
    encryption
  X.509: support OSCCA certificate parse
  X.509: support OSCCA sm2-with-sm3 certificate verification
  integrity: Asymmetric digsig supports SM2-with-SM3 algorithm

 crypto/Kconfig                            |   17 +
 crypto/Makefile                           |    8 +
 crypto/asymmetric_keys/Makefile           |    1 +
 crypto/asymmetric_keys/public_key.c       |    6 +
 crypto/asymmetric_keys/public_key_sm2.c   |   61 +
 crypto/asymmetric_keys/x509_cert_parser.c |   14 +-
 crypto/asymmetric_keys/x509_public_key.c  |    3 +
 crypto/sm2.c                              |  473 +++++++
 crypto/sm2signature.asn1                  |    4 +
 crypto/sm3_generic.c                      |    7 +-
 crypto/testmgr.c                          |    7 +-
 include/crypto/public_key.h               |   15 +
 include/crypto/sm2.h                      |   25 +
 include/crypto/sm3.h                      |    2 +
 include/linux/mpi.h                       |  192 +++
 include/linux/oid_registry.h              |    6 +
 lib/mpi/Makefile                          |    6 +
 lib/mpi/ec.c                              | 1509 +++++++++++++++++++++
 lib/mpi/mpi-add.c                         |  155 +++
 lib/mpi/mpi-bit.c                         |  251 ++++
 lib/mpi/mpi-cmp.c                         |   46 +-
 lib/mpi/mpi-div.c                         |  238 ++++
 lib/mpi/mpi-internal.h                    |   53 +
 lib/mpi/mpi-inv.c                         |  143 ++
 lib/mpi/mpi-mod.c                         |  155 +++
 lib/mpi/mpi-mul.c                         |   94 ++
 lib/mpi/mpicoder.c                        |  336 +++++
 lib/mpi/mpih-div.c                        |  294 ++++
 lib/mpi/mpih-mul.c                        |   25 +
 lib/mpi/mpiutil.c                         |  204 +++
 security/integrity/digsig_asymmetric.c    |   14 +-
 31 files changed, 4346 insertions(+), 18 deletions(-)
 create mode 100644 crypto/asymmetric_keys/public_key_sm2.c
 create mode 100644 crypto/sm2.c
 create mode 100644 crypto/sm2signature.asn1
 create mode 100644 include/crypto/sm2.h
 create mode 100644 lib/mpi/ec.c
 create mode 100644 lib/mpi/mpi-add.c
 create mode 100644 lib/mpi/mpi-div.c
 create mode 100644 lib/mpi/mpi-inv.c
 create mode 100644 lib/mpi/mpi-mod.c
 create mode 100644 lib/mpi/mpi-mul.c

-- 
2.19.1.3.ge56e4f7

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
