Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 585011D282E
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 08:53:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01795C3F93D;
	Thu, 14 May 2020 06:53:15 +0000 (UTC)
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA628C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 06:53:13 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id j127so501142vke.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2020 23:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=verdurent-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AD73/gyPw537Xp1vDJOYvLHr7JMtBDUrFsijP0WuRks=;
 b=RdSLSskx2Wvw3alRl86UnDw5dnN1+ZHo+jEuOiDqNYvb3EfRrfuQ1fjHd8pEofVcmx
 OSOsg5Ki+jgXdahzTq8BYmydYLkEp/D/1CWEiD9WIoLB/oyMT0/XdOe73UgI9Xo/PX8Z
 vAsKTrb1XOhLWFCweUDfv5clUyY9/Ct0OqoS4jylDHfwnX2dZaBf96hPr9UjJyc9qJ54
 LfhUMigof8LCnYdiDSe3krEkaZ0cdi5WNh7X76KkQjTeQbosgpRBGY0UM/FYTbyUC8gZ
 fAmJrAfp1zGCiCU5/M/YWEfBTBFrgSdaXqABtBbjTfwTGLLBBjxmcCGYThD0EubKLklL
 Y/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AD73/gyPw537Xp1vDJOYvLHr7JMtBDUrFsijP0WuRks=;
 b=jb6CWhQTv/HobTMKaq4MgsyFRAmIZUREjPL+WtS7HM6oqnhrcD/EUXZpoqjVVTycPb
 E6iHxnreJmcVZx46FMZ+e8cimSiluByImwi9ePf8yyQH9t0kPLvYbQRA8keRCpampeJU
 k5hqrbzMVfyCyfxBu6E5g3s70nV0JUpAYPc2nketd2ss1ezGTpGaoI5vSg5qN3gRKpyV
 gTKM6dTzCKpTKLMGq6Wfl8EMVWtZocirpcJG7rVo1P85HyoGpebGvj4NYL+AYXsH9Omm
 rSfen7rPbLqyrlvbHtv2H0vwHq/S8+cffW9Swsc/0P/izxizWeT/gMr/Ynz2P4bOppXf
 lgEA==
X-Gm-Message-State: AOAM533VCl6lKRwkWlDJAGft6+j/8PIlDHhVV1Y4Ci/Tg+WZciZ36dW/
 LmnEQYzplCn1lDHDINATAM+jmjRpgU7MrTNdvnRNXQ==
X-Google-Smtp-Source: ABdhPJwqOdHWX9G/Vc1PEWvZMXQ69dsTzV+tAJwC+UvjMCX5pJg7UnTD2qxWptjx7wEK5anGtRzdU/mrdZoXOnfLCtw=
X-Received: by 2002:a1f:a786:: with SMTP id q128mr2448341vke.86.1589439192297; 
 Wed, 13 May 2020 23:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200514062836.190194-1-vkoul@kernel.org>
In-Reply-To: <20200514062836.190194-1-vkoul@kernel.org>
From: Amit Kucheria <amit.kucheria@verdurent.com>
Date: Thu, 14 May 2020 12:22:33 +0530
Message-ID: <CAHLCerN_pxkqJojJLL5ztbYCeFZ9Mco6oM-=0mdmh5iSydxrUg@mail.gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rahul Ankushrao Kawadgave <rahulak@qti.qualcomm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 lakml <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix num_por initialization
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

On Thu, May 14, 2020 at 11:59 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> Driver missed initializing num_por which is por values that driver

Nit: s/is/is one of the/ ?

> configures to hardware. In order to get this values, add a new structure

Nit: s/this/these

> ethqos_emac_driver_data which holds por and num_por values and populate
> that in driver probe.
>
> Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
> Reported-by: Rahul Ankushrao Kawadgave <rahulak@qti.qualcomm.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Otherwise,

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e0a5fe83d8e0..bfc4a92f1d92 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -75,6 +75,11 @@ struct ethqos_emac_por {
>         unsigned int value;
>  };
>
> +struct ethqos_emac_driver_data {
> +       const struct ethqos_emac_por *por;
> +       unsigned int num_por;
> +};
> +
>  struct qcom_ethqos {
>         struct platform_device *pdev;
>         void __iomem *rgmii_base;
> @@ -171,6 +176,11 @@ static const struct ethqos_emac_por emac_v2_3_0_por[] = {
>         { .offset = RGMII_IO_MACRO_CONFIG2,     .value = 0x00002060 },
>  };
>
> +static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
> +       .por = emac_v2_3_0_por,
> +       .num_por = ARRAY_SIZE(emac_v2_3_0_por),
> +};
> +
>  static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  {
>         unsigned int val;
> @@ -442,6 +452,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>         struct device_node *np = pdev->dev.of_node;
>         struct plat_stmmacenet_data *plat_dat;
>         struct stmmac_resources stmmac_res;
> +       const struct ethqos_emac_driver_data *data;
>         struct qcom_ethqos *ethqos;
>         struct resource *res;
>         int ret;
> @@ -471,7 +482,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>                 goto err_mem;
>         }
>
> -       ethqos->por = of_device_get_match_data(&pdev->dev);
> +       data = of_device_get_match_data(&pdev->dev);
> +       ethqos->por = data->por;
> +       ethqos->num_por = data->num_por;
>
>         ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
>         if (IS_ERR(ethqos->rgmii_clk)) {
> @@ -526,7 +539,7 @@ static int qcom_ethqos_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id qcom_ethqos_match[] = {
> -       { .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_por},
> +       { .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
> --
> 2.25.4
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
