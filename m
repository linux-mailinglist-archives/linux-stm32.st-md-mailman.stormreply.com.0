Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9C051F58A
	for <lists+linux-stm32@lfdr.de>; Mon,  9 May 2022 09:46:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10905C5F1D3;
	Mon,  9 May 2022 07:46:55 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC3C6C6049F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 22:56:56 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id f3so2099580qvi.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 May 2022 15:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jiMx1KNAzuMIgpn6LqdJi2ADhn7OHgQMCNsj9Mwa3ZA=;
 b=c/5NIlXsr1gsCXmvQZIu/ByrkSBvSPA+5yIMedNUlzuk0MlGc4OaZfDOL1mNTAOxlG
 kUR+qWhdKmBqEsad++XyNSmPXNZINRJLp/aTCcX4fwqnOurEq1imV3EQJJQTBuNxqHtX
 GE6jQqe/c/M8+QxdNfKZe26Gu1GvyqLT3fdgzRTn1wo6hx8UodL0REqq8g2YqCXaEzb3
 p85wKzLzRDYEJirBjxl8wueyU07H2uKTQLC4SASiotQOubBiMc8aRw9mDisu4UY5y/Yi
 UxyEF8F5a0q4ihRGht34Y65uVdkB+4Y8slAKx15y19kq/f7mq8hPaUn63xGxHISKcdBZ
 GcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jiMx1KNAzuMIgpn6LqdJi2ADhn7OHgQMCNsj9Mwa3ZA=;
 b=IaBP2yev6JV+Qt2GRJiv8IqQbK00yaKSkhYz/jjr5CVJYhkrMxnexDtjVp4ZG7TdY8
 BzaYd8fIq4VzW1KJITbMB2ctykVDEQTUAQdeiI+Cvy6pl0yoIyOMtBoRERjn/zt9VHJu
 4m7SUsGF8GEpNaXvgoo4ifeO7eEvj8TFeWaaovkjgt5663pTpheqFfp24on7inmQ5uXD
 nrykZjLSdo8SdlI24V3kCLXlw2NvWh9W8W8FURj4ssZryNlk/kQmjfL+7Dmcfr4kEFbn
 lFSBjlaoI6XRbvqvWlvrxnNPPW8pxYQ8P/BPdqVQqrH4oUISM2qeeWSAWa7IFhpw+EyD
 fT1w==
X-Gm-Message-State: AOAM533hICuNICHgbsVEfmYK6JR948uSsKhArOcWjBhcOvvOM+6SGcfH
 LTqkx2wl56ilQgt2qycfEJg=
X-Google-Smtp-Source: ABdhPJxrDUwu4Z10IRKqRVGhaH8iLkEjQy2GN2YKD3abQzhKTiYSjD2JqGul25opJn2AVjn8yU3jhA==
X-Received: by 2002:a05:6214:1d08:b0:45a:a692:3bb2 with SMTP id
 e8-20020a0562141d0800b0045aa6923bb2mr4501663qvd.24.1651877815661; 
 Fri, 06 May 2022 15:56:55 -0700 (PDT)
Received: from grrm.lan
 (bras-base-mtrlpq4809w-grc-17-70-53-205-21.dsl.bell.ca. [70.53.205.21])
 by smtp.gmail.com with ESMTPSA id
 q188-20020a37a7c5000000b0069fc13ce208sm3187880qke.57.2022.05.06.15.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 15:56:54 -0700 (PDT)
From: Yannick Brosseau <yannick.brosseau@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, fabrice.gasnier@foss.st.com,
 olivier.moysan@foss.st.com
Date: Fri,  6 May 2022 18:56:15 -0400
Message-Id: <20220506225617.1774604-1-yannick.brosseau@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 May 2022 07:46:53 +0000
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] iio: adc: stm32: Fix ADC IRQ handling on
	STM32F4
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

Recent changes to the STM32 ADC irq handling broke the STM32F4 platforms
These two patches bring it back to a working state.

Yannick Brosseau (2):
  iio: adc: stm32: Iterate through all ADCs in irq handler
  iio: adc: stm32: Fix check for spurious IRQs on STM32F4

 drivers/iio/adc/stm32-adc-core.c | 7 ++++++-
 drivers/iio/adc/stm32-adc.c      | 9 ++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.36.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
