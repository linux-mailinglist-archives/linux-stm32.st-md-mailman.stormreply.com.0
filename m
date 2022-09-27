Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9190B5EC021
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 12:51:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4646AC63326;
	Tue, 27 Sep 2022 10:51:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0F4FC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 10:51:40 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D122984A73;
 Tue, 27 Sep 2022 12:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664275900;
 bh=3ewozdLEQlhQmZ3Bns2Zl5WX79hSFw5CgIFBudDQgBc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uOIaUlBT3Um1DSnZtgXwlvgjopyw0wuBcbgZ5Na5fXgzQD1telN5jbVxrK+KArzWP
 6+7sIjZHGH7wXpaOungjXmCdvHk8VGdheDIygY57is/ZlJvZJjlgnbvD0MILGt++OO
 ln8up93LLLPoSEQT7n0/ImNKVZ/dL4IDgjCeII6zoiglPkZgbd1+3ed25XMyvWvDFN
 KeXnkuWSkYeN7GQ4BdOFkBAjxMNrbB0BR4ljlnwDopxWRmGRGtkKT4rjDkw5z5wRoU
 XuIqOXdmAoi4iHynZO3Gc1kMIk/mX89R3zpfvYYFhr3c3ZtuGzBz/vzx84C6QqOdJM
 0fvZRZ4CL5qpw==
Message-ID: <336df874-2c22-c2cb-9565-75fe697ca473@denx.de>
Date: Tue, 27 Sep 2022 12:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220927002004.685108-1-marex@denx.de>
 <YzLST/bYxqd0S/i4@sirena.org.uk>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YzLST/bYxqd0S/i4@sirena.org.uk>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: sound: st,
 stm32-sai: Document audio OF graph port
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

On 9/27/22 12:37, Mark Brown wrote:
> On Tue, Sep 27, 2022 at 02:20:04AM +0200, Marek Vasut wrote:
>> It is expected that the SAI subnodes would contain audio OF graph port
>> with endpoint to link it with the other side of audio link. Document
>> the port: property.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Will do, and I updated the patch tags locally in case a V2 is needed anyway.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
