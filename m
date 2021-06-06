Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B45D739D5D6
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 09:19:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 677C9C59798;
	Mon,  7 Jun 2021 07:19:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36CF7C58D5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Jun 2021 14:38:40 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id h3so8294374wmq.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Jun 2021 07:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=SEVMnnp5jdJsfAi2k7Qasv3hIqmGSZ59KOCLXsglWOA=;
 b=BhlhgQ9N06MFmRnop6dpWkPHolaAHbqtg/S1iH7IkTPMYWqV3cuHpOza8s5TPhWn/m
 kacj+V//eT5wfef/cBFWLqJKBeEmIcOKxJC7tRUg53dQSceeYhb9pGDgIYKHPTRjkc3J
 Ri+D49LbinizfAQo5VR8NNyrMD+pNN/kw8x0y3Hik1suuKNLojvUz7e5C3pW/ZVx3wID
 Eg/E02DR5l2fkKqlZpnz/FY30IB5tc3AHSpND3KypkLuGZ4TtJDGDSG4OPeU672Gq/Fe
 ELvi71Cz2ogQqnD591h8eD+Vcgkr/FhAo3GAfjr4LYW8kq+3cu5odsJILUQGSkWJ3mF0
 a9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SEVMnnp5jdJsfAi2k7Qasv3hIqmGSZ59KOCLXsglWOA=;
 b=R7QZgMm+8jclO48zvqZqd44xJX6jBuUZsH/F6ZoYFobl5kRCvoCJDFHaNAyrDFgC66
 WklBQlHuPiTkSNI/rYtnXDzqDU4RJvEepoOfy7OMKDRtS5KrizB307wk0P6H++DbjfPq
 rqeMhazTuiMTXBuTUaL3LbXRhxWdll0QgmfEShv34RtadiYqMZzQUhKg1Y4kzTtmQTGK
 mcG5yg/m6vsbAXWfLvo5+V7aGzv2CpfgGGM8YY8nvTRk3mb7JMA9EXGPwgNYaWiwR44o
 2btc5KeinFgowMH/4SkHp+zA0quoKWVbsB8AuJkKHGFn9DvYFS+J26gGw1biKrn0hstN
 PG8w==
X-Gm-Message-State: AOAM533p6ccPMmT1q9tPwMCkhoJ1cgFK1hVVEJhYXO1Ufe9POet/IXHI
 TFq+gDhjSqgEVXAGQmGjCBM=
X-Google-Smtp-Source: ABdhPJwO7FetrZnpByd+buizj9rapzo5bXP50YMSXUYMlLCtYO90cuwv/6b2PSRFmQvSgM7IdmwcrQ==
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr4191738wmq.16.1622990319748; 
 Sun, 06 Jun 2021 07:38:39 -0700 (PDT)
Received: from localhost.localdomain (haganm.plus.com. [212.159.108.31])
 by smtp.gmail.com with ESMTPSA id a123sm15383703wmd.2.2021.06.06.07.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 07:38:39 -0700 (PDT)
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210605173546.4102455-1-mnhagan88@gmail.com>
 <YLw//XARgqNlRoTB@builder.lan>
From: Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <a322fc12-b041-5530-0b2a-5bb6a5ca050c@gmail.com>
Date: Sun, 6 Jun 2021 15:38:37 +0100
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

This is giving a warning. Shouldn't v1 be kept as it is here? Please refer
to "net: stmmac: platform: use optional clk/reset get APIs" [1] which
modified error handling for plat->stmmac_rst. PTR_ERR() would then be
called by the parent function on the returned value of ret.

[1]: https://lore.kernel.org/netdev/20201112092606.5173aa6f@xhacker.debian/

Thanks,
Matthew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
