Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2345190308
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 01:45:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C765C36B0A;
	Tue, 24 Mar 2020 00:45:28 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10A40C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 00:45:27 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48mXbR5r3Jz1qs45;
 Tue, 24 Mar 2020 01:45:23 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48mXbR568tz1qyF8;
 Tue, 24 Mar 2020 01:45:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id FO-gghsvXtfJ; Tue, 24 Mar 2020 01:45:22 +0100 (CET)
X-Auth-Info: ZGG/J4gwG3dOZ4fK596fd89O+wp6LvVr1WgV+S4kI0M=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 24 Mar 2020 01:45:22 +0100 (CET)
To: Christophe Kerello <christophe.kerello@st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 tony@atomide.com
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-11-git-send-email-christophe.kerello@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <784fafd2-f1f3-f9c4-d6eb-1d2f6f8d38e4@denx.de>
Date: Tue, 24 Mar 2020 01:44:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584975532-8038-11-git-send-email-christophe.kerello@st.com>
Content-Language: en-US
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [10/12] mtd: rawnand: stm32_fmc2: use regmap APIs
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

On 3/23/20 3:58 PM, Christophe Kerello wrote:
[...]
> @@ -531,11 +515,11 @@ static int stm32_fmc2_nfc_bch_correct(struct nand_chip *chip, u8 *dat,
>  		return -ETIMEDOUT;
>  	}
>  
> -	ecc_sta[0] = readl_relaxed(nfc->io_base + FMC2_BCHDSR0);
> -	ecc_sta[1] = readl_relaxed(nfc->io_base + FMC2_BCHDSR1);
> -	ecc_sta[2] = readl_relaxed(nfc->io_base + FMC2_BCHDSR2);
> -	ecc_sta[3] = readl_relaxed(nfc->io_base + FMC2_BCHDSR3);
> -	ecc_sta[4] = readl_relaxed(nfc->io_base + FMC2_BCHDSR4);
> +	regmap_read(nfc->regmap, FMC2_BCHDSR0, &ecc_sta[0]);
> +	regmap_read(nfc->regmap, FMC2_BCHDSR1, &ecc_sta[1]);
> +	regmap_read(nfc->regmap, FMC2_BCHDSR2, &ecc_sta[2]);
> +	regmap_read(nfc->regmap, FMC2_BCHDSR3, &ecc_sta[3]);
> +	regmap_read(nfc->regmap, FMC2_BCHDSR4, &ecc_sta[4]);

Would regmap_bulk_read() work here ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
