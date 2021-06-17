Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6593AB072
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 11:56:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73C2BC597B0;
	Thu, 17 Jun 2021 09:56:10 +0000 (UTC)
Received: from lb3-smtp-cloud8.xs4all.net (lb3-smtp-cloud8.xs4all.net
 [194.109.24.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C401C59780
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 09:56:07 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id tokll2ktChqlttokol03Pw; Thu, 17 Jun 2021 11:56:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1623923767; bh=sn759aJtkKVdyZtPUsdKiIGaaDc782nBKlFC8+/0BCg=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=COe6YrzHeUfruS5mF7O4oQslwUzLyhlQ48NSXpUXKuWpc5WWJwCRHxoq9DgbLtqBn
 iIvIj5tBmI1ZhUMvXVvtnVphBaaxwyC9eZKAhomuusn8mmVom75jZxRU5hGvUrU/hN
 ueWTSZhO2lsYc+nlEP+axeqSRAZjLHyjHJuZTqtXZnGMzHUj0GE9zeAdAGJJbDmRLk
 BQPhcck4qNOAQWE681IT65bYfgAlAVbgi+Y67DsJes6UbVecEfaBUWxvffu9s1yXWs
 STOHQSfkHA1ejuX3M9pBSwc7FHSm1aEMyD/qJhKToY651lpTgkJjDbIHpbKjLrNjL5
 5K/OuXM9TQXLg==
To: dillon.minfei@gmail.com, mchehab@kernel.org, mchehab+huawei@kernel.org,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
 <1621508727-24486-2-git-send-email-dillon.minfei@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0f3145ce-3a01-3a77-2b65-85450bf9d920@xs4all.nl>
Date: Thu, 17 Jun 2021 11:56:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1621508727-24486-2-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfKZ/8vYZsMKfy5XT9cFmXy4HeO2qsC/V3WkPyz7B36DxM96di6zumwxUBougCC6EByhNoRgZqZ8REIb9kFts/cYflP9N6yEJJXSgL7+cnpyL0o70RpuJ
 NoHPE0boo9ic0ONSg+8vPd0c+UI/0TkSZB7EahYHNH9p03txRyj4c8tgC9P+/FEJ5loZ+qGYIjnt/TMrYrnGvn7zjsHUtTmkHHxCN2MLCCSznfx1fAD/CD/M
 Gy3SEAo24WKx17d2G9wSfcSLur40RnmHEcBmReyfXadul7z+jWHwz02hCehQ7eBAvpOtirPtJD4cyc4wHCGmEzI95fiP7NbIiQnb6zVSUFn9YJR9Z9pvKxge
 BHWleMCeBTNvYY7g6wv3tqgZ5nofuTBR1i08sTSUtkQh24Vde8LV4XyNMj9ZD5+IcvBCvivDEkIUbxHgV2BfQpRYzWgXVFuwBNiPc2Ded5SIyrmmZio4txvx
 JbUIA0aArZbGSl8rK89FqblDTjp6vXfdrKYQU91EbKeS14Gck7h3lVN6S+JodmVS+Nv2G5jajw+ZvMb2x8sqfWEwDc8aWZIDCNmLqemLJ2iHhBCIhVm5crNq
 uzHTZRbQL5jBZBZmUHmYlpynCcr+XHX2Vyj0pFmoSztkuISwxFA/bpQBNb4c4GNnaklKgREv0+Hkw4PmJdPDNnlg/JBZ8AdEzf58n6TYWd6M+NrqksYWjNmj
 cpwa8ArguC6hl8rUCark07d9vOL70D9pfk8uTjvxlO4znPMpn/vLn8Btyqw4WFe4gNqUdbrHZjosPhHFkNHMa1P2kTmXgWI0n5h7bV3kwbZr3ued4AXEY4oi
 ZcgxX48TQAj073KjPqGmVFdzrgpjFICbMvfCvDxlTO90RP8tAGYckn8bisnm5w==
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/7] media: admin-guide: add stm32-dma2d
	description
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

On 20/05/2021 13:05, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> add stm32-dma2d description for dma2d driver
> 
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
>  Documentation/admin-guide/media/platform-cardlist.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/admin-guide/media/platform-cardlist.rst b/Documentation/admin-guide/media/platform-cardlist.rst
> index 261e7772eb3e..ac73c4166d1e 100644
> --- a/Documentation/admin-guide/media/platform-cardlist.rst
> +++ b/Documentation/admin-guide/media/platform-cardlist.rst
> @@ -60,6 +60,7 @@ s5p-mfc            Samsung S5P MFC Video Codec
>  sh_veu             SuperH VEU mem2mem video processing
>  sh_vou             SuperH VOU video output
>  stm32-dcmi         STM32 Digital Camera Memory Interface (DCMI)
> +stm32-dma2d        STM32 Chrom-Art Accelerator Unit

I have to ask: it is really 'Chrom-Art' and not Chrome-Art or Choma-Art?

It's probably correct, but I have to check this :-)

Regards,

	Hans

>  sun4i-csi          Allwinner A10 CMOS Sensor Interface Support
>  sun6i-csi          Allwinner V3s Camera Sensor Interface
>  sun8i-di           Allwinner Deinterlace
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
