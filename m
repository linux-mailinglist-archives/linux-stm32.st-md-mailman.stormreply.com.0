Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF7E241688
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Aug 2020 08:55:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52568C36B26;
	Tue, 11 Aug 2020 06:55:15 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77BF2C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Aug 2020 08:06:54 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id k12so6636268otr.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Aug 2020 01:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H3mHRvaRZisXkE1k7gc8Zaux048wFOrFYZD8foSy8Gs=;
 b=bPTb6Uzpu1fClFugclQsVjCaWpH8t9uG88D8JkSncytFEZ0eJssVU7PYtMuk7CUPy2
 g1A2roq9EWm0GCMaX9sXs3aL1sRIdCOM9xrg+o02gxbpW7I/gZd2rIos5grnRZRNLNeS
 vHEk8iLkkI4JZIYeBJrprpgNTgQe7SBUu0kEYs352YSxNRiXKkPhPV5PXngs4u8Yp5Xj
 aIXSrB5mhT/pAx7vBlNDUpsZ5Gb/IpBjLnZjWEFyABV7NXVx5OjqAdLK41om05PNsKn2
 f1A47UG5qmEyMNCA5+3rEFcdlRvfOWE6derdlyTQtLxPy8dgmNB+jOETG3zzrsUVWnGj
 fXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H3mHRvaRZisXkE1k7gc8Zaux048wFOrFYZD8foSy8Gs=;
 b=iWH+4VJrUcKmLPPrJnWGdgv6+yaD9IqJvoF2HNhW2s5b4hTbbqpu4hx9u2+yQXEvoI
 EWPfXjNVqC7VOlSnyc1VK+pYXSViy8nC+J8F9FEMrgI+qRvBYBFkCDDdov1VOUF33QQm
 Z3oXP5ZB/qVaBaWOGj1gi5SuWbNEU3aGA/hsYKtY3Vn074U5wPMwk8tG0YzHMbJO7QGI
 Zerl7xQPolfGsJ1SaCg5q602NuesLoSCwjO7vCQoXTZevxhJ6TbSeNtFHIo+zNYbH40S
 6W5WHRakcjavLn3Jb3Pf/7fJvrdUxwM1mrNkOwF9xHLPNa8lbPtExKzejpIsPCycf9ME
 Et7A==
X-Gm-Message-State: AOAM530bA2HIe8HSmNjfQaRw/ygHTffQ7qzJpc1C1kUVsdVaPCuo1qhn
 uqke90uSzk1RGb73HYJ0Y8oDWQAwzmNL75IsZDw=
X-Google-Smtp-Source: ABdhPJzqouQQSrGEdEsAISn77bXOTSpshwpmkMN1OGvQTFq8BOQwiq+pbP7ujEJwHN86uJ6N8qGzxPen8lwyeBAQz9I=
X-Received: by 2002:a05:6830:1519:: with SMTP id
 k25mr22216546otp.208.1597046813509; 
 Mon, 10 Aug 2020 01:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200709084015.21886-1-tianjia.zhang@linux.alibaba.com>
 <20200709084015.21886-5-tianjia.zhang@linux.alibaba.com>
In-Reply-To: <20200709084015.21886-5-tianjia.zhang@linux.alibaba.com>
From: zou cao <zoucaox@gmail.com>
Date: Mon, 10 Aug 2020 16:06:42 +0800
Message-ID: <CAMhuB30ha_-gW5RkMDma_tfcO_NZcVArOuvgx9iRoFGYwhSLfw@mail.gmail.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:55:13 +0000
Cc: vt@altlinux.org, gilad@benyossef.com, pvanleeuwen@rambus.com,
 linux-stm32@st-md-mailman.stormreply.com, jmorris@namei.org,
 zohar@linux.ibm.com, linux-kernel@vger.kernel.org, dhowells@redhat.com,
 nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
 zhang.jia@linux.alibaba.com, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 serge@hallyn.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 herbert@gondor.apana.org.au
Subject: Re: [Linux-stm32] [PATCH v5 4/8] crypto: sm2 - introduce OSCCA SM2
 asymmetric cipher algorithm
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
Content-Type: multipart/mixed; boundary="===============7203723567466274666=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7203723567466274666==
Content-Type: multipart/alternative; boundary="000000000000024f5d05ac817079"

--000000000000024f5d05ac817079
Content-Type: text/plain; charset="UTF-8"

this patch has been test in my env, it look okay for me.

On Thu, Jul 9, 2020 at 4:42 PM Tianjia Zhang <
tianjia.zhang@linux.alibaba.com> wrote:

> This new module implement the SM2 public key algorithm. It was
> published by State Encryption Management Bureau, China.
> List of specifications for SM2 elliptic curve public key cryptography:
>
> * GM/T 0003.1-2012
> * GM/T 0003.2-2012
> * GM/T 0003.3-2012
> * GM/T 0003.4-2012
> * GM/T 0003.5-2012
>
> IETF: https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
> oscca: http://www.oscca.gov.cn/sca/xxgk/2010-12/17/content_1002386.shtml
> scctc: http://www.gmbz.org.cn/main/bzlb.html
>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>  crypto/Kconfig           |  17 ++
>  crypto/Makefile          |   8 +
>  crypto/sm2.c             | 473 +++++++++++++++++++++++++++++++++++++++
>  crypto/sm2signature.asn1 |   4 +
>  include/crypto/sm2.h     |  25 +++
>  5 files changed, 527 insertions(+)
>  create mode 100644 crypto/sm2.c
>  create mode 100644 crypto/sm2signature.asn1
>  create mode 100644 include/crypto/sm2.h
>
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 091c0a0bbf26..de330d658758 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -260,6 +260,23 @@ config CRYPTO_ECRDSA
>           standard algorithms (called GOST algorithms). Only signature
> verification
>           is implemented.
>
> +config CRYPTO_SM2
> +       tristate "SM2 algorithm"
> +       select CRYPTO_SM3
> +       select CRYPTO_AKCIPHER
> +       select CRYPTO_MANAGER
> +       select MPILIB
> +       select ASN1
> +       help
> +         Generic implementation of the SM2 public key algorithm. It was
> +         published by State Encryption Management Bureau, China.
> +         as specified by OSCCA GM/T 0003.1-2012 -- 0003.5-2012.
> +
> +         References:
> +         https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
> +
> http://www.oscca.gov.cn/sca/xxgk/2010-12/17/content_1002386.shtml
> +         http://www.gmbz.org.cn/main/bzlb.html
> +
>  config CRYPTO_CURVE25519
>         tristate "Curve25519 algorithm"
>         select CRYPTO_KPP
> diff --git a/crypto/Makefile b/crypto/Makefile
> index 4ca12b6044f7..b279483fba50 100644
> --- a/crypto/Makefile
> +++ b/crypto/Makefile
> @@ -42,6 +42,14 @@ rsa_generic-y += rsa_helper.o
>  rsa_generic-y += rsa-pkcs1pad.o
>  obj-$(CONFIG_CRYPTO_RSA) += rsa_generic.o
>
> +$(obj)/sm2signature.asn1.o: $(obj)/sm2signature.asn1.c
> $(obj)/sm2signature.asn1.h
> +$(obj)/sm2.o: $(obj)/sm2signature.asn1.h
> +
> +sm2_generic-y += sm2signature.asn1.o
> +sm2_generic-y += sm2.o
> +
> +obj-$(CONFIG_CRYPTO_SM2) += sm2_generic.o
> +
>  crypto_acompress-y := acompress.o
>  crypto_acompress-y += scompress.o
>  obj-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
> diff --git a/crypto/sm2.c b/crypto/sm2.c
> new file mode 100644
> index 000000000000..86da175bcda6
> --- /dev/null
> +++ b/crypto/sm2.c
> @@ -0,0 +1,473 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * SM2 asymmetric public-key algorithm
> + * as specified by OSCCA GM/T 0003.1-2012 -- 0003.5-2012 SM2 and
> + * described at https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
> + *
> + * Copyright (c) 2020, Alibaba Group.
> + * Authors: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/mpi.h>
> +#include <crypto/internal/akcipher.h>
> +#include <crypto/akcipher.h>
> +#include <crypto/hash.h>
> +#include <crypto/sm3_base.h>
> +#include <crypto/rng.h>
> +#include <crypto/sm2.h>
> +#include "sm2signature.asn1.h"
> +
> +#define MPI_NBYTES(m)   ((mpi_get_nbits(m) + 7) / 8)
> +
> +struct ecc_domain_parms {
> +       const char *desc;           /* Description of the curve.  */
> +       unsigned int nbits;         /* Number of bits.  */
> +       unsigned int fips:1; /* True if this is a FIPS140-2 approved curve
> */
> +
> +       /* The model describing this curve.  This is mainly used to select
> +        * the group equation.
> +        */
> +       enum gcry_mpi_ec_models model;
> +
> +       /* The actual ECC dialect used.  This is used for curve specific
> +        * optimizations and to select encodings etc.
> +        */
> +       enum ecc_dialects dialect;
> +
> +       const char *p;              /* The prime defining the field.  */
> +       const char *a, *b;          /* The coefficients.  For Twisted
> Edwards
> +                                    * Curves b is used for d.  For
> Montgomery
> +                                    * Curves (a,b) has ((A-2)/4,B^-1).
> +                                    */
> +       const char *n;              /* The order of the base point.  */
> +       const char *g_x, *g_y;      /* Base point.  */
> +       unsigned int h;             /* Cofactor.  */
> +};
> +
> +static const struct ecc_domain_parms sm2_ecp = {
> +       .desc = "sm2p256v1",
> +       .nbits = 256,
> +       .fips = 0,
> +       .model = MPI_EC_WEIERSTRASS,
> +       .dialect = ECC_DIALECT_STANDARD,
> +       .p   =
> "0xfffffffeffffffffffffffffffffffffffffffff00000000ffffffffffffffff",
> +       .a   =
> "0xfffffffeffffffffffffffffffffffffffffffff00000000fffffffffffffffc",
> +       .b   =
> "0x28e9fa9e9d9f5e344d5a9e4bcf6509a7f39789f515ab8f92ddbcbd414d940e93",
> +       .n   =
> "0xfffffffeffffffffffffffffffffffff7203df6b21c6052b53bbf40939d54123",
> +       .g_x =
> "0x32c4ae2c1f1981195f9904466a39c9948fe30bbff2660be1715a4589334c74c7",
> +       .g_y =
> "0xbc3736a2f4f6779c59bdcee36b692153d0a9877cc62a474002df32e52139f0a0",
> +       .h = 1
> +};
> +
> +static int sm2_ec_ctx_init(struct mpi_ec_ctx *ec)
> +{
> +       const struct ecc_domain_parms *ecp = &sm2_ecp;
> +       MPI p, a, b;
> +       MPI x, y;
> +       int rc = -EINVAL;
> +
> +       p = mpi_scanval(ecp->p);
> +       a = mpi_scanval(ecp->a);
> +       b = mpi_scanval(ecp->b);
> +       if (!p || !a || !b)
> +               goto free_p;
> +
> +       x = mpi_scanval(ecp->g_x);
> +       y = mpi_scanval(ecp->g_y);
> +       if (!x || !y)
> +               goto free;
> +
> +       /* mpi_ec_setup_elliptic_curve */
> +       ec->G = mpi_point_new(0);
> +       if (!ec->G)
> +               goto free;
> +
> +       mpi_set(ec->G->x, x);
> +       mpi_set(ec->G->y, y);
> +       mpi_set_ui(ec->G->z, 1);
> +
> +       ec->n = mpi_scanval(ecp->n);
> +       if (!ec->n) {
> +               mpi_point_release(ec->G);
> +               goto free;
> +       }
> +
> +       ec->h = ecp->h;
> +       ec->name = ecp->desc;
> +       mpi_ec_init(ec, ecp->model, ecp->dialect, 0, p, a, b);
> +
> +       rc = 0;
> +
> +free:
> +       mpi_free(x);
> +       mpi_free(y);
> +free_p:
> +       mpi_free(p);
> +       mpi_free(a);
> +       mpi_free(b);
> +
> +       return rc;
> +}
> +
> +static void sm2_ec_ctx_deinit(struct mpi_ec_ctx *ec)
> +{
> +       mpi_free(ec->n);
> +       mpi_point_release(ec->G);
> +
> +       mpi_ec_deinit(ec);
> +
> +       memset(ec, 0, sizeof(*ec));
> +}
> +
> +static int sm2_ec_ctx_reset(struct mpi_ec_ctx *ec)
> +{
> +       sm2_ec_ctx_deinit(ec);
> +       return sm2_ec_ctx_init(ec);
> +}
> +
> +/* RESULT must have been initialized and is set on success to the
> + * point given by VALUE.
> + */
> +static int sm2_ecc_os2ec(MPI_POINT result, MPI value)
> +{
> +       int rc;
> +       size_t n;
> +       const unsigned char *buf;
> +       unsigned char *buf_memory;
> +       MPI x, y;
> +
> +       n = (mpi_get_nbits(value)+7)/8;
> +       buf_memory = kmalloc(n, GFP_KERNEL);
> +       rc = mpi_print(GCRYMPI_FMT_USG, buf_memory, n, &n, value);
> +       if (rc) {
> +               kfree(buf_memory);
> +               return rc;
> +       }
> +       buf = buf_memory;
> +
> +       if (n < 1) {
> +               kfree(buf_memory);
> +               return -EINVAL;
> +       }
> +       if (*buf != 4) {
> +               kfree(buf_memory);
> +               return -EINVAL; /* No support for point compression.  */
> +       }
> +       if (((n-1)%2)) {
> +               kfree(buf_memory);
> +               return -EINVAL;
> +       }
> +       n = (n-1)/2;
> +       x = mpi_read_raw_data(buf + 1, n);
> +       if (!x) {
> +               kfree(buf_memory);
> +               return -ENOMEM;
> +       }
> +       y = mpi_read_raw_data(buf + 1 + n, n);
> +       kfree(buf_memory);
> +       if (!y) {
> +               mpi_free(x);
> +               return -ENOMEM;
> +       }
> +
> +       mpi_normalize(x);
> +       mpi_normalize(y);
> +
> +       mpi_set(result->x, x);
> +       mpi_set(result->y, y);
> +       mpi_set_ui(result->z, 1);
> +
> +       mpi_free(x);
> +       mpi_free(y);
> +
> +       return 0;
> +}
> +
> +struct sm2_signature_ctx {
> +       MPI sig_r;
> +       MPI sig_s;
> +};
> +
> +int sm2_get_signature_r(void *context, size_t hdrlen, unsigned char tag,
> +                               const void *value, size_t vlen)
> +{
> +       struct sm2_signature_ctx *sig = context;
> +
> +       if (!value || !vlen)
> +               return -EINVAL;
> +
> +       sig->sig_r = mpi_read_raw_data(value, vlen);
> +       if (!sig->sig_r)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +int sm2_get_signature_s(void *context, size_t hdrlen, unsigned char tag,
> +                               const void *value, size_t vlen)
> +{
> +       struct sm2_signature_ctx *sig = context;
> +
> +       if (!value || !vlen)
> +               return -EINVAL;
> +
> +       sig->sig_s = mpi_read_raw_data(value, vlen);
> +       if (!sig->sig_s)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +static int sm2_z_digest_update(struct shash_desc *desc,
> +                       MPI m, unsigned int pbytes)
> +{
> +       static const unsigned char zero[32];
> +       unsigned char *in;
> +       unsigned int inlen;
> +
> +       in = mpi_get_buffer(m, &inlen, NULL);
> +       if (!in)
> +               return -EINVAL;
> +
> +       if (inlen < pbytes) {
> +               /* padding with zero */
> +               crypto_sm3_update(desc, zero, pbytes - inlen);
> +               crypto_sm3_update(desc, in, inlen);
> +       } else if (inlen > pbytes) {
> +               /* skip the starting zero */
> +               crypto_sm3_update(desc, in + inlen - pbytes, pbytes);
> +       } else {
> +               crypto_sm3_update(desc, in, inlen);
> +       }
> +
> +       kfree(in);
> +       return 0;
> +}
> +
> +static int sm2_z_digest_update_point(struct shash_desc *desc,
> +                       MPI_POINT point, struct mpi_ec_ctx *ec, unsigned
> int pbytes)
> +{
> +       MPI x, y;
> +       int ret = -EINVAL;
> +
> +       x = mpi_new(0);
> +       y = mpi_new(0);
> +
> +       if (!mpi_ec_get_affine(x, y, point, ec) &&
> +               !sm2_z_digest_update(desc, x, pbytes) &&
> +               !sm2_z_digest_update(desc, y, pbytes))
> +               ret = 0;
> +
> +       mpi_free(x);
> +       mpi_free(y);
> +       return ret;
> +}
> +
> +int sm2_compute_z_digest(struct crypto_akcipher *tfm,
> +                       const unsigned char *id, size_t id_len,
> +                       unsigned char dgst[SM3_DIGEST_SIZE])
> +{
> +       struct mpi_ec_ctx *ec = akcipher_tfm_ctx(tfm);
> +       uint16_t bits_len;
> +       unsigned char entl[2];
> +       SHASH_DESC_ON_STACK(desc, NULL);
> +       unsigned int pbytes;
> +
> +       if (id_len > (USHRT_MAX / 8) || !ec->Q)
> +               return -EINVAL;
> +
> +       bits_len = (uint16_t)(id_len * 8);
> +       entl[0] = bits_len >> 8;
> +       entl[1] = bits_len & 0xff;
> +
> +       pbytes = MPI_NBYTES(ec->p);
> +
> +       /* ZA = H256(ENTLA | IDA | a | b | xG | yG | xA | yA) */
> +       sm3_base_init(desc);
> +       crypto_sm3_update(desc, entl, 2);
> +       crypto_sm3_update(desc, id, id_len);
> +
> +       if (sm2_z_digest_update(desc, ec->a, pbytes) ||
> +               sm2_z_digest_update(desc, ec->b, pbytes) ||
> +               sm2_z_digest_update_point(desc, ec->G, ec, pbytes) ||
> +               sm2_z_digest_update_point(desc, ec->Q, ec, pbytes))
> +               return -EINVAL;
> +
> +       crypto_sm3_finup(desc, NULL, 0, dgst);
> +       return 0;
> +}
> +EXPORT_SYMBOL(sm2_compute_z_digest);
> +
> +static int _sm2_verify(struct mpi_ec_ctx *ec, MPI hash, MPI sig_r, MPI
> sig_s)
> +{
> +       int rc = -EINVAL;
> +       struct gcry_mpi_point sG, tP;
> +       MPI t = NULL;
> +       MPI x1 = NULL, y1 = NULL;
> +
> +       mpi_point_init(&sG);
> +       mpi_point_init(&tP);
> +       x1 = mpi_new(0);
> +       y1 = mpi_new(0);
> +       t = mpi_new(0);
> +
> +       /* r, s in [1, n-1] */
> +       if (mpi_cmp_ui(sig_r, 1) < 0 || mpi_cmp(sig_r, ec->n) > 0 ||
> +               mpi_cmp_ui(sig_s, 1) < 0 || mpi_cmp(sig_s, ec->n) > 0) {
> +               goto leave;
> +       }
> +
> +       /* t = (r + s) % n, t == 0 */
> +       mpi_addm(t, sig_r, sig_s, ec->n);
> +       if (mpi_cmp_ui(t, 0) == 0)
> +               goto leave;
> +
> +       /* sG + tP = (x1, y1) */
> +       rc = -EBADMSG;
> +       mpi_ec_mul_point(&sG, sig_s, ec->G, ec);
> +       mpi_ec_mul_point(&tP, t, ec->Q, ec);
> +       mpi_ec_add_points(&sG, &sG, &tP, ec);
> +       if (mpi_ec_get_affine(x1, y1, &sG, ec))
> +               goto leave;
> +
> +       /* R = (e + x1) % n */
> +       mpi_addm(t, hash, x1, ec->n);
> +
> +       /* check R == r */
> +       rc = -EKEYREJECTED;
> +       if (mpi_cmp(t, sig_r))
> +               goto leave;
> +
> +       rc = 0;
> +
> +leave:
> +       mpi_point_free_parts(&sG);
> +       mpi_point_free_parts(&tP);
> +       mpi_free(x1);
> +       mpi_free(y1);
> +       mpi_free(t);
> +
> +       return rc;
> +}
> +
> +static int sm2_verify(struct akcipher_request *req)
> +{
> +       struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
> +       struct mpi_ec_ctx *ec = akcipher_tfm_ctx(tfm);
> +       unsigned char *buffer;
> +       struct sm2_signature_ctx sig;
> +       MPI hash;
> +       int ret;
> +
> +       if (unlikely(!ec->Q))
> +               return -EINVAL;
> +
> +       buffer = kmalloc(req->src_len + req->dst_len, GFP_KERNEL);
> +       if (!buffer)
> +               return -ENOMEM;
> +
> +       sg_pcopy_to_buffer(req->src,
> +                       sg_nents_for_len(req->src, req->src_len +
> req->dst_len),
> +                       buffer, req->src_len + req->dst_len, 0);
> +
> +       sig.sig_r = NULL;
> +       sig.sig_s = NULL;
> +       ret = asn1_ber_decoder(&sm2signature_decoder, &sig, buffer,
> req->src_len);
> +       if (ret)
> +               goto error;
> +
> +       ret = -ENOMEM;
> +       hash = mpi_read_raw_data(buffer + req->src_len, req->dst_len);
> +       if (!hash)
> +               goto error;
> +
> +       ret = _sm2_verify(ec, hash, sig.sig_r, sig.sig_s);
> +
> +       mpi_free(hash);
> +error:
> +       mpi_free(sig.sig_r);
> +       mpi_free(sig.sig_s);
> +       kfree(buffer);
> +       return ret;
> +}
> +
> +static int sm2_set_pub_key(struct crypto_akcipher *tfm, const void *key,
> +                                               unsigned int keylen)
> +{
> +       struct mpi_ec_ctx *ec = akcipher_tfm_ctx(tfm);
> +       MPI a;
> +       int rc;
> +
> +       rc = sm2_ec_ctx_reset(ec);
> +       if (rc)
> +               return rc;
> +
> +       ec->Q = mpi_point_new(0);
> +       if (!ec->Q)
> +               return -ENOMEM;
> +
> +       /* include the uncompressed flag '0x04' */
> +       rc = -ENOMEM;
> +       a = mpi_read_raw_data(key, keylen);
> +       if (!a)
> +               goto error;
> +
> +       mpi_normalize(a);
> +       rc = sm2_ecc_os2ec(ec->Q, a);
> +       mpi_free(a);
> +       if (rc)
> +               goto error;
> +
> +       return 0;
> +
> +error:
> +       mpi_point_release(ec->Q);
> +       ec->Q = NULL;
> +       return rc;
> +}
> +
> +static unsigned int sm2_max_size(struct crypto_akcipher *tfm)
> +{
> +       /* Unlimited max size */
> +       return PAGE_SIZE;
> +}
> +
> +static void sm2_exit_tfm(struct crypto_akcipher *tfm)
> +{
> +       struct mpi_ec_ctx *ec = akcipher_tfm_ctx(tfm);
> +
> +       mpi_ec_deinit(ec);
> +}
> +
> +static struct akcipher_alg sm2 = {
> +       .verify = sm2_verify,
> +       .set_pub_key = sm2_set_pub_key,
> +       .max_size = sm2_max_size,
> +       .exit = sm2_exit_tfm,
> +       .base = {
> +               .cra_name = "sm2",
> +               .cra_driver_name = "sm2-generic",
> +               .cra_priority = 100,
> +               .cra_module = THIS_MODULE,
> +               .cra_ctxsize = sizeof(struct mpi_ec_ctx),
> +       },
> +};
> +
> +static int sm2_init(void)
> +{
> +       return crypto_register_akcipher(&sm2);
> +}
> +
> +static void sm2_exit(void)
> +{
> +       crypto_unregister_akcipher(&sm2);
> +}
> +
> +subsys_initcall(sm2_init);
> +module_exit(sm2_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Tianjia Zhang <tianjia.zhang@linux.alibaba.com>");
> +MODULE_DESCRIPTION("SM2 generic algorithm");
> +MODULE_ALIAS_CRYPTO("sm2-generic");
> diff --git a/crypto/sm2signature.asn1 b/crypto/sm2signature.asn1
> new file mode 100644
> index 000000000000..ab8c0b754d21
> --- /dev/null
> +++ b/crypto/sm2signature.asn1
> @@ -0,0 +1,4 @@
> +Sm2Signature ::= SEQUENCE {
> +       sig_r   INTEGER ({ sm2_get_signature_r }),
> +       sig_s   INTEGER ({ sm2_get_signature_s })
> +}
> diff --git a/include/crypto/sm2.h b/include/crypto/sm2.h
> new file mode 100644
> index 000000000000..af452556dcd4
> --- /dev/null
> +++ b/include/crypto/sm2.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * sm2.h - SM2 asymmetric public-key algorithm
> + * as specified by OSCCA GM/T 0003.1-2012 -- 0003.5-2012 SM2 and
> + * described at https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
> + *
> + * Copyright (c) 2020, Alibaba Group.
> + * Written by Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> + */
> +
> +#ifndef _CRYPTO_SM2_H
> +#define _CRYPTO_SM2_H
> +
> +#include <crypto/sm3.h>
> +#include <crypto/akcipher.h>
> +
> +/* The default user id as specified in GM/T 0009-2012 */
> +#define SM2_DEFAULT_USERID "1234567812345678"
> +#define SM2_DEFAULT_USERID_LEN 16
> +
> +extern int sm2_compute_z_digest(struct crypto_akcipher *tfm,
> +                       const unsigned char *id, size_t id_len,
> +                       unsigned char dgst[SM3_DIGEST_SIZE]);
> +
> +#endif /* _CRYPTO_SM2_H */
> --
> 2.17.1
>
>

--000000000000024f5d05ac817079
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this patch has been test=C2=A0in my env, it look okay for =
me.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Jul 9, 2020 at 4:42 PM Tianjia Zhang &lt;<a href=3D"mailto:tianj=
ia.zhang@linux.alibaba.com">tianjia.zhang@linux.alibaba.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">This new module =
implement the SM2 public key algorithm. It was<br>
published by State Encryption Management Bureau, China.<br>
List of specifications for SM2 elliptic curve public key cryptography:<br>
<br>
* GM/T 0003.1-2012<br>
* GM/T 0003.2-2012<br>
* GM/T 0003.3-2012<br>
* GM/T 0003.4-2012<br>
* GM/T 0003.5-2012<br>
<br>
IETF: <a href=3D"https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02" rel=
=3D"noreferrer" target=3D"_blank">https://tools.ietf.org/html/draft-shen-sm=
2-ecdsa-02</a><br>
oscca: <a href=3D"http://www.oscca.gov.cn/sca/xxgk/2010-12/17/content_10023=
86.shtml" rel=3D"noreferrer" target=3D"_blank">http://www.oscca.gov.cn/sca/=
xxgk/2010-12/17/content_1002386.shtml</a><br>
scctc: <a href=3D"http://www.gmbz.org.cn/main/bzlb.html" rel=3D"noreferrer"=
 target=3D"_blank">http://www.gmbz.org.cn/main/bzlb.html</a><br>
<br>
Signed-off-by: Tianjia Zhang &lt;<a href=3D"mailto:tianjia.zhang@linux.alib=
aba.com" target=3D"_blank">tianjia.zhang@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0crypto/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 ++<=
br>
=C2=A0crypto/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<b=
r>
=C2=A0crypto/sm2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 473 +++=
++++++++++++++++++++++++++++++++++++<br>
=C2=A0crypto/sm2signature.asn1 |=C2=A0 =C2=A04 +<br>
=C2=A0include/crypto/sm2.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +++<br>
=C2=A05 files changed, 527 insertions(+)<br>
=C2=A0create mode 100644 crypto/sm2.c<br>
=C2=A0create mode 100644 crypto/sm2signature.asn1<br>
=C2=A0create mode 100644 include/crypto/sm2.h<br>
<br>
diff --git a/crypto/Kconfig b/crypto/Kconfig<br>
index 091c0a0bbf26..de330d658758 100644<br>
--- a/crypto/Kconfig<br>
+++ b/crypto/Kconfig<br>
@@ -260,6 +260,23 @@ config CRYPTO_ECRDSA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 standard algorithms (called GOST algorit=
hms). Only signature verification<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is implemented.<br>
<br>
+config CRYPTO_SM2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;SM2 algorithm&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select CRYPTO_SM3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select CRYPTO_AKCIPHER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select CRYPTO_MANAGER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select MPILIB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select ASN1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Generic implementation of the SM2 public=
 key algorithm. It was<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0published by State Encryption Management=
 Bureau, China.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as specified by OSCCA GM/T 0003.1-2012 -=
- 0003.5-2012.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0References:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://tools.ietf.org/html/d=
raft-shen-sm2-ecdsa-02" rel=3D"noreferrer" target=3D"_blank">https://tools.=
ietf.org/html/draft-shen-sm2-ecdsa-02</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.oscca.gov.cn/sca/x=
xgk/2010-12/17/content_1002386.shtml" rel=3D"noreferrer" target=3D"_blank">=
http://www.oscca.gov.cn/sca/xxgk/2010-12/17/content_1002386.shtml</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.gmbz.org.cn/main/b=
zlb.html" rel=3D"noreferrer" target=3D"_blank">http://www.gmbz.org.cn/main/=
bzlb.html</a><br>
+<br>
=C2=A0config CRYPTO_CURVE25519<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;Curve25519 algorithm&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select CRYPTO_KPP<br>
diff --git a/crypto/Makefile b/crypto/Makefile<br>
index 4ca12b6044f7..b279483fba50 100644<br>
--- a/crypto/Makefile<br>
+++ b/crypto/Makefile<br>
@@ -42,6 +42,14 @@ rsa_generic-y +=3D rsa_helper.o<br>
=C2=A0rsa_generic-y +=3D rsa-pkcs1pad.o<br>
=C2=A0obj-$(CONFIG_CRYPTO_RSA) +=3D rsa_generic.o<br>
<br>
+$(obj)/sm2signature.asn1.o: $(obj)/sm2signature.asn1.c $(obj)/sm2signature=
.asn1.h<br>
+$(obj)/sm2.o: $(obj)/sm2signature.asn1.h<br>
+<br>
+sm2_generic-y +=3D sm2signature.asn1.o<br>
+sm2_generic-y +=3D sm2.o<br>
+<br>
+obj-$(CONFIG_CRYPTO_SM2) +=3D sm2_generic.o<br>
+<br>
=C2=A0crypto_acompress-y :=3D acompress.o<br>
=C2=A0crypto_acompress-y +=3D scompress.o<br>
=C2=A0obj-$(CONFIG_CRYPTO_ACOMP2) +=3D crypto_acompress.o<br>
diff --git a/crypto/sm2.c b/crypto/sm2.c<br>
new file mode 100644<br>
index 000000000000..86da175bcda6<br>
--- /dev/null<br>
+++ b/crypto/sm2.c<br>
@@ -0,0 +1,473 @@<br>
+/* SPDX-License-Identifier: GPL-2.0-or-later */<br>
+/*<br>
+ * SM2 asymmetric public-key algorithm<br>
+ * as specified by OSCCA GM/T 0003.1-2012 -- 0003.5-2012 SM2 and<br>
+ * described at <a href=3D"https://tools.ietf.org/html/draft-shen-sm2-ecds=
a-02" rel=3D"noreferrer" target=3D"_blank">https://tools.ietf.org/html/draf=
t-shen-sm2-ecdsa-02</a><br>
+ *<br>
+ * Copyright (c) 2020, Alibaba Group.<br>
+ * Authors: Tianjia Zhang &lt;<a href=3D"mailto:tianjia.zhang@linux.alibab=
a.com" target=3D"_blank">tianjia.zhang@linux.alibaba.com</a>&gt;<br>
+ */<br>
+<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/mpi.h&gt;<br>
+#include &lt;crypto/internal/akcipher.h&gt;<br>
+#include &lt;crypto/akcipher.h&gt;<br>
+#include &lt;crypto/hash.h&gt;<br>
+#include &lt;crypto/sm3_base.h&gt;<br>
+#include &lt;crypto/rng.h&gt;<br>
+#include &lt;crypto/sm2.h&gt;<br>
+#include &quot;sm2signature.asn1.h&quot;<br>
+<br>
+#define MPI_NBYTES(m)=C2=A0 =C2=A0((mpi_get_nbits(m) + 7) / 8)<br>
+<br>
+struct ecc_domain_parms {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *desc;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Description of the curve.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int nbits;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Number of bits.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int fips:1; /* True if this is a FIPS1=
40-2 approved curve */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The model describing this curve.=C2=A0 This =
is mainly used to select<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the group equation.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum gcry_mpi_ec_models model;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The actual ECC dialect used.=C2=A0 This is u=
sed for curve specific<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * optimizations and to select encodings etc.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum ecc_dialects dialect;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *p;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* The prime defining the field.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *a, *b;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* The coefficients.=C2=A0 For Twisted Edwards<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Curves b is used for=
 d.=C2=A0 For Montgomery<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Curves (a,b) has ((A=
-2)/4,B^-1).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *n;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* The order of the base point.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *g_x, *g_y;=C2=A0 =C2=A0 =C2=A0 /* B=
ase point.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int h;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Cofactor.=C2=A0 */<br>
+};<br>
+<br>
+static const struct ecc_domain_parms sm2_ecp =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.desc =3D &quot;sm2p256v1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.nbits =3D 256,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.fips =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.model =3D MPI_EC_WEIERSTRASS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dialect =3D ECC_DIALECT_STANDARD,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.p=C2=A0 =C2=A0=3D &quot;0xfffffffeffffffffffff=
ffffffffffffffffffff00000000ffffffffffffffff&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.a=C2=A0 =C2=A0=3D &quot;0xfffffffeffffffffffff=
ffffffffffffffffffff00000000fffffffffffffffc&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.b=C2=A0 =C2=A0=3D &quot;0x28e9fa9e9d9f5e344d5a=
9e4bcf6509a7f39789f515ab8f92ddbcbd414d940e93&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.n=C2=A0 =C2=A0=3D &quot;0xfffffffeffffffffffff=
ffffffffffff7203df6b21c6052b53bbf40939d54123&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.g_x =3D &quot;0x32c4ae2c1f1981195f9904466a39c9=
948fe30bbff2660be1715a4589334c74c7&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.g_y =3D &quot;0xbc3736a2f4f6779c59bdcee36b6921=
53d0a9877cc62a474002df32e52139f0a0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.h =3D 1<br>
+};<br>
+<br>
+static int sm2_ec_ctx_init(struct mpi_ec_ctx *ec)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct ecc_domain_parms *ecp =3D &amp;sm2=
_ecp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MPI p, a, b;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MPI x, y;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc =3D -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D mpi_scanval(ecp-&gt;p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0a =3D mpi_scanval(ecp-&gt;a);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D mpi_scanval(ecp-&gt;b);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!p || !a || !b)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto free_p;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0x =3D mpi_scanval(ecp-&gt;g_x);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0y =3D mpi_scanval(ecp-&gt;g_y);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!x || !y)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto free;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* mpi_ec_setup_elliptic_curve */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ec-&gt;G =3D mpi_point_new(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ec-&gt;G)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto free;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_set(ec-&gt;G-&gt;x, x);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_set(ec-&gt;G-&gt;y, y);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_set_ui(ec-&gt;G-&gt;z, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ec-&gt;n =3D mpi_scanval(ecp-&gt;n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ec-&gt;n) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_point_release(e=
c-&gt;G);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto free;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ec-&gt;h =3D ecp-&gt;h;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ec-&gt;name =3D ecp-&gt;desc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_ec_init(ec, ecp-&gt;model, ecp-&gt;dialect,=
 0, p, a, b);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D 0;<br>
+<br>
+free:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(x);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(y);<br>
+free_p:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(a);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(b);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
+}<br>
+<br>
+static void sm2_ec_ctx_deinit(struct mpi_ec_ctx *ec)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(ec-&gt;n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_point_release(ec-&gt;G);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_ec_deinit(ec);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(ec, 0, sizeof(*ec));<br>
+}<br>
+<br>
+static int sm2_ec_ctx_reset(struct mpi_ec_ctx *ec)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sm2_ec_ctx_deinit(ec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sm2_ec_ctx_init(ec);<br>
+}<br>
+<br>
+/* RESULT must have been initialized and is set on success to the<br>
+ * point given by VALUE.<br>
+ */<br>
+static int sm2_ecc_os2ec(MPI_POINT result, MPI value)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t n;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const unsigned char *buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *buf_memory;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MPI x, y;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D (mpi_get_nbits(value)+7)/8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf_memory =3D kmalloc(n, GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D mpi_print(GCRYMPI_FMT_USG, buf_memory, n=
, &amp;n, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(buf_memory);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D buf_memory;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n &lt; 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(buf_memory);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*buf !=3D 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(buf_memory);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL; /* =
No support for point compression.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (((n-1)%2)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(buf_memory);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D (n-1)/2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0x =3D mpi_read_raw_data(buf + 1, n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!x) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(buf_memory);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0y =3D mpi_read_raw_data(buf + 1 + n, n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(buf_memory);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!y) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(x);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_normalize(x);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_normalize(y);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_set(result-&gt;x, x);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_set(result-&gt;y, y);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_set_ui(result-&gt;z, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(x);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(y);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+struct sm2_signature_ctx {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MPI sig_r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MPI sig_s;<br>
+};<br>
+<br>
+int sm2_get_signature_r(void *context, size_t hdrlen, unsigned char tag,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void *value, size_t vlen)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sm2_signature_ctx *sig =3D context;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!value || !vlen)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sig-&gt;sig_r =3D mpi_read_raw_data(value, vlen=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sig-&gt;sig_r)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+int sm2_get_signature_s(void *context, size_t hdrlen, unsigned char tag,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void *value, size_t vlen)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sm2_signature_ctx *sig =3D context;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!value || !vlen)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sig-&gt;sig_s =3D mpi_read_raw_data(value, vlen=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sig-&gt;sig_s)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int sm2_z_digest_update(struct shash_desc *desc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MPI m, unsigned int pbytes)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0static const unsigned char zero[32];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *in;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int inlen;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0in =3D mpi_get_buffer(m, &amp;inlen, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!in)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (inlen &lt; pbytes) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* padding with zer=
o */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crypto_sm3_update(d=
esc, zero, pbytes - inlen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crypto_sm3_update(d=
esc, in, inlen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (inlen &gt; pbytes) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* skip the startin=
g zero */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crypto_sm3_update(d=
esc, in + inlen - pbytes, pbytes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crypto_sm3_update(d=
esc, in, inlen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(in);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int sm2_z_digest_update_point(struct shash_desc *desc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MPI_POINT point, struct mpi_ec_ctx *ec, unsigned int pbytes)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MPI x, y;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0x =3D mpi_new(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0y =3D mpi_new(0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mpi_ec_get_affine(x, y, point, ec) &amp;&a=
mp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!sm2_z_digest_updat=
e(desc, x, pbytes) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!sm2_z_digest_updat=
e(desc, y, pbytes))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(x);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(y);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+int sm2_compute_z_digest(struct crypto_akcipher *tfm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const unsigned char *id, size_t id_len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned char dgst[SM3_DIGEST_SIZE])<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mpi_ec_ctx *ec =3D akcipher_tfm_ctx(tfm)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t bits_len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char entl[2];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SHASH_DESC_ON_STACK(desc, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int pbytes;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (id_len &gt; (USHRT_MAX / 8) || !ec-&gt;Q)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bits_len =3D (uint16_t)(id_len * 8);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0entl[0] =3D bits_len &gt;&gt; 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0entl[1] =3D bits_len &amp; 0xff;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pbytes =3D MPI_NBYTES(ec-&gt;p);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ZA =3D H256(ENTLA | IDA | a | b | xG | yG | =
xA | yA) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sm3_base_init(desc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0crypto_sm3_update(desc, entl, 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0crypto_sm3_update(desc, id, id_len);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sm2_z_digest_update(desc, ec-&gt;a, pbytes)=
 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sm2_z_digest_update=
(desc, ec-&gt;b, pbytes) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sm2_z_digest_update=
_point(desc, ec-&gt;G, ec, pbytes) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sm2_z_digest_update=
_point(desc, ec-&gt;Q, ec, pbytes))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0crypto_sm3_finup(desc, NULL, 0, dgst);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+EXPORT_SYMBOL(sm2_compute_z_digest);<br>
+<br>
+static int _sm2_verify(struct mpi_ec_ctx *ec, MPI hash, MPI sig_r, MPI sig=
_s)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc =3D -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gcry_mpi_point sG, tP;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MPI t =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MPI x1 =3D NULL, y1 =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_point_init(&amp;sG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_point_init(&amp;tP);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0x1 =3D mpi_new(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0y1 =3D mpi_new(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D mpi_new(0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* r, s in [1, n-1] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mpi_cmp_ui(sig_r, 1) &lt; 0 || mpi_cmp(sig_=
r, ec-&gt;n) &gt; 0 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_cmp_ui(sig_s, 1=
) &lt; 0 || mpi_cmp(sig_s, ec-&gt;n) &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto leave;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* t =3D (r + s) % n, t =3D=3D 0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_addm(t, sig_r, sig_s, ec-&gt;n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mpi_cmp_ui(t, 0) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto leave;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* sG + tP =3D (x1, y1) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D -EBADMSG;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_ec_mul_point(&amp;sG, sig_s, ec-&gt;G, ec);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_ec_mul_point(&amp;tP, t, ec-&gt;Q, ec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_ec_add_points(&amp;sG, &amp;sG, &amp;tP, ec=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mpi_ec_get_affine(x1, y1, &amp;sG, ec))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto leave;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* R =3D (e + x1) % n */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_addm(t, hash, x1, ec-&gt;n);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* check R =3D=3D r */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D -EKEYREJECTED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mpi_cmp(t, sig_r))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto leave;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D 0;<br>
+<br>
+leave:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_point_free_parts(&amp;sG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_point_free_parts(&amp;tP);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(x1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(y1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(t);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
+}<br>
+<br>
+static int sm2_verify(struct akcipher_request *req)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct crypto_akcipher *tfm =3D crypto_akcipher=
_reqtfm(req);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mpi_ec_ctx *ec =3D akcipher_tfm_ctx(tfm)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *buffer;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sm2_signature_ctx sig;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MPI hash;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!ec-&gt;Q))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer =3D kmalloc(req-&gt;src_len + req-&gt;ds=
t_len, GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!buffer)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sg_pcopy_to_buffer(req-&gt;src,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sg_nents_for_len(req-&gt;src, req-&gt;src_len + req-&gt;dst_len),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buffer, req-&gt;src_len + req-&gt;dst_len, 0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sig.sig_r =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sig.sig_s =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D asn1_ber_decoder(&amp;sm2signature_deco=
der, &amp;sig, buffer, req-&gt;src_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hash =3D mpi_read_raw_data(buffer + req-&gt;src=
_len, req-&gt;dst_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!hash)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D _sm2_verify(ec, hash, sig.sig_r, sig.si=
g_s);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(hash);<br>
+error:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(sig.sig_r);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(sig.sig_s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(buffer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static int sm2_set_pub_key(struct crypto_akcipher *tfm, const void *key,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0unsigned int keylen)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mpi_ec_ctx *ec =3D akcipher_tfm_ctx(tfm)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MPI a;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D sm2_ec_ctx_reset(ec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ec-&gt;Q =3D mpi_point_new(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ec-&gt;Q)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* include the uncompressed flag &#39;0x04&#39;=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0a =3D mpi_read_raw_data(key, keylen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!a)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_normalize(a);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D sm2_ecc_os2ec(ec-&gt;Q, a);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_free(a);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+error:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_point_release(ec-&gt;Q);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ec-&gt;Q =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
+}<br>
+<br>
+static unsigned int sm2_max_size(struct crypto_akcipher *tfm)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Unlimited max size */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return PAGE_SIZE;<br>
+}<br>
+<br>
+static void sm2_exit_tfm(struct crypto_akcipher *tfm)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mpi_ec_ctx *ec =3D akcipher_tfm_ctx(tfm)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mpi_ec_deinit(ec);<br>
+}<br>
+<br>
+static struct akcipher_alg sm2 =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.verify =3D sm2_verify,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.set_pub_key =3D sm2_set_pub_key,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.max_size =3D sm2_max_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.exit =3D sm2_exit_tfm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.base =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cra_name =3D &quot=
;sm2&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cra_driver_name =
=3D &quot;sm2-generic&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cra_priority =3D 1=
00,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cra_module =3D THI=
S_MODULE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cra_ctxsize =3D si=
zeof(struct mpi_ec_ctx),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+};<br>
+<br>
+static int sm2_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return crypto_register_akcipher(&amp;sm2);<br>
+}<br>
+<br>
+static void sm2_exit(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0crypto_unregister_akcipher(&amp;sm2);<br>
+}<br>
+<br>
+subsys_initcall(sm2_init);<br>
+module_exit(sm2_exit);<br>
+<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_AUTHOR(&quot;Tianjia Zhang &lt;<a href=3D"mailto:tianjia.zhang@linu=
x.alibaba.com" target=3D"_blank">tianjia.zhang@linux.alibaba.com</a>&gt;&qu=
ot;);<br>
+MODULE_DESCRIPTION(&quot;SM2 generic algorithm&quot;);<br>
+MODULE_ALIAS_CRYPTO(&quot;sm2-generic&quot;);<br>
diff --git a/crypto/sm2signature.asn1 b/crypto/sm2signature.asn1<br>
new file mode 100644<br>
index 000000000000..ab8c0b754d21<br>
--- /dev/null<br>
+++ b/crypto/sm2signature.asn1<br>
@@ -0,0 +1,4 @@<br>
+Sm2Signature ::=3D SEQUENCE {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sig_r=C2=A0 =C2=A0INTEGER ({ sm2_get_signature_=
r }),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sig_s=C2=A0 =C2=A0INTEGER ({ sm2_get_signature_=
s })<br>
+}<br>
diff --git a/include/crypto/sm2.h b/include/crypto/sm2.h<br>
new file mode 100644<br>
index 000000000000..af452556dcd4<br>
--- /dev/null<br>
+++ b/include/crypto/sm2.h<br>
@@ -0,0 +1,25 @@<br>
+/* SPDX-License-Identifier: GPL-2.0-or-later */<br>
+/*<br>
+ * sm2.h - SM2 asymmetric public-key algorithm<br>
+ * as specified by OSCCA GM/T 0003.1-2012 -- 0003.5-2012 SM2 and<br>
+ * described at <a href=3D"https://tools.ietf.org/html/draft-shen-sm2-ecds=
a-02" rel=3D"noreferrer" target=3D"_blank">https://tools.ietf.org/html/draf=
t-shen-sm2-ecdsa-02</a><br>
+ *<br>
+ * Copyright (c) 2020, Alibaba Group.<br>
+ * Written by Tianjia Zhang &lt;<a href=3D"mailto:tianjia.zhang@linux.alib=
aba.com" target=3D"_blank">tianjia.zhang@linux.alibaba.com</a>&gt;<br>
+ */<br>
+<br>
+#ifndef _CRYPTO_SM2_H<br>
+#define _CRYPTO_SM2_H<br>
+<br>
+#include &lt;crypto/sm3.h&gt;<br>
+#include &lt;crypto/akcipher.h&gt;<br>
+<br>
+/* The default user id as specified in GM/T 0009-2012 */<br>
+#define SM2_DEFAULT_USERID &quot;1234567812345678&quot;<br>
+#define SM2_DEFAULT_USERID_LEN 16<br>
+<br>
+extern int sm2_compute_z_digest(struct crypto_akcipher *tfm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const unsigned char *id, size_t id_len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned char dgst[SM3_DIGEST_SIZE]);<br>
+<br>
+#endif /* _CRYPTO_SM2_H */<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000024f5d05ac817079--

--===============7203723567466274666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7203723567466274666==--
