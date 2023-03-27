Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D66C9DF0
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 10:35:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9E94C6A5F6;
	Mon, 27 Mar 2023 08:35:10 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C607EC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 08:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=NhCskZWj5emexPdjn3uIw47avpX8Bt9NtqvL+U/jfag=; b=f0bVMI+4UdzTOpXtQOhc5By35H
 Fo37ovlF8Yq56KWJvXkYPXhq5c03330PyXaiciX11vNXXIZTPMHy3dAEV7r0y664aH+gHaL4Z30RD
 XBgMyl+FDwfDLsEoAXOE0VRvj7GuwWyl/wWIfqA024NPVbyYfIjbY0hHecGWsZlVdzX+Z/H7/yTLB
 Ic2Ht1LYM0vJubdLYcAXDdCFOePIHf0DTJFTfZ9aZcl9xTK/ukxhwtMMwW0UkS53mYhSh9+J3EsFV
 sNIGV712gLrBjRg/bj06Q5qfsMzcDElCw9m2qTTR75HntbfL2OfN4lyC6Jfls70jz6jufCuHZNc4e
 r/mx/oqg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1pgiJo-000PcY-Hf; Mon, 27 Mar 2023 10:35:08 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1pgiJo-000H3h-7e; Mon, 27 Mar 2023 10:35:08 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: jic23@kernel.org, lars@metafoo.de, alexandre.torgue@foss.st.com,
 nuno.sa@analog.com
Date: Mon, 27 Mar 2023 10:34:48 +0200
Message-Id: <20230327083449.1098174-2-sean@geanix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230327083449.1098174-1-sean@geanix.com>
References: <20230327083449.1098174-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26856/Mon Mar 27 09:24:05 2023)
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Sean Nyekjaer <sean@geanix.com>
Subject: [Linux-stm32] [PATCH 2/3] iio: adc: stm32-adc: skip
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
 drivers/iio/adc/stm32-adc.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index d8e755d0cc52..a04fcb2dc80a 100644
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
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
