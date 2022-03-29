Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 110274EBB8F
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 09:15:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA5DEC628A3;
	Wed, 30 Mar 2022 07:15:34 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3485BC5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1648543851; x=1680079851;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0r3zs2np5g1OGyfR5AfBJmzryAoR1xJqsqcoDejQqWU=;
 b=SvzazobpV11jWeMgpXo0FTvE1SLSgCyZ7Xqqf+G+mtJGMfNJ9dbOCrDf
 ysi5EidKWkWJ49RAyHugcujFV5Kw0oT1phK7DlUFPa6sZN1D1b/yMAXmv
 RCdj/QsyqhI3Z1SjDcDYeAcyh/VPEi7+sI5OLoYwx9CjtHPiYDaJevD76
 8I6jXHHTjFr79/zR8y4Bgh1Gy35vFCZqn2MULJmTFkyb95PUicosRdfrd
 ZDbhw2po6iiow2+V+HMacAd2XS96BryxDwBl6ib89n3nhoZYszcVOAd31
 VA5WMVXwoTHyfGGelRpyFs3vNbtaDve3Zad+K6r7cbpt8O6NzEkpqUN+Y A==;
X-IronPort-AV: E=Sophos;i="5.90,219,1643698800"; d="scan'208";a="158497460"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Mar 2022 01:50:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 29 Mar 2022 01:50:48 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 29 Mar 2022 01:50:41 -0700
Message-ID: <4ff4f171-c5f8-87af-aad1-5e7686292288@microchip.com>
Date: Tue, 29 Mar 2022 10:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Daniel Palmer <daniel@0x0f.com>, Ansuel Smith <ansuelsmth@gmail.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Santiago Esteban
 <Santiago.Esteban@microchip.com>, Cristian Birsan
 <Cristian.Birsan@microchip.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
X-Mailman-Approved-At: Wed, 30 Mar 2022 07:15:33 +0000
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, DTML <devicetree@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

Ansuel, All,

On 28/03/2022 at 10:55, Daniel Palmer wrote:
> Hi Ansuel
> 
> On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>>
>> Hi,
>> as the title say, the intention of this ""series"" is to finally categorize
>> the ARM dts directory in subdirectory for each oem.
> 
> While I agree with this change and think it's for the good (browsing
> the ARM dts directory at the moment is frustrating..) I think
> buildroot and others need to be told about this as it'll potentially
> break their kernel build scripting for ARM and probably messes up the
> configs they have for existing boards.

This aspect mustn't be underestimated and I anticipate lots of issues 
during a long time on this particular topic of "build systems".

Another aspect is CI and public or private testing farms we all have 
running.

These aspects always refrained me to change anything in the naming 
scheme of our DT files, but if we go in this direction, we must really 
be prepared and I'm still not convince it's worth it...


If this has to happen, I would also like to queue some file name changes 
to do all modifications in one go in order to lower the annoyance level 
of those who would need to adapt to those changes.

BTW, is there a common scheme for dts/dtsi file naming? Is it more 
enforced in one way or another for arm64 in a sense that I can take some 
norm as an example?

[..]

Best regards,
   Nicolas



-- 
Nicolas Ferre
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
