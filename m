Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7D7653E2F
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 11:22:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80A11C6904C;
	Thu, 22 Dec 2022 10:22:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F574C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 10:22:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D81EB61A4D;
 Thu, 22 Dec 2022 10:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636AAC433EF;
 Thu, 22 Dec 2022 10:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671704562;
 bh=22s/99ngrjGMLNIsEVIM+52lfbZ7CCn6Y6YPEHFsEwA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n2VoowaaAov3rlJlorcSeIQht1unkjO4aYT+/vnfCCuhEbmXXSRM9i4jZ7QfKXVJd
 eEIRkH6T8g9UwNF3X1Q/jmEcmFXOHC58MVEWz3Wg9qRUAfL99HdJdaTkoA5wfxY20/
 n+iT+n4fdehILpa16E7kruNTIT71+P3PktQrDd3j45IKYbfBjPicA0skk0KcxN/M/v
 Vl7U26rdkovEfL9X9VifUPDADXyX88TeoF7q09fq8y6Dm+jF2wm26cErCjDBlgk6Ns
 E2GQWX+wUprsvVZdYARTH/dnArC82K6VsHbmDF0/SmfwacvY03CtO+Imz3k8VG37ct
 IwLCRRUISDRYg==
Message-ID: <2a4b5094-013f-f873-4c0e-bb48ca6ac19e@kernel.org>
Date: Thu, 22 Dec 2022 11:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-2-gatien.chevallier@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221221173055.11719-2-gatien.chevallier@foss.st.com>
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

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.


On 21/12/2022 18:30, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>

You same From as SoB.

> 
> Introducing of the common device controller bindings for the controller
> provider and consumer devices. Those bindings are intended to allow
> divided system on chip into muliple domains, that can be used to
> configure hardware permissions.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

Missing SoB.

Missing changelog. This is not v1 but v7 or something.



> ---
>  .../feature-domain-controller.yaml            | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml b/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
> new file mode 100644
> index 000000000000..90a7c38c833c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/feature-controllers/feature-domain-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Domain Controller bindings

Drop "bindings".

Anyway you duplicate work here:
https://lore.kernel.org/all/c869d2751125181a55bc8a88c96e3a892b42f37a.1668070216.git.oleksii_moisieiev@epam.com/
and maybe you duplicate comments.

I don't think there is point to review things twice, so NAK.


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
