Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0066B1E5E
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 09:38:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 464C5C6A60C;
	Thu,  9 Mar 2023 08:38:08 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00E3BC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 08:38:06 +0000 (UTC)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 06553D5A;
 Thu,  9 Mar 2023 09:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1678351086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y41tMb7AS1Jh/KPkjkW3IKsx9az487kv51tekdAE29Q=;
 b=ubF2lj5lvtCp3H7KLxdAsbRS49b+6sBRLrUXT9KQPAgSrFQzeRzDS2fkDLPSfxRKxt25Py
 hhzH14kjrTJ0eUyJPpIVEPLzilgqwrH77iFF2rczY3X2G6Whjsyv75W5o2zLkv4xQr0gS3
 6/DwPS9d5+CcLnmWTtd0b2D4aR8vAOPXcJSIhsTen4XwVezu/C9iULPkPkJ8scOVW8Rqwi
 XgfaTBwuaDA9OgZLRgWwM3HjL8p90rrGeieoSN7ZzRIM0/TCOY48OR3QUrjt4XEXy+a5Nk
 4LKbiDSTBEEp1YIlprtkvdq1LtX0K44TNRpBr6xjevQvrOhW6/dMHqZlCotLiw==
MIME-Version: 1.0
Date: Thu, 09 Mar 2023 09:38:05 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
X-Sender: michael@walle.cc
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

> In an ideal world, where both the controller and the device talk about
> dummy number of cycles, I would agree with you, buswidth and dtr should
> not be relevant for the number of dummy cycles. But it seems that there
> are old controllers (e.g. spi-hisi-sfc-v3xx.c, spi-mt65xx.c, 
> spi-mxic.c)
> that support buswidths > 1 and work only with dummy nbytes, they are 
> not
> capable of specifying a smaller granularity (ncycles). Thus the older
> controllers would have to convert the dummy ncycles to dummy nbytes.
> Since mixed transfer modes are a thing (see jesd251, it talks about
> 4S-4D-4D), where single transfer mode (S) can be mixed with double
> transfer mode (D) for a command, the controller would have to guess the
> buswidth and dtr of the dummy. Shall they replicate the buswidth and 
> dtr
> of the address or of the data? There's no rule for that.

But in the end that doesn't matter because they are just dummy clock
cycles and the mode will only affect the data/address/command. 
Therefore,
the controller is free to choose the mode that suits it best.

But that begs the question, is ncycles in regard to DTR or SDR? That is,
are you counting just one type of edges or both the falling and rising
edges. The smallest granularity would be ncycles in regard of DTR. To 
me,
it's not obvious what the SEMPER Nano Flash [1] uses. I'd say we choose
the smallest granularty in spi-mem to be future proof and maybe provide
some spi-mem helper to help setting the cycles for SDR/DTR. As an 
example,
if you want to wait 4 cycles in SDR you'd have ncycles=8 in spi-mem.

So you won't need the mode nor the dtr property.

-michael

[1] 
https://www.infineon.com/dgdl/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c80027ecd0180740c5a46707a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
