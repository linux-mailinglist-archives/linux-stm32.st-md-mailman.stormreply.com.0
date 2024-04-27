Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E838B47E3
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Apr 2024 22:36:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B21E9C7128E;
	Sat, 27 Apr 2024 20:36:21 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E619DC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2024 20:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=vucjjM3RsCbo5+
 FPCKzNEmVbLons1oLEEtyP6oygaEw=; b=J/dbn4NFhpPLnpA2UHgTAGogwIkFVU
 c1Oe144PmBmlBY7G1bZjfrO64wUSfJItMs30Ey1vHza/lqVrpXpu3HBC64PtE6wm
 PM643I22QuBpe+FQCCFBy9C1g8B/+qKR2wnguasGV7MKIQhjrLfC6ogaEikc7wZg
 NXKz5ylEb6ox+6JSJCa222bDqBSM7wjjeZmD2itN/VEqY86s1JzjVcawhMT0dNBB
 ZfrCpu0HSx1LJTveW87o2Bi1Cr36obPwq5lvaoeqdeUgwJOFx2FSWFozO2gDVB1+
 r2IRSzGgTFNtpEl2Svq5p+/Wg9jwOurnZVwcxRc0W7D4YqCilqvAW/8A==
Received: (qmail 1781755 invoked from network); 27 Apr 2024 22:36:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 27 Apr 2024 22:36:14 +0200
X-UD-Smtp-Session: l3s3148p1@ZFeo+BkXsI9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Date: Sat, 27 Apr 2024 22:35:52 +0200
Message-ID: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/15] i2c: use 'time_left' with wait_for_*
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
store the result of wait_for_*() causing patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

This is the I2C part of a tree-wide series. The rest of the patches can
be found here (slightly WIP):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left

Because these patches are generated, they need manual audit. So, I will
send them step by step. This is part 1 and also a call for opinions if
this is a desirable change. But at least in the I2C realm, I really want
to have it proper.

Build bot is happy with these patches and I also compile tested them
(except two). No functional changes intended.

Wolfram Sang (15):
  i2c: amd-mp2-plat: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: digicolor: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: exynos5: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: hix5hd2: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: imx-lpi2c: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: omap: use 'time_left' variable with wait_for_completion_timeout()
  i2c: st: use 'time_left' variable with wait_for_completion_timeout()
  i2c: stm32f4: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: stm32f7: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: synquacer: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: jz4780: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: qcom-geni: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: rk3x: use 'time_left' variable with wait_event_timeout()
  i2c: s3c2410: use 'time_left' variable with wait_event_timeout()
  i2c: pxa: use 'time_left' variable with wait_event_timeout()

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
