Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC869277DE0
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Sep 2020 04:22:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78A6FC3FADF;
	Fri, 25 Sep 2020 02:22:03 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB666C3FAD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 02:22:02 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id u3so1007878pjr.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 19:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=OoMs0S+DYmhpBCeehilqFtpkqSz4jGb6L6091gZK7Mc=;
 b=CV7aZUPNpuWw2l/WrXcyE205zU/wVqjT9dU58RtS8+PoQykMQKIw9O8ht0U4mYhlWj
 JLj2cdyBGXtZFQ7j1WXO60dD2kBPORVCaH0OP7JLlwqDEZg81O9Lfag7YK4ojt60AtB7
 HB+yj9lVv2YGWxCNLf2YhRGDXcYu/aOPeSYECqmpEmTTu8iN2aljsJPp2SKsircfumbv
 LDUqoXk9brA1XhbhsO5MjkVFw5P1rUY5RsrNtGXinepNEz2hVkVl93A74m2pdIzSHCH4
 0p+xPQptrnmJ/4aymKw/JduYEY13DxVztueFBNuwxJ2BbL9UMUPqwKSqmfgs5ORLKSXo
 +RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=OoMs0S+DYmhpBCeehilqFtpkqSz4jGb6L6091gZK7Mc=;
 b=JESEQmxRdNuQrJisoMro91FBykpatfnkSaf5+tV01hY18GEqom5MOXNhuLKSGwSBTZ
 a9NFTzVLPa22XP/3jkkByr9ojXGEvwpo/ZC0KOR8SIF47DkSRIjE3D2YY30bBkrqGyGg
 NX+OXETf4ME5zrCZ1aIgsYRGHWkTwVW4LQG4Ckw5MID/8oK2XxUJeq3VwREoLaYbmv/n
 XMxWi1ZECoFxYDLzRVtYwkAwGo76g4Bsn2mLNCJVxaakGl4y04fzrYgReO8MzXcNGe7c
 0zsaQZ1GBxDvhJ08by3PjTzAjfVfp3Qp8NeuotmWe9QmoJ/bANjAJHKWlxjuu8eue7CB
 rFPA==
X-Gm-Message-State: AOAM533dG9m5XHgYG8aaYeAMaedH4l44wSm/shN9AVDCUZk9l/a3EX4s
 4Dt/Cxn7LhpvUfou5NrWcu0s
X-Google-Smtp-Source: ABdhPJzO+TynFw/gM3o1Ql3dUy+uJUoL54ARk/fwoRykJ9Ftkkz83M1cGx208Xu4u3iXNXnWciXBOw==
X-Received: by 2002:a17:90b:a44:: with SMTP id gw4mr545998pjb.26.1601000520573; 
 Thu, 24 Sep 2020 19:22:00 -0700 (PDT)
Received: from ?IPv6:2409:4072:6d80:ea8c:4827:e640:206e:12?
 ([2409:4072:6d80:ea8c:4827:e640:206e:12])
 by smtp.gmail.com with ESMTPSA id 64sm713687pfz.204.2020.09.24.19.21.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Sep 2020 19:21:59 -0700 (PDT)
Date: Fri, 25 Sep 2020 07:51:53 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <5d0c9b8f-8f6b-a4c7-dc80-638e23749310@denx.de>
References: <20200923232535.241437-1-marex@denx.de>
 <0D1E174A-2217-4785-B4E5-79135AAF76F1@linaro.org>
 <5d0c9b8f-8f6b-a4c7-dc80-638e23749310@denx.de>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>,linux-arm-kernel@lists.infradead.org
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <BD86CF01-741D-4ED6-9D08-B43049E9B816@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable thermal sensor
	support on stm32mp15xx-dhcor
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



On 24 September 2020 4:11:11 PM IST, Marek Vasut <marex@denx.de> wrote:
>On 9/24/20 7:16 AM, Manivannan Sadhasivam wrote:
>> 
>> 
>> On 24 September 2020 4:55:35 AM IST, Marek Vasut <marex@denx.de>
>wrote:
>>> Enable STM32 Digital Thermal Sensor driver for stm32mp15xx-dhcor
>SoMs.
>>>
>>> Fixes: 94cafe1b6482 ("ARM: dts: stm32: Add Avenger96 devicetree
>support
>>> based on STM32MP157A")
>> 
>> The change looks good but what does this patch fixes? 
>
>The missing temp sensor, which helps you detect overheat of the SoC.
>That is esp. important on the 800 MHz AV96.

This doesn't quality as a "fix". Essentially you're just adding a missing feature and not fixing any issues. So please remove the fixes tag and resubmit. 

Thanks, 
Mani

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
