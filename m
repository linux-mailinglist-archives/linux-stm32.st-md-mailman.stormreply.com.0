Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFEF528F84
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 22:40:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4456C03FDB;
	Mon, 16 May 2022 20:40:01 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53472C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 20:40:00 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id i20so12956827qti.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 13:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRyYZy7MUY9Z/ZyS1jq+AuFFP7q0GxQUZ1g6iG97tyM=;
 b=jRAPfAxvk37A+4zg3JePp6ctoOo27aHfPQzvPO/cLLDVov8JMSdbL5Goe5mzQ1GHVI
 e1KgC/HsHj91CoO2A327UT8DcApUlzJIiPG5K38EJXtL5Vs+JLfh4mAoXfQQ/873B7EG
 AIrLk+0G9EcwbbiYW2BGLPLYVFzo1g70p+B64FCCRYzTi6CCMkyQzG4rFAtzMZskHrUa
 g238LZVFMqIHDDcFq8qJOGTvvMVmCyVIsDi3iLIy6iqzK0x4ZHwVnxSDwBlPpA6Uh9JR
 ZrcCXwJZoMI0V4RLN5EVsFxxHRyuf5sTNC13xv4Btbgo37b+APRDSSp/tmoo+p5j77jI
 XjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRyYZy7MUY9Z/ZyS1jq+AuFFP7q0GxQUZ1g6iG97tyM=;
 b=7hkQ0Q3Tt2fSs4r76EJZByxadV4W/OGQdBuI+bYPCHGuwTO3dtqLYFX4yW9rmjGS1M
 a7u7kw//ULw/+FmqBwgsJSpyCrTWdrKzje8FQazhD2nNZiIMmNlesPqNvjPE6OYDdaLL
 e/I80mWlLL6nsOX5ynEcgYZOSbFf4sKGl3nEfp9W5PzZKYDExHZpWV/5+2cNuvOdkFu+
 6BadkDKCxrU9i25wxng/nuZtewApbeYVOjXBotkfuvsOdXd8swrLmtdZ1onbx5w/h4Xd
 wq4ZCJVwILAz4V04QBQ9+dtg7OakeeTCRAbddoWXb5bZBvOJtpHQYcc/5akOESB7OPKa
 VAIw==
X-Gm-Message-State: AOAM533B9S9v73avgz+UDqKnnSL+lbkRorjOquRaPbS91OeN6yoCpnlP
 WXqXPmZNe3E1pmMK5Vd2kHg=
X-Google-Smtp-Source: ABdhPJzxCGqOh+bB58fssYdqVlJzJSN0fs2Z5kI37E/iSL/1fO8Hyo71gRgar0YDeHHlg4FAjH1MeA==
X-Received: by 2002:a05:622a:19a2:b0:2f3:cb4d:d4d9 with SMTP id
 u34-20020a05622a19a200b002f3cb4dd4d9mr16554824qtc.245.1652733599224; 
 Mon, 16 May 2022 13:39:59 -0700 (PDT)
Received: from grrm.lan
 (bras-base-mtrlpq4809w-grc-17-70-53-205-21.dsl.bell.ca. [70.53.205.21])
 by smtp.gmail.com with ESMTPSA id
 k67-20020a378846000000b006a00fabde68sm6364016qkd.10.2022.05.16.13.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:39:58 -0700 (PDT)
From: Yannick Brosseau <yannick.brosseau@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, fabrice.gasnier@foss.st.com,
 olivier.moysan@foss.st.com
Date: Mon, 16 May 2022 16:39:37 -0400
Message-Id: <20220516203939.3498673-1-yannick.brosseau@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] iio: adc: stm32: Fix ADC IRQ handling
	on STM32F4
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

Changes to the STM32 ADC irq handling broke the STM32F4 platforms
These two patches bring it back to a working state.

Changes:
 * Removed spurious IRQs detection
 * Updated comments and commit messages

Yannick Brosseau (2):
  iio: adc: stm32: Fix ADCs iteration in irq handler
  iio: adc: stm32: Fix IRQs on STM32F4 by removing custom spurious IRQs
    message

 drivers/iio/adc/stm32-adc-core.c |  7 ++++++-
 drivers/iio/adc/stm32-adc.c      | 10 ----------
 2 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
