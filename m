Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4506E6C9DF1
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 10:35:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02AC2C6A5FD;
	Mon, 27 Mar 2023 08:35:11 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9FC9C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 08:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=nlRe8f4/ag5dmmxfq8dbVSW6Imwp09NDX9J36bNmqcE=; b=1n9DpUdWR7h3HKncZodKxLLvt/
 PmX3+2bFVlysh3j9qIRbC5G6/HPMQJavh1DU1tvIgnQAAR/p7Zb+/jENNUG/cDYYefi0Exxh+czVd
 y82FrJ/dJ9NiIbNLQAjCXG6eIOpHfNWVK436x4OwNTeJwQEnIDzmrCDFCZ05ZM2A8Z3fNZ7JwVq32
 NQisL69TjgIKd9lmZUqRjc25fqOgQ+SoanQyihH5OZriZB3iZ9KSaGXLe5Cx9mXSXirolDKJKJfsy
 sAlWe+BKSvXmG2Trg8wNEjR0mQ/l1GIk9Vzny9OwL6CStRLw9JqCDcnj5jzrMifS1nlvLDmdE7JkA
 wy9ZnFyw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1pgiJo-000PcX-Bq; Mon, 27 Mar 2023 10:35:08 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1pgiJo-000H3h-1k; Mon, 27 Mar 2023 10:35:08 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: jic23@kernel.org, lars@metafoo.de, alexandre.torgue@foss.st.com,
 nuno.sa@analog.com
Date: Mon, 27 Mar 2023 10:34:47 +0200
Message-Id: <20230327083449.1098174-1-sean@geanix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26856/Mon Mar 27 09:24:05 2023)
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Sean Nyekjaer <sean@geanix.com>
Subject: [Linux-stm32] [PATCH 1/3] iio: adc: stm32-adc: warn if dt uses
	legacy channel config
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

Since nearly all stm32 dt's are using the legacy adc channel config,
we should warn users about using it.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/iio/adc/stm32-adc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 1aadb2ad2cab..d8e755d0cc52 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1993,6 +1993,8 @@ static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm
 	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
 	int num_channels = 0, ret;
 
+	dev_warn(&indio_dev->dev, "using legacy channel config\n");
+
 	ret = device_property_count_u32(dev, "st,adc-channels");
 	if (ret > adc_info->max_channels) {
 		dev_err(&indio_dev->dev, "Bad st,adc-channels?\n");
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
