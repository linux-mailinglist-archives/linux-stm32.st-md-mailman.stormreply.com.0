Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F08E6CA16F
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 12:29:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E794C6A5F6;
	Mon, 27 Mar 2023 10:29:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F6B4C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 10:29:58 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 l8-20020a05600c1d0800b003ef6708bbf6so2827410wms.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 03:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679912998;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KYfSIoKXNS3sSCXkM4mLPOnfFyH+Y/o4nva0Ic4Cwk0=;
 b=dcns/R16IPSR9+8Qx4l91dTXHIf7FlZWe9GoJ6MSG9DAgpQUHXBvQf3iS3ONcMn6nH
 eFHmciA8dwxEBu7xf32wW4b3HGloLF6XIwRk6nM7qCG4pJ8zZTP5FT8GG6KeV9bezVKO
 ppDzdYI7Ve/fQ5s2K3kEUKJ/eEGdXOZxn4vbDjoYcRnIrZ7X7lrDYve0ovs6dhf5KqYC
 qJ5hKC+eEJw3RFo9XKgTRDJO9aXJ+4JLSti0Ot3SMHJSb+34ucfZwyY3dYHHmKHzRxeD
 F+5qKTMcbu36DlU6w1uro8ymsJMAgWyIzp+PXXTcJEMUybyPB1Ggb0prNSIEf4e9PX/H
 vmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679912998;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KYfSIoKXNS3sSCXkM4mLPOnfFyH+Y/o4nva0Ic4Cwk0=;
 b=1zxX8aNe9RtprCGsc0Z+iDkC39N00dUQ4FKlR5M/wLhNTIrgDOuUxn6xtZXYwSf1vr
 a9I17OeZsw/5bMyOnfdQDpkHAlhTmhZJDUOujiBU4PoS9WdMqc1RiCOYnQIlzGqQM18U
 YSGX4K4YcWfxMhNm0TrwI1TtBpsYcI5oxGpwI8CsHRKJ4yJ1bVCu/TJETCmngudyixpg
 xc2Tk8z/eMRHuLFJMuRnI9Hmvc0KzNhSKNcnDUNxAg9O+K3JrZtDJD0ZEKxi1cmG01hb
 DH3Rk5h69e8LKXSPI5vE4V9smRtn+llJMBJUZ0ujZbhjxvbv26tiQCqEcdT2G8Thyjuz
 aofQ==
X-Gm-Message-State: AO0yUKUupBzCimBpKa8JiOyKo52uFh+hg6je5K/4eMkQtOmWclE51d3I
 K+9OUugrvx67+JGA4HMApJMgZA==
X-Google-Smtp-Source: AK7set/smYnMthy48xIiehT+4wd3+HCmKMpGIq/8zhn9DCMe/nzn+LRCE19xdyNlP+eMMFDqVvbXNw==
X-Received: by 2002:a05:600c:28b:b0:3ed:5cf7:3080 with SMTP id
 11-20020a05600c028b00b003ed5cf73080mr8752590wmk.5.1679912997970; 
 Mon, 27 Mar 2023 03:29:57 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a7bc391000000b003ed2987690dsm13210822wmj.26.2023.03.27.03.29.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 03:29:57 -0700 (PDT)
Message-ID: <a17cd888-ef4d-ced0-adba-c6a6abdba51a@linaro.org>
Date: Mon, 27 Mar 2023 11:29:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
 <20230327094742.38856-2-christophe.kerello@foss.st.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230327094742.38856-2-christophe.kerello@foss.st.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 1/2] mtd: rawnand: stm32_fmc2: do not
	support EDO mode
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

Hi,

On 3/27/23 10:47, Christophe Kerello wrote:
> FMC2 controller does not support EDO mode (timings mode 4 and 5).
> 

commit subject and message should be in imperative mood, so I would
change the commit subject to "mtd: rawnand: stm32_fmc2: Remove
unsupported EDO mode" and the message to something like "Remove the EDO
mode support from as the FMC2 controller does not support the feature."
Extra points if you describe what happened when you used timings mode 4
and 5 with the current version of the driver.

Miquel, could you add Cc to stable when applying?
Cc: stable@vger.kernel.org

> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 5d627048c420..3abb63d00a0b 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -1531,6 +1531,9 @@ static int stm32_fmc2_nfc_setup_interface(struct nand_chip *chip, int chipnr,
>  	if (IS_ERR(sdrt))
>  		return PTR_ERR(sdrt);
>  
> +	if (sdrt->tRC_min < 30000)
> +		return -EOPNOTSUPP;
> +
>  	if (chipnr == NAND_DATA_IFACE_CHECK_ONLY)
>  		return 0;
>  
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
