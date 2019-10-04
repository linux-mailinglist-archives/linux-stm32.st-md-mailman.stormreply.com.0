Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2552FCB3FA
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 06:46:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7F4CC36B0B;
	Fri,  4 Oct 2019 04:46:07 +0000 (UTC)
Received: from mx4.ucr.edu (mx4.ucr.edu [138.23.248.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF9F9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 04:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1570164366; x=1601700366;
 h=from:to:cc:subject:date:message-id;
 bh=jWL5W27uUFoqE45P9aToaJkEZWCPur2rRlOPC00wtwM=;
 b=bubsh7ARlNWNSbAtUVMl7plRDtHRwNeA69RiL/EOjjsRmstvnn/ue22b
 Iby3+p/VL/Ew488vgIxDs/gXSl/0Z5JnW4YfTIkACZ8hpKKcWqbKr1CoK
 getRWwhJIhZb8HvsQRbFsh9EaWzx8x10tROogEmaFNEJ+HyKwqunZgWLA
 vPqmV/eKQTbrAZqMMmoKMi+qY38GNraB1KHGHw8Z+Hza+ZkflD6oNNgop
 PWTSbIrgzMmzWeIg8tb6bXy6ow3Nr2d+rWGcfPF+Rta+ZjyoqHFMHOiMK
 qPKiUe7XlVX+27a3A8qW7GUhLOn844kkTciwdUi+KAhj6Kx3u/zDKtwlo w==;
IronPort-SDR: uTWoqtNwZouO0ZTolZKTUNR7y59UFB7WuzkUSoiwRe0rkHn2/Socmeq5VdQJO6ZOgqSN+kUO2M
 z63gn6/IRYi3gl0b5vKSP6cF/POBOnskJNvMwwMxJZ3TgWImPA+Gdq3MGDWipBg/TGew2sJKS0
 dSylkmi4BZ23a1NjyeiFq02kjr1OebH4Ba8Jgkc8mEGGTmHxD2lULMQ18/NPq/jTL4Q22ywZ9b
 A/XRceLHZcBRZWd8UZ2CPWJ1117N3CcRO49VlzSSt++jViqxQmBfq4Z+fQmB5tAsTbDBUT3WDq
 Vd8=
IronPort-PHdr: =?us-ascii?q?9a23=3A8HvhbR1m9SY57YGdsmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZseISKfad9pjvdHbS+e9qxAeQG9mCsLQZ06GM6ujJYi8p2d65qncMcZhBBV?=
 =?us-ascii?q?cuqP49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx?=
 =?us-ascii?q?7xKRR6JvjvGo7Vks+7y/2+94fcbglVijexe7N/IAm5oQnPq8UdnJdvJLs2xh?=
 =?us-ascii?q?bVuHVDZv5YxXlvJVKdnhb84tm/8Zt++ClOuPwv6tBNX7zic6s3UbJXAjImM3?=
 =?us-ascii?q?so5MLwrhnMURGP5noHXWoIlBdDHhXI4wv7Xpf1tSv6q/Z91SyHNsD4Ubw4RT?=
 =?us-ascii?q?Kv5LpwRRT2lCkIKSI28GDPisxxkq1bpg6hpwdiyILQeY2ZKeZycr/Ycd4cQG?=
 =?us-ascii?q?pBX91RVzdAAoO6YIsEEvQPM/9FpInzplsBsx++ChSxD+/rxDJEmnr60Ks93O?=
 =?us-ascii?q?k9HwzKwBEsE8sSvHjJsd75MLoeXOCwwKTO0D7Nbe5Z2S3l5YbIbB4vvP+CU7?=
 =?us-ascii?q?F3f8fK1UUjCxnIgkmKpID5Iz+Y0PkGvWiB7+pnUOKik2woqwBwoziv28csjZ?=
 =?us-ascii?q?TCi4UVy1HF9SV22oc1KcGkREN1etOkDYdftzuAO4RoX8wiXnhltSAnwbMFoZ?=
 =?us-ascii?q?62ZDYGxIgjyhLFaPGKc5KE7gz+WOueOzt0mm5pdK6nixqv8EWtzvfwWte63V?=
 =?us-ascii?q?tKtCZJjNjBumoP2hHc7MWMV+Fz8V272TmV0gDe8uREIUcpmqXFM5Mh2bswlo?=
 =?us-ascii?q?YLsUTEAy/2hF36jK+IeUUg/eil8+Hnba/npp+YLoN0kgX+Prk3lsyxH+g0Lh?=
 =?us-ascii?q?QCU3KU+eS7073j8kn5T6tQgvIqlanZtYjWJcUdpqGnHw9Yypgv5wq7Aju809?=
 =?us-ascii?q?kVnWMLIExYdB+IlYTlJU3CLOzgAfe6mVuskTNrx/7cPr3mB5XANnjCkbbhfb?=
 =?us-ascii?q?ln6k5Q1BY/wN5E6pJJFr4BOuj/VVHsu9zFFhM5KRC7w/77CNVh0YMTQWaPAq?=
 =?us-ascii?q?6fMKPPvl6E//kvI/WJZIIbpjrwMOMl5+L3gX88hFARZKyp0oEWaHC8G/RpOU?=
 =?us-ascii?q?OZbWD3gtcdFmcKpA8+TPb0h12aVT5SZ2y+UL475jE+W8qIF4DGE7Gskryc22?=
 =?us-ascii?q?/vD49Wb2EeUgukDHzyMYiIRqFfO2qpPsZ9n2lcBvCaQIg72ETr6VL3?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EsIgCpzZZdh8jWVdFlHgEGEoFpg1x?=
 =?us-ascii?q?MEI0khV1RAQEGiyYYcYV6gwuHIwEIAQEBDAEBLQIBAYRAgkgjOBMCAwkBAQU?=
 =?us-ascii?q?BAQEBAQUEAQECEAEBAQgNCQgphUBCAQwBgWopgzULFhVSgRUBBQE1IjmCRwG?=
 =?us-ascii?q?BdhQFoVeBAzyMJTOIZQEJDYFICQEIgSIBhzSEWYEQgQeDbgdsh2WCRASBNwE?=
 =?us-ascii?q?BAY12hzWWUgEGAoIRFIF4kxQnhDyJP4tEAS2nLwIKBwYPI4FGgXtNJYFsCoF?=
 =?us-ascii?q?EUBAUgVsOCRWOLiEzgQiCaY1aAQ?=
X-IPAS-Result: =?us-ascii?q?A2EsIgCpzZZdh8jWVdFlHgEGEoFpg1xMEI0khV1RAQEGi?=
 =?us-ascii?q?yYYcYV6gwuHIwEIAQEBDAEBLQIBAYRAgkgjOBMCAwkBAQUBAQEBAQUEAQECE?=
 =?us-ascii?q?AEBAQgNCQgphUBCAQwBgWopgzULFhVSgRUBBQE1IjmCRwGBdhQFoVeBAzyMJ?=
 =?us-ascii?q?TOIZQEJDYFICQEIgSIBhzSEWYEQgQeDbgdsh2WCRASBNwEBAY12hzWWUgEGA?=
 =?us-ascii?q?oIRFIF4kxQnhDyJP4tEAS2nLwIKBwYPI4FGgXtNJYFsCoFEUBAUgVsOCRWOL?=
 =?us-ascii?q?iEzgQiCaY1aAQ?=
X-IronPort-AV: E=Sophos;i="5.67,254,1566889200"; d="scan'208";a="80569467"
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by smtpmx4.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2019 21:46:03 -0700
Received: by mail-pl1-f200.google.com with SMTP id o9so3175427plk.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Oct 2019 21:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=psYXa8mIT1FkAshfcFCubEkA00yN3VjYG8rNmfjs5/o=;
 b=HGEraidjc+4wPV3V3ZO6Qi8q9XfaOAz5bvFO15PFuJg7IFVc8cGT8SuYTZaENnWPyE
 5ykEhfH8x+4YjtZJBGc4KcKa9q+sFLz7yGZzQj792y2RskzOWhFAxEgQAip4CdlTPvuq
 yhtNerzIMLvgcePiGnhILOKuZNE1nFY8Fx2R7JSHRPRwiBQDayoaBsls+aaTtlki+JhD
 IrXl3LKZnGtM4Il63D9pRIq63goTlQLilpdSRy1T/idtMsNjyMfZyCtgbOdj0Zvcl4ey
 hOQPNt/mdsh0kInungAazfcTVjpLiSdXb1VWy2h2iWrq1hpSAM2gPOlGAT5JXFJtDYWJ
 ymsg==
X-Gm-Message-State: APjAAAUJ3wSyRSHTDuC6RKWt7hM2KfSNuxlfh7tZ3/IMjTfoKkJKHrg1
 XgQdcazFdXAZLkNvacFtTMGE92JSaLiBBh20uO37nmtVk4ZKx8+AetIdjnVJGot3RAPNmPFVJAV
 cWgZj6gLtcRTOGr9Pco5kaxtYGyk0v0CKqy0A8MDzPA==
X-Received: by 2002:a17:90a:22b0:: with SMTP id
 s45mr14621633pjc.22.1570164362693; 
 Thu, 03 Oct 2019 21:46:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGjRTgwnhlo2KZICWhErm2QBBJwJvYEziM2d39vj6xXurXwJPnB9wMG3PeWPQZzN2CBEQCIQ==
X-Received: by 2002:a17:90a:22b0:: with SMTP id
 s45mr14621596pjc.22.1570164362245; 
 Thu, 03 Oct 2019 21:46:02 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
 by smtp.googlemail.com with ESMTPSA id p88sm3786036pjp.22.2019.10.03.21.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 21:46:01 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Date: Thu,  3 Oct 2019 21:46:49 -0700
Message-Id: <20191004044649.2405-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yizhuo <yzhai003@ucr.edu>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stm32: Fix the usage of uninitialized
	variable in stm32_pwm_config()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Inside function stm32_pwm_config(), variable "psc" and " arr"
could be uninitialized if regmap_read() returns -EINVALs.
However, they are used later in the if statement to decide
the return value which is potentially unsafe.

The same case happens in function stm32_pwm_detect_channels()
with variable "ccer", but we cannot just return -EINVAL because
the error code is not acceptable by the caller. Aslo, the variable
"ccer" in functionstm32_pwm_detect_complementary() could also be
uninitialized, since stm32_pwm_detect_complementary() returns void,
the patch is not easy.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/pwm/pwm-stm32.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index 359b08596d9e..22c54df52977 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -346,9 +346,15 @@ static int stm32_pwm_config(struct stm32_pwm *priv, int ch,
 	 */
 	if (active_channels(priv) & ~(1 << ch * 4)) {
 		u32 psc, arr;
+		int ret;
 
-		regmap_read(priv->regmap, TIM_PSC, &psc);
-		regmap_read(priv->regmap, TIM_ARR, &arr);
+		ret = regmap_read(priv->regmap, TIM_PSC, &psc);
+		if (ret)
+			return ret;
+
+		ret = regmap_read(priv->regmap, TIM_ARR, &arr);
+		if (ret)
+			return ret;
 
 		if ((psc != prescaler) || (arr != prd - 1))
 			return -EBUSY;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
