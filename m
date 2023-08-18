Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C03F784757
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:26:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF699C7128E;
	Tue, 22 Aug 2023 16:26:15 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFF1AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 10:19:56 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4fe8c16c1b4so1043696e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692353996; x=1692958796;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pb0pctZb8QtUfFQr+rA7AG4CHO5Qtd4k3pKgwlh5qck=;
 b=Pa05IZmzxUof/JTX5sYgmbso85hDS8hYULdKoqRJ9pa7oEJj3KKPJvlp8aKsu7BkWe
 7LZCZAAJkdeFzE8FevvQGusqrJtgmxn63kAVxmqmD8CfifcwAxo4VH35MPrbg9GbhWMM
 4Pw0oOpcSQ1TqydswzrxSNGG6n0QblyYXklq1LMn07Tim5a8r7oIQu4TBSHlU18VTiTy
 sBll8RKZRHt1X3nHO72Gp4owtRF1Gac+qGE0ZG+H+wdJvjIc12gGSim0WTlF1kEbpD4M
 /2t9f30R9G0Ku/t4SGWRcIvvtXOz0qNl7O68eEhByuz5Q9l7b+4Asm6TdNGwsKlLpIQ7
 EULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692353996; x=1692958796;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pb0pctZb8QtUfFQr+rA7AG4CHO5Qtd4k3pKgwlh5qck=;
 b=D6otIqzwwjF/2IXSDRY0OXfJPLyM5VDM10TzpwATWnjAR/Z5VRPBhu7iswVJpnr6Zd
 lfLVLAr3Dzus48b742m+X7EMybyJxdTU5jFYlr3K4ZLQZLYNRpCs/OLRoG68B3VCbrPX
 21COa8lvkhD7Et3a9Q6H/UHHijHjkA0nmCNAq1aeU4gzH445XoeZZfcyC7/URshk5h7q
 uiFp/HustHmOHFhZSqpZ6rwqXvaaEDpHTlwUHcOdEL0qA7/XfGBUhWRcN9J+nBofWtwz
 RO0rBG6mw4REaAstgBiwk9mTck8NBs+ntHQr1Jouj9tcsTR5XZnkEgp9IASc0G2uWhvb
 Mw4w==
X-Gm-Message-State: AOJu0YxckhcW96cQ/MgYgrC72N+LVZiNntMJjyTu2Rp1vFt1SCTFJD5G
 IhvT1LOcCTg+vs8D3jXgbN3rUw==
X-Google-Smtp-Source: AGHT+IGRjpQiG6m5okW2Rjffn2dFFyB2X81OzXUKgZV+AmI+W2jGdx/QNJfEpqKmEPeD398d/xB9VQ==
X-Received: by 2002:a05:6512:3d08:b0:4ff:727e:9e67 with SMTP id
 d8-20020a0565123d0800b004ff727e9e67mr2032630lfv.40.1692353995812; 
 Fri, 18 Aug 2023 03:19:55 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.195])
 by smtp.gmail.com with ESMTPSA id
 k12-20020adfe3cc000000b0031ad5470f89sm2306468wrm.18.2023.08.18.03.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 03:19:55 -0700 (PDT)
Message-ID: <04f7f779-e92e-ec7a-994d-19e555e5c460@linaro.org>
Date: Fri, 18 Aug 2023 13:19:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Li Zetao <lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230818074642.308166-1-lizetao1@huawei.com>
 <20230818074642.308166-12-lizetao1@huawei.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230818074642.308166-12-lizetao1@huawei.com>
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: heiko@sntech.de, geert+renesas@glider.be, stefan@agner.ch,
 paul@crapouillou.net, linux-mtd@lists.infradead.org, jernej.skrabec@gmail.com,
 miquel.raynal@bootlin.com, jinpu.wang@ionos.com,
 linux-stm32@st-md-mailman.stormreply.com, vigneshr@ti.com, robh@kernel.org,
 samuel@sholland.org, richard@nod.at, christophe.leroy@csgroup.eu,
 wens@csie.org, u.kleine-koenig@pengutronix.de, linux-sunxi@lists.linux.dev,
 frank.li@vivo.com, martin.blumenstingl@googlemail.com,
 yangyingliang@huawei.com, vz@mleia.com, rogerq@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, philmd@linaro.org,
 dmitry.torokhov@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 mcoquelin.stm32@gmail.com, pratyush@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next v2 11/12] mtd: spi-nor: nxp-spifi:
 Use helper function devm_clk_get_enabled()
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

Just a reminder that for the owners of the driver that we'd like to move
all the SPI NOR controller drivers to drivers/spi and that until then
we'll no longer queue features for the controllers, but just fixes or
cosmetics patches like this one.

Cheers,
ta
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
