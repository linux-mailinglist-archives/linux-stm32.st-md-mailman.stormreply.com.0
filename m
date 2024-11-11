Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6107A9C3B0A
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 10:40:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04F87C78F60;
	Mon, 11 Nov 2024 09:40:11 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10DB2C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 09:40:03 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so6335674a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 01:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731318002; x=1731922802;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8uq+o2vFZJUqX4/y2uQm9wgc0uDfnPCbnfiej+5FcGg=;
 b=NDgYbVG9rDFVd32BpVnCuBwgEqNLGG9zLgVZ8SmlbFZaGAwHHdWKwy2sMzNzqr/KG7
 dkNOmiTnJ0fyKcNXS50CJ7OLltX+8V/Y6Uly8pYQOKQXfqaPvLGeBClp0xKwa1vUkB80
 jV9XW4sK5O7PjAYxw7rMrYvheO3TmV4mYITwIBC8kBQNnpf1GaU0Y1E5RL74+/YsmC+R
 ep2CacUMEGwb0LxUcH7LHhZJE6anxOVoJ1V40warELgbJx52OvAwmpxLbVaVoCgmZRqV
 SgXivtfw1inAO8UwEMiRc6qD2FKGYri/id8mLukWFFIi/wSCiN6r+4c5cuKMxim7oEV6
 Umsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731318002; x=1731922802;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8uq+o2vFZJUqX4/y2uQm9wgc0uDfnPCbnfiej+5FcGg=;
 b=pQxkRkGsQ0NIkawKs8RrvR1kidA/emRYJi3svM8mUNvJmlnByC/3meAX24CHUhMnMU
 y0GOn9VWPgxz8O9oJIUzhAhFRyJOtElkXYwXEgg9ExKvrX+JH0TGtdDm+YmeB5jhs8nG
 VJrM9nApIiGsdxbHGu0sPAvXYZIc/hYO64EYctOYVUPnCjPEEq1SB2+9vLPb0UBQKmsE
 17V7LW99Ov/6t9frxS2R63d1XprXB4bgABcRS/LHBXB5k78CZXgk0xnUQQ8MLC5B7+91
 3vk75wlA2I0bt80bDyV8kcbUUMw0geyAKjb0LNlFf1JlKACvoYtVDjX/XXuE2c1putWA
 jXng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX/Ry4yZ9foDIulliHd87yYa5YXXUe9BlmL1USQpP8NNWB8IXgaGOdXJYH3ISBartDyDYnlPQwGC8arw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXDXdkND7JhDKHFatZu8Q7V5I5oSgBZCPsA/7m4Io8jvCnyVJ0
 0uHNYB94c680pyVPviivaRk9iDqK8SGQHOUDxz/7gOwdUdWgc5CZpwx5C4eaSUA=
X-Google-Smtp-Source: AGHT+IEtwIpih366270iEmy7zBPiGHFqTs9kQiN6axsaFrcWpMU4sHgBmIXXbVCyVCYkUQP1Knn9+w==
X-Received: by 2002:a05:6402:3198:b0:5ce:c9ae:347e with SMTP id
 4fb4d7f45d1cf-5cf0a45d167mr7750194a12.30.1731318002466; 
 Mon, 11 Nov 2024 01:40:02 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03bb85f5sm4646840a12.53.2024.11.11.01.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 01:40:01 -0800 (PST)
Date: Mon, 11 Nov 2024 12:39:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Vitalii Mordan <mordan@ispras.ru>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <e1b263d8-adc0-455b-adf1-9247fae1b320@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241108173334.2973603-1-mordan@ispras.ru>
Cc: lkp@intel.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vadim Mutilin <mutilin@ispras.ru>, Fedor Pchelkin <pchelkin@ispras.ru>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vitalii Mordan <mordan@ispras.ru>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, lvc-project@linuxtesting.org
Subject: Re: [Linux-stm32] [PATCH net v2]: stmmac: dwmac-intel-plat: fix
 call balance of tx_clk handling routines
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

Hi Vitalii,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Vitalii-Mordan/stmmac-dwmac-intel-plat-fix-call-balance-of-tx_clk-handling-routines/20241109-013647
base:   net/main
patch link:    https://lore.kernel.org/r/20241108173334.2973603-1-mordan%40ispras.ru
patch subject: [PATCH net v2]: stmmac: dwmac-intel-plat: fix call balance of tx_clk handling routines
config: arm-randconfig-r071-20241110 (https://download.01.org/0day-ci/archive/20241111/202411110911.fxtHBKSw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411110911.fxtHBKSw-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c:163 intel_eth_plat_probe() error: we previously assumed 'dwmac->data' could be null (see line 101)

vim +163 drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c

9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   75  static int intel_eth_plat_probe(struct platform_device *pdev)
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   76  {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   77  	struct plat_stmmacenet_data *plat_dat;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   78  	struct stmmac_resources stmmac_res;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   79  	struct intel_dwmac *dwmac;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   80  	unsigned long rate;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   81  	int ret;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   82  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   83  	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   84  	if (ret)
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   85  		return ret;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   86  
abea8fd5e801a6 Jisheng Zhang        2023-09-16   87  	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   88  	if (IS_ERR(plat_dat)) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   89  		dev_err(&pdev->dev, "dt configuration failed\n");
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   90  		return PTR_ERR(plat_dat);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   91  	}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   92  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   93  	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
abea8fd5e801a6 Jisheng Zhang        2023-09-16   94  	if (!dwmac)
abea8fd5e801a6 Jisheng Zhang        2023-09-16   95  		return -ENOMEM;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   96  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   97  	dwmac->dev = &pdev->dev;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   98  	dwmac->tx_clk = NULL;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26   99  
b0377116decdee Rob Herring          2023-10-09  100  	dwmac->data = device_get_match_data(&pdev->dev);
b0377116decdee Rob Herring          2023-10-09 @101  	if (dwmac->data) {
                                                            ^^^^^^^^^^^
Check for NULL

9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  102  		if (dwmac->data->fix_mac_speed)
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  103  			plat_dat->fix_mac_speed = dwmac->data->fix_mac_speed;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  104  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  105  		/* Enable TX clock */
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  106  		if (dwmac->data->tx_clk_en) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  107  			dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
abea8fd5e801a6 Jisheng Zhang        2023-09-16  108  			if (IS_ERR(dwmac->tx_clk))
abea8fd5e801a6 Jisheng Zhang        2023-09-16  109  				return PTR_ERR(dwmac->tx_clk);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  110  
bd8cfad17c9530 Vitalii Mordan       2024-11-08  111  			ret = clk_prepare_enable(dwmac->tx_clk);
bd8cfad17c9530 Vitalii Mordan       2024-11-08  112  			if (ret) {
bd8cfad17c9530 Vitalii Mordan       2024-11-08  113  				dev_err(&pdev->dev,
bd8cfad17c9530 Vitalii Mordan       2024-11-08  114  					"Failed to enable tx_clk\n");
bd8cfad17c9530 Vitalii Mordan       2024-11-08  115  				return ret;
bd8cfad17c9530 Vitalii Mordan       2024-11-08  116  			}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  117  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  118  			/* Check and configure TX clock rate */
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  119  			rate = clk_get_rate(dwmac->tx_clk);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  120  			if (dwmac->data->tx_clk_rate &&
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  121  			    rate != dwmac->data->tx_clk_rate) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  122  				rate = dwmac->data->tx_clk_rate;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  123  				ret = clk_set_rate(dwmac->tx_clk, rate);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  124  				if (ret) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  125  					dev_err(&pdev->dev,
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  126  						"Failed to set tx_clk\n");
bd8cfad17c9530 Vitalii Mordan       2024-11-08  127  					goto err_tx_clk_disable;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  128  				}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  129  			}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  130  		}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  131  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  132  		/* Check and configure PTP ref clock rate */
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  133  		rate = clk_get_rate(plat_dat->clk_ptp_ref);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  134  		if (dwmac->data->ptp_ref_clk_rate &&
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  135  		    rate != dwmac->data->ptp_ref_clk_rate) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  136  			rate = dwmac->data->ptp_ref_clk_rate;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  137  			ret = clk_set_rate(plat_dat->clk_ptp_ref, rate);
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  138  			if (ret) {
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  139  				dev_err(&pdev->dev,
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  140  					"Failed to set clk_ptp_ref\n");
bd8cfad17c9530 Vitalii Mordan       2024-11-08  141  				goto err_tx_clk_disable;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  142  			}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  143  		}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  144  	}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  145  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  146  	plat_dat->bsp_priv = dwmac;
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  147  	plat_dat->eee_usecs_rate = plat_dat->clk_ptp_rate;
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  148  
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  149  	if (plat_dat->eee_usecs_rate > 0) {
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  150  		u32 tx_lpi_usec;
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  151  
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  152  		tx_lpi_usec = (plat_dat->eee_usecs_rate / 1000000) - 1;
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  153  		writel(tx_lpi_usec, stmmac_res.addr + GMAC_1US_TIC_COUNTER);
b4c5f83ae3f3e2 Rusaimi Amira Ruslan 2020-09-28  154  	}
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  155  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  156  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
bd8cfad17c9530 Vitalii Mordan       2024-11-08  157  	if (ret)
bd8cfad17c9530 Vitalii Mordan       2024-11-08  158  		goto err_tx_clk_disable;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  159  
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  160  	return 0;
bd8cfad17c9530 Vitalii Mordan       2024-11-08  161  
bd8cfad17c9530 Vitalii Mordan       2024-11-08  162  err_tx_clk_disable:
bd8cfad17c9530 Vitalii Mordan       2024-11-08 @163  	if (dwmac->data->tx_clk_en)
                                                            ^^^^^^^^^^^^^
Unchecked dereference

bd8cfad17c9530 Vitalii Mordan       2024-11-08  164  		clk_disable_unprepare(dwmac->tx_clk);
bd8cfad17c9530 Vitalii Mordan       2024-11-08  165  	return ret;
9efc9b2b04c74e Rusaimi Amira Ruslan 2020-08-26  166  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
