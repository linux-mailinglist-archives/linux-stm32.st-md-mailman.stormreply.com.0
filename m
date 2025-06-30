Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFBFAEE7AE
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 21:41:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACDB3C32E92;
	Mon, 30 Jun 2025 19:41:12 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32A6CC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 19:41:10 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-73a5c41a71aso2611075a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751312469; x=1751917269;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YmZU1CwxbYdxvjVqnDRbR2hmU1JLOG0dDJmR8AN044k=;
 b=ZOEUWE20OwODLMFs6/CCXN4AKlOMuu3iVrOpVBsOa82ouEFx6yFAxt8uLvinivMK9P
 tfJm1XjbVz65YuWqnhdXpLdBd43ELk3BUjBcvbrVP0onaFdLUflgO2NtCPPkvLPcYHre
 OzUJ6FtfU5SR7y6IbeXK5lfJBHprb8G/KfLH0c35aQPiS6zmlL/Rks/XEwEyO1lUm2NF
 yGLGAzwKs0bVEhJKtA8R62wQEMhy6jP/T0CK4ucfxERO8zN5bhDTymTA1KeVH6MUGq+g
 CPt4dgzhOnQ9HMOqTl0AfhsTOQBc8VQSTFDqxB4BRQCUV5KYEoBxKDdi2FhxR/BPup9i
 2dQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751312469; x=1751917269;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YmZU1CwxbYdxvjVqnDRbR2hmU1JLOG0dDJmR8AN044k=;
 b=Zhv1ma9njO4CO9efrElWIDmbgMmu2RXHfOvq9EdLor807IZDMHu+3wmvg8qSfeCl1F
 n0KMbzzZl74bGvQSQlVRh0arIfm11B5ni4QtMgFa1GUsViKVaNvQUoSg9WbEPcap28/m
 MRWfa642MN/Jbvun78QTkSFvlpgh3pGdFIo7liZ8eAJIQQAtwKkudP19GHkxw2GPf6Jx
 CcVTiCQL2HaVDOf8NEGFU6S5nDtRyulwp2RYWD4lN0oRbG0Q0FZ2wsyJY8VQ9FaDJIyV
 OIV2bt+pdjMdYxbinfsLxIO5/g+m4nSKSewyisZzBjvjWA0Gpaz3L3ICyKACFQhAFokJ
 Ml0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZhsf8mx21xJxmFxYm2JawCx2ZBlymbjAc1SMFNq7IlTnvE0fuJKye0L86/rLyv48WWxWfVLw1Sqgc3g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzuFKB0+zhbWTKQIZQ2NItEbrIwc9LndNFuip6zycYFQCGqF9zY
 77Hlctt1wbzml8/C20uiu3Mmr1ZqSikCoUyBsbWVM6jWQRqLStrI1ubbGeDhXT84gZI=
X-Gm-Gg: ASbGncshUV91HeauhMiiHcn5a00GAN914ejNnMmMkS78fK1D7y/+EvATEsL2pjvdDgd
 H37sZM06u+yH8arD/oguzhjHz2FOv63CQhuWugUJisowQS4lgOi9ROiJLdxxFTstNDKm6b0gx84
 51LmSZHQrJD8b0DY+FXeE52AvHr0EIfirDlKRh8q0vH+tzuNJKf2PQaYxdG3/Hvp1J4lxPBOusQ
 qw8t2vXu94A9tYt2kO5T6Ja0/ditXTfU79eD5g+pPhlh1AGdHb2AjGCAg98lBQ3xcZd2H8FDVIi
 1KisFbjnQlLm7HsPA1i4JEL3rHbpr845RtURlSkQ0YJwtMp9AtNKyBSJ+S+bRX00Oa99
X-Google-Smtp-Source: AGHT+IFCr/h/Pq7YioC0C96yZfnS46Emb0XznV8LFfoTN6Hof+uG2lgGCVIDP4UToYNd7qu111FhBg==
X-Received: by 2002:a05:6830:2901:b0:72a:ec6:7fc1 with SMTP id
 46e09a7af769-73afc6507b1mr8500368a34.14.1751312469502; 
 Mon, 30 Jun 2025 12:41:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73afaff249bsm1798804a34.6.2025.06.30.12.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 12:41:08 -0700 (PDT)
Date: Mon, 30 Jun 2025 22:41:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gu Bowen <gubowen5@huawei.com>
Message-ID: <0bf20f7e-117c-4495-9805-baade7f466ba@suswa.mountain>
References: <20250630133934.766646-1-gubowen5@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630133934.766646-1-gubowen5@huawei.com>
Cc: Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 GONG Ruiqi <gongruiqi1@huawei.com>, linux-stm32@st-md-mailman.stormreply.com,
 Lu Jialin <lujialin4@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Lukas Wunner <lukas@wunner.de>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ignat Korchagin <ignat@cloudflare.com>, David Woodhouse <dwmw2@infradead.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 0/4] Reintroduce the sm2 algorithm
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

On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
> To reintroduce the sm2 algorithm, the patch set did the following:
>  - Reintroduce the mpi library based on libgcrypt.
>  - Reintroduce ec implementation to MPI library.
>  - Rework sm2 algorithm.
>  - Support verification of X.509 certificates.

Remind me, why did we remove these?

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
