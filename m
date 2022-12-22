Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1827C6544BA
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 17:00:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1767C6904C;
	Thu, 22 Dec 2022 16:00:44 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F1C3C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 16:00:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C968B803F2;
 Thu, 22 Dec 2022 16:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C28C433F1;
 Thu, 22 Dec 2022 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671724841;
 bh=4PZEhtB+HsEMWZwH6hbUPCcu8L5AHH6AdX/rHB1wVx4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X94iq2o+ImJJ2csjubHv2gRJ84HqxcfWtZYhbAFGE0rlPT1sL1IKCgiQ6R7AcR6TA
 kf8Gj+HhTqPRfqca3W9M5GaGJUEjIonQqE2rRLFQx1CubS3w03ZWkCpvS7nYxA5Rjn
 ksi/V56P02RnbL6kanIQH8b0hrPS81XdToisufWkmoajve2XVGSapqJa8OhdmDSfVy
 itxs6Cd74hcQJrgaMu/UGP8HBLCji3unE3ucMDirPxubDi4m3XUDiUvWTYSQdHFGhX
 fTQ3YVCiegq8sPkcBygqzxXHly6EtWBmK5HZcFAehpaQGJK+en+H+eb1cUl6NpllH/
 357mwXu+KjneA==
Message-ID: <5d21758f-4e1a-9041-b94d-1352c6a6c8a6@kernel.org>
Date: Thu, 22 Dec 2022 17:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-7-gatien.chevallier@foss.st.com>
 <2e7c901c-e322-ded6-b170-6d2436d74c0f@kernel.org>
 <0bff5b2d-2837-57cb-5434-58158acc1483@foss.st.com>
 <041b77e0-40c5-e724-e5d9-f1da64d5e684@kernel.org>
 <18d0eca0-838e-92c3-4188-d8dcf480ef6e@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <18d0eca0-838e-92c3-4188-d8dcf480ef6e@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 6/7] ARM: dts: stm32: add ETZPC as a
 system bus for STM32MP15x boards
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

On 22/12/2022 16:57, Gatien CHEVALLIER wrote:
> Result after patch is:
> 
> etzpc: etzpc@5c007000 {
> 	compatible = "st,stm32mp15-sys-bus";
> 	reg = <0x5c007000 0x400>;
> 	#address-cells = <1>;
> 	#size-cells = <1>;
> 	feature-domain-controller;
> 	#feature-domain-cells = <2>;
> 	ranges;
> 
> 	timers2: timer@40000000 {
> (...)
> 
> Or do I misunderstand you comment?


Ah, you're right. I missed that it's line removal. Sorry for confusion.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
