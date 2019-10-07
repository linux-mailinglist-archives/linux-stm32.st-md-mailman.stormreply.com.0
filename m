Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E8FCED1A
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 22:01:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A4DFC36B0C;
	Mon,  7 Oct 2019 20:01:35 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 479ACC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 20:01:34 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id i185so12776703oif.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Oct 2019 13:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lvKxDCEdVgPdg3NBubDuHJYxBHQHsF+19QqSBENKigs=;
 b=ldZWZLPYdSK/lW58g3GggUrvVCJd1bSherkZ3i1sSTYmEWn8xkwIcVHcmZ3icueHQp
 oy5jhaY7EWxyWVR9117SxscpYTuLMHxESfnKRG8OiuTaUqvhUU6ovZmkM9O2vxxFt+eU
 j1Ahl1lPiieioT2lbA364gHNXQWxIF0DgKTKQLSIoQ9sNQu3MyZJlIheMi1AbflSbGt4
 FMBBws1iMdul9gqqFEcvBoTYYrPIjtJ8f054Son5rjx4xSysmRjtnZZEtvqD1noCgWOm
 IoXuRgR8rfAJ12qdkaYZR+biJvf7tEDnz8LaI7EH80M+v2A1gn7VKk1h0BWgQr+cPfKB
 CGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lvKxDCEdVgPdg3NBubDuHJYxBHQHsF+19QqSBENKigs=;
 b=evhLwjrPvo99jF+ypfY6c8WLbUlR4za97ytcmq4ECVSy59qjdktjjdDHEzs1vMc4JK
 4I9QE+PdkgzeHA6eOj88T4uujNmcqAAkcNa1BgkY4TQu75qYSlPFcrBVgJmLh1QWk/CX
 HaEiQL+3U5LULTd3ZZOYSkyC6JsHfbScSJnV+YDlO0sUIuWEw4Y/6HAHKjQz++KgwxdZ
 A2PNR6qfMoZf+HJZGabOjqWWD7UGrE/0y71QdnTtkeLclHWteNNx386z1njYlRKezkcq
 TAlCs2XWdheOXR6ilAKLcJwBNg1T6m7GXs3bdNTejdXoj4ibcx9H9LsIsjyGB94NgScU
 mmGw==
X-Gm-Message-State: APjAAAWMeUSaxKsP73N3yLqD81Ci6UH/7LxyJQpFl8BVsWxdnQrPex5h
 H5lIpF4+jPyJneewLfHkJjkoYYoC8Wcy7u4yl58=
X-Google-Smtp-Source: APXvYqxw4MwTHhEk1nJATSbu3GLXbTfDZIxzJF0EPb2WPk2JVoRBmvrn3TlNb7LKr7TGaqwsqjCfogj/ATlyGhjt7wk=
X-Received: by 2002:aca:d90a:: with SMTP id q10mr851452oig.129.1570478492843; 
 Mon, 07 Oct 2019 13:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191006102953.57536-1-yuehaibing@huawei.com>
 <20191006102953.57536-17-yuehaibing@huawei.com>
In-Reply-To: <20191006102953.57536-17-yuehaibing@huawei.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 7 Oct 2019 22:01:21 +0200
Message-ID: <CAFBinCD+DSDoPiza2KKJAB_s6793ZeCZ6vjb5Zx9y0Cdz0mGjA@mail.gmail.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, baruch@tkos.co.il, paul@crapouillou.net,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com, michal.simek@xilinx.com,
 linux-rtc@vger.kernel.org, f.fainelli@gmail.com, khilman@baylibre.com,
 wens@csie.org, jonathanh@nvidia.com, ludovic.desroches@microchip.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, slemieux.tyco@gmail.com,
 sean.wang@mediatek.com, mripard@kernel.org, vz@mleia.com,
 linux-mediatek@lists.infradead.org, gregory.0xf0@gmail.com,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 a.zummo@towertech.it, andrew@aj.id.au,
 linux-stm32@st-md-mailman.stormreply.com, nicolas.ferre@microchip.com,
 linux-kernel@vger.kernel.org, linux@prisktech.co.nz, mcoquelin.stm32@gmail.com,
 computersforpeace@gmail.com
Subject: Re: [Linux-stm32] [PATCH -next 16/34] rtc: meson: use
 devm_platform_ioremap_resource() to simplify code
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

On Sun, Oct 6, 2019 at 12:38 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for taking care of this!


Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
