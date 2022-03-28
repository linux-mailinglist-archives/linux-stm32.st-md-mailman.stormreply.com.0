Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A7B4E92B7
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 12:47:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF2E9C5C842;
	Mon, 28 Mar 2022 10:47:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DEE1C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 10:47:49 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id i4so908186wrb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 03:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=S4BUcd6hJObrfpqKxdRcJRoKACX0pcH5PLnHV9ghRjU=;
 b=B9rhYXNFCJG8FVrCwa5K+POuffvNj9XzTQKCajpz8pCCAe58zDB/aU9DL5fqtqJWAI
 ky54WS/d9TWKJ7aQI2ZqzXMkcPHxKAbOnYADOVDTZRl4K4EZ6nKuXHMRMOUlTa3pZvcK
 Y8cetVauSkzbUxvUnWzmQRJ7x7hfdMpVLYHTE3/Ae2k2izID9wHS/jw5EaXtUzwHEHAR
 K1L5smUPkm9azb41ja7r0hy1dRp/X4/xrOgLDr5HfLY+yO2hJuHnUmcoNrEBPPoA5ZAp
 n8/SKRsojeJxYPxX0tjb6jEnopKhJ1kNHYloxuyu3SfO3NpPdbAhGWlCkOMUqOnXfwdd
 bWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=S4BUcd6hJObrfpqKxdRcJRoKACX0pcH5PLnHV9ghRjU=;
 b=TDYAmM/AzzocZwu1YGVU/wR/oPXwU90UhV3KenST42HunsqX0189KjHDm/v9GGypDD
 1ig2gkNGCo6KwrCMfDpn65zrNk1kcV9mOtC9zgLZ8VsXcNnJB8n+EckpQV09oJZ5igzH
 T9CiedgZMTazsc4qd297pXJ/SR7/Bf4EYpMVX6dfiTfBqF4r9T5vJejlp9DffS3Uaqh9
 RWbbb8ujRUWYnz9rP+BTRSW9c+LkEad+0CNQIvwltFx2DV099oh+p5V1fGu6wgWBr7Zv
 Bc4dAiPb1ZLlrjtTyMjYi8I6IFIDKdkanTGN8FsOYe68N96mJVou+hn1PcTIITpDhuT2
 6Bsw==
X-Gm-Message-State: AOAM532H5TAgMbMTFnofVKXA6A+Vjab/H8GaiOh6mJ66arYtf4mjGatq
 W8zZGFIUn5MaIkqZkPgzpKU=
X-Google-Smtp-Source: ABdhPJxpNsUPF4FVDfJw3TgkeBx1g5iROwUOuCmVKrZ2Kp8QiOuC95uyQZ19znx7Kf29FzrQ8qx3og==
X-Received: by 2002:a5d:404c:0:b0:203:ea4e:3c07 with SMTP id
 w12-20020a5d404c000000b00203ea4e3c07mr22646484wrp.597.1648464468913; 
 Mon, 28 Mar 2022 03:47:48 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0038cb924c3d7sm11665275wmq.45.2022.03.28.03.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 03:47:48 -0700 (PDT)
Message-ID: <c5eeca79-38b6-eb9f-1d78-1685aa1cca6c@gmail.com>
Date: Mon, 28 Mar 2022 12:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org,
 linux-unisoc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220328000915.15041-2-ansuelsmth@gmail.com>
Subject: Re: [Linux-stm32] [RFC PATCH 1/1] ARM/arm64: categorize dts in arm
 dir and fix dependency in arm64
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



On 28/03/2022 02:09, Ansuel Smith wrote:
> - Categorize every dts in arm directory in subdirectory
> - Fix Makefile to address for the arm subdirectory
> - Fix any arm64 dependency
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
[...]
>   arch/arm/boot/dts/mediatek/Makefile           |   14 +
>   .../boot/dts/{ => mediatek}/mt2701-evb.dts    |    0
>   .../boot/dts/{ => mediatek}/mt2701-pinfunc.h  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt2701.dtsi  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6323.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt6580-evbp1.dts  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6580.dtsi  |    0
>   .../mt6582-prestigio-pmt5008-3g.dts           |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6582.dtsi  |    0
>   .../dts/{ => mediatek}/mt6589-aquaris5.dts    |    0
>   .../{ => mediatek}/mt6589-fairphone-fp1.dts   |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6589.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt6592-evb.dts    |    0
>   arch/arm/boot/dts/{ => mediatek}/mt6592.dtsi  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7623.dtsi  |    0
>   .../dts/{ => mediatek}/mt7623a-rfb-emmc.dts   |    0
>   .../dts/{ => mediatek}/mt7623a-rfb-nand.dts   |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7623a.dtsi |    0
>   .../mt7623n-bananapi-bpi-r2.dts               |    0
>   .../dts/{ => mediatek}/mt7623n-rfb-emmc.dts   |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7623n.dtsi |    0
>   .../boot/dts/{ => mediatek}/mt7629-rfb.dts    |    0
>   arch/arm/boot/dts/{ => mediatek}/mt7629.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt8127-moose.dts  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt8127.dtsi  |    0
>   .../boot/dts/{ => mediatek}/mt8135-evbp1.dts  |    0
>   arch/arm/boot/dts/{ => mediatek}/mt8135.dtsi  |    0

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Would it be possible to also script a fix for the MAINTAINERS file?

$ git grep "arch\/arm\/boot\/dts" MAINTAINERS |wc -l

101


Regards,
Matthias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
