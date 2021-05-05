Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 429C137357F
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 09:21:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBE84C5718D;
	Wed,  5 May 2021 07:21:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FCF8C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 May 2021 07:21:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1457Fit7014805; Wed, 5 May 2021 09:21:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8/yAuhmraI0tqlt6iAwgkJ+3l0e6yI+x8bwBJnx/s2Q=;
 b=k+vCqSIoxOP8tNQSEvYXY0LpqoCBvF1AlYEeNYBPgjZt5bVejv1yfUUF7pMikiFHcEns
 PuyOVqZmuqEnRRFk1Wk6YwNW1dkRabc9DWrwN8JKzxK3sHBoXMEnmCbos4mnP2tveH7g
 sBgjpqhZYswcn0iKcZMjkWekUwGwBn12t+yzxye/8GCIakEXQlFEtUEUxT9V1Pnj9xSJ
 rUtHBWni74fr1C5MkvggwCyUEdf4LS4ovUw0GuTbq3AsluwZVrq6wUi6QuSPnh1WEUnK
 AXWSZodN7Z9EZhBD4MyCPsnvckywQYDTX0RNBpGHk4yLMLGk75Kh91NZ0hOEg5J/nY4E og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38be9ajddu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 09:21:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EA3110002A;
 Wed,  5 May 2021 09:21:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F50020F46C;
 Wed,  5 May 2021 09:21:17 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 5 May
 2021 09:21:16 +0200
To: Mark Brown <broonie@kernel.org>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
 <20210426162610.erpt5ubeddx7paeq@ti.com>
 <20210426165118.GH4590@sirena.org.uk>
 <28acedfd-6cd5-a8ad-0182-e61c3c30c27d@foss.st.com>
 <20210430155623.GD5981@sirena.org.uk>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <f472d75d-7549-191b-1b42-4e3921280c49@foss.st.com>
Date: Wed, 5 May 2021 09:21:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210430155623.GD5981@sirena.org.uk>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_02:2021-05-05,
 2021-05-05 signatures=0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] spi: spi-mem: add automatic poll
	status functions
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

Hi Mark

On 4/30/21 5:56 PM, Mark Brown wrote:
> On Fri, Apr 30, 2021 at 04:22:34PM +0200, Patrice CHOTARD wrote:
>> On 4/26/21 6:51 PM, Mark Brown wrote:
>>> On Mon, Apr 26, 2021 at 09:56:12PM +0530, Pratyush Yadav wrote:
> 
>>> Is it possible there's some situation where you're waiting for some bits
>>> to clear as well?
> 
>> Yes, we are waiting STATUS_BUSY bit to be cleared, see patch 2 which is making 
>> usage of this API.
> 
> Then the inverse question applies - is there no circumstance where we
> might be waiting for a bit to be set?
> 
>>> We already have the core handling other timeouts.  We don't pass around
>>> completions but rather have an API function that the driver has to call
>>> when the operation completes, a similar pattern might work here.  Part
> 
>> So, if i correctly understood, you make allusion to what is already done
>> in SPI core framework with spi_finalize_current_transfer() right ?
> 
> Yes, and _current_message().
> 
>>> of the thing with those APIs which I'm missing here is that this will
>>> just return -EOPNOTSUPP if the driver can't do the delay in hardware, I
>>> think it would be cleaner if this API were similar and the core dealt
>>> with doing the delay/poll on the CPU.  That way the users don't need to
>>> repeat the handling for the offload/non-offload cases.
> 
>> Sorry, i didn't catch what you mean here. In PATCH 2, that's the case,
>> if spi_mem_poll_status() is not supported, the core is dealing with 
>> the delay/poll on the CPU in spinand_wait().
> 
> That's in the NAND core, not in spi-mem.  Any other users of spi-mem
> will also need to open code stuff.
> 

Ok, got it, i will transfer what is done in spi_nand_wait() into spi_mem_poll_status() 
in order to get the full feature in spi-mem which will profit to all spi-mem users as requested.

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
