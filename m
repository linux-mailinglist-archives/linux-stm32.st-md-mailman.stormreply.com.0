Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2699A449829
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Nov 2021 16:26:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E85BBC5EC4F;
	Mon,  8 Nov 2021 15:26:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 685A4C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Oct 2021 15:26:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TDDFCP001362; 
 Fri, 29 Oct 2021 17:21:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : in-reply-to : message-id : references : mime-version :
 content-type; s=selector1;
 bh=tlJPjaHr3bopdMN69Mr2F3ZcC3w0YkJhjYgUllbtTzk=;
 b=pPsh8uZN+ePssNyktStyh7o0Dg/jk9WMjY2jihqFmYkCghCj1EQOXga0aNjz3D3DpUEL
 Mw74NxKPI/F8330np5Ii9uggT+7oyLNubEwC3gxK7ZHh7CpSZ0aA3rt4meILPcRQEdVN
 ip5BTO/7rS03ZyzdYOFuYsTEWRL/qyL0BRdveISBgj4N9DRYbPU229QqV5fNF/qspnNr
 xCUHSOlhP50GVDd6PtxZ1Rr6yyKRdCbYMcSEz+vXjpLNETaTMUbV25vq/KQz3Zl9tFj+
 eVuTBMm5Ho5NDupycvI8/Bz6LwDzgS1KO+7RZggca6Lgw9JBhgdKqVrv2p+N20Aoa/aV zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3c07xgm36t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Oct 2021 17:21:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4DD1C10002A;
 Fri, 29 Oct 2021 17:21:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14B87240741;
 Fri, 29 Oct 2021 17:21:36 +0200 (CEST)
Received: from gnbcxd0088.gnb.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 29 Oct
 2021 17:21:35 +0200
Date: Fri, 29 Oct 2021 17:21:24 +0200
From: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
X-X-Sender: toromano@gnbcxd0088.gnb.st.com
To: Marek Vasut <marex@denx.de>
In-Reply-To: <1ec60d9c-1ab4-8a92-1c6d-8093232ca039@denx.de>
Message-ID: <alpine.DEB.2.21.2110291708040.20378@gnbcxd0088.gnb.st.com>
References: <20211029135454.4383-1-nicolas.toromanoff@foss.st.com>
 <20211029135454.4383-5-nicolas.toromanoff@foss.st.com>
 <1ec60d9c-1ab4-8a92-1c6d-8093232ca039@denx.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-29_04,2021-10-29_01,2020-04-07_01
X-Mailman-Approved-At: Mon, 08 Nov 2021 15:26:11 +0000
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/8] crypto: stm32/cryp - fix race
	condition
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

On Fri, 29 Oct 2021, Marek Vasut wrote:

> On 10/29/21 3:54 PM, Nicolas Toromanoff wrote:
>> Erase key before finalizing request.
>> Fixes: 9e054ec21ef8 ("crypto: stm32 - Support for STM32 CRYP crypto 
>> module")
>
> Can you be a bit more specific in your commit messages ? That applies to the 
> entire patchset. It is absolutely impossible to tell what race is fixed here 
> or why it is fixed by exactly this change. This applies to the entire series.

I'll send a v2 with better commit messages.

for this specific patch:
We reset the saved key before the crypto_finalize_*() call. Otherwise a 
still pending crypto action could be ran with a wrong key = {0};

> And while I am at it, does the CRYP finally pass at least the most basic 
> kernel boot time crypto tests or does running those still overwrite kernel 
> memory and/or completely crash or lock up the machine ?

All extra tests (finally) pass.

With a kernel config :
   # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
   CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
   CONFIG_CRYPTO_DEV_STM32_CRYP=m

while(true) do ; modprobe stm32-cryp && modprobe -r stm32-cryp ; done

ran a whole day without a crash, nor a detected error.

-- 
Nicolas.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
