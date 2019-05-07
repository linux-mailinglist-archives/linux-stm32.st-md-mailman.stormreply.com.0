Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CC3165CE
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2019 16:36:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F715C35E08
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2019 14:36:37 +0000 (UTC)
Received: from mxout013.mail.hostpoint.ch (mxout013.mail.hostpoint.ch
 [217.26.49.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D793C35E06
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2019 14:36:36 +0000 (UTC)
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
 by mxout013.mail.hostpoint.ch with esmtp (Exim 4.91 (FreeBSD))
 (envelope-from <dev@pschenker.ch>)
 id 1hO1Ch-000IFQ-3D; Tue, 07 May 2019 16:36:23 +0200
Received: from [46.140.72.82] (helo=philippe-pc.toradex.int)
 by asmtp013.mail.hostpoint.ch with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91 (FreeBSD))
 (envelope-from <dev@pschenker.ch>)
 id 1hO1Cg-0008oW-Sg; Tue, 07 May 2019 16:36:23 +0200
X-Authenticated-Sender-Id: dev@pschenker.ch
From: Philippe Schenker <dev@pschenker.ch>
To: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Date: Tue,  7 May 2019 16:36:14 +0200
Message-Id: <20190507143615.28477-4-dev@pschenker.ch>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507143615.28477-1-dev@pschenker.ch>
References: <20190507143615.28477-1-dev@pschenker.ch>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Philippe Schenker <philippe.schenker@toradex.com>,
 David Laight <David.Laight@ACULAB.COM>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Lee Jones <lee.jones@linaro.org>, dev@pschenker.ch,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] iio: stmpe-adc: Use
	wait_for_completion_timeout
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

From: Philippe Schenker <philippe.schenker@toradex.com>

Use wait_for_completion_timeout instead of
wait_for_completion_interuptible_timeout.

The interruptible variant gets constantly interrupted if a user
program is compiled with the -pg option.
The killable variant was not used due to the fact that a second
program, reading on this device, that gets killed is then also killing
that wait.

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
---

 drivers/iio/adc/stmpe-adc.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
index 82b43e4522b6..cc752a47444c 100644
--- a/drivers/iio/adc/stmpe-adc.c
+++ b/drivers/iio/adc/stmpe-adc.c
@@ -77,17 +77,11 @@ static int stmpe_read_voltage(struct stmpe_adc *info,
 	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_CAPT,
 			STMPE_ADC_CH(info->channel));
 
-	*val = info->value;
-
-	ret = wait_for_completion_interruptible_timeout
-		(&info->completion, STMPE_ADC_TIMEOUT);
+	ret = wait_for_completion_timeout(&info->completion, STMPE_ADC_TIMEOUT);
 
 	if (ret <= 0) {
 		mutex_unlock(&info->lock);
-		if (ret == 0)
-			return -ETIMEDOUT;
-		else
-			return ret;
+		return -ETIMEDOUT;
 	}
 
 	*val = info->value;
@@ -116,15 +110,11 @@ static int stmpe_read_temp(struct stmpe_adc *info,
 	stmpe_reg_write(info->stmpe, STMPE_REG_TEMP_CTRL,
 			STMPE_START_ONE_TEMP_CONV);
 
-	ret = wait_for_completion_interruptible_timeout
-		(&info->completion, STMPE_ADC_TIMEOUT);
+	ret = wait_for_completion_timeout(&info->completion, STMPE_ADC_TIMEOUT);
 
 	if (ret <= 0) {
 		mutex_unlock(&info->lock);
-		if (ret == 0)
-			return -ETIMEDOUT;
-		else
-			return ret;
+		return -ETIMEDOUT;
 	}
 
 	/*
-- 
2.21.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
