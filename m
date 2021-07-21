Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFFE3D1548
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jul 2021 19:42:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CC7BC5A4C0;
	Wed, 21 Jul 2021 17:42:50 +0000 (UTC)
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1874C597BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 17:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TjEvLNNHsaSMgTUGcuTFfcltWUToJtf32CG/+sem9oM=; b=RWW2ghceWcYcdYf59J7wku4SgX
 asTxnafzEldcqxfOMw1hGEdAJbe/ScWiax0dQA7D85esoVmpNgp8d4+5kXxKOvvLby8ISnjRMFJXW
 HpX2W4ASw/7bu60u3IoHBLTlRxbEyA1chCshKjtqylSh896BX9g7YHb7zYSUGLBDYkgUwNoAphm/7
 CBk3LLu6hK8QLzH0PGJDJkrVlqZVHCbe9yav+wQ+dQPlIFCGpZP5SRe7miyZOr4cYWO+lNXjDL9rv
 79wdYqYXlLNb52v/tXFO+VlJeXhMkMkk0lNl6C0tWfeFIvsTOiHpDKFpTY7m7HsMTo4/UE+KIukTK
 TdpPnndg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61963
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1m6GF5-00034t-Ej; Wed, 21 Jul 2021 19:42:47 +0200
To: dillon.minfei@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <8e091b9c-764d-d410-559e-3c5e25de2a3c@tronnes.org>
Date: Wed, 21 Jul 2021 19:42:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] drm/panel: Add ilitek ili9341
	panel driver
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



Den 21.07.2021 09.41, skrev dillon.minfei@gmail.com:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> This driver combine tiny/ili9341.c mipi_dbi_interface driver
> with mipi_dpi_interface driver, can support ili9341 with serial
> mode or parallel rgb interface mode by register configuration.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---

> +static const struct of_device_id ili9341_of_match[] = {
> +	{
> +		.compatible = "st,sf-tc240t-9370-t",
> +		.data = &ili9341_stm32f429_disco_data,
> +	},
> +	{
> +		/* porting from tiny/ili9341.c
> +		 * for original mipi dbi compitable
> +		 */
> +		.compatible = "adafruit,yx240qv29",

I don't understand this, now there will be 2 drivers that support the
same display?

AFAICT drm/tiny/ili9341.c is just copied into this driver, is the plan
to remove the tiny/ driver? If so I couldn't see this mentioned anywhere.

Noralf.

> +		.data = NULL,
> +	},
> +};
> +MODULE_DEVICE_TABLE(of, ili9341_of_match);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
