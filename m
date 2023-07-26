Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5587C763DB2
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 19:32:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5162C6B45C;
	Wed, 26 Jul 2023 17:32:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2549DC6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 17:32:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E35B61BE3;
 Wed, 26 Jul 2023 17:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF2AC433C7;
 Wed, 26 Jul 2023 17:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690392775;
 bh=Cu9ADdxUn4Vjuuuu5fCdXgTIS4gN48R2EByULEFioQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xwd2qU9V6MS6YK2q9bYdstjRNBTbgq0MjOtsFH7ExlzwV2zmWCQ0dMrrBaigqDL4G
 quVWnwJvm04Qc5GG4vPonxd7ZqOGbYMbf4NVe1V7N3xJFVqTWwqPJtd5ncZfIjTz25
 ydOvWfqb7qZl4RdHpJGqNu+56qaj4npNHPU25yB21NMbHjjJSJud76miyi5QB23x4a
 Cu1yWsUymI6ENL99eXhBmT3OfHqsGlkVhSWCPqf+6u1tV6Fifjsv39EbWBKQWD+UNu
 0sdsNWQevG7KWzhlGz3JI9NrYaqUuReS2OfIqY9qXPAWbr3Ule3cjYmT/+sXevGzsE
 oWXcN+8HqOytA==
Received: (nullmailer pid 1693967 invoked by uid 1000);
 Wed, 26 Jul 2023 17:32:52 -0000
Date: Wed, 26 Jul 2023 11:32:52 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230726173252.GA1686272-robh@kernel.org>
References: <20230726074940.121040-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726074940.121040-1-krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 devicetree@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 ChiYuan Huang <cy_huang@richtek.com>, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 - <patches@opensource.cirrus.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robin Gong <yibin.gong@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] regulator: dt-bindings: add missing
 unevaluatedProperties for each regulator
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

On Wed, Jul 26, 2023 at 09:49:40AM +0200, Krzysztof Kozlowski wrote:
> Each regulator node, which references common regulator.yaml schema,
> should disallow additional or unevaluated properties.  Otherwise
> mistakes in properties will go unnoticed.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Closes: https://git.codelinaro.org/linaro/qcomlt/kernel/-/commit/1c8aeef8a6e84520b77f0c270d99c8bf692c5933
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Humm, I have a meta-schema to check this and did a pass fixing them, but 
seems some of them I missed. I'll have to check the meta-schema (still 
some false positives in it, so I haven't committed it)

> 
> ---
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Changes in v2:
> 1. Rebase, drop patches from work-in-progress branch
> ---
>  Documentation/devicetree/bindings/regulator/mps,mp5416.yaml   | 2 ++
>  Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml  | 2 ++
>  Documentation/devicetree/bindings/regulator/pfuze100.yaml     | 4 ++++
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml    | 2 ++
>  .../devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml | 1 +
>  .../bindings/regulator/richtek,rt4831-regulator.yaml          | 1 +
>  .../bindings/regulator/richtek,rtmv20-regulator.yaml          | 1 +
>  .../bindings/regulator/richtek,rtq6752-regulator.yaml         | 1 +
>  .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml    | 2 +-
>  Documentation/devicetree/bindings/regulator/wlf,arizona.yaml  | 2 ++
>  10 files changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
