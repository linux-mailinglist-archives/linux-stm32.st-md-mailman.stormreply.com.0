Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9101D21CD14
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2020 04:18:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 341A2C36B2A;
	Mon, 13 Jul 2020 02:18:06 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E70FC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2020 02:18:02 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07488;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=22; SR=0;
 TI=SMTPD_---0U2Uh7i._1594606675; 
Received: from 30.25.206.74(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U2Uh7i._1594606675) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 13 Jul 2020 10:17:56 +0800
To: Marcelo Henrique Cerri <marcelo.cerri@canonical.com>
References: <20200709084015.21886-1-tianjia.zhang@linux.alibaba.com>
 <20200709084015.21886-3-tianjia.zhang@linux.alibaba.com>
 <20200710131203.wyj33bq2hgkz6pv4@valinor>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <82c805c6-5614-2889-6e2d-840a2eb8373b@linux.alibaba.com>
Date: Mon, 13 Jul 2020 10:17:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710131203.wyj33bq2hgkz6pv4@valinor>
Cc: vt@altlinux.org, gilad@benyossef.com, pvanleeuwen@rambus.com,
 linux-stm32@st-md-mailman.stormreply.com, jmorris@namei.org,
 zohar@linux.ibm.com, linux-kernel@vger.kernel.org, dhowells@redhat.com,
 nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
 zhang.jia@linux.alibaba.com, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 serge@hallyn.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 herbert@gondor.apana.org.au
Subject: Re: [Linux-stm32] [PATCH v5 2/8] lib/mpi: Extend the MPI library
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2020/7/10 21:12, Marcelo Henrique Cerri wrote:
> Hi, Tianjia.
> 
> On Thu, Jul 09, 2020 at 04:40:09PM +0800, Tianjia Zhang wrote:
>> Expand the mpi library based on libgcrypt, and the ECC algorithm of
>> mpi based on libgcrypt requires these functions.
>> Some other algorithms will be developed based on mpi ecc, such as SM2.
>>
>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>> ---
>>   include/linux/mpi.h    |  88 +++++++++++
>>   lib/mpi/Makefile       |   5 +
>>   lib/mpi/mpi-add.c      | 207 +++++++++++++++++++++++++
>>   lib/mpi/mpi-bit.c      | 251 ++++++++++++++++++++++++++++++
>>   lib/mpi/mpi-cmp.c      |  46 ++++--
>>   lib/mpi/mpi-div.c      | 238 +++++++++++++++++++++++++++++
>>   lib/mpi/mpi-internal.h |  53 +++++++
>>   lib/mpi/mpi-inv.c      | 143 ++++++++++++++++++
>>   lib/mpi/mpi-mod.c      | 155 +++++++++++++++++++
>>   lib/mpi/mpi-mul.c      |  94 ++++++++++++
>>   lib/mpi/mpicoder.c     | 336 +++++++++++++++++++++++++++++++++++++++++
>>   lib/mpi/mpih-div.c     | 294 ++++++++++++++++++++++++++++++++++++
>>   lib/mpi/mpih-mul.c     |  25 +++
>>   lib/mpi/mpiutil.c      | 204 +++++++++++++++++++++++++
>>   14 files changed, 2129 insertions(+), 10 deletions(-)
>>   create mode 100644 lib/mpi/mpi-add.c
>>   create mode 100644 lib/mpi/mpi-div.c
>>   create mode 100644 lib/mpi/mpi-inv.c
>>   create mode 100644 lib/mpi/mpi-mod.c
>>   create mode 100644 lib/mpi/mpi-mul.c
>>
>> diff --git a/lib/mpi/mpi-add.c b/lib/mpi/mpi-add.c
>> new file mode 100644
>> index 000000000000..9afad7832737
>> --- /dev/null
>> +++ b/lib/mpi/mpi-add.c
>> @@ -0,0 +1,207 @@
>> +/* mpi-add.c  -  MPI functions
>> + * Copyright (C) 1994, 1996, 1998, 2001, 2002,
>> + *               2003 Free Software Foundation, Inc.
>> + *
>> + * This file is part of Libgcrypt.
>> + *
>> + * Note: This code is heavily based on the GNU MP Library.
>> + *	 Actually it's the same code with only minor changes in the
>> + *	 way the data is stored; this is to support the abstraction
>> + *	 of an optional secure memory allocation which may be used
>> + *	 to avoid revealing of sensitive data due to paging etc.
>> + */
>> +
>> +#include "mpi-internal.h"
>> +
>> +/****************
>> + * Add the unsigned integer V to the mpi-integer U and store the
>> + * result in W. U and V may be the same.
>> + */
>> +void mpi_add_ui(MPI w, MPI u, unsigned long v)
>> +{
>> +	mpi_ptr_t wp, up;
>> +	mpi_size_t usize, wsize;
>> +	int usign, wsign;
>> +
>> +	usize = u->nlimbs;
>> +	usign = u->sign;
>> +	wsign = 0;
>> +
>> +	/* If not space for W (and possible carry), increase space.  */
>> +	wsize = usize + 1;
>> +	if (w->alloced < wsize)
>> +		mpi_resize(w, wsize);
> 
> You are ignoring the mpi_resize() return. I believe these new functions
> need to return an int to indicate errors as mpi_powm() does.
> 

Yes, of course.  Thanks for pointing it out.

Thanks,
Tianjia

> 
>> +
>> +	/* These must be after realloc (U may be the same as W).  */
>> +	up = u->d;
>> +	wp = w->d;
>> +
>> +	if (!usize) {  /* simple */
>> +		wp[0] = v;
>> +		wsize = v ? 1:0;
>> +	} else if (!usign) {  /* mpi is not negative */
>> +		mpi_limb_t cy;
>> +		cy = mpihelp_add_1(wp, up, usize, v);
>> +		wp[usize] = cy;
>> +		wsize = usize + cy;
>> +	} else {
>> +		/* The signs are different.  Need exact comparison to determine
>> +		 * which operand to subtract from which.
>> +		 */
>> +		if (usize == 1 && up[0] < v) {
>> +			wp[0] = v - up[0];
>> +			wsize = 1;
>> +		} else {
>> +			mpihelp_sub_1(wp, up, usize, v);
>> +			/* Size can decrease with at most one limb. */
>> +			wsize = usize - (wp[usize-1] == 0);
>> +			wsign = 1;
>> +		}
>> +	}
>> +
>> +	w->nlimbs = wsize;
>> +	w->sign   = wsign;
>> +}
>> +

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
