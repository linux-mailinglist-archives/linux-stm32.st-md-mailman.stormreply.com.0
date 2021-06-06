Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8679039D5D4
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 09:19:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41AA6C59789;
	Mon,  7 Jun 2021 07:19:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C0B7C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Jun 2021 09:36:36 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso10590210wmh.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Jun 2021 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MJuP8CxV6bjU2gIDe6Qlmusnyce3p54TGbmJ67b3i24=;
 b=moV/rgoyuYvOuX2oJAMxsMD5dWl7bn8Kth+LDjn06gSDP96MKJJtdHeiblB9HNbTXN
 CJVga/pAzwi2UGAy2Xah3nC1sDDXnzhSLsV7IgNbTATu+KxD9Du9Aqkuhht+qGqVUFth
 zREl1PjycLCiF3R4miwRpR6dG7UKyAcmIx/J6bFgXosCHIjQ04826C4o8bG9bUzO0yok
 6qdDtV7kY87J+m6ArfVNYqcgD4tA5dYPB1ETPXBpB4W5ixR7yG5sBqVh/aD1KXSD7n/j
 1Cx92lwyi51TCpnB2g33560bSASlyfzUBMRz+99cgHZK8JAYY1YZmsVX+FV/D2/ioPro
 upwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MJuP8CxV6bjU2gIDe6Qlmusnyce3p54TGbmJ67b3i24=;
 b=rOBnt5ohYzS8kwbaegKHKMv4M5w5vbt+T2xchM1BN8X4PBwhWZAwU9gtBrDziiWJz+
 chGwVaPQj56/eBOx+LJyptaDxOh7X0RQKQXaOxTK67ijNWrBxblaGlBifYoV2wiFwJKN
 I3bSaYWaBOcdeer/RseqZPRTAqVaHNnA9YMSIrgZHLNY4i9AkvGr61u5uEPd0lDmrnUp
 NGq9y06Dlkfq0UCabgY4sTrfD2OXq/U35hYG6MyLGMBVn5XLEw1OaO3ZzgSFL2VpWEq4
 TYi/dQgTiTc1B89iuG1Usqakkhj/LkccmhkVIMFlSZF5tcVaPsxvNWWo+X9KuyNFIl6L
 POdw==
X-Gm-Message-State: AOAM532U2aSjNWvV/aVif7p274MApR5GJqbS3H4Zu+9HSLXDlEpmnDWO
 eX/dolEDArdcGFY5Zz0prJQ=
X-Google-Smtp-Source: ABdhPJyNIZqQPUm8ZPsH8rrCJBxDeoLQi0RWvWLyw30Db65AgsZUfT6IQD3f5Q7tthNSJ6IOqVhmcQ==
X-Received: by 2002:a7b:c2a2:: with SMTP id c2mr9663889wmk.89.1622972195496;
 Sun, 06 Jun 2021 02:36:35 -0700 (PDT)
Received: from localhost.localdomain (haganm.plus.com. [212.159.108.31])
 by smtp.gmail.com with ESMTPSA id y6sm13818467wmy.23.2021.06.06.02.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 02:36:34 -0700 (PDT)
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210605173546.4102455-1-mnhagan88@gmail.com>
 <YLw//XARgqNlRoTB@builder.lan>
From: Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <3436f8f0-77dc-d4ff-4489-e9294c434a08@gmail.com>
Date: Sun, 6 Jun 2021 10:36:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLw//XARgqNlRoTB@builder.lan>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Jun 2021 07:19:27 +0000
Cc: Jose Abreu <joabreu@synopsys.com>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Fugang Duan <fugang.duan@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Voon Weifeng <weifeng.voon@intel.com>, devicetree@vger.kernel.org, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Tan Tee Min <tee.min.tan@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] net: stmmac: explicitly deassert
	GMAC_AHB_RESET
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

On 06/06/2021 04:24, Bjorn Andersson wrote:

> On Sat 05 Jun 12:35 CDT 2021, Matthew Hagan wrote:
>
>> We are currently assuming that GMAC_AHB_RESET will already be deasserted
>> by the bootloader. However if this has not been done, probing of the GMAC
>> will fail. To remedy this we must ensure GMAC_AHB_RESET has been deasserted
>> prior to probing.
>>
> Sounds good, just some small style comments below.
>
>> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 7 +++++++
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 7 +++++++
>>  include/linux/stmmac.h                                | 1 +
>>  3 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 6d41dd6f9f7a..1e28058b65a8 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -6840,6 +6840,13 @@ int stmmac_dvr_probe(struct device *device,
>>  			reset_control_reset(priv->plat->stmmac_rst);
>>  	}
>>  
>> +	if (priv->plat->stmmac_ahb_rst) {
> You don't need this conditional, stmmac_ahb_rst will be NULL if not
> specified and you can reset_control_deassert(NULL) without any problems.
>
>> +		ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);
>> +		if (ret == -ENOTSUPP)
>> +			dev_err(priv->device,
>> +				"unable to bring out of ahb reset\n");
> No need to wrap this line.
>
>> +	}
>> +
>>  	/* Init MAC and get the capabilities */
>>  	ret = stmmac_hw_init(priv);
>>  	if (ret)
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index 97a1fedcc9ac..d8ae58bdbbe3 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -600,6 +600,13 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>>  		goto error_hw_init;
>>  	}
>>  
>> +	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
>> +							&pdev->dev, "ahb");
>> +	if (IS_ERR(plat->stmmac_ahb_rst)) {
>> +		ret = plat->stmmac_ahb_rst;
> You need a PTR_ERR() around the plat->stmmac_ahb_rst.
>
> Regards,
> Bjorn
>
>> +		goto error_hw_init;
>> +	}
>> +
>>  	return plat;
>>  
>>  error_hw_init:
>> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
>> index e55a4807e3ea..9b6a64f3e3dc 100644
>> --- a/include/linux/stmmac.h
>> +++ b/include/linux/stmmac.h
>> @@ -239,6 +239,7 @@ struct plat_stmmacenet_data {
>>  	unsigned int mult_fact_100ns;
>>  	s32 ptp_max_adj;
>>  	struct reset_control *stmmac_rst;
>> +	struct reset_control *stmmac_ahb_rst;
>>  	struct stmmac_axi *axi;
>>  	int has_gmac4;
>>  	bool has_sun8i;
>> -- 
>> 2.26.3
>>
>>
Thanks for the review. Will submit a v2 shortly.

Matthew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
