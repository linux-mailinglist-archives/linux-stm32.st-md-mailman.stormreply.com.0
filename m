Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DDE1FAC94
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 11:36:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 010E9C36B11;
	Tue, 16 Jun 2020 09:36:09 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0B5FC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 09:36:06 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=19; SR=0;
 TI=SMTPD_---0U.m0p4p_1592300158; 
Received: from 30.27.116.240(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U.m0p4p_1592300158) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 16 Jun 2020 17:35:59 +0800
To: herbert@gondor.apana.org.au, davem@davemloft.net, dhowells@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, jmorris@namei.org,
 serge@hallyn.com, nramas@linux.microsoft.com, tusharsu@linux.microsoft.com,
 zohar@linux.ibm.com, gilad@benyossef.com, pvanleeuwen@rambus.com,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-security-module@vger.kernel.org,
 zhang.jia@linux.alibaba.com
References: <20200609134855.21431-1-tianjia.zhang@linux.alibaba.com>
 <20200609205837.osganry2tyzwvanz@altlinux.org>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <254bf52e-eeb8-b615-be2a-d5cba976b63a@linux.alibaba.com>
Date: Tue, 16 Jun 2020 17:35:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200609205837.osganry2tyzwvanz@altlinux.org>
Subject: Re: [Linux-stm32] [PATCH v3 0/8] crpyto: introduce OSCCA
 certificate and SM2 asymmetric algorithm
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



On 2020/6/10 4:58, Vitaly Chikunov wrote:
> Tianjia,
> 
> On Tue, Jun 09, 2020 at 09:48:47PM +0800, Tianjia Zhang wrote:
>> Hello all,
>>
>> This new module implement the OSCCA certificate and SM2 public key
>> algorithm. It was published by State Encryption Management Bureau, China.
>> List of specifications for OSCCA certificate and SM2 elliptic curve
>> public key cryptography:
>>
>> * GM/T 0003.1-2012
>> * GM/T 0003.2-2012
>> * GM/T 0003.3-2012
>> * GM/T 0003.4-2012
>> * GM/T 0003.5-2012
>> * GM/T 0015-2012
>> * GM/T 0009-2012
>>
>> IETF: https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
>> oscca: http://www.oscca.gov.cn/sca/xxgk/2010-12/17/content_1002386.shtml
>> scctc: http://www.gmbz.org.cn/main/bzlb.html
>>
>> These patchs add the OID object identifier defined by OSCCA. The
>> x509 certificate supports sm2-with-sm3 type certificate parsing
>> and verification.
>>
>> The sm2 algorithm is based on libgcrypt's mpi implementation, and has
>> made some additions to the kernel's original mpi library, and added the
>> implementation of ec to better support elliptic curve-like algorithms.
>>
>> sm2 has good support in both openssl and gnupg projects, and sm3 and sm4
>> of the OSCCA algorithm family have also been implemented in the kernel.
>>
>> Among them, sm3 and sm4 have been well implemented in the kernel.
>> This group of patches has newly introduced sm2. In order to implement
>> sm2 more perfectly, I expanded the mpi library and introduced the
>> ec implementation of the mpi library as the basic algorithm. Compared
>> to the kernel's crypto/ecc.c, the implementation of mpi/ec.c is more
>> complete and elegant, sm2 is implemented based on these algorithms.
> 
> Does it use constant-time algorithms?
> 
> Thanks,
> 

Sorry for not responding in time.
This algorithm is constant-time algorithms, and this logic is 
implemented in ec_mul_point().
Will you consider implementing ecrdsa based on the mpi ec algorithm in 
the future?

Thanks and best,
Tianjia
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
