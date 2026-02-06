Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEuRBWrvhWlvIQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 14:40:58 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A099DFE4C2
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 14:40:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18073C87EDD;
	Fri,  6 Feb 2026 13:40:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65ED9C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Feb 2026 13:40:55 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4362ab556f5so552196f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Feb 2026 05:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770385255; x=1770990055;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mib8qSuKz/dqMMxLJ47BKHYisRGtocujstnMCZQJiTs=;
 b=ECvM9he+RRQnAncGEi66tULZzsxrkz+8I8cSRGeS2UufvBVt8oNko+YQRgKEcQjLNu
 Yefa8sSC8wbzVpwV9D1xDbf0G6aBrc3nHaFU9BdOBV9RzVjK8JGT2RWxhF5fAL+l9rgP
 /uEDsVcFwe9bbmrWX+CS4bJIMiOb5Y+29lnhy0cwOzVLc/xXG2lu1Agnpq6mOMyw5Z1o
 FLrlw9LqdZ6sGYib4oefrlYICgZA7L8enI6wYlE+/tF02BBD7tU7Kdkj/bVFFFESZnAW
 AkhQJH+JAZLgOoV6kLhebGR52apbmdqp6e1xMsQJj9KqBsqHGGpbL8rcHQ1xjG8RXAZ/
 DQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770385255; x=1770990055;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mib8qSuKz/dqMMxLJ47BKHYisRGtocujstnMCZQJiTs=;
 b=rHeHtO908RklztdB8QNGR1wHBo1xoYpdsnXxoPOKp2BmRZe1YMx75ZsXbtk9ClLa7Q
 OOJNTVNRz/3pk8qMEKzO/vfPt5cjHLyCc1IuP8Ov2tdF5ler4aQ4KVJ/WRsCzzlNRd93
 DrilyfKcitQq5mjRUnJYT8jufBiHRiqT+FvIzyOkTUvdJ08zWI3EKggD18NPBMK3YsqI
 gPjMvqbG/mro5Jg1kfg42AE8F9sgqdb73HwL256qoThkfiLLuLaLzyTgJ1gHyjqwhVdC
 7LWvDbPDiNosfJICuloLFAbb74Uuur9pwioud0ZtTxaaRijI7ApCqA0Up9zdU/WFnXmD
 1S/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW9DkOWLnrDz2Tmya05n7CdszlVwtWgn/R21gnf9kTxnwQjk8RxLYc8sJVaRLq3isCBjl2G1YQFDa5Tg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yya8QOHVERhzO3Ee55K8I0pckfKfjh3HAOrjmTBTubov7Wu6VTh
 eAN455dN6Cv1Ec/2uM1mUFZ+YFljZJ8Oj0BAKIRcxX6932E19QhcqhWq/QGAaHoBFKc=
X-Gm-Gg: AZuq6aIzd0fto1ddfPe7MQlF6YqCXvp1tJovMSgtdd6zm8sqOwke58UrGhahBHzRwUw
 NdepbAknuT1aYIenpvPrdtjPtKJeHghjt9WHoHVjInCusVgexcOv61QtopTzHl7gaYKsk8CIGS6
 9qmZc9JeavqoSUO4j0O98u9C15PKwdz/KP3WSaZVVnOlw6ddztP8N0EUzh91sU/VJFhEbxBQoo/
 AkjBwuREzvsTdreoMyRo3sET722PwA0mJlKrbcKf/dUToYqHO7ZyBG7Pa0VFi6kfktWaf98TP6O
 5wFHoOWY+ObJJ4A0U8I8i451S45JBPZW3gcO7JNODO+qwYUbKhNSygIKsgicWkBeBm3iN/ipz53
 2XF87Z0qId9bsXFAPkOeTHwiDAPtXAMh2F4fmBV9pMA+vy2FaxsoPlCe0W41NQgI0NCsGTxLBkJ
 SAwjP02P7K+RO4l8YU
X-Received: by 2002:a5d:5e01:0:b0:432:c37c:d83b with SMTP id
 ffacd0b85a97d-436296590a0mr4325393f8f.20.1770385254516; 
 Fri, 06 Feb 2026 05:40:54 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b25casm6293951f8f.4.2026.02.06.05.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 05:40:54 -0800 (PST)
Date: Fri, 6 Feb 2026 16:40:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <aYXvY6NH7OlZ-OAF@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: [Linux-stm32] [bug report] spi: stm32: properly fail on
	dma_request_chan error
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-spi@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.971];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[linaro.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: A099DFE4C2
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Alain Volmat,

Commit c266d19b7d4e ("spi: stm32: properly fail on dma_request_chan
error") from Dec 18, 2025 (linux-next), leads to the following Smatch
static checker warning:

	drivers/spi/spi-stm32.c:2578 stm32_spi_probe()
	error: 'spi->dma_rx' dereferencing possible ERR_PTR()

drivers/spi/spi-stm32.c
    2480         if (STM32_SPI_DEVICE_MODE(spi))
    2481                 ctrl->target_abort = stm32h7_spi_device_abort;
    2482 
    2483         spi->dma_tx = dma_request_chan(spi->dev, "tx");
    2484         if (IS_ERR(spi->dma_tx)) {
    2485                 ret = PTR_ERR(spi->dma_tx);
    2486                 if (ret == -ENODEV) {
    2487                         dev_info(&pdev->dev, "tx dma disabled\n");
    2488                         spi->dma_tx = NULL;
    2489                 } else {
    2490                         dev_err_probe(&pdev->dev, ret, "failed to request tx dma channel\n");
    2491                         goto err_clk_disable;
    2492                 }
    2493         } else {
    2494                 ctrl->dma_tx = spi->dma_tx;
    2495         }
    2496 
    2497         spi->dma_rx = dma_request_chan(spi->dev, "rx");
    2498         if (IS_ERR(spi->dma_rx)) {
    2499                 ret = PTR_ERR(spi->dma_rx);
    2500                 if (ret == -ENODEV) {
    2501                         dev_info(&pdev->dev, "rx dma disabled\n");
    2502                         spi->dma_rx = NULL;
    2503                 } else {
    2504                         dev_err_probe(&pdev->dev, ret, "failed to request rx dma channel\n");
    2505                         goto err_dma_release;

spi->dma_rx is an erorr pointer at this goto so it will crash.

    2506                 }
    2507         } else {
    2508                 ctrl->dma_rx = spi->dma_rx;
    2509         }
    2510 
    2511         if (spi->dma_tx || spi->dma_rx)
    2512                 ctrl->can_dma = stm32_spi_can_dma;
    2513 
    2514         spi->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
    2515         if (spi->sram_pool) {
    2516                 spi->sram_rx_buf_size = gen_pool_size(spi->sram_pool);
    2517                 dev_info(&pdev->dev, "SRAM pool: %zu KiB for RX DMA/MDMA chaining\n",
    2518                          spi->sram_rx_buf_size / 1024);
    2519                 spi->sram_rx_buf = gen_pool_dma_zalloc(spi->sram_pool, spi->sram_rx_buf_size,
    2520                                                        &spi->sram_dma_rx_buf);
    2521                 if (!spi->sram_rx_buf) {
    2522                         dev_err(&pdev->dev, "failed to allocate SRAM buffer\n");
    2523                 } else {
    2524                         spi->mdma_rx = dma_request_chan(spi->dev, "rxm2m");
    2525                         if (IS_ERR(spi->mdma_rx)) {
    2526                                 ret = PTR_ERR(spi->mdma_rx);
    2527                                 spi->mdma_rx = NULL;
    2528                                 if (ret == -EPROBE_DEFER) {
    2529                                         goto err_pool_free;
    2530                                 } else {
    2531                                         gen_pool_free(spi->sram_pool,
    2532                                                       (unsigned long)spi->sram_rx_buf,
    2533                                                       spi->sram_rx_buf_size);
    2534                                         dev_warn(&pdev->dev,
    2535                                                  "failed to request rx mdma channel, DMA only\n");
    2536                                 }
    2537                         }
    2538                 }
    2539         }
    2540 
    2541         pm_runtime_set_autosuspend_delay(&pdev->dev,
    2542                                          STM32_SPI_AUTOSUSPEND_DELAY);
    2543         pm_runtime_use_autosuspend(&pdev->dev);
    2544         pm_runtime_set_active(&pdev->dev);
    2545         pm_runtime_get_noresume(&pdev->dev);
    2546         pm_runtime_enable(&pdev->dev);
    2547 
    2548         ret = spi_register_controller(ctrl);
    2549         if (ret) {
    2550                 dev_err(&pdev->dev, "spi controller registration failed: %d\n",
    2551                         ret);
    2552                 goto err_pm_disable;
    2553         }
    2554 
    2555         pm_runtime_put_autosuspend(&pdev->dev);
    2556 
    2557         dev_info(&pdev->dev, "driver initialized (%s mode)\n",
    2558                  STM32_SPI_HOST_MODE(spi) ? "host" : "device");
    2559 
    2560         return 0;
    2561 
    2562 err_pm_disable:
    2563         pm_runtime_disable(&pdev->dev);
    2564         pm_runtime_put_noidle(&pdev->dev);
    2565         pm_runtime_set_suspended(&pdev->dev);
    2566         pm_runtime_dont_use_autosuspend(&pdev->dev);
    2567 
    2568         if (spi->mdma_rx)
    2569                 dma_release_channel(spi->mdma_rx);
    2570 err_pool_free:
    2571         if (spi->sram_pool)
    2572                 gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
    2573                               spi->sram_rx_buf_size);
    2574 err_dma_release:
    2575         if (spi->dma_tx)
    2576                 dma_release_channel(spi->dma_tx);
    2577         if (spi->dma_rx)
--> 2578                 dma_release_channel(spi->dma_rx);
                                             ^^^^^^^^^^^
Here.

    2579 err_clk_disable:
    2580         clk_disable_unprepare(spi->clk);
    2581 
    2582         return ret;
    2583 }

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
