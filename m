Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CC412FA7
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2019 15:57:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 759F1C5784C
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2019 13:57:48 +0000 (UTC)
Received: from mxout012.mail.hostpoint.ch (mxout012.mail.hostpoint.ch
 [217.26.49.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9800BC5784A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2019 13:57:45 +0000 (UTC)
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
 by mxout012.mail.hostpoint.ch with esmtp (Exim 4.91 (FreeBSD))
 (envelope-from <dev@pschenker.ch>)
 id 1hMYh1-000K4m-UA; Fri, 03 May 2019 15:57:39 +0200
Received: from [46.140.72.82] (helo=philippe-pc.toradex.int)
 by asmtp013.mail.hostpoint.ch with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91 (FreeBSD))
 (envelope-from <dev@pschenker.ch>)
 id 1hMYh1-0003ks-Oj; Fri, 03 May 2019 15:57:39 +0200
X-Authenticated-Sender-Id: dev@pschenker.ch
From: Philippe Schenker <dev@pschenker.ch>
To: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Date: Fri,  3 May 2019 15:57:25 +0200
Message-Id: <20190503135725.9959-3-dev@pschenker.ch>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190503135725.9959-1-dev@pschenker.ch>
References: <20190503135725.9959-1-dev@pschenker.ch>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Lee Jones <lee.jones@linaro.org>, dev@pschenker.ch,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] iio: stmpe-adc: Enable all stmpe-adc
	interrupts just once
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

This commit will enable the interrupts of all channels handled by this
driver only once in the probe function.

This will improve performance because one byte less has to be written over
i2c on each read out of the adc. On the fastest ADC mode this will improve
read out speed by 15%.

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

---

 drivers/iio/adc/stmpe-adc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
index baa41ffc0d76..427c890c6e7d 100644
--- a/drivers/iio/adc/stmpe-adc.c
+++ b/drivers/iio/adc/stmpe-adc.c
@@ -72,9 +72,6 @@ static int stmpe_read_voltage(struct stmpe_adc *info,
 		return -EINVAL;
 	}
 
-	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_INT_EN,
-			STMPE_ADC_CH(info->channel));
-
 	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_CAPT,
 			STMPE_ADC_CH(info->channel));
 
@@ -328,6 +325,9 @@ static int stmpe_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_INT_EN,
+			~(norequest_mask & 0xFF));
+
 	return devm_iio_device_register(&pdev->dev, indio_dev);
 }
 
-- 
2.21.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
