Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 576276B034C
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 10:44:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0997BC69067;
	Wed,  8 Mar 2023 09:44:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1396C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Mar 2023 09:04:59 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so742429wms.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Mar 2023 01:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678266299;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kA8QaXHaQv2zTvTrF1F5tUB/9uaPE/un/rBzeew06Qk=;
 b=q89OEdbdQ8/5wEe6qFgIWzh3vd6s4xaRgf89QS/3X4cOBtJctnoIMQxxEkA1D1BiHI
 0rPMGxYv1A8HM3xCu5rwnUu1Ej1pGr2yhOovW1vpKhfjmrhnTXnSrnkTPEb2jQaLNjCu
 gjPvDpbonBmkmrER6l1D5vxT9FfWi6H61jHjcQqvRP49uhXANQfBL/nTJmVo9mW1K9+n
 yBrlg1+msaFsX+hZi1yQGq1ALarkY7lxAgSKSy51rXIuUTDYzdRIQ4Td+1aCJOW/HPYu
 E7T1Lo6gbBZA2NMhBQNGnjngG9/h7JB3LioUT5eLeFK7zU7ue/RKGy/ITsQAn5o7NDuO
 SNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678266299;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kA8QaXHaQv2zTvTrF1F5tUB/9uaPE/un/rBzeew06Qk=;
 b=p78KQPLQcDXoXJI7JeQiQotUTDZ5LFjnfEbWx+wUF8kFe6MfKdsR0T3ye3esH6VtN6
 q1p3tO8ECfBm5MRri562jsaqMcS8nP1bVnYzVnXhWSQEq18noqjJqXpCF7D0Vd3l/0f2
 tUCHI/+POARnJe9px0P3MszuwZqM/WUjcRml/3JfxDlQS7YBzXMfZpy6UCsSSERA6YW4
 a45lD8Dom1Mx0/HTpbOXuktl/fys03Dyp7HMTmoiS10lPF40FAVaP5GG7kGJ3HJqlGX3
 CoXgd0PEDeVhdgrE1HePvNPIqjXiYHsCMU4U4I3H0RYmwicVU+TaIYYn992fXIIsaexR
 h2Ng==
X-Gm-Message-State: AO0yUKWv/2NN/jtTNFtBn7kqEL5xQKyQxue2BIAECDoKffaYwoq3EPEg
 Sjnzm/Zfod+22lkV7Fid142l9w==
X-Google-Smtp-Source: AK7set/L9zFk+/3muQ4XCE6qXO8h4slPi9HcknR81cfBA77IySEK46FikrIsHFywPlVNMXfACef86g==
X-Received: by 2002:a05:600c:1907:b0:3eb:29fe:7b9e with SMTP id
 j7-20020a05600c190700b003eb29fe7b9emr14295268wmq.17.1678266299463; 
 Wed, 08 Mar 2023 01:04:59 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.78])
 by smtp.gmail.com with ESMTPSA id
 v38-20020a05600c4da600b003eb68bb61c8sm14645299wmp.3.2023.03.08.01.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 01:04:58 -0800 (PST)
Message-ID: <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
Date: Wed, 8 Mar 2023 09:04:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Serge Semin <fancer.lancer@gmail.com>, Sergiu.Moga@microchip.com,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20220926172454.kbpzck7med5bopre@mobilestation>
X-Mailman-Approved-At: Wed, 08 Mar 2023 09:44:24 +0000
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com,
 linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 tmaimon77@gmail.com, benjaminfair@google.com, kdasu.kdev@gmail.com,
 richard@nod.at, chin-ting_kuo@aspeedtech.com, michal.simek@xilinx.com,
 haibo.chen@nxp.com, openbmc@lists.ozlabs.org, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 linux-rockchip@lists.infradead.org, avifishman70@gmail.com,
 john.garry@huawei.com, linux-mediatek@lists.infradead.org, clg@kaod.org,
 matthias.bgg@gmail.com, han.xu@nxp.com, linux-arm-kernel@lists.infradead.org,
 andrew@aj.id.au, venture@google.com, heiko@sntech.de,
 Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org,
 yogeshgaur.83@gmail.com, mcoquelin.stm32@gmail.com,
 Claudiu.Beznea@microchip.com
Subject: Re: [Linux-stm32] [PATCH] spi: Replace `dummy.nbytes` with
	`dummy.ncycles`
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

Hi, Sarge,

On 9/26/22 18:24, Serge Semin wrote:
>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>> index f2c64006f8d7..cc8ca824f912 100644
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>> @@ -88,7 +88,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>>>>        if (op->addr.nbytes)
>>>>                op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>>>
>>>
>>>
>>>> -     if (op->dummy.nbytes)
>>>> +     if (op->dummy.ncycles)
>>>>                op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>>>
>>>>        if (op->data.nbytes)
>>>> @@ -106,9 +106,6 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>>>>                op->dummy.dtr = true;
>>>>                op->data.dtr = true;
>>>>
>>>> -             /* 2 bytes per clock cycle in DTR mode. */
>>>> -             op->dummy.nbytes *= 2;
>>>> -
>>>>                ext = spi_nor_get_cmd_ext(nor, op);
>>>>                op->cmd.opcode = (op->cmd.opcode << 8) | ext;
>>>>                op->cmd.nbytes = 2;
>>>> @@ -207,10 +204,7 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
>>>>
>>>>        spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
>>>>
>>>> -     /* convert the dummy cycles to the number of bytes */
>>>> -     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>>>> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
>>>> -             op.dummy.nbytes *= 2;
>>>> +     op.dummy.ncycles = nor->read_dummy;
>>> So according to this modification and what is done in the rest of the
>>> patch, the dummy part of the SPI-mem operations now contains the number
>>> of cycles only. Am I right to think that it means a number of dummy
>>> clock oscillations? (Judging from what I've seen in the HW-manuals of
>>> the SPI NOR memory devices most likely I am...)
>>
>>
>> Yes, you are correct.
>>

I confirm.

>>
>>> If so the "ncycles" field
>>> is now free from the "data" semantic. Then what is the meaning of the
>>> "buswidth and "dtr" fields in the spi_mem_op.dummy field?
>>>
>>
>> It is still meaningful as it is used for the conversion by some drivers 
>> to nbytes and I do not see how it goes out of the specification in any 
>> way. So, at least for now, I do not see any reason to remove these fields.
> I do see the way these fields are used in the SPI-mem drivers. I was
> wondering what do these bits mean in the framework of the SPI-mem
> core? AFAICS from the specification the dummy cycles are irrelevant to
> the data bus state. It says "the master tri-states the bus during
> 'dummy' cycles." If so I don't see a reason to have the DTR and
> buswidth fields in the spi_mem_op structure anymore. The number of
> cycles could be calculated right on the initialization stage based on
> the SPI NOR/NAND requirements.
> 
> @Mark, @Tudor, @Pratyush, what do you think?
> 

In an ideal world, where both the controller and the device talk about
dummy number of cycles, I would agree with you, buswidth and dtr should
not be relevant for the number of dummy cycles. But it seems that there
are old controllers (e.g. spi-hisi-sfc-v3xx.c, spi-mt65xx.c, spi-mxic.c)
that support buswidths > 1 and work only with dummy nbytes, they are not
capable of specifying a smaller granularity (ncycles). Thus the older
controllers would have to convert the dummy ncycles to dummy nbytes.
Since mixed transfer modes are a thing (see jesd251, it talks about
4S-4D-4D), where single transfer mode (S) can be mixed with double
transfer mode (D) for a command, the controller would have to guess the
buswidth and dtr of the dummy. Shall they replicate the buswidth and dtr
of the address or of the data? There's no rule for that. So we're forced
to keep the dummy.{dtr, buswidth} fields by the old controllers that
don't understand dummy ncycles.

I'm going to send a v2 of this patch, I'll add you in To. Thanks for
taking the time to review this patch!

Cheers,
ta
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
