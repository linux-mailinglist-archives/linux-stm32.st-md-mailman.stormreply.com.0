Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CFC957E82
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 08:41:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0299EC78031;
	Tue, 20 Aug 2024 06:41:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47B7DC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724086401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIGjmIxgd4ZYoEGhHZhEaO790wvl9zuuKnu8/dcY7mY=;
 b=DQx9RQS/tI5GfYbaOQFMUDKGQfURH76OPMb5O11p7ZU2fHMmrEEapploBcV3HwbHMOEVyZ
 2Dtz5sZ6FVqtyX1fMIryM2lNBQvkWhpaGFxCzQjgqnINSZBbwKJvus17A8dtwOQ3n769/L
 4Rsw5dPHNayhn//so2kvAfKn3m3eXF4=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-MIu8DcXYNaSa2HexrGeEsQ-1; Mon, 19 Aug 2024 12:53:18 -0400
X-MC-Unique: MIu8DcXYNaSa2HexrGeEsQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-5d5cd0bd366so865744eaf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 09:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724086397; x=1724691197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RIGjmIxgd4ZYoEGhHZhEaO790wvl9zuuKnu8/dcY7mY=;
 b=Q4kxbaWGZkia4nus9Qzm0UQVet+g4F157zUg+AX4/pgrOLI7aPmEHEc9IkwcruyIEZ
 gE6OY4gYxQSOSXy4zTlXXNxKUWSp1ezoL0l6sYF+Tntvl4UurbUck+LqWUrQb9faFksZ
 vSWHv49ZFaQp4xOaO4moFpLhXm7CxKEu4TX0B9oxBEtMSIOF3TUcklWPvcEhWv52FLw9
 VvRmQ2mUXFf/5MePdvLyRbxgOua1xp3tWebiM6FGxn1ZJs8mXzvxxbn3Kk83DPFVuPSc
 uoSeAbrNYHxURYj821a64aVg1thG2C/EAx7vO/UNGR/mFjPL8HcIM6pMDDQZisszPTCK
 j7ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj0VMKdvAdwOARqVLT4IB4VqKBWX8vy7NzTJTXaki1kiqybP+VgywmEGgk+1aPMvSeAXe58tyltSr4oA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwWOYAqdOd3tk6zZetJwsVemgre3PNWJTMl29TiUVKOgeDEyN/Y
 5VpOubvh95kpqtLiVp4ENIxJpI526pTBaR6skhGRJlOp0FTZ/cLDXoVUt+e5+wml6pZ/B3mnnWA
 Vr4FnsqzagYvCz0BRECcCvbipY47I6L5ipCENyICcvNqiE5MOZ7KOUhYOmVBGdXXYDvUbk7EjPn
 zA/w==
X-Received: by 2002:a05:6358:6f15:b0:1ac:a26c:a617 with SMTP id
 e5c5f4694b2df-1b3933a2ef4mr724902055d.5.1724086397474; 
 Mon, 19 Aug 2024 09:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT/mWFQ9yoQUfbebPKob1DsZxH+iTK/HwcCt5JWpV0k06WRkWCd30wgdmfipghSMnyk6p9TQ==
X-Received: by 2002:a05:6358:6f15:b0:1ac:a26c:a617 with SMTP id
 e5c5f4694b2df-1b3933a2ef4mr724898255d.5.1724086397091; 
 Mon, 19 Aug 2024 09:53:17 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff01e293sm446579885a.26.2024.08.19.09.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:53:16 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: onathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
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
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Philipp Stanner <pstanner@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Damien Le Moal <dlemoal@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 19 Aug 2024 18:51:49 +0200
Message-ID: <20240819165148.58201-11-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819165148.58201-2-pstanner@redhat.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Tue, 20 Aug 2024 06:41:18 +0000
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 9/9] PCI: Remove pcim_iounmap_regions()
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

All users of pcim_iounmap_regions() have been removed by now.

Remove pcim_iounmap_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/pci/devres.c                          | 21 -------------------
 include/linux/pci.h                           |  1 -
 3 files changed, 23 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index ac9ee7441887..525f08694984 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -397,7 +397,6 @@ PCI
   pcim_iomap_regions_request_all() : do request_region() on all and iomap() on multiple BARs
   pcim_iomap_table()		: array of mapped addresses indexed by BAR
   pcim_iounmap()		: do iounmap() on a single BAR
-  pcim_iounmap_regions()	: do iounmap() and release_region() on multiple BARs
   pcim_pin_device()		: keep PCI device enabled after release
   pcim_set_mwi()		: enable Memory-Write-Invalidate PCI transaction
 
diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 30c813766e8b..a1689100a535 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -1014,27 +1014,6 @@ int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 }
 EXPORT_SYMBOL(pcim_iomap_regions_request_all);
 
-/**
- * pcim_iounmap_regions - Unmap and release PCI BARs
- * @pdev: PCI device to map IO resources for
- * @mask: Mask of BARs to unmap and release
- *
- * Unmap and release regions specified by @mask.
- */
-void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
-{
-	int i;
-
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (!mask_contains_bar(mask, i))
-			continue;
-
-		pcim_iounmap_region(pdev, i);
-		pcim_remove_bar_from_legacy_table(pdev, i);
-	}
-}
-EXPORT_SYMBOL(pcim_iounmap_regions);
-
 /**
  * pcim_iomap_range - Create a ranged __iomap mapping within a PCI BAR
  * @pdev: PCI device to map IO resources for
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 7de75900854a..4eee09624932 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2302,7 +2302,6 @@ void pcim_iounmap_region(struct pci_dev *pdev, int bar);
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
-void pcim_iounmap_regions(struct pci_dev *pdev, int mask);
 void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
 				unsigned long offset, unsigned long len);
 
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
