Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9896F5BD6
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 18:20:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D52CC6A60E;
	Wed,  3 May 2023 16:20:45 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7EA2C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=OpZHjSdSGQpoQPed8Rj960aLDTbFhfFzVPv3Avi9JCU=; b=HvPgdKfsuBj+Z2jyjAkbJwH66/
 7z6CCF+suypgGbnh4bbOQA5YnGzZO8eqFETJKVr+KmwMVlA/G0Khn0WtfOVDmQNiHwNIVBf0VB1JI
 PyQUcuEldZH016Jm9ma9ZOajjXMqpjQLNX0qfmFtRwnSkeQdjfi1OgVSeF3L9X3GPdgiIploMGgYY
 FhAWkKYxyaXG//U/1P5kaZ6o3TF0JN0W8gbXkS2jxMk49o0C/NqUgkqQ2aa+awuVbPB3SGYQfHe3m
 HXZ7qsSxH/cEoiJgnP79YCK0jI2/CvFpoKHIih74lg4jF4lca/imbgSi7WM0cGtkDRlZUFRz14HnZ
 reQt8T3w==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1puFDf-000MMM-0k; Wed, 03 May 2023 18:20:43 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1puFDe-000QMl-Mv; Wed, 03 May 2023 18:20:42 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: jic23@kernel.org, olivier.moysan@foss.st.com, alexandre.torgue@foss.st.com,
 nuno.sa@analog.com
Date: Wed,  3 May 2023 18:20:28 +0200
Message-Id: <20230503162029.3654093-1-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26895/Wed May  3 09:23:02 2023)
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Sean Nyekjaer <sean@geanix.com>
Subject: [Linux-stm32] [PATCH v3 1/2] iio: adc: stm32-adc: skip
	adc-diff-channels setup if none is present
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

If no adc differential channels are defined driver will fail with EINVAL:
stm32-adc: probe of 48003000.adc:adc@0 failed with error -22

Fix this by skipping the initialization if no channels are defined.

This applies only to the legacy way of initializing adc channels.

Fixes: d7705f35448a ("iio: adc: stm32-adc: convert to device properties")
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
Changes since v1:
- None

Changes since v2:
- None

 drivers/iio/adc/stm32-adc.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index e179b6611e4d..14524c1b5583 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2008,16 +2008,15 @@ static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm
 	 * to get the *real* number of channels.
 	 */
 	ret = device_property_count_u32(dev, "st,adc-diff-channels");
-	if (ret < 0)
-		return ret;
-
-	ret /= (int)(sizeof(struct stm32_adc_diff_channel) / sizeof(u32));
-	if (ret > adc_info->max_channels) {
-		dev_err(&indio_dev->dev, "Bad st,adc-diff-channels?\n");
-		return -EINVAL;
-	} else if (ret > 0) {
-		adc->num_diff = ret;
-		num_channels += ret;
+	if (ret > 0) {
+		ret /= (int)(sizeof(struct stm32_adc_diff_channel) / sizeof(u32));
+		if (ret > adc_info->max_channels) {
+			dev_err(&indio_dev->dev, "Bad st,adc-diff-channels?\n");
+			return -EINVAL;
+		} else if (ret > 0) {
+			adc->num_diff = ret;
+			num_channels += ret;
+		}
 	}
 
 	/* Optional sample time is provided either for each, or all channels */
-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
