Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D5C4E61A3
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Mar 2022 11:19:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C646C60497;
	Thu, 24 Mar 2022 10:19:58 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1984C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 09:38:20 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-d39f741b2bso4397509fac.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y7FIzF9vShJDyNSTAI9Bl+NsBsiiQpO5BNc3AiMxftk=;
 b=ySe6RJRCAPeeLMB9SnC6/a97PstVNOtFinmQGKjn4YHaVL5NF/NRb1UE0H5QkUUNvC
 0I4WCRX0oOxH9jch86Tf3ubEmYnn8Ogc5SVYD8hp0IBZ4AVOXnNZdjEXADL4uTErQS8Z
 hJIs38kB4wWnvCaRW2cNFiIa1GLWSUdlQNA2A7zJkUDRlVgcvEgckZ//dyLusfEbRDEK
 MzMiCFGieWDb974RyoZxZsC/zMu4JfHhA06g5iGNywzu+Ufqn5L3lgCBe5xaT9hWhtdI
 YRkdcexVpMd2wAN5ml3iEKn8lC9hd8ABjp9X4RKVsG6XT7ueMz6uJTsHF5iBikpCHu2j
 qiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y7FIzF9vShJDyNSTAI9Bl+NsBsiiQpO5BNc3AiMxftk=;
 b=I6EBrmEa9q57t83ufJQrfzLAhih+BHzZ6hb9R1kOv88OAnTEOrZzsJcbdW5EtdA7gd
 tez15eH+uvRu9qys/SgkRaBpfP91rZHBrkhaZ6QiuaIFAu7x0HlDSI5OZvjA0dKHn4H2
 pHhQbp23SKF2489l95V3q+JMozYQ3072gFL9zmkUmCBOQ8LGlpuGQH6YCCBL+HbvtIU8
 oyaMJcQ2kVt4aZV5emHiAvYjQBKn3OaNp4iQtgCrt/Va673tBvjewVpODPwiV/7kPpkp
 PbVwHK250ehg3Q9qpuoASOgRF8OGniuB5UGwj/ubvPmi/ulvVNVux8q0WzXMTRjxvlg8
 8ebQ==
X-Gm-Message-State: AOAM5326ZD0tn5WhvLXcH4y/zqaYd13zbacYXmgJzFf2bNI7Rh3YUxtV
 dWirXZQIRUWb3QGb7k8oSXxBQA3FfLHmSB2jNJ69pA==
X-Google-Smtp-Source: ABdhPJx9d8KNFjQ1KjbzrfhhF8oZEjO5RdYVRlSeAkVF4UbZuvbD20l0AoemyJKpQ/mIycuE738SW9E4BfAPPRXeC1o=
X-Received: by 2002:a05:6870:3323:b0:de:282:34f0 with SMTP id
 x35-20020a056870332300b000de028234f0mr1941298oae.147.1648114699587; Thu, 24
 Mar 2022 02:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220323033255.2282930-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220323033255.2282930-1-bjorn.andersson@linaro.org>
From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date: Thu, 24 Mar 2022 15:08:08 +0530
Message-ID: <CAH=2NtyChidtrBVBL=RNjPaYYmtTuN0N4fbMx4DRBD6hXxHguQ@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
X-Mailman-Approved-At: Thu, 24 Mar 2022 10:19:57 +0000
Cc: linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 stable <stable@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable
 RGMII functional clock on resume
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

+Cc: stable tree as I think this is an important fix for stmmac
dwmac-qcom-ethernet driver and affects ethernet functionality on QCOM
boards which use this driver.

More below..

On Wed, 23 Mar 2022 at 09:01, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> When the Qualcomm ethqos driver is properly described in its associated
> GDSC power-domain, the hardware will be powered down and loose its state
> between qcom_ethqos_probe() and stmmac_init_dma_engine().
>
> The result of this is that the functional clock from the RGMII IO macro
> is no longer provides and the DMA software reset in dwmac4_dma_reset()
> will time out, due to lacking clock signal.
>
> Re-enable the functional clock, as part of the Qualcomm specific clock
> enablement sequence to avoid this problem.
>
> The final clock configuration will be adjusted by ethqos_fix_mac_speed()
> once the link is being brought up.
>
> Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 0cc28c79cc61..835caa15d55f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -487,6 +487,13 @@ static int ethqos_clks_config(void *priv, bool enabled)
>                         dev_err(&ethqos->pdev->dev, "rgmii_clk enable failed\n");
>                         return ret;
>                 }
> +
> +               /* Enable functional clock to prevent DMA reset to timeout due
> +                * to lacking PHY clock after the hardware block has been power
> +                * cycled. The actual configuration will be adjusted once
> +                * ethqos_fix_mac_speed() is invoked.
> +                */
> +               ethqos_set_func_clk_en(ethqos);
>         } else {
>                 clk_disable_unprepare(ethqos->rgmii_clk);
>         }
> --
> 2.33.1

Thanks for the catch, Bjorn. I tested this on the SA8155p-ADP board
and the eth interface can be moved from 'on' to 'off' state and
vice-versa properly after this change and we no longer need the EMAC
GDSC quirk, so:

Tested-and-Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Regards.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
