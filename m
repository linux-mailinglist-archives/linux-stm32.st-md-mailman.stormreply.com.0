Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E9E5A3EE3
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Aug 2022 19:36:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0BB0C5EC6B;
	Sun, 28 Aug 2022 17:36:08 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38DBCC03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Aug 2022 17:36:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2C37B80B18;
 Sun, 28 Aug 2022 17:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC922C433C1;
 Sun, 28 Aug 2022 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661708166;
 bh=zk0aZVHiItxWxC0upniYjtmDuwhHEaADU5YLRrj+ZxE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZeTrYGelgpW8o1guW26ZZlNZjQaFs6rtHOOR6aJNM3xKbHt4g4Z8R9wld8xFLxAJx
 wVIsW37alkXZzNwzXxtnnqVm3KdkFL5uqPJ+T7OmYlN8qeuBok0Nl8pX4QbCuwnxFj
 AoBhJs7DjSPN0UtcDTdcZ4zJe9Ao2G550k/r0o0dPzkntvFlR8KR3pOBbCbLnt2tdV
 1pKuSUQ+/aHfwEvTk8JWf+hfovsx12KQ/PthVLDMzvo9sImIv/vcyAQIUReNk/zj03
 AFSH6xA1No/e/MZXgBIKHjE2tljQqWtt/QmLDmI3hkTMeIpThZl/a7mc5Ycywj24Fk
 rOSWld2vCFv3Q==
Date: Sun, 28 Aug 2022 18:01:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20220828180050.51c3e857@jic23-huawei>
In-Reply-To: <99dfcc39-ab1b-1b24-c6b2-67de5509f5ac@linaro.org>
References: <20220823145649.3118479-2-robh@kernel.org>
 <99dfcc39-ab1b-1b24-c6b2-67de5509f5ac@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Michal Simek <michal.simek@xilinx.com>,
 Andy Gross <agross@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: Add missing
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

On Thu, 25 Aug 2022 15:04:33 +0300
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 23/08/2022 17:56, Rob Herring wrote:
> > In order to ensure only documented properties are present, node schemas
> > must have unevaluatedProperties or additionalProperties set to false
> > (typically).
> >   
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to the togreg branch of iio.git and pushed out as testing for 0-day
to poke at it before I push out as togreg for linux-next to pick up.

Side note. Some odd entries in your cc list...  alsa-devel?

Thanks,

Jonathan

> 
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
