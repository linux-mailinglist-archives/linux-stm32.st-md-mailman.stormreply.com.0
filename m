Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC6E702438
	for <lists+linux-stm32@lfdr.de>; Mon, 15 May 2023 08:13:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 179C4C6A611;
	Mon, 15 May 2023 06:13:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CCB9C6A60A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 May 2023 06:13:19 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-30639daee76so7886010f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 May 2023 23:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684131199; x=1686723199;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mtvY5cyvCtNLcapxjmjirEYUMwUHwlJife3t9ZdJg3c=;
 b=jWkW+asukCVLhAxzXf1LM1GGxRBfHBvUu/h7ykjxqCz3SxhuHIpBeO13lR8iDbd32W
 HbeqagiG5X863OTe9xfvTSeIqbDkmapD34jX53DbcRCH+HXE3ZdA3EapuHA/PhPNQutJ
 EC1RzA70rOcQIqkbZ0HgMlAdRXW3BZKqu5z62S3fkgxUnG4+Xngr7WuGfqV7FpAMr9OD
 8cIZ4ZX2Flw2haiPzscMl/oQnIognOvKUtRRO3DNmQkwPMSlIGjB8K57QjS/1KUZYuQR
 MRbr4fl9+IHK5ImT1ihvgAt93CI/r0tyZzMwqKED8JP+EPit9KOoNq25W9t+Wq+wNiIz
 z5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684131199; x=1686723199;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mtvY5cyvCtNLcapxjmjirEYUMwUHwlJife3t9ZdJg3c=;
 b=ZRW+eJ4pSwFlh391ufKwI8uBiASA84pwYEApqHmwKabBt7H2LBLzCca/Om+dLsjSjL
 WT1/VSoL0q4yFDKq0w5zxxadswsUijCB0LRHCYF9re5Q7V8YRVj3KRBosZdDKefI5K0t
 +5iO4bEQ5bxql8/QQHFz4c28KOBIdnRGTXRG8Dg+WlOOkyT+VFBb2u7JRQ2h2QEJBsJ8
 9YsIZz+4n+Luzd6oE+xXR0+Fhg0w5sEi9ic4MFUaRTzbagBMoE+6PKQEPsPi99XOGhZ/
 IAIV1bkdbe5W8IPX2ip+d6o1VQFwWuvU0pm7JdePTOCx/2EKKrzVWdMDVW+QDMGTmxFM
 Ce+A==
X-Gm-Message-State: AC+VfDzPT999CACWhJ7j86Va05pdatYeJkxKeNQtb8YYaBRAUKaumiqi
 3SumNPQhNNSn6wNoBKeJBAKO6w==
X-Google-Smtp-Source: ACHHUZ5bpiJno7tJRn+DJbV7E+3GQdv6r8DDYCxi0yQ8XXY1nv+RlNBUm3oa6vqAW7MzqkAGCbTOwg==
X-Received: by 2002:adf:cd11:0:b0:307:83a4:3d3b with SMTP id
 w17-20020adfcd11000000b0030783a43d3bmr23040157wrm.54.1684131198826; 
 Sun, 14 May 2023 23:13:18 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 k9-20020adfe8c9000000b0030642f5da27sm31174244wrn.37.2023.05.14.23.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 May 2023 23:13:17 -0700 (PDT)
Date: Mon, 15 May 2023 09:13:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: raphael.gallais-pou@foss.st.com
Message-ID: <f8126585-e486-4b73-8704-c52fa8f3b262@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [bug report] drm/stm: ltdc: add support for CRC
	hashing feature
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

Hello Raphael Gallais-Pou,

This is a semi-automatic email about new static checker warnings.

The patch 79b44684a14e: "drm/stm: ltdc: add support for CRC hashing 
feature" from Feb 11, 2022, leads to the following Smatch complaint:

    drivers/gpu/drm/stm/ltdc.c:1153 ltdc_crtc_set_crc_source()
    warn: variable dereferenced before check 'crtc' (see line 1148)

drivers/gpu/drm/stm/ltdc.c
  1147	{
  1148		struct ltdc_device *ldev = crtc_to_ltdc(crtc);
                                                        ^^^^
Dereferenced.

  1149		int ret;
  1150	
  1151		DRM_DEBUG_DRIVER("\n");
  1152	
  1153		if (!crtc)
                    ^^^^^
Checked too late.  Hopefully, this check can just be deleted.

  1154			return -ENODEV;
  1155	

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
