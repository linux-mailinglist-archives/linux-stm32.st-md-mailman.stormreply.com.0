Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA76AE17C
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Mar 2023 14:56:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F17E4C65E73;
	Tue,  7 Mar 2023 13:56:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4246DC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Mar 2023 13:56:00 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327ClLYn007111; Tue, 7 Mar 2023 14:55:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=yLH8kRBL+xgt5uffNynZZbuGSAhtYDNWHHu3XGprTUc=;
 b=OhYSUGzK3W8Akvv4Sg72S70p5RDqVxgEWp/25j9vXehUjO1hI0b8tP0F6q4bkCa7NdC1
 g9I1wkcCPejiMuOH6OLiDg7pkzv97rkoUkGbbnHUI/tm0K02RLb2Hc943R7+URdoPM7k
 eA+wrS77jNVk2f89cQsmHYve63BkK2+W6xny07K+rFKr9kb9eu+KiuqTui+D/UWtqqau
 o02Vv9QeoZjnctUJp1WDDO0eeskyP0F7u0pGzpNg9/jgjp0LbfrEP6k9EkvqovfAGHgL
 S42j0LCbdvafcnYmktXYWk3YeZMVipcQsYVpaCwfGTNbbgkut/QGzv2Knu3B1IAB7c8L cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3p416026yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 14:55:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9168110002A;
 Tue,  7 Mar 2023 14:55:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 541BB21D3B0;
 Tue,  7 Mar 2023 14:55:36 +0100 (CET)
Received: from LMECWL1288 (10.201.28.198) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 7 Mar
 2023 14:55:35 +0100
From: <lionel.debieve@foss.st.com>
To: 'Herbert Xu' <herbert@gondor.apana.org.au>, 'Linus Walleij'
 <linus.walleij@linaro.org>
References: <Y/yIbPBVCPx9K/0s@gondor.apana.org.au>
 <CACRpkdZC4z2Xng4=k94rmM=AFzNzTdXkvtkArMnK7afouz=7VA@mail.gmail.com>
 <Y/3FYZJeLE7DVPBf@gondor.apana.org.au> <Y/3IA4OjmUmjMgh1@gondor.apana.org.au>
 <Y/3N6zFOZeehJQ/p@gondor.apana.org.au>
 <CACRpkdZ3rCsOWqooNkPL6m7vZ2Z2Frh2sdxruKhrS0t3QHcSKw@mail.gmail.com>
 <Y/6sCC2nH0FcD6kJ@gondor.apana.org.au>
 <CACRpkdYN-SDfxXKLt3HWGVkWb3V1rABwvWuytwDrzfTqm81fNA@mail.gmail.com>
 <ZAA8doNUjYmTRScB@gondor.apana.org.au> <ZAMQjOdi8GfqDUQI@gondor.apana.org.au>
 <ZAVu/XHbL9IR5D3h@gondor.apana.org.au>
In-Reply-To: <ZAVu/XHbL9IR5D3h@gondor.apana.org.au>
Date: Tue, 7 Mar 2023 14:55:29 +0100
Message-ID: <009901d950fc$7e0f68a0$7a2e39e0$@foss.st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQM1VOWhy180cDq7iroA9b7idoF8/ALVghyWASjSKLcBK0rUMwI+YZijAmT0ufgCFKWGPgLboMstAYC561sCOBC6OgG+LZC+q5VZXhA=
Content-Language: en-us
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2023-03-07T13:55:29Z;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=4d2247e7-9cb5-451b-91d6-e6b3793df82d;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
X-Originating-IP: [10.201.28.198]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_08,2023-03-07_01,2023-02-09_01
Cc: 'Li kunyu' <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 davem@davemloft.net, linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v6 PATCH 0/7] crypto: stm32 - Save and restore
	between each request
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

Hi All,

Sorry for the very (very very) late response.
Thanks for highlighting the issue. I'm worried about the issue seen that
we've fixed at our downstream level.
We (ST) are currently working on upstreaming the new peripheral update for
STM32MP13 that fixed the old issue seen (such as CSR register numbers), and
so on....

The issue about the context management relies on a question I've get time to
ask you. There is no internal test purpose (using test manager) that really
show the need of a hash update that needs to be "self-content". We've seen
the issue using openssl use cases that is not using import/export.
I'm wondering to understand the real need of import/export in the framework
if the request must be safe itself?

From hardware point of view, it is a penalty to wait for completion to save
the context after each request. I understand the need of multiple hash
request in // but I was wondering that it can be managed by the
import/export, but it seems I was wrong. The penalty of the context saving
will impact all hash requests where, in a runtime context is probably not
the most important use case.
I'm looking deeper to check with the DMA use case and there is some new HW
restriction on the coming hash version that doesn't allow the read of CSR
register at some times.

BR,
Lionel


ST Restricted

-----Original Message-----
From: Herbert Xu <herbert@gondor.apana.org.au> 
Sent: Monday, March 6, 2023 5:42 AM
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lionel Debieve <lionel.debieve@foss.st.com>; Li kunyu
<kunyu@nfschina.com>; davem@davemloft.net;
linux-arm-kernel@lists.infradead.org; linux-crypto@vger.kernel.org;
linux-kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
mcoquelin.stm32@gmail.com
Subject: [v6 PATCH 0/7] crypto: stm32 - Save and restore between each
request

On Sat, Mar 04, 2023 at 05:34:04PM +0800, Herbert Xu wrote:
> 
> I've split the patch up into smaller chunks for easier testing.

v6 fixes a bug in the finup patch that caused the new data to be discarded
instead of hashed.

This patch series fixes the import/export functions in the stm32 driver.  As
usual, a failure in import/export indicates a general bug in the hash driver
that may break as soon as two concurrent users show up and hash at the same
time using any method other than digest or init+finup.

Cheers,
--
Email: Herbert Xu <herbert@gondor.apana.org.au> Home Page:
http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
