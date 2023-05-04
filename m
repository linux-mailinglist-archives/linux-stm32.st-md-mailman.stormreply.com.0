Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E98D6F6986
	for <lists+linux-stm32@lfdr.de>; Thu,  4 May 2023 13:07:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FE72C6A5EE;
	Thu,  4 May 2023 11:07:49 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C8B3C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 May 2023 10:54:01 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-304935cc79bso238320f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 May 2023 03:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683197641; x=1685789641;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mak+/8tgM9Xe43QF0nYG9nprPJsIfRVjt1FrrJwmdlk=;
 b=RlNErPiKKcMDkTbpO4JaG2wnYArrg+tuU/Ka9mdSgk+28sBApqk/2xIpimVPk79Zod
 XOH5JhD8EMp7g4iLyxa+NHWHOhzAaTQnO8mzFujTXrxbEeZsdjjHWsmsZt2rgm/yusth
 DYpkZdUTytYKIZS5rLHW3PQftngkw8mIatZUxLEhYLYs3/8NHMwncOQ64GFJsFHG6/YL
 HqMUQZIIWkDPA+P+i0RR671cfK+3mLAnMNFY2dWb4flDKp8e0DiyYqr29iuiuCwYuK5h
 zudBLkm4DnFHaWRNYpCLkURaRQJUqvoa2OwFo4QwWeUNFVJnGmL/9udqUXOLJmquV9Dm
 uQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683197641; x=1685789641;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mak+/8tgM9Xe43QF0nYG9nprPJsIfRVjt1FrrJwmdlk=;
 b=OaA0maI2mRyqXuMGpuJ1ubgyj9Vf06q4MnNNo4ieb/7Unfbsq9fGpKQF7bK94srgmk
 ZRpSCqWeLOE9QkzetsEHikaGQ1l0/TdjmknIIwxjU5C1U7oDx/sljxCfK4elMwfLiA+m
 64XrXtjOFfxN/2Hk9oKLkEwI51RtOZ2O6QRlglGyiCVPCnJnE+4Ere9wxwTS5VHQ6TZu
 dwxvBUx/nKx/7qLyaZvXaPWP9qlqYTS7rWhx1CCmx0ygq2u/5+MC644L9xeDhgC720pf
 l1VTXP8HylmSplccjYPt7Tw9hEj7L7d2i2+IarpF8HBqd2kw9L4sw+jKXaPv6+2YwchC
 hOpA==
X-Gm-Message-State: AC+VfDxoo824ZE4FhsMz7/cDSfYCEVbUYUePB+09vIpHO0bHixTCil3+
 nJcpNvWbiWmYbAw8/d17CAghSQ==
X-Google-Smtp-Source: ACHHUZ6uOHiq3Q0/ZO6nIqI2wnd8IeOHXdKBaFcBaTE2/5EIEFQKmEYHsy42ufRsnDJ6Be1FWaujOw==
X-Received: by 2002:adf:f60d:0:b0:304:9fb0:6a8 with SMTP id
 t13-20020adff60d000000b003049fb006a8mr2086930wrp.18.1683197640975; 
 Thu, 04 May 2023 03:54:00 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 j10-20020adfe50a000000b0030631f199f9sm9299272wrm.34.2023.05.04.03.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 03:53:58 -0700 (PDT)
Date: Thu, 4 May 2023 13:53:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: samin.guo@starfivetech.com
Message-ID: <e16d3d7b-3789-4951-9cd0-06693c7c6293@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 04 May 2023 11:07:48 +0000
Cc: kernel-janitors@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [bug report] net: stmmac: Add glue layer for StarFive
	JH7110 SoC
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

Hello Samin Guo,

The patch 4bd3bb7b4526: "net: stmmac: Add glue layer for StarFive
JH7110 SoC" from Apr 17, 2023, leads to the following Smatch static
checker warning:

drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c:148 starfive_dwmac_probe()
warn: inconsistent refcounting 'plat_dat->mdio_node->kobj.kref.refcount.refs.counter':
  inc on: 113,117,122,140
  dec on: 145

drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
    93 static int starfive_dwmac_probe(struct platform_device *pdev)
    94 {
    95         struct plat_stmmacenet_data *plat_dat;
    96         struct stmmac_resources stmmac_res;
    97         struct starfive_dwmac *dwmac;
    98         struct clk *clk_gtx;
    99         int err;
    100 
    101         err = stmmac_get_platform_resources(pdev, &stmmac_res);
    102         if (err)
    103                 return dev_err_probe(&pdev->dev, err,
    104                                      "failed to get resources\n");
    105 
    106         plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
    107         if (IS_ERR(plat_dat))
    108                 return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
    109                                      "dt configuration failed\n");

All the error paths after stmmac_probe_config_dt() succeeds should call
stmmac_remove_config_dt() but only the last one does.

    110 
    111         dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
    112         if (!dwmac)
    113                 return -ENOMEM;
    114 
    115         dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
    116         if (IS_ERR(dwmac->clk_tx))
    117                 return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
    118                                      "error getting tx clock\n");
    119 
    120         clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
    121         if (IS_ERR(clk_gtx))
    122                 return dev_err_probe(&pdev->dev, PTR_ERR(clk_gtx),
    123                                      "error getting gtx clock\n");
    124 
    125         /* Generally, the rgmii_tx clock is provided by the internal clock,
    126          * which needs to match the corresponding clock frequency according
    127          * to different speeds. If the rgmii_tx clock is provided by the
    128          * external rgmii_rxin, there is no need to configure the clock
    129          * internally, because rgmii_rxin will be adaptively adjusted.
    130          */
    131         if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
    132                 plat_dat->fix_mac_speed = starfive_dwmac_fix_mac_speed;
    133 
    134         dwmac->dev = &pdev->dev;
    135         plat_dat->bsp_priv = dwmac;
    136         plat_dat->dma_cfg->dche = true;
    137 
    138         err = starfive_dwmac_set_mode(plat_dat);
    139         if (err)
    140                 return err;
    141 
    142         err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
    143         if (err) {
    144                 stmmac_remove_config_dt(pdev, plat_dat);
    145                 return err;
    146         }
    147 
--> 148         return 0;
    149 }

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
