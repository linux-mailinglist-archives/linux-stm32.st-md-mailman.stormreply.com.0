Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C0654EFA
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Dec 2022 11:08:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CDC6C6904C;
	Fri, 23 Dec 2022 10:08:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CF7BC64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Dec 2022 10:08:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 078D161EEA;
 Fri, 23 Dec 2022 10:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70371C433D2;
 Fri, 23 Dec 2022 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671790127;
 bh=Ibkd+PwHR1HEZiuXMmKszeauVwyPlqTPO0LQKes81VY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CdG/FqC8CRH3eAsO38CVNxRJipPIJrCk+rLqSogTHHRDLC+W6NgCH8oakS+N73Uex
 cEO8mZeWMbKfKVnv6q/zkSMs8JZqFfvX6fWfw71yyDOd7HbJc9E0xR8XG3cDdXt+G0
 Ppr3Q92VB1GQ7G+FUv1xhXqd7WP3yYKWR4YuXO11qpnXMPNFZNbBDLcO7hO+W/Lcb1
 ISSSTBLfoDYWgp6GA5tVSZ+tZD9YbQc80+72he7Qt0U3VE1rpihgFbRWZe9ZavcJx7
 jIY0LKBabjYeW+ltMSrccZ+Vqb1BIidLgJFHw0JP8FeX2MyVe0MXTXVy0i7b2iXhmd
 9ezTHjPl/HQEQ==
Message-ID: <3847a67a-38f3-b8e7-749a-1a76f39b2196@kernel.org>
Date: Fri, 23 Dec 2022 11:08:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
References: <20221222100504.68247-1-gatien.chevallier@foss.st.com>
 <20221222100504.68247-2-gatien.chevallier@foss.st.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221222100504.68247-2-gatien.chevallier@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH v2 1/7] dt-bindings: Document common
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

On 22/12/2022 11:04, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the common device controller bindings for the controller
> provider and consumer devices. Those bindings are intended to allow
> divided system on chip into muliple domains, that can be used to
> configure hardware permissions.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

It seems you sent it after my feedback but I do not see my feedback
implemented here (missing SoB, this patch should not be here, not cc-ing
all maintainers, etc.). If you sent it before reading feedback, please
sent a v3 with the feedback implemented.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
