Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B54AA5A5C7A
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Aug 2022 09:07:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E61EC5EC6B;
	Tue, 30 Aug 2022 07:07:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E362CC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 07:07:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 757E9B815D2;
 Tue, 30 Aug 2022 07:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7672EC433C1;
 Tue, 30 Aug 2022 07:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661843222;
 bh=FMfNnM+I09AoWhN6ovBiEHCCKZyla04MjnYb5+HBX/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lYYXLxk559HkJfjNSMlOUQiSfxmgGkTvUoP5TmcQofe4V8571S7IOiT3f1TjQqmVC
 Ku6V/1aJq5Hc5UCnmkQD37kIleKUeuZVmTXaSJ+CpT2Ri/M0wF1arbetLW//AJL+ZI
 pFOtnDyS+pmha2UuFVX7wxLKtGZTGAKvrE7UB1GeDwO6/GA90m1TBYdZWL6S/kWoea
 DUXujmq8LXDmAhBjOvP3HQxYaF9o33MXsZ7Fbu9KItTzPmO3ATd69PiZkwnIxNO3r8
 RfyPzFfNgvGHBWVmJijLNoKyd5ygV+WwE/vH3xwWducmXNQsex03NR0OA/+4Vlx/7H
 vVG9imQyidGnQ==
Date: Tue, 30 Aug 2022 12:36:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <Yw23EkV/P3fuNI4C@matsya>
References: <20220823145649.3118479-14-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220823145649.3118479-14-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Scott Branden <sbranden@broadcom.com>,
 Scott Branden <scott.branden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Ray Jui <ray.jui@broadcom.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: phy: Add missing
 (unevaluated|additional)Properties on child nodes
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

On 23-08-22, 09:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
