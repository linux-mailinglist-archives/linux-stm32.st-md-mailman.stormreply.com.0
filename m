Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E791F95B71C
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 15:48:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7802BC71290;
	Thu, 22 Aug 2024 13:48:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A302BC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724334486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhs2ECxIqanvtxlvW30RxDZNTtb7z2CuQcsYq71BRfY=;
 b=iNQzstJTlDGsSq1kjWGlZSeoXS96/2I4/UsKH6YjjKmX6mkNjQ5gVZFS3dapmuVD1t8RdL
 y4eVPPuN9b2fM+IAlmPH/YTHofWcI5KPB0AUAvObPY3/TqmDeYdDgfCGtUHng/GTfcvFHG
 g42kTltIbP5x+bdEmrtblAXyNxXT3NM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-qtQVXEzKPkCTu2RJXgb9Sg-1; Thu, 22 Aug 2024 09:48:04 -0400
X-MC-Unique: qtQVXEzKPkCTu2RJXgb9Sg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4280cf2be19so6213995e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 06:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724334483; x=1724939283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jhs2ECxIqanvtxlvW30RxDZNTtb7z2CuQcsYq71BRfY=;
 b=ullOntbE5nbEXBM5N5vz6D7wKuSEKyUWOywQ4XX2F0yEqyRpQVuMgJJ0k8EJYWy898
 S0zW4khNtcew3/FDEuoKEzXzX19JD/dd8kXbQJHOKN2IkMF/er9kcBLDYACx6KLuoO0S
 De5xhena3I4p8f1lO8uwmaiYxcnhSnqZrR8OuDYA1FH/Try39kcowgFlHvQRRjIhyCRD
 uSoXxg04X99tLAYqfZqLYTX0yBgtIND+7hhhgfySwOIqRleIg5L0Ld2fNtAA5VQzTizx
 kWFm6MlkuzQ1rBnR7liu9TlBJ3jd8gYyuLm9MKMA48JdRiFE2/P1e5iqwmPrhrHFO4oE
 kXrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbF9GtK7aogCSdXN9+gPKzyW2MnweWyDgXG/cGSsRQdxQv2cokEFecU1McoCgLO8KmHktwEdO59LJtog==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzFQSDruq8JCSxrS2AiSHDRHDVRT5HqPs6zUGdKQASUuExbrV27
 L82e0DTRLSxqMwjC0h5pQaTpoUq/LwAkMdt9Vnz3sm2I6Y+b0WjCX9D9YbEWSoz/E899cymD2Vr
 /2ebOZ9sk84o2iUSOfu4wzpROitbpl730h2KAI/9AtDoAXoSThaDtUoK8LbTJsVIHit7Jlr2QsQ
 hXSw==
X-Received: by 2002:a05:600c:5114:b0:426:60bc:8f4e with SMTP id
 5b1f17b1804b1-42abd21f5e8mr38750895e9.5.1724334482802; 
 Thu, 22 Aug 2024 06:48:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXx12BAf3CxTnmjhd6pOZhjB7i9I5cLSUjMGAYvwAfvdwbDB7drJJLXCP1Y+6M4I79vMkMAA==
X-Received: by 2002:a05:600c:5114:b0:426:60bc:8f4e with SMTP id
 5b1f17b1804b1-42abd21f5e8mr38750635e9.5.1724334482246; 
 Thu, 22 Aug 2024 06:48:02 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5162322sm25057215e9.24.2024.08.22.06.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 06:48:01 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
 Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Stanner <pstanner@redhat.com>, Damien Le Moal <dlemoal@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Date: Thu, 22 Aug 2024 15:47:35 +0200
Message-ID: <20240822134744.44919-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822134744.44919-1-pstanner@redhat.com>
References: <20240822134744.44919-1-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/9] block: mtip32xx: Replace deprecated
	PCI functions
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

pcim_iomap_regions() and pcim_iomap_table() have been deprecated by the
PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

In mtip32xx, these functions can easily be replaced by their respective
successors, pcim_request_region() and pcim_iomap(). Moreover, the
driver's calls to pcim_iounmap_regions() in probe()'s error path and in
remove() are not necessary. Cleanup can be performed by PCI devres
automatically.

Replace pcim_iomap_regions() and pcim_iomap_table().

Remove the calls to pcim_iounmap_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/block/mtip32xx/mtip32xx.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index c6ef0546ffc9..bd40a06e4c0f 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -2716,7 +2716,9 @@ static int mtip_hw_init(struct driver_data *dd)
 	int rv;
 	unsigned long timeout, timetaken;
 
-	dd->mmio = pcim_iomap_table(dd->pdev)[MTIP_ABAR];
+	dd->mmio = pcim_iomap(dd->pdev, MTIP_ABAR, 0);
+	if (!dd->mmio)
+		return -ENOMEM;
 
 	mtip_detect_product(dd);
 	if (dd->product_type == MTIP_PRODUCT_UNKNOWN) {
@@ -3722,14 +3724,14 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 	rv = pcim_enable_device(pdev);
 	if (rv < 0) {
 		dev_err(&pdev->dev, "Unable to enable device\n");
-		goto iomap_err;
+		goto setmask_err;
 	}
 
 	/* Map BAR5 to memory. */
-	rv = pcim_iomap_regions(pdev, 1 << MTIP_ABAR, MTIP_DRV_NAME);
+	rv = pcim_request_region(pdev, MTIP_ABAR, MTIP_DRV_NAME);
 	if (rv < 0) {
-		dev_err(&pdev->dev, "Unable to map regions\n");
-		goto iomap_err;
+		dev_err(&pdev->dev, "Unable to request regions\n");
+		goto setmask_err;
 	}
 
 	rv = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
@@ -3849,9 +3851,6 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 		drop_cpu(dd->work[2].cpu_binding);
 	}
 setmask_err:
-	pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
-
-iomap_err:
 	kfree(dd);
 	pci_set_drvdata(pdev, NULL);
 	return rv;
@@ -3925,7 +3924,6 @@ static void mtip_pci_remove(struct pci_dev *pdev)
 
 	pci_disable_msi(pdev);
 
-	pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
 	pci_set_drvdata(pdev, NULL);
 
 	put_disk(dd->disk);
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
