Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5900C2DB29A
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Dec 2020 18:32:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC4FEC32E90;
	Tue, 15 Dec 2020 17:32:08 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2818C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 17:32:07 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id a109so20144637otc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 09:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5yaEryw6XNLMEgGskzSLFE6j4zs11TlaPsMd8R+3tYU=;
 b=pa8QaukOKH1TI1F4pXwNx9vsNUfjplM3xttIGSX/pWZVdG4vIa1GUWy+nCJWhbfZKZ
 IaA7Rk8xOOQ/CoMsPabPGTxJohyDZCERiDB8uw33mbj/4j4cXWlV2dOhZSa8Lgp3psr4
 zIXteMfz4IaPDyInhMT1hQ5DxcVobaLZKDZ8RVgtMiEat156teGu+fqHnhikdchK0WQL
 oPPpqz3rDSd36cWjPCW4wWkEv+rBsjZdJu47mL01D9fYKtIW+xkBwFGvQK8WfxWrgixd
 U2E+wIbDguYAkt0DcS3iwizDcLP+/v6XYst59hPRfSmsjVEpx7FvjdrCtw70oJlxOvOc
 Yhmg==
X-Gm-Message-State: AOAM533FrVpVil0vO+Ii1RbGVbW2TDT1Ut7sRK2JfyIBd5RRcAqPn1A9
 rM4plZ00eh3Dy9hXUzxF6A==
X-Google-Smtp-Source: ABdhPJz+DY6y44Ux4FcF2FQdoyK9exddTpaOa4EWcrlXxajMaOLwPQ8+7pZrd+v329TzX5euhJ8YfQ==
X-Received: by 2002:a05:6830:1e41:: with SMTP id
 e1mr24207426otj.143.1608053526489; 
 Tue, 15 Dec 2020 09:32:06 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q4sm4825687ooo.1.2020.12.15.09.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 09:32:05 -0800 (PST)
Received: (nullmailer pid 4074363 invoked by uid 1000);
 Tue, 15 Dec 2020 17:32:04 -0000
Date: Tue, 15 Dec 2020 11:32:04 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20201215173204.GA4072234@robh.at.kernel.org>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
 <20201214091616.13545-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214091616.13545-7-Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Lars Persson <larper@axis.com>, linux-stm32@st-md-mailman.stormreply.com,
 Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH 06/25] dt-bindings: net: dwmac: Add Tx/Rx
	clock sources
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

On Mon, Dec 14, 2020 at 12:15:56PM +0300, Serge Semin wrote:
> Generic DW *MAC can be connected to an external Tramit and Receive clock

s/Tramit/Transmit/

> generators. Add the corresponding clocks description and clock-names to
> the generic bindings schema so new DW *MAC-based bindings wouldn't declare
> its own names of the same clocks.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml        | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index e1ebe5c8b1da..74820f491346 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -126,6 +126,18 @@ properties:
>            MCI, CSR and SMA interfaces run on this clock. If it's omitted,
>            the CSR interfaces are considered as synchronous to the system
>            clock domain.
> +      - description:
> +          GMAC Tx clock or so called Transmit clock. The clock is supplied
> +          by an external with respect to the DW MAC clock generator.
> +          The clock source and its frequency depends on the DW MAC xMII mode.
> +          In case if it's supplied by PHY/SerDes this property can be
> +          omitted.
> +      - description:
> +          GMAC Rx clock or so called Receive clock. The clock is supplied
> +          by an external with respect to the DW MAC clock generator.
> +          The clock source and its frequency depends on the DW MAC xMII mode.
> +          In case if it's supplied by PHY/SerDes or it's synchronous to
> +          the Tx clock this property can be omitted.
>        - description:
>            PTP reference clock. This clock is used for programming the
>            Timestamp Addend Register. If not passed then the system
> @@ -139,6 +151,8 @@ properties:
>        enum:
>          - stmmaceth
>          - pclk
> +        - tx
> +        - rx
>          - ptp_ref
>  
>    resets:
> -- 
> 2.29.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
