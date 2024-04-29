Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC78B56B4
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 13:33:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E9C7C71285;
	Mon, 29 Apr 2024 11:33:15 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D115C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 11:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=Vgux3aE3wJGJ6D
 mN+k2dPKSst7IED0Ek/dvVSF5yq0g=; b=LZifYU4S7NUCZENs8jHvem7CPVc3RO
 Z3op2lLszJOlJW1oB5HiWE7k2lz1H+HkpBtnYKqtl7Lp8rQRdP9YXnjf6sPTzO4j
 Wk8RtkToMA8SV96difp+7EyiKQOCJ2ifDGF1OE2meSCScZGzXtRX8dv8uSIjrXRT
 1Gk/Roz7bw3hlJUSwnHCOHS8z+lRdyxGEJC8I2TXDabw4CYqDmJXVGsI7MEP4T9z
 D8cDOIGDMfMvH96D+lULSj1D+HbRqQk9cZlnluoi0G+iWOM83jhL/6p5zh5KS0ir
 JwwH5q/TFzeIOAMMa0JiHpRDafNE5erJTauOlwdCZG6ig419naUxKWmg==
Received: (qmail 2280950 invoked from network); 29 Apr 2024 13:33:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 Apr 2024 13:33:14 +0200
X-UD-Smtp-Session: l3s3148p1@eC5qnjoXbxxtKPB4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-iio@vger.kernel.org
Date: Mon, 29 Apr 2024 13:33:03 +0200
Message-ID: <20240429113313.68359-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/8] iio: use 'time_left' instead of 'timeout'
	with wait_for_*() functions
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

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_*() functions causing patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
obvious and self explaining.

This is part of a tree-wide series. The rest of the patches can be found here
(some parts may still be WIP):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left

Because these patches are generated, I audit them before sending. This is why I
will send series step by step. Build bot is happy with these patches, though.
No functional changes intended.

Wolfram Sang (8):
  iio: adc: ad_sigma_delta: use 'time_left' variable with
    wait_for_completion_timeout()
  iio: adc: exynos_adc: use 'time_left' variable with
    wait_for_completion_timeout()
  iio: adc: fsl-imx25-gcq: use 'time_left' variable with
    wait_for_completion_interruptible_timeout()
  iio: adc: intel_mrfld_adc: use 'time_left' variable with
    wait_for_completion_interruptible_timeout()
  iio: adc: stm32-adc: use 'time_left' variable with
    wait_for_completion_interruptible_timeout()
  iio: adc: stm32-dfsdm-adc: use 'time_left' variable with
    wait_for_completion_interruptible_timeout()
  iio: adc: twl6030-gpadc: use 'time_left' variable with
    wait_for_completion_interruptible_timeout()
  iio: pressure: zpa2326: use 'time_left' variable with
    wait_for_completion_interruptible_timeout()

 drivers/iio/adc/ad_sigma_delta.c  |  6 +++---
 drivers/iio/adc/exynos_adc.c      | 16 ++++++++--------
 drivers/iio/adc/fsl-imx25-gcq.c   | 10 +++++-----
 drivers/iio/adc/intel_mrfld_adc.c | 12 ++++++------
 drivers/iio/adc/stm32-adc.c       | 10 +++++-----
 drivers/iio/adc/stm32-dfsdm-adc.c | 12 ++++++------
 drivers/iio/adc/twl6030-gpadc.c   |  8 ++++----
 drivers/iio/pressure/zpa2326.c    | 10 +++++-----
 8 files changed, 42 insertions(+), 42 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
