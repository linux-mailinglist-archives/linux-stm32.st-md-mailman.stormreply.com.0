Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D49A86EA5FF
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Apr 2023 10:39:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76E02C65E4F;
	Fri, 21 Apr 2023 08:39:23 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 429C5C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Apr 2023 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=Guq9tjQRAPQ7aI3TlsQDkj7tfxjVkiUdlit3uczhIeU=; b=I7RZuy9uzKlRjoRHKP3cC47UV+
 7EytV4deMhrFG5fUOkPGo7aHqhxF4pDVb7PpKW65nnFWou5EO2M0VE5x3LCeNFnOuygDhKc/6qdOT
 7W7eayhyMVuwL3CeOVLS/eB7tdJgtmk17M1sw27W9kskRb7DxveCvnJrE3zBCF0cy4xKqt8W3y5KC
 btkWYRhZMwiNAyy3uSLIpWaFSSAlsRGUFV70Rf4pmkter6HgS+0mfbLnqEBSb/1Oy9FDPEB1BwMbl
 5qz8+nJLFi6MgRhBN0k/xwk46oppE3HRz4h6PruStSqGPwSYk8/9d0kmQ8zu4nu/Zuox/2qowHZcf
 +QD20ODQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1ppmIa-0000rU-4J; Fri, 21 Apr 2023 10:39:20 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1ppmIZ-000NoW-Oh; Fri, 21 Apr 2023 10:39:19 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: jic23@kernel.org, lars@metafoo.de, alexandre.torgue@foss.st.com,
 nuno.sa@analog.com
Date: Fri, 21 Apr 2023 10:38:58 +0200
Message-Id: <20230421083858.2613289-1-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26883/Fri Apr 21 09:25:39 2023)
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Sean Nyekjaer <sean@geanix.com>
Subject: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: add debug info if dt
	uses legacy channel config
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
Changes since v1:
 - Changed dev_warn -> dev_dbg

 drivers/iio/adc/stm32-adc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 1aadb2ad2cab..e179b6611e4d 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1993,6 +1993,8 @@ static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm
 	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
 	int num_channels = 0, ret;
 
+	dev_dbg(&indio_dev->dev, "using legacy channel config\n");
+
 	ret = device_property_count_u32(dev, "st,adc-channels");
 	if (ret > adc_info->max_channels) {
 		dev_err(&indio_dev->dev, "Bad st,adc-channels?\n");
-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
