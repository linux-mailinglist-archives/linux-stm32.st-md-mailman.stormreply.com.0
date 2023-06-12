Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB6A72CE80
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 20:34:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8740FC6A617;
	Mon, 12 Jun 2023 18:34:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8DFAC6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686594880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fA7PgHsHXUvTzj6r/c+oFo9WuyCUMyzAZAoI7rpa/bU=;
 b=jVBrBOQX3v/JJ/w78PsKXnN+310xNl5Bnw72/2X/fOtT8+0hChGQ5pFj4jHkpsHpcAXMKb
 jkE/eK7bAJUOhzhCH3KtJQLdy/bj56qtTvrCdGXGWNEDMPpDUm9enXych5yWQzPn4VhUe+
 j3BGjX7b6wpV+fnxkRP4G92thAeZA1g=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-HX-4tL3lMaaif457QY-jAw-1; Mon, 12 Jun 2023 14:34:37 -0400
X-MC-Unique: HX-4tL3lMaaif457QY-jAw-1
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-6b2940e84fdso3215091a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 11:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686594877; x=1689186877;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fA7PgHsHXUvTzj6r/c+oFo9WuyCUMyzAZAoI7rpa/bU=;
 b=jlaRtiIO6xGXiu0wigGxLwNj4d2kJvT+jI0tD1iG8ZvBh0zeOCrwt3xVEnvxe0TX+p
 IFO5toB6C4Oa3jeIfyyKOf/N3tB04oLd3lv/WZdyq4qQgnJ7srzdrzjBbHZ3F9UsN0h6
 GWKE3q9yQQQ/cCwQYugvDdks7Hvjo6G6wHyce6CtvOgX0jRq0rai4ziCI9TWL2GQIo0o
 QCEeuWf6S1Ts3w6oSiw8ZR3CHKxTtKsjGshRIN8CdY74vVnYsBmahAqhcqf+TPHRzLqP
 0wq6VzBYDDIchc+YruqgDGtFMHCLgecDmLZfZTdvsnB2X9msNXbNcbNmLByfvHDBgiuj
 Bkmg==
X-Gm-Message-State: AC+VfDyjO0MG5qR7+ApAyJdrvfROGcSwkB+lqa/uW5dixAvJaKEHAbSi
 qUEswLkOTSTVdl3XRBTCAWZAMFvbaeS6GPOeFr9V4hrY3+SwpUu/NoNxh/ynVkGOZ2jvo+AX9r8
 A+TWxZFbfhxRZQ/2Bxsdx/Ytw0TNDfWp0UEqok9w/
X-Received: by 2002:a9d:6299:0:b0:6b2:b82c:1418 with SMTP id
 x25-20020a9d6299000000b006b2b82c1418mr6159654otk.9.1686594876850; 
 Mon, 12 Jun 2023 11:34:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ71QwPMhZSycXjuAG8mCHe8g88dFSFJqGDZsnw2ZprTbOlJNax+lvJcUSmy8K0z+ff8r52HsQ==
X-Received: by 2002:a9d:6299:0:b0:6b2:b82c:1418 with SMTP id
 x25-20020a9d6299000000b006b2b82c1418mr6159634otk.9.1686594876618; 
 Mon, 12 Jun 2023 11:34:36 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a056830019500b006b2a31ec95dsm4137128ota.65.2023.06.12.11.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 11:34:36 -0700 (PDT)
Date: Mon, 12 Jun 2023 13:34:33 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612183433.ii23wc2yie5n25vs@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-8-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-8-brgl@bgdev.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 07/26] net: stmmac: dwmac-qcom-ethqos:
 tweak the order of local variables
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

On Mon, Jun 12, 2023 at 11:23:36AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Make sure we follow the reverse-xmas tree convention.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 16e856861558..28d2514a8795 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -594,9 +594,9 @@ static void ethqos_clks_disable(void *data)
>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> +	const struct ethqos_emac_driver_data *data;
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
> -	const struct ethqos_emac_driver_data *data;
>  	struct qcom_ethqos *ethqos;
>  	int ret;
>  
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
