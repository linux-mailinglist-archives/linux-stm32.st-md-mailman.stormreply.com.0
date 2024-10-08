Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E62DB995075
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2024 15:42:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89E82C7128F;
	Tue,  8 Oct 2024 13:42:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCA61C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2024 13:42:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 64EDD5C5A60;
 Tue,  8 Oct 2024 13:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46B5C4CEC7;
 Tue,  8 Oct 2024 13:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728394922;
 bh=PLTW4wEi44inD24SGOxcygZQ8NsHLs+KSu6NJQ0Niyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B8BWrc0HIy0mUEVmvruHx9Wg4rdjAjooMw9gKa0BsYGeyQPy5nVG/mJO19OAeqUTr
 RZvlalK+CCdOUrzeF2LVsqGJPps2pF7umzScMSogqyAoM0EPgrgRCbLooKirBI9dA+
 WUp/WqunEg2rmMr+l96oVjppKcokvacmlF5oGdm97YycsNq9uW5JZ2ji6VDRoEOmgl
 Gr6mo9tJmksNFGKD3Ip4xD9gEeuOuhJPa+WOlsKgC6pR+o2tXGw5UMSz+wW9TkNqgQ
 eb67xO/bt1HeuBx3rqMtsbVhVw+3yWpZxs2qGW0Z9ZctlAjM3oFjWTv898DG7Ha0f/
 YAbv5AFYnQ29g==
Date: Tue, 8 Oct 2024 15:41:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <lu252oltrh6bftg2e4hpthazd4r3lwbd75mboezhz7f4bbfdip@w5k4jx6oyyzx>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-12-e3fd0ed54b31@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-12-e3fd0ed54b31@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 12/15] dt-bindings: media: addition of
 stm32mp25 compatible of DCMIPP
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

On Tue, Oct 08, 2024 at 01:18:14PM +0200, Alain Volmat wrote:
> Addition of the stm32mp25 compatible for the DCMIPP.

"Add"
See submitting patches.

> The stm32mp25 distinguish with the stm32mp13 by the fact that:
>  - supports also csi inputs in addition to parallel inputs
>  - requires an addition csi clock to be present
> 
> The commit also adds access-controllers, an optional property that

"Add", see submitting patches.

> allows a peripheral to refer to one or more domain access controller(s).
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../devicetree/bindings/media/st,stm32-dcmipp.yaml | 53 +++++++++++++++++++---
>  1 file changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> index 87731f3ce7bd..bda28fef0b78 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> @@ -10,9 +10,40 @@ maintainers:
>    - Hugues Fruchet <hugues.fruchet@foss.st.com>
>    - Alain Volmat <alain.volmat@foss.st.com>
>  
> +allOf:

Please put allOf: like in example schema, so after required:.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
