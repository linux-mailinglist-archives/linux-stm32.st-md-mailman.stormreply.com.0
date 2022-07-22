Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8457DC7C
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jul 2022 10:35:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4ADFC04005;
	Fri, 22 Jul 2022 08:35:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 675DBC03FD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 08:35:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17E981063;
 Fri, 22 Jul 2022 01:35:31 -0700 (PDT)
Received: from bogus (unknown [10.57.14.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3996C3F766;
 Fri, 22 Jul 2022 01:35:24 -0700 (PDT)
Date: Fri, 22 Jul 2022 09:35:20 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20220722083520.coovqsa2pv7mnifp@bogus>
References: <20220721212718.1980905-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220721212718.1980905-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: arm: coresight: Add
 'power-domains' property
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

On Thu, Jul 21, 2022 at 03:27:14PM -0600, Rob Herring wrote:
> Coresight components may be in a power domain which is the case for the Arm
> Juno board. Allow a single 'power-domains' entry for Coresight components.
>

I assume the maxItems can be changed in case if some platforms have multiple
power domains especially for some per CPU coresight ETR/debug components.

But for now, it looks good.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
