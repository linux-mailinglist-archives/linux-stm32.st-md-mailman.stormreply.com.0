Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 180956EA92B
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Apr 2023 13:35:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD101C6905A;
	Fri, 21 Apr 2023 11:35:21 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8013C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Apr 2023 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=ox+YMMP5BtU7nkNA6WBhHsW92G5sHmgRrz8uI0MSILA=; b=1JVorq+75IC7YDEivOdPAo3gWJ
 VIDfVveqSFJtcsAHuP9xNBlvv9z6fvvgOV9iEGsKjtIdvBIbVGDtej4WeefIEB98hUHQ5zL7LVFd2
 nElRl/CMBr/Fp1cZPP6T5vdCf+FAf8pCVm2XrPpqFkoVNUYVyxP2Dm8Jo+V4cBFzzHBaJdWD8JjGy
 x1z7yyfy1+MNSMR0U/2rbXbJhTAC/rvNdXp1MUSjfdl7AoG75SSepUG5PHRAqdpN9/JQjn/53X2y7
 o8e1nYerEWp1rb2Kg3EgSZzd1iYbM1oyInNDIdFhUtuyVCMKRitTLQkL/T8Nxw/iXxnOfxwVcirxY
 bQzcWPnQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1ppp2t-0002Vw-5G; Fri, 21 Apr 2023 13:35:19 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1ppp2s-000MPW-R2; Fri, 21 Apr 2023 13:35:18 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: jic23@kernel.org, olivier.moysan@foss.st.com, alexandre.torgue@foss.st.com,
 nuno.sa@analog.com
Date: Fri, 21 Apr 2023 13:35:16 +0200
Message-Id: <20230421113516.2710454-2-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421113516.2710454-1-sean@geanix.com>
References: <20230421113516.2710454-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26883/Fri Apr 21 09:25:39 2023)
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Sean Nyekjaer <sean@geanix.com>
Subject: [Linux-stm32] [PATCH v2 2/2] iio: adc: stm32-adc: skip adc-channels
	setup if none is present
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

If only adc differential channels are defined driver will fail with
stm32-adc: probe of 48003000.adc:adc@0 failed with error -22

Fix this by skipping the initialization if no channels are defined.

This applies only to the legacy way of initializing adc channels.

Fixes: d7705f35448a ("iio: adc: stm32-adc: convert to device properties")
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
Changes since v1:
 - Ignore extra channel for timestamps in PIO mode
 - Use single ended count in channel creation (Thanks Olivier Moysan)

 drivers/iio/adc/stm32-adc.c | 40 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 14524c1b5583..99bfe995b6f1 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2038,6 +2038,7 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
 	struct stm32_adc_diff_channel diff[STM32_ADC_CH_MAX];
 	struct device *dev = &indio_dev->dev;
 	u32 num_diff = adc->num_diff;
+	int num_se = nchans - num_diff;
 	int size = num_diff * sizeof(*diff) / sizeof(u32);
 	int scan_index = 0, ret, i, c;
 	u32 smp = 0, smps[STM32_ADC_CH_MAX], chans[STM32_ADC_CH_MAX];
@@ -2065,28 +2066,27 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
 		}
 	}
 
-	ret = device_property_read_u32_array(dev, "st,adc-channels", chans,
-					     nchans);
-	if (ret)
-		return ret;
-
-	for (c = 0; c < nchans; c++) {
-		if (chans[c] >= adc_info->max_channels) {
-			dev_err(&indio_dev->dev, "Invalid channel %d\n",
-				chans[c]);
-			return -EINVAL;
-		}
-
-		/* Channel can't be configured both as single-ended & diff */
-		for (i = 0; i < num_diff; i++) {
-			if (chans[c] == diff[i].vinp) {
-				dev_err(&indio_dev->dev, "channel %d misconfigured\n",	chans[c]);
+	ret = device_property_read_u32_array(dev, "st,adc-channels", chans, num_se);
+	if (ret == 0 && num_se > 0) {
+		for (c = 0; c < num_se; c++) {
+			if (chans[c] >= adc_info->max_channels) {
+				dev_err(&indio_dev->dev, "Invalid channel %d\n",
+					chans[c]);
 				return -EINVAL;
 			}
+
+			/* Channel can't be configured both as single-ended & diff */
+			for (i = 0; i < num_diff; i++) {
+				if (chans[c] == diff[i].vinp) {
+					dev_err(&indio_dev->dev, "channel %d misconfigured\n",
+						chans[c]);
+					return -EINVAL;
+				}
+			}
+			stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
+						chans[c], 0, scan_index, false);
+			scan_index++;
 		}
-		stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
-					chans[c], 0, scan_index, false);
-		scan_index++;
 	}
 
 	if (adc->nsmps > 0) {
@@ -2307,7 +2307,7 @@ static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
 
 	if (legacy)
 		ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels,
-						 num_channels);
+						 timestamping ? num_channels - 1 : num_channels);
 	else
 		ret = stm32_adc_generic_chan_init(indio_dev, adc, channels);
 	if (ret < 0)
-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
