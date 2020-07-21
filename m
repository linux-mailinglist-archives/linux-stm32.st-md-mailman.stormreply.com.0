Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5751F227B06
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 10:49:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15567C36B2A;
	Tue, 21 Jul 2020 08:49:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00E51C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 08:49:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L8lWgT029098; Tue, 21 Jul 2020 10:49:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=/AMDsnmMg6e/KnTUQmRcMKb3eBNXg2kCGXVP0hShHgw=;
 b=g4DJs4ieF2zv3OGN1dEjUEqs22wd8iCWYk7iYbc1UvKXGxAfALWM6GEDbFmwnJr6IhTT
 l6aO6UzrvXDvF+oCQGrb3qGnU07f+GQH/kZ/xNrV/D3FHhss/eeJ4rbCyPOSfSAPeRFu
 F/9kihhF2d9ROkkYRxuvRyKwkEXWz0ugqacIrrCQcoMg67rUGC3BWO9KuPy0C3yk0Bqj
 VYYSqdr7KuMNFErcDB6PslyyNCFweARRXF7ByYUfHVjRnYfSItDp0MwXDVihjoxu7+WJ
 HvKIyzgownPsVXvMhCDIVydtfI+gOkfJOCShlU9l9NJ7WkCdGRkZBSeaadvTn51o2jIx qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsfpcs82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 10:49:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 110D110002A;
 Tue, 21 Jul 2020 10:49:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E28822A7526;
 Tue, 21 Jul 2020 10:49:18 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Jul
 2020 10:49:18 +0200
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>, <linux@armlinux.org.uk>, 
 <mcoquelin.stm32@gmail.com>, <herbert@gondor.apana.org.au>,
 <davem@davemloft.net>, <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>
References: <20200719094948.57487-1-grandmaster@al2klimov.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <43c11c7a-269e-cc41-6934-0d2e0dec3226@st.com>
Date: Tue, 21 Jul 2020 10:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200719094948.57487-1-grandmaster@al2klimov.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
Subject: Re: [Linux-stm32] [PATCH for v5.9] ARM: STM32: Replace HTTP links
	with HTTPS ones
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

Hi Alexander

On 7/19/20 11:49 AM, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>    If not .svg:
>      For each line:
>        If doesn't contain `\bxmlns\b`:
>          For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>              If both the HTTP and HTTPS versions
>              return 200 OK and serve the same content:
>                Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

This patch touch 2 different subsystems. Can you please split it ?

Regards
Alex


> ---
>   Continuing my work started at 93431e0607e5.
>   See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>   (Actually letting a shell for loop submit all this stuff for me.)
> 
>   If there are any URLs to be removed completely
>   or at least not (just) HTTPSified:
>   Just clearly say so and I'll *undo my change*.
>   See also: https://lkml.org/lkml/2020/6/27/64
> 
>   If there are any valid, but yet not changed URLs:
>   See: https://lkml.org/lkml/2020/6/26/837
> 
>   If you apply the patch, please let me know.
> 
>   Sorry again to all maintainers who complained about subject lines.
>   Now I realized that you want an actually perfect prefixes,
>   not just subsystem ones.
>   I tried my best...
>   And yes, *I could* (at least half-)automate it.
>   Impossible is nothing! :)
> 
> 
>   arch/arm/mach-stm32/Makefile.boot | 2 +-
>   crypto/testmgr.h                  | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32/Makefile.boot b/arch/arm/mach-stm32/Makefile.boot
> index cec195d4fcba..5dde7328a7a9 100644
> --- a/arch/arm/mach-stm32/Makefile.boot
> +++ b/arch/arm/mach-stm32/Makefile.boot
> @@ -1,4 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   # Empty file waiting for deletion once Makefile.boot isn't needed any more.
>   # Patch waits for application at
> -# http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7889/1 .
> +# https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7889/1 .
> diff --git a/crypto/testmgr.h b/crypto/testmgr.h
> index d29983908c38..cdcf0d2fe40d 100644
> --- a/crypto/testmgr.h
> +++ b/crypto/testmgr.h
> @@ -16231,7 +16231,7 @@ static const struct cipher_testvec aes_lrw_tv_template[] = {
>   			  "\xe9\x5d\x48\x92\x54\x63\x4e\xb8",
>   		.len	= 48,
>   	}, {
> -/* http://www.mail-archive.com/stds-p1619@listserv.ieee.org/msg00173.html */
> +/* https://www.mail-archive.com/stds-p1619@listserv.ieee.org/msg00173.html */
>   		.key    = "\xf8\xd4\x76\xff\xd6\x46\xee\x6c"
>   			  "\x23\x84\xcb\x1c\x77\xd6\x19\x5d"
>   			  "\xfe\xf1\xa9\xf3\x7b\xbc\x8d\x21"
> @@ -21096,7 +21096,7 @@ static const struct aead_testvec aegis128_tv_template[] = {
>   
>   /*
>    * All key wrapping test vectors taken from
> - * http://csrc.nist.gov/groups/STM/cavp/documents/mac/kwtestvectors.zip
> + * https://csrc.nist.gov/groups/STM/cavp/documents/mac/kwtestvectors.zip
>    *
>    * Note: as documented in keywrap.c, the ivout for encryption is the first
>    * semiblock of the ciphertext from the test vector. For decryption, iv is
> @@ -22825,7 +22825,7 @@ static const struct cipher_testvec xeta_tv_template[] = {
>    * FCrypt test vectors
>    */
>   static const struct cipher_testvec fcrypt_pcbc_tv_template[] = {
> -	{ /* http://www.openafs.org/pipermail/openafs-devel/2000-December/005320.html */
> +	{ /* https://www.openafs.org/pipermail/openafs-devel/2000-December/005320.html */
>   		.key	= "\x00\x00\x00\x00\x00\x00\x00\x00",
>   		.klen	= 8,
>   		.iv	= "\x00\x00\x00\x00\x00\x00\x00\x00",
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
