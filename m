Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF505428A4
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jun 2022 09:58:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8ACBC56630;
	Wed,  8 Jun 2022 07:58:20 +0000 (UTC)
Received: from smtpbg.qq.com (smtpbg136.qq.com [106.55.201.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA8C8C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jun 2022 01:06:18 +0000 (UTC)
X-QQ-mid: bizesmtp87t1654650215t7lcf720
Received: from localhost.localdomain ( [182.148.15.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 08 Jun 2022 09:03:25 +0800 (CST)
X-QQ-SSF: 01000000000000209000000A0000000
X-QQ-FEAT: /bItHp+/hBgwwBc6ufl9SttNv8vY7eHAakJdU2zK306udwi1WHEE8dJGu/T44
 Z/r1Rue3cXwnVr5dsrBduj42bpx5QdDep7N1dDKcnDdiU6Z6YyIUnOBR1yL00YGfJnvYHNU
 sofkdMU99toGtDxwmUZH2hVCqxxX2IuZ7285EHA0/EBXvjvprEoeHT8N6hul7SR1ff1ye8R
 UGc+sqQhVnf00VVfLqgzCp72C9HJ46IClSgoI5h09oaDif9o+8N3JRWRIPgDZuyPew3oRns
 Lx87ej3/wTJFFlLtdhMGbIdPBD1k4FcrpdcesxCb0seYG1
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: thierry.reding@gmail.com, lee.jones@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Wed,  8 Jun 2022 09:03:18 +0800
Message-Id: <20220608010318.18040-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam7
X-Mailman-Approved-At: Wed, 08 Jun 2022 07:58:19 +0000
Cc: linux-pwm@vger.kernel.org, Jilin Yuan <yuanjilin@cdjrlc.com>,
 linux-kernel@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stmpe: Deleted extra {}
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

Remove unnecessary braces

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/pwm/pwm-stmpe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-stmpe.c b/drivers/pwm/pwm-stmpe.c
index 2df526fe9c38..c45fe27859de 100644
--- a/drivers/pwm/pwm-stmpe.c
+++ b/drivers/pwm/pwm-stmpe.c
@@ -78,10 +78,9 @@ static void stmpe_24xx_pwm_disable(struct pwm_chip *chip,
 	value = ret & ~BIT(pwm->hwpwm);
 
 	ret = stmpe_reg_write(stmpe_pwm->stmpe, STMPE24XX_PWMCS, value);
-	if (ret) {
+	if (ret)
 		dev_err(chip->dev, "error writing PWM#%u control\n",
 			pwm->hwpwm);
-	}
 }
 
 /* STMPE 24xx PWM instructions */
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
