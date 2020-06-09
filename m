Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A861F3E67
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 16:39:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78BE7C36B23;
	Tue,  9 Jun 2020 14:39:06 +0000 (UTC)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39813C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 13:49:12 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R771e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01419;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=20; SR=0;
 TI=SMTPD_---0U.6GXtb_1591710536; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U.6GXtb_1591710536) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 09 Jun 2020 21:48:56 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, dhowells@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, jmorris@namei.org,
 serge@hallyn.com, nramas@linux.microsoft.com, tusharsu@linux.microsoft.com,
 zohar@linux.ibm.com, gilad@benyossef.com, pvanleeuwen@rambus.com
Date: Tue,  9 Jun 2020 21:48:47 +0800
Message-Id: <20200609134855.21431-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 09 Jun 2020 14:39:02 +0000
Cc: tianjia.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, zhang.jia@linux.alibaba.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/8] crpyto: introduce OSCCA certificate
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
MIME-Version: 1.0
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
 crypto/asymmetric_keys/public_key_sm2.c   |   59 +
 crypto/asymmetric_keys/x509_cert_parser.c |   14 +-
 crypto/asymmetric_keys/x509_public_key.c  |    2 +
 crypto/sm2.c                              |  473 +++++++
 crypto/sm2signature.asn1                  |    4 +
 crypto/sm3_generic.c                      |    7 +-
 crypto/testmgr.c                          |    7 +-
 include/crypto/public_key.h               |   14 +
 include/crypto/sm2.h                      |   25 +
 include/crypto/sm3.h                      |    2 +
 include/linux/mpi.h                       |  193 +++
 include/linux/oid_registry.h              |    6 +
 lib/mpi/Makefile                          |    6 +
 lib/mpi/ec.c                              | 1538 +++++++++++++++++++++
 lib/mpi/mpi-add.c                         |  207 +++
 lib/mpi/mpi-bit.c                         |  251 ++++
 lib/mpi/mpi-cmp.c                         |   46 +-
 lib/mpi/mpi-div.c                         |  259 ++++
 lib/mpi/mpi-internal.h                    |   53 +
 lib/mpi/mpi-inv.c                         |  143 ++
 lib/mpi/mpi-mod.c                         |  155 +++
 lib/mpi/mpi-mul.c                         |  166 +++
 lib/mpi/mpicoder.c                        |  336 +++++
 lib/mpi/mpih-div.c                        |  294 ++++
 lib/mpi/mpih-mul.c                        |   25 +
 lib/mpi/mpiutil.c                         |  204 +++
 security/integrity/digsig_asymmetric.c    |   14 +-
 31 files changed, 4517 insertions(+), 18 deletions(-)
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
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
