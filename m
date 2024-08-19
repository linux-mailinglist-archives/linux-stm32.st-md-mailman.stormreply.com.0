Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 383E2957E81
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 08:41:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDB61C7802F;
	Tue, 20 Aug 2024 06:41:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE3A3C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724086395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abZiwvPf4gC19vxFT17Sz8slSRtUXISkEhAwbNUMlrw=;
 b=WWCBbyVHi01AbgvLhjvBzYpQvazdkekOH4eF/uWA5su5pq/omb2za3uZI/RSPcRaNwQbuJ
 hdQk7o4QVoE0RSzNJLFIZCjcFol6mC1PDxwJnSA/Ja2zmf4rGhcJQBSVcaiVyq81O4K4T0
 3R196ySyVUENbftSEPdGE3BrwlD2RKA=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-kn20iXV4PWaZltuIcXx3RQ-1; Mon, 19 Aug 2024 12:53:14 -0400
X-MC-Unique: kn20iXV4PWaZltuIcXx3RQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-4f5111f666fso188783e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 09:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724086392; x=1724691192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=abZiwvPf4gC19vxFT17Sz8slSRtUXISkEhAwbNUMlrw=;
 b=DsOXliJpATR5sxG0TM6ISzRaGd6D9+q/McGyOSbAaLpB+sLV3/P9eWourPzcvJJZGN
 +1pvP2sRCT4fL4N1Jk0W4D5t5j4NC3rkey3I6+InJJfmxxDXzfNtUTXX3B9xRo/tkk6m
 aCclnX2a1grYeRAYM2yhjbWESbMqUMg1IpFBeQXVMDVNPHOWjXcijt9Nt5CA08WcvdEQ
 4Yb0MJqVhM08F/iIADOWi/fSsWDUY1zFFI1Cao++iDb4LP6GIyOA8OL+3qSXTzZSKqUA
 1DmUnkjZYcT03q17R1DoQZgl+Ml+yaOEtFOMU2+Tw+boh5pMbqkXQoNPPV+/7tEMQkxv
 fVUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZCNO9QgvJsjxczTFrp5IyNwdjn91++zxEkdi0EIp1e+xdqj/iU9GtvOdsT0H62vmLF+ufGuIE76UE4A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzmgJsNMm07vnoATM/4UNryAwNwKNRGM6lq1hNrFzC5boqMIrdn
 J9WHNniRs+QQ9LejiUX65j0/AsUxrLPlYtLx45MbB7HMyDxXItyBd3IXTrqxQKUVfnbp1F2hKyr
 8GJvI4wW9MalL6qCyK8gSU7WI4sfp+kLFr904vCNPkXwBapYYarmSlfKRmo0cvyn1D+15rjWh5w
 d41A==
X-Received: by 2002:a05:6102:5127:b0:493:bb70:940 with SMTP id
 ada2fe7eead31-4977992674fmr7984188137.2.1724086392215; 
 Mon, 19 Aug 2024 09:53:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSFSVYmUjqgNVHiq1+h9E7HGJis8qQ3DMxEZS8Skowa7KMQsueVdBGNDdQuxxSfXwtk0QtBA==
X-Received: by 2002:a05:6102:5127:b0:493:bb70:940 with SMTP id
 ada2fe7eead31-4977992674fmr7984139137.2.1724086391863; 
 Mon, 19 Aug 2024 09:53:11 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff01e293sm446579885a.26.2024.08.19.09.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:53:11 -0700 (PDT)
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
Date: Mon, 19 Aug 2024 18:51:48 +0200
Message-ID: <20240819165148.58201-10-pstanner@redhat.com>
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
Subject: [Linux-stm32] [PATCH 8/9] vdap: solidrun: Replace deprecated PCI
	functions
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

solidrun utilizes pcim_iomap_regions(), which has been deprecated by the
PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()"), among other
things because it forces usage of quite a complicated bitmask mechanism.
The bitmask handling code can entirely be removed by replacing
pcim_iomap_regions() and pcim_iomap_table().

Replace pcim_iomap_regions() and pcim_iomap_table() with
pci_iomap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/vdpa/solidrun/snet_main.c | 47 +++++++++++--------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/vdpa/solidrun/snet_main.c b/drivers/vdpa/solidrun/snet_main.c
index 99428a04068d..abf027ca35e1 100644
--- a/drivers/vdpa/solidrun/snet_main.c
+++ b/drivers/vdpa/solidrun/snet_main.c
@@ -556,33 +556,24 @@ static const struct vdpa_config_ops snet_config_ops = {
 static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet *psnet)
 {
 	char name[50];
-	int ret, i, mask = 0;
+	int i;
+
+	snprintf(name, sizeof(name), "psnet[%s]-bars", pci_name(pdev));
+
 	/* We don't know which BAR will be used to communicate..
 	 * We will map every bar with len > 0.
 	 *
 	 * Later, we will discover the BAR and unmap all other BARs.
 	 */
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i))
-			mask |= (1 << i);
-	}
-
-	/* No BAR can be used.. */
-	if (!mask) {
-		SNET_ERR(pdev, "Failed to find a PCI BAR\n");
-		return -ENODEV;
-	}
-
-	snprintf(name, sizeof(name), "psnet[%s]-bars", pci_name(pdev));
-	ret = pcim_iomap_regions(pdev, mask, name);
-	if (ret) {
-		SNET_ERR(pdev, "Failed to request and map PCI BARs\n");
-		return ret;
-	}
+		if (pci_resource_len(pdev, i)) {
+			psnet->bars[i] = pcim_iomap_region(pdev, i, name);
+			if (IS_ERR(psnet->bars[i])) {
+				SNET_ERR(pdev, "Failed to request and map PCI BARs\n");
+				return PTR_ERR(psnet->bars[i]);
+			}
+		}
 
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (mask & (1 << i))
-			psnet->bars[i] = pcim_iomap_table(pdev)[i];
 	}
 
 	return 0;
@@ -591,18 +582,15 @@ static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet *psnet)
 static int snet_open_vf_bar(struct pci_dev *pdev, struct snet *snet)
 {
 	char name[50];
-	int ret;
 
 	snprintf(name, sizeof(name), "snet[%s]-bar", pci_name(pdev));
 	/* Request and map BAR */
-	ret = pcim_iomap_regions(pdev, BIT(snet->psnet->cfg.vf_bar), name);
-	if (ret) {
+	snet->bar = pcim_iomap_region(pdev, snet->psnet->cfg.vf_bar, name);
+	if (IS_ERR(snet->bar)) {
 		SNET_ERR(pdev, "Failed to request and map PCI BAR for a VF\n");
-		return ret;
+		return PTR_ERR(snet->bar);
 	}
 
-	snet->bar = pcim_iomap_table(pdev)[snet->psnet->cfg.vf_bar];
-
 	return 0;
 }
 
@@ -650,15 +638,12 @@ static int psnet_detect_bar(struct psnet *psnet, u32 off)
 
 static void psnet_unmap_unused_bars(struct pci_dev *pdev, struct psnet *psnet)
 {
-	int i, mask = 0;
+	int i;
 
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		if (psnet->bars[i] && i != psnet->barno)
-			mask |= (1 << i);
+			pcim_iounmap_region(pdev, i);
 	}
-
-	if (mask)
-		pcim_iounmap_regions(pdev, mask);
 }
 
 /* Read SNET config from PCI BAR */
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
