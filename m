Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFB93E8BE4
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Aug 2021 10:37:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BF09C5A4CD;
	Wed, 11 Aug 2021 08:37:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9170C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Aug 2021 08:36:59 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso3819073wms.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Aug 2021 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r2N2lJNtd9ZVoClfrfgh876Vfdtyeq7ZHkyk/68V1gA=;
 b=dSYtxaXDCl25xHC0RUhzvW1jjtWK0C461gFRD7NdUbEikkzJ0Fq2JFdLgvgeZTSYPt
 vGbHkLazdljjkjZgnlAOEJPz90n7dwcNji7tOWR2r0zV8KjMQiNCMQeZiHbhafyPm4e2
 HbdN7bYSWTwGCaLzlZAjivjzq536vg0oBvWAeflq9zyo7rzP9ZliT8rW5e1rAh+jI+y0
 qm1Z3ltM8zkefRQ9DwenwuOH+arhQ526i2rxdWGu5ooK7ns/Ov5Vmd/xUp06ZurBOKcK
 HyTVfTQvaae4haJmjC8Mt65Ha7htxJoCWH4ZIJ6dY4e0ytXFv70jJC2XLg9BqvWLvxJ/
 ROBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r2N2lJNtd9ZVoClfrfgh876Vfdtyeq7ZHkyk/68V1gA=;
 b=GPiYhYZJuGl6w2gjXx5cnRS2V8YWEu66izOAKPX3vYMLXPs/KEfP9t4w7dZEFATSoy
 LQgLlECXnFvtDkJtbYhxi7gdR5pd3bVQTp4B5Ydy+qftw8NMlHaDaoWpfE/h+bnJuVI6
 pkpRLT2ZAluVxtNBKIk0a+7tXJq5EeY7YyclIgZWjxX0JpjWqUDlR1MJVjQqyRKkrDi2
 pHs0cIGfGa7VKwcUyWwUHeL9XFXGh9pNNMJyUgwhilmVpXohi88dV160tKbclEku5o8W
 sEPrTUTH3uaN9uTYTDTO7qA2cYX/RcILKvZhKPqiYvrN2wpqMic+bt5aS46b8IRfDL0n
 Rkvg==
X-Gm-Message-State: AOAM533k877XEak7cgLLWOj7RmS7u53ksrjpiemErFRxBtYJtilfpDnR
 RsQQoVM+LZ2YwAIF51bU+5E=
X-Google-Smtp-Source: ABdhPJx+Bhx60Go2TR/I/ARqxGl4Pjqxf0dXF/m8YuYGiTNSgcVyZOkKXRwpDNnxmKXEbaUEtP7BXA==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr25447530wmh.56.1628671019135; 
 Wed, 11 Aug 2021 01:36:59 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8192:e700:90a4:fe44:d3d1:f079?
 (2a01cb058192e70090a4fe44d3d1f079.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8192:e700:90a4:fe44:d3d1:f079])
 by smtp.gmail.com with ESMTPSA id u6sm11308532wrp.83.2021.08.11.01.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 01:36:58 -0700 (PDT)
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>
References: <20210809102229.933748-1-vee.khee.wong@linux.intel.com>
 <20210809102229.933748-2-vee.khee.wong@linux.intel.com>
 <YREvDRkiuScyN8Ws@lunn.ch> <20210810235529.GB30818@linux.intel.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f2a1f135-b77a-403d-5d2e-c497efc99df7@gmail.com>
Date: Wed, 11 Aug 2021 01:36:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810235529.GB30818@linux.intel.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: pcs: xpcs: enable skip
	xPCS soft reset
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



On 8/10/2021 4:55 PM, Wong Vee Khee wrote:
> Hi Andrew,
> On Mon, Aug 09, 2021 at 03:35:09PM +0200, Andrew Lunn wrote:
>> On Mon, Aug 09, 2021 at 06:22:28PM +0800, Wong Vee Khee wrote:
>>> From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
>>>
>>> Unlike any other platforms, Intel AlderLake-S uses Synopsys SerDes where
>>> all the SerDes PLL configurations are controlled by the xPCS at the BIOS
>>> level. If the driver perform a xPCS soft reset on initialization, these
>>> settings will be switched back to the power on reset values.
>>>
>>> This changes the xpcs_create function to take in an additional argument
>>> to check if the platform request to skip xPCS soft reset during device
>>> initialization.
>>
>> Why not just call into the BIOS and ask it to configure the SERDES?
>> Isn't that what ACPI is all about, hiding the details from the OS? Or
>> did the BIOS writers not add a control method to do this?
>>
>>      Andrew
> 
> BIOS does configured the SerDes. The problem here is that all the
> configurations done by BIOS are being reset at xpcs_create().
> 
> We would want user of the pcs-xpcs module (stmmac, sja1105) to have
> control whether or not we need to perform to the soft reset in the
> xpcs_create() call.

I understood Andrew's response as suggesting to introduce the ability 
for xpcs_create() to make a BIOS call which would configure the SerDes 
after xpcs_soft_reset(). That way the current xpcs_create() signature 
would remain the same, but you could easily hook any post-reset 
initialization by making an appropriate BIOS call.
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
