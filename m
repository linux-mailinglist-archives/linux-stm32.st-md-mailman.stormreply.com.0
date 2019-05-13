Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF71BC8F
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 20:02:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDCF2C35E08
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 18:02:50 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C88EC35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 18:02:49 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id z65so2819295oia.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 11:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/XhxD4qfD0ns8reknvj9RpAcHKvugYCkDKZURXupK5s=;
 b=KtxTBHxeTdmnqCSM3EJtab6WuRgk/UKZ7QfdMqt19UlIM3kgC262vDnhiFF9Y9vonH
 hoycmCSNV65GCVWJOfUKOABI/5fi3Swzh47uaLSfNNy00idV7OpZhZm0WIFjBqI0savJ
 bweAqonGbGMM/FhO1DGIT87DKjfMjdHdQPoeZl4c+Zknrhr5EGjzapexhZQrKkEAGoBi
 mti8D8qiTkh/bURQWSFMrw18Lv6avK3T2wdXWrlPNfwAaLNWH3HD2IYrXw3ksPk8EtJL
 OBTn1JXcNKjECxQbzmDepdmaqlY725tBANuhdQiZ0LiiPGbRel6cesLNIRtItL2CYOqx
 qz5A==
X-Gm-Message-State: APjAAAXaC2ZuN0KVocuNhG9rWMal183jm6Vyv9Pu7XkV1TT2Pek20azs
 zDHysiYXG7s3sbtN9AQXvw==
X-Google-Smtp-Source: APXvYqx+ua4Ihwv0KGSXt2vA9ULzrBLsnrobys6zGYP5eS/LZsAKrESt0LAOr0df0+FCAMzvi5AZjQ==
X-Received: by 2002:aca:bd09:: with SMTP id n9mr301808oif.56.1557770567715;
 Mon, 13 May 2019 11:02:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y3sm5243396oto.58.2019.05.13.11.02.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 11:02:46 -0700 (PDT)
Date: Mon, 13 May 2019 13:02:46 -0500
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <20190513180246.GA8487@bogus>
References: <20190506100534.24145-1-manivannan.sadhasivam@linaro.org>
 <20190506100534.24145-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506100534.24145-2-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: arm: stm32: Document
 Avenger96 devicetree binding
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

On Mon, May 06, 2019 at 03:35:32PM +0530, Manivannan Sadhasivam wrote:
> Document devicetree binding for Avenger96 board.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.txt b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> index 6808ed9ddfd5..eba363a4b514 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> @@ -8,3 +8,9 @@ using one of the following compatible strings:
>    st,stm32f746
>    st,stm32h743
>    st,stm32mp157
> +
> +Boards:
> +
> +Root node property compatible must contain one of below depending on board:
> +
> + - Avenger96: "arrow,stm32mp157a-avenger96"

With which SoC compatible?

> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
