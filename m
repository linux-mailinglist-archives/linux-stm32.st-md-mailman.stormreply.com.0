Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EA1A9BEA
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2019 09:33:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 317ACC35E01;
	Thu,  5 Sep 2019 07:33:19 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE314C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2019 06:15:43 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id 82so214872vkf.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2019 23:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lxv2YjVDy5w6AQ+Z95Jd1OHt1865rQWbHzl1H0ckHb4=;
 b=IurRXFpodLHrXjhNeDu0PBjJR6aKmlNT/dzeEONMU1V5mjYfCIsKTQIXkLXspZuRLT
 SO2IeUW73ig0y4hTpIc1LeJScYwe/7jF3x1ItS7fkoJd9YSTWsUH2sI/3COuK4II6o/r
 +Kj20DSoITETteLabp2V7jA4ju9DbWda2nuGTSuEzhZ1KGohbqZEVKqkpRJCAhcLSXD9
 kEdWKNMJEgbkZzacsvDJtyDbgG7jhbcfx/K1U5vEhgoviC+KwrwJF0gUE3d7mSshVMHg
 A0LYcz1miwyWZt1OUA9B7KkZFPklzUWf8pMOs0ddGs8nwCkutop0K9qwCxD0ooyRsoi+
 ohUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lxv2YjVDy5w6AQ+Z95Jd1OHt1865rQWbHzl1H0ckHb4=;
 b=li/Txoi1X31tK7ADY335GjDGbQIBtg4B585PYZx709mHWN51dpWzJI2eMQO+OhX7kz
 CFCW1ZbI6WKW3+UAXL6hrV1FZQ8ZjIhLTX/P5SHbcOibPA8IUo5ZsVXQ0d5mBM7bKUc4
 bfw8sx6PsPGEIOuCdzu1cIfNWydMc6H20nhkNrIu7nHZYapOy/sPlh7W8Uf3l1DA+iDl
 rmw2Kn62blJlppzgwyJKnTJs9FsufUM9t0vYplZQa3dPdQ3bIHvB13vHPwO/bWUjHZXH
 V9SO/yha1xobujQqrVxuKJrekeyV54JgK/MvpvDTZSDH6WW2bsfai0+v+IOEJE9tKveX
 jfqQ==
X-Gm-Message-State: APjAAAWFKJ8l0feE2ov6AjPmKh3kk00wSrizCmjNx/TM34+ammBwlTVE
 x38y7sxfaM/H9uT/iOriCbTaSljfRalLHLeMi0Q+7g==
X-Google-Smtp-Source: APXvYqwVi7szQ+w3nsCf0zPQZyYdR4HeVO1GXvtz/sWMMhtS2v2QWLsWh3Ip3Jb3oWwBQ9pfzHwoVyT/iOmN8ovRJtE=
X-Received: by 2002:a1f:4981:: with SMTP id w123mr690507vka.13.1567664142296; 
 Wed, 04 Sep 2019 23:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190904122939.23780-1-yuehaibing@huawei.com>
 <20190904122939.23780-9-yuehaibing@huawei.com>
In-Reply-To: <20190904122939.23780-9-yuehaibing@huawei.com>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Thu, 5 Sep 2019 11:45:30 +0530
Message-ID: <CAHLCerOVuNEAkCggBoDU4NgbzhTVxpdJXeTXVrTs5tp7ZVtSMg@mail.gmail.com>
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:33:18 +0000
Cc: mans@mansr.com, Markus Mayer <mmayer@broadcom.com>,
 Eric Anholt <eric@anholt.net>, miquel.raynal@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 f.fainelli@gmail.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
 phil@raspberrypi.org, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, rjui@broadcom.com,
 Eduardo Valentin <edubezval@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, gregory.0xf0@gmail.com,
 Matthias Brugger <matthias.bgg@gmail.com>, horms+renesas@verge.net.au,
 talel@amazon.com, lakml <linux-arm-kernel@lists.infradead.org>,
 sbranden@broadcom.com, wsa+renesas@sang-engineering.com,
 gregkh@linuxfoundation.org, Linux PM list <linux-pm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, wahrenst@gmx.net,
 mcoquelin.stm32@gmail.com, Jun Nie <jun.nie@linaro.org>,
 computersforpeace@gmail.com, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH -next 08/15] thermal: tsens: use
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

On Wed, Sep 4, 2019 at 6:05 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  drivers/thermal/qcom/tsens-common.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> index 528df88..43ce4fb 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -155,7 +155,6 @@ int __init init_common(struct tsens_priv *priv)
>  {
>         void __iomem *tm_base, *srot_base;
>         struct device *dev = priv->dev;
> -       struct resource *res;
>         u32 enabled;
>         int ret, i, j;
>         struct platform_device *op = of_find_device_by_node(priv->dev->of_node);
> @@ -166,8 +165,7 @@ int __init init_common(struct tsens_priv *priv)
>         if (op->num_resources > 1) {
>                 /* DT with separate SROT and TM address space */
>                 priv->tm_offset = 0;
> -               res = platform_get_resource(op, IORESOURCE_MEM, 1);
> -               srot_base = devm_ioremap_resource(&op->dev, res);
> +               srot_base = devm_platform_ioremap_resource(op, 1);
>                 if (IS_ERR(srot_base)) {
>                         ret = PTR_ERR(srot_base);
>                         goto err_put_device;
> @@ -184,8 +182,7 @@ int __init init_common(struct tsens_priv *priv)
>                 priv->tm_offset = 0x1000;
>         }
>
> -       res = platform_get_resource(op, IORESOURCE_MEM, 0);
> -       tm_base = devm_ioremap_resource(&op->dev, res);
> +       tm_base = devm_platform_ioremap_resource(op, 0);
>         if (IS_ERR(tm_base)) {
>                 ret = PTR_ERR(tm_base);
>                 goto err_put_device;
> --
> 2.7.4
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
