Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D75616B21B8
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 11:42:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 898ECC6A60C;
	Thu,  9 Mar 2023 10:42:41 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4990C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 10:42:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id l1so1353809wry.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 02:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678358559;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AXe5GLVgfCGpsOd/5Hq05tqMS28XNylXrDvLRZzzBYk=;
 b=nBr8nAd36m9PAaXhfYM/4OLaddFdsGqVE33IkJXe836CVY1mwrMaJ0z6xZBf96qoOI
 wHtu0PFtoKoyIzX+VPr+/fuzdwvpjf7WHn48t+f9zcU6YwYZWztwBuqGj7l0dwdbArgj
 9BdJxnMMnENBMqvEWmtN9PjHCRl7l2YExcQXYKyBbziRvao/CePqrt7EvP4HpVtto5VH
 QXi3YjTFTii/7goIfJr/GTdt68ovUVdmBOWoUiiz0gXw5VAu3RMa5w0b1gBU8OSuUqb4
 AEtkZbqFYD4W0WJ0d3IiA/1XF2s9Fl82n7X/PtjFCiLZRgjUzj9Q13c24vjHb1a/yAmF
 vQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678358559;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AXe5GLVgfCGpsOd/5Hq05tqMS28XNylXrDvLRZzzBYk=;
 b=pp9cvhIzfDpcAOAeUgAyvdKOvol3wzCyxhXczmT9aQ5V/UuTocwBBaDWBk2FRHraKy
 gMRT5qUHMMwuxSh/Na/AIFISTfB4CmILbAyX3J9BZj0r08vpTqgioMnnJ0IQfaLLz/3B
 Uiav+Tk6wQGoJuyfExZnUnYsOMH4f/3r2dBs3rQhYMvo4j8mVJgty0lWmTgtE/UmNnoh
 CrZGZ/Vu8SnssiIklL/IllciVLyHOUj6OzmW0wa+21s0wPk/gsZUjGnOhSIqwPOzL2oy
 ECAt969t+W9NxdhvuURbyrfdPvyP54Sbrnpy59CW7CfucKfG9FteUCt1mHxmIr/DcEW3
 onnA==
X-Gm-Message-State: AO0yUKVdYEAaUfBNuu6nUJAAkheKIQscL6F73/Ml9cIueL5jkmNvOXVi
 RD0JfUc+R3W1d1n1FiMgHCNGnw==
X-Google-Smtp-Source: AK7set9TX+g8GQa3ZvYm7K5IyQckLiVBKmzBF9eqRJS1rvlystpDX78yR8o1b1wUu4lOee+V+S+WMQ==
X-Received: by 2002:a05:6000:507:b0:2c5:4f2d:d9b4 with SMTP id
 a7-20020a056000050700b002c54f2dd9b4mr12687108wrf.58.1678358559301; 
 Thu, 09 Mar 2023 02:42:39 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d58ec000000b002c71b4d476asm17579951wrd.106.2023.03.09.02.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 02:42:38 -0800 (PST)
Message-ID: <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
Date: Thu, 9 Mar 2023 12:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Michael Walle <michael@walle.cc>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com,
 linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-spi@vger.kernel.org, michal.simek@xilinx.com, tmaimon77@gmail.com,
 benjaminfair@google.com, kdasu.kdev@gmail.com, richard@nod.at,
 chin-ting_kuo@aspeedtech.com, Sergiu.Moga@microchip.com, haibo.chen@nxp.com,
 openbmc@lists.ozlabs.org, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, yogeshgaur.83@gmail.com,
 linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>, john.garry@huawei.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com,
 linux-arm-kernel@lists.infradead.org, andrew@aj.id.au, venture@google.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
 Nicolas.Ferre@microchip.com, Serge Semin <fancer.lancer@gmail.com>,
 linux-kernel@vger.kernel.org, avifishman70@gmail.com,
 mcoquelin.stm32@gmail.com, Claudiu.Beznea@microchip.com,
 Pratyush Yadav <pratyush@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 09.03.2023 10:38, Michael Walle wrote:
>> In an ideal world, where both the controller and the device talk about
>> dummy number of cycles, I would agree with you, buswidth and dtr should
>> not be relevant for the number of dummy cycles. But it seems that there
>> are old controllers (e.g. spi-hisi-sfc-v3xx.c, spi-mt65xx.c, spi-mxic.c)
>> that support buswidths > 1 and work only with dummy nbytes, they are not
>> capable of specifying a smaller granularity (ncycles). Thus the older
>> controllers would have to convert the dummy ncycles to dummy nbytes.
>> Since mixed transfer modes are a thing (see jesd251, it talks about
>> 4S-4D-4D), where single transfer mode (S) can be mixed with double
>> transfer mode (D) for a command, the controller would have to guess the
>> buswidth and dtr of the dummy. Shall they replicate the buswidth and dtr
>> of the address or of the data? There's no rule for that.
> 
> But in the end that doesn't matter because they are just dummy clock
> cycles and the mode will only affect the data/address/command. Therefore,
> the controller is free to choose the mode that suits it best.
>  > But that begs the question, is ncycles in regard to DTR or SDR? That is,
> are you counting just one type of edges or both the falling and rising
> edges. The smallest granularity would be ncycles in regard of DTR. To me,
> it's not obvious what the SEMPER Nano Flash [1] uses. I'd say we choose
> the smallest granularty in spi-mem to be future proof and maybe provide
> some spi-mem helper to help setting the cycles for SDR/DTR. As an example,
> if you want to wait 4 cycles in SDR you'd have ncycles=8 in spi-mem.
> 

No, we can't invent our own measuring units. We have cycles and half 
cycles (regardless of the transfer mode used (STR, DTR)).

> So you won't need the mode nor the dtr property.
> 
> -michael
> 
> [1] 
> https://www.infineon.com/dgdl/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c80027ecd0180740c5a46707a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
