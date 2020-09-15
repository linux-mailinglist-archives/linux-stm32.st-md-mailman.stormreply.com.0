Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58826B2D4
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Sep 2020 00:54:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B45A4C3FADF;
	Tue, 15 Sep 2020 22:54:14 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58481C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 22:54:13 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id o20so2787239pfp.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 15:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L2C+dPVYyO3cziOHeg11PzVDpTrm1r0ahIYEXV+L+xc=;
 b=HUWDM7k/ixTdF6CPF7+ArffV1FkahQu/o3t73DVNDxpN8sq0yefJBxvdHHq1zw5+Yf
 VYYYBHIAQVz1S/SAwzN9be6AgCX36neUCGnEk9mNSZJ55Q9ypT3UUDKcSIUjBT19l0m7
 5T8rA7QmUkexPq9BE97Q2epTtgVSISRGbIy/cIjFxnBmB0ToQvNK3/y/a0ZGiPY3L/nY
 Zhc6v0U+ktjmICD49V9hUOt7X5YWagZOFmezFJHALY7OU40KcYCxr84ryfE9sfuhvHmh
 V2BTU1Uv2czdmygZ1Ha8bIIXoEgh7vtL2Bzt6MW66cNGVb2H0gkVQcNkog+/UqHUWNzR
 OpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L2C+dPVYyO3cziOHeg11PzVDpTrm1r0ahIYEXV+L+xc=;
 b=eVVCJ3gwk5SvzRfoDfBNXc8Dn8fOKL4u335tXZBiMinpdCLwMwEB0momVgGJf+4ZyY
 TZtRjqEQoodkzQssnWM5+r4PhOB+WCGrJE4dZcIlfpPeqyH4cwqzfVjwS4e8QIRs4RDh
 LdUAdaa0mzzq9Wah6ixSrjCXYYssoEB5nMcf0HPIhJiOpAIfUsQopQ6jyX28XZwpWBRr
 RJqLzs3gbQzyVGrmAgZsXDOaDL9ww+VuR95/FeRU2NlSeXgnTQIA5pPBkelUesBoCilr
 a+uWppMiYR01v0WVKlq0/3wNFLiofjhGJWh+5K+zu7l2QUgHEXiC8MKKkWhEINEkRazj
 9/KQ==
X-Gm-Message-State: AOAM531k/OCWp9DRsrVxpgrP581LLdyrJsgiMijFIb8NkGy/r9vqxgbl
 avM5iGPt3SdThLfRH4tUEko=
X-Google-Smtp-Source: ABdhPJxCnEU8TcwxkbvBJv/LF2Lme7WXHa52bedmzBRgFfASi/GMqcvRIQjYS6TJINzG4WJGyl8UBQ==
X-Received: by 2002:a63:1a05:: with SMTP id a5mr16980916pga.145.1600210451660; 
 Tue, 15 Sep 2020 15:54:11 -0700 (PDT)
Received: from [10.230.28.120] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e19sm14910651pfl.135.2020.09.15.15.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 15:54:10 -0700 (PDT)
To: David Miller <davem@davemloft.net>, vee.khee.wong@intel.com
References: <20200915012840.31841-1-vee.khee.wong@intel.com>
 <20200915.154302.373083705277550666.davem@davemloft.net>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b945fcc5-e287-73e2-8e37-bd78559944ab@gmail.com>
Date: Tue, 15 Sep 2020 15:54:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200915.154302.373083705277550666.davem@davemloft.net>
Content-Language: en-US
Cc: weifeng.voon@intel.com, Joao.Pinto@synopsys.com, arnd@arndb.de,
 netdev@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 chen.yong.seow@intel.com, joabreu@synopsys.com,
 sadhishkhanna.vijaya.balan@intel.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: Add ethtool
 support for get|set channels
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



On 9/15/2020 3:43 PM, David Miller wrote:
> From: Wong Vee Khee <vee.khee.wong@intel.com>
> Date: Tue, 15 Sep 2020 09:28:37 +0800
> 
>> This patch set is to add support for user to get or set Tx/Rx channel
>> via ethtool. There are two patches that fixes bug introduced on upstream
>> in order to have the feature work.
>>
>> Tested on Intel Tigerlake Platform.
> 
> Series applied, thank you.

patch #2 does not have a proper Fixes: tag format, it should be:

Fixes: cafebabed00d ("some super subject")
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
