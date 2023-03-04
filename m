Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 376076AB73B
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 08:48:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF307C6B445;
	Mon,  6 Mar 2023 07:48:37 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D44B1C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Mar 2023 05:59:21 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id x3so18308692edb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Mar 2023 21:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cZdOR2mQrM2Yh/ZdXBDU9hVL0HlZsZVueh/CEeqYueU=;
 b=Spc5p3ovs3CEvWjvB15Lsxi3xGjMUIlNSYNFAcggChHEqyh1XQIV3ghzRysFCQdwot
 B+Pzk25ozrx9jxO/cugIqFD/r06/RjYzQnBpUsHfl/0KYoxab8FIKN/6rnu8co2Z7lxk
 Mz/CVbIsMog2abpNbYK7pFe96zz3t3Rm2GralvuU2HiegQXFXYRGe79tiCnlqDK3Rrl6
 8VS8m3lEou653ypRcub4hORgngyVE/4CfwaI/6Ymv9PPP20xwlEC+gP0A5TBq1L9JjQx
 WqrbysUxMMTh2VK+L+GDogxIkZBJXxBrm5+58547IY4AFuOrd0rJYXORJ4HKz5lJfuqe
 f6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cZdOR2mQrM2Yh/ZdXBDU9hVL0HlZsZVueh/CEeqYueU=;
 b=urZkIYPJYbbvSXLtHUDuBPPYB6+5Dz6XSRK0Av3h9YOaeWriD5h92n5LuDhhUPaN+Y
 PCADEe+OcK8wCS8aSla7oKCdAy359gpfze5rht9uPiiOuWGSAWn4iHb6LjfC7KxFzPC3
 OlVXBBSjPLgjgx74HylfMsyAvQsZ2GYxIknf75w8X6UIZ6aETRWc23TPgjrAozdaIstu
 LDIqZVUqboPYgXe6DbNwWl6O2BKzM+7YAS9EDwFrhdllkq1SVFhldUL+hW4HuF2u/+E8
 ebECHFdunUzfHdWl08n1AP65LhesJR4w9FPxuHP79XMaD+Gzro1QF33Rlmj3N124+zFO
 B5og==
X-Gm-Message-State: AO0yUKX/tfDsinudZqIA/BKPwEt2XyYkF7SFMP6VofQ0sgl3ABiXgndU
 M76Ib+aTUlnJs8iY8jKNxFM=
X-Google-Smtp-Source: AK7set8UXUFWR2ui/AgXkHFAvLBJPzNPX6LhnlTox4YZzu7Cyy9qpwNmgZWB6VYga3nqRk1K4I90aA==
X-Received: by 2002:a05:6402:510:b0:4bb:83fa:5e83 with SMTP id
 m16-20020a056402051000b004bb83fa5e83mr4125414edv.12.1677909561087; 
 Fri, 03 Mar 2023 21:59:21 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a50c40c000000b004bb810e0b87sm2030841edf.39.2023.03.03.21.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 21:59:20 -0800 (PST)
Message-ID: <5bd48f09-f7ba-e5b3-60ba-49ecd1493e36@gmail.com>
Date: Sat, 4 Mar 2023 07:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Sergiu Moga <sergiu.moga@microchip.com>, pratyush@kernel.org,
 michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
 chin-ting_kuo@aspeedtech.com, clg@kaod.org, joel@jms.id.au, andrew@aj.id.au,
 kdasu.kdev@gmail.com, fancer.lancer@gmail.com, han.xu@nxp.com,
 john.garry@huawei.com, matthias.bgg@gmail.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, haibo.chen@nxp.com,
 yogeshgaur.83@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, michal.simek@xilinx.com, tkuw584924@gmail.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, tudor.ambarus@linaro.org
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
From: Tudor Ambarus <tudor.ambarus@gmail.com>
Content-Language: en-US
In-Reply-To: <20220911174551.653599-1-sergiu.moga@microchip.com>
X-Mailman-Approved-At: Mon, 06 Mar 2023 07:48:36 +0000
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Hi,

Sergiu changed his interests, I'm going to send a new version of this
patch. We really need the conversion in SPI NOR as there are flashes
that require a number of dummy cycles that is not multiple of 8.

Cheers,
ta
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
