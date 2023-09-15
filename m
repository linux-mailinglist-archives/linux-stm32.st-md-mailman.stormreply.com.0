Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5487A22B0
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Sep 2023 17:43:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A091C6B47C;
	Fri, 15 Sep 2023 15:43:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE47EC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Sep 2023 15:43:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C6A4B82CBF;
 Fri, 15 Sep 2023 15:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620ADC433C7;
 Fri, 15 Sep 2023 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694792581;
 bh=9bRj4OGDHZcWypcbZ6nrLnPTFGOMENS0AvkmhkVoxF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K4HmihmqyVuBI7ExjAGaEePXqlsxLyl0pyr7CY7q1/UigsvPNGqVIo4QlDeC3yvUX
 X/JN5TCdKnWoL1hVVy4NouqrfLZ7SDilBmkCRGokIfc2ZdpWb8V0DsEd2U6nzCVF4V
 /4NuE6QAjTGkDA99f1ZCYP+yVFCKRI34ceDSluxCSV7+rkVTBQl2TQjc55U+9wiowC
 2zHHTM/arQemdTlgHn7QqEVzOKXlsSX0W2W20JTfNnbfKfBknsuXKMFDGqGkT8GUXF
 AxzoGkYisQPGKRABk5LuQBUb5lWl00q1NA23Wzmmu6sylV/riYdgBaiNZMZgsqNvva
 K9izqTNKNkIIQ==
Received: (nullmailer pid 3773371 invoked by uid 1000);
 Fri, 15 Sep 2023 15:42:58 -0000
Date: Fri, 15 Sep 2023 10:42:58 -0500
From: Rob Herring <robh@kernel.org>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <20230915154258.GA3769303-robh@kernel.org>
References: <20230915095417.1949-1-rohan.g.thomas@intel.com>
 <20230915095417.1949-2-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915095417.1949-2-rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6 1/2] dt-bindings: net: snps,
 dwmac: Tx coe unsupported
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

On Fri, Sep 15, 2023 at 05:54:16PM +0800, Rohan G Thomas wrote:
> Add dt-bindings for coe-unsupported property per tx queue.

Why? (What every commit msg should answer)

> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index ddf9522a5dc2..365e6cb73484 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -394,6 +394,9 @@ properties:
>                When a PFC frame is received with priorities matching the bitmask,
>                the queue is blocked from transmitting for the pause time specified
>                in the PFC frame.

blank line needed

> +          snps,coe-unsupported:
> +            type: boolean
> +            description: TX checksum offload is unsupported by the TX queue.

And here.

>          allOf:
>            - if:
>                required:
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
