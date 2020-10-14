Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE428E4DD
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 18:51:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28A96C424AF;
	Wed, 14 Oct 2020 16:51:28 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30E38C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 16:51:26 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w21so145207pfc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0oKd/1+Q49pwBEic+j1QGYF+5cG+STAkikN4kllIFis=;
 b=WpXfutAzKSb8AwlyKEbbrghfkcSB7k9AL+h07lEQEaZh1JMnxbsOzfEdql8BJsw0AK
 zAY4oNLRQ46zuvgRYLjmZaA7DY2JdcJWwAuSgMq/VGmX2baResgV4wYE40yUGQhepKBL
 gHIG87e6uDjv5VK46UVTRf8gwbs36NnMz3LDJuiL2NcN06VktehgQQRD73/rYb2/2Bp9
 T3qhJKZr1bE5ms4+5reFbCR+JUrkCvxZp/l2+Tgng8uS0eqBG8wGl/L4evH4UH5CfpP0
 quIjd6v8H9E2pzXFV+72SC+wtwBguzysisyXSZF1AehfVB8BhZgt+ZeY2eZu8eZF82t4
 oebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0oKd/1+Q49pwBEic+j1QGYF+5cG+STAkikN4kllIFis=;
 b=g+PHP7ioexAGM630FWxEit5NEsxWqHYB9CAJqjJKlUI6qHtbJNC9Xf8ql/czAUru9h
 6EqzRf0ElihRH4MtfMmNykhP9j0yHTKRFuISVu3NXe8Po5uVhIDhouispJP1Zj4AN5SU
 broEjPQEUwEqEeKNJ1JFLBc/Pu9P/4qf+oFCwydHTFQsG8lEIMwgEGUdD3oXbfm5kjb+
 2HLtEFblnOTAa+GbB6v1FDmEyvhYKpjduuYmYYJ/ENsilf8MJnB8n9p9HMMD2al+KDCb
 iRhyM+U1Y8frFz+MUF2attaWGlaDYZ7t+gztszR7qmaN8AW5XycMeAk66xC0lCEUuX+D
 3iJQ==
X-Gm-Message-State: AOAM532Dj/m9RkvsYtIYtY3GIedo5UU7BUVApN1tsc4jYJKs5cUIZp1j
 Aezgb+h29N2aAgLOet++IOLvCw==
X-Google-Smtp-Source: ABdhPJyF+kMGcVCJWKBQTvA0HeUTDn2r3CiRgsDWATdxaTcjHEJZMUafV6IesWwPvzCk/d3d5GUc8A==
X-Received: by 2002:a62:6507:0:b029:155:3b11:b458 with SMTP id
 z7-20020a6265070000b02901553b11b458mr216999pfb.45.1602694284480; 
 Wed, 14 Oct 2020 09:51:24 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id j1sm94318pfj.202.2020.10.14.09.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 09:51:23 -0700 (PDT)
Date: Wed, 14 Oct 2020 10:51:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20201014165121.GA1406857@xps15>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
 <20201014125441.2457-5-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014125441.2457-5-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/4] ARM: dts: stm32: update stm32mp151
 for remote proc synchronization support
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

On Wed, Oct 14, 2020 at 02:54:41PM +0200, Arnaud Pouliquen wrote:
> Two backup registers are used to store the Cortex-M4 state and the resource
> table address.
> Declare the tamp node and add associated properties in m4_rproc node
> to allow Linux to attach to a firmware loaded by the first boot stages.
> 
> Associated driver implementation is available in commit 9276536f455b3
> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation").
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  arch/arm/boot/dts/stm32mp151.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index bfe29023fbd5..842ecffae73a 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1541,6 +1541,11 @@
>  			status = "disabled";
>  		};
>  
> +		tamp: tamp@5c00a000 {
> +			compatible = "st,stm32-tamp", "syscon";
> +			reg = <0x5c00a000 0x400>;
> +		};
> +
>  		/*
>  		 * Break node order to solve dependency probe issue between
>  		 * pinctrl and exti.
> @@ -1717,6 +1722,8 @@
>  			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
>  			st,syscfg-tz = <&rcc 0x000 0x1>;
>  			st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
> +			st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
> +			st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;

Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  			status = "disabled";
>  		};
>  	};
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
