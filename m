Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F07CF654227
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 14:51:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A50A9C6904C;
	Thu, 22 Dec 2022 13:51:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FB7FC6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 13:51:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A85861B8D;
 Thu, 22 Dec 2022 13:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628ECC433D2;
 Thu, 22 Dec 2022 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671717066;
 bh=TOtbGOORwXabVJ6rql6w4RikBZsUsoYh/GbazoMYmGI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ILncDriYPc37lXtxLYo5GPA+LZvmcCZS7K2gEgJ3NgUfwJ8TOJWNeS35k4BeVQBIY
 O388WXENtsRgVoq4rsBkxc/24M2jlpW3vRil22aWhHn97qXo48I3oO/sJAJ2LSs4St
 t9ibmJs/fkbT7GyzMejQYv2H05Ar6YUrW+sB7JSTVWS9KZHNMIeFI+zskA9RISJxOi
 k6Mcj1epKKg3v4TtnFk+zevJcnMApqSh9eQ+3i/rQgsMjxyx4MNU7L1YFbWCy6bsmZ
 KEmuc1Ej2Mgazw2OPTGobV1+sslysflfCY5GrpOj5bsNkxUmCUP6rX9IhQgyDBAHtO
 tBebnd9vyX05Q==
Message-ID: <3072bc2f-6d99-8e52-ee4c-82d5bd46fa5a@kernel.org>
Date: Thu, 22 Dec 2022 14:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-2-gatien.chevallier@foss.st.com>
 <2a4b5094-013f-f873-4c0e-bb48ca6ac19e@kernel.org>
 <6e14aecb-e6f5-ec10-a5c5-af6fd1b54e89@foss.st.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <6e14aecb-e6f5-ec10-a5c5-af6fd1b54e89@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 1/7] dt-bindings: Document common
 device controller bindings
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

On 22/12/2022 14:01, Gatien CHEVALLIER wrote:
> 

>>
>> Anyway you duplicate work here:
>> https://lore.kernel.org/all/c869d2751125181a55bc8a88c96e3a892b42f37a.1668070216.git.oleksii_moisieiev@epam.com/
>> and maybe you duplicate comments.
>>
>> I don't think there is point to review things twice, so NAK.
> This is a result of me not knowing how to handle this particular case. 
> It is a patch that I need to have in my patch set in order to pass Rob's 
> bindings check. Otherwise, feature domains bindings defined here will 
> not be known in the STM32 System Bus binding file, where they are used.
> 
> I wanted to illustrate the use of Oleksii's binding with a practical 
> use-case that we want to implement.

Mention patch dependency in the path changelog (---) and that's it. No
tests will be done. You are expected to run tests anyway on your side,
before sending.

> 
> What would be the correct way of managing this dependency?
> -Specify something like "On top of ...." in the cover letter/patch and 
> reference the other thread?
> -Use a "Depends-On" tag on the YAML binding commit?
> -Something else?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
