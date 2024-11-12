Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 084A09C62B1
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 21:39:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1EC1C78F85;
	Tue, 12 Nov 2024 20:39:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5275BC78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 20:39:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E3A165C58A2;
 Tue, 12 Nov 2024 20:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76B9C4CED7;
 Tue, 12 Nov 2024 20:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731443972;
 bh=Cz4bRV94/5MKAskZbYAn+TUSR0LBQP5CIfaO0PQZ+eA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Ff1apUwpOiGPDm+i+5r5B3s5dmMB2dJgxctx3edd+b8FqF8Nq3n93rQlg+41y6zOA
 EPwhloVc6oGbcSWc3w0fax5DWB8hXhLMxLQJDc4PLLIMp5u3XuwJGwYPr+k0fxj1JN
 TvpI1koK8FK9Jz1qa6gsTyhc3PzbzilN2ZW+SDXjPgB15ms1yNhVgTOmpQE8s7gjNQ
 CYy8yCHHLYst8fgwZop0vbGlqErCDK4gxLXQdkg4avOvz8LJtuxCVfYTHZF2biblwf
 5JfB0NGw1U2oK8kbGhKypOx4xWcXZKafm1zqdSAGge/7VCqmssFPjEgxVbe5+4yk3k
 Gp8simaEgiFCg==
Date: Tue, 12 Nov 2024 14:39:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20241112203931.GA1858001@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241112161925.999196-6-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, manivannan.sadhasivam@linaro.org,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/5] MAINTAINERS: add entry for ST
	STM32MP25 PCIe drivers
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

On Tue, Nov 12, 2024 at 05:19:25PM +0100, Christian Bruel wrote:
> Add myself as STM32MP25 PCIe host and PCIe endpoint drivers

s/as STM32MP25/as maintainer of STM32MP25/

> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4803908768e8..277e1cc0769e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17912,6 +17912,13 @@ L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  F:	drivers/pci/controller/dwc/pci-exynos.c
>  
> +PCI DRIVER FOR STM32MP25
> +M:	Christian Bruel <christian.bruel@foss.st.com>
> +L:	linux-pci@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/st,stm32-pcie-*.yaml
> +F:	drivers/pci/controller/dwc/*stm32*
> +
>  PCI DRIVER FOR SYNOPSYS DESIGNWARE
>  M:	Jingoo Han <jingoohan1@gmail.com>
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
