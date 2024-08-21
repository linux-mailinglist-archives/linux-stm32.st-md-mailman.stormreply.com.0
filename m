Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCE2959594
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 09:19:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD373C6DD9A;
	Wed, 21 Aug 2024 07:19:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21697C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 07:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724224748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ch4IaqQVqf4n7EviAoZPVdER6FOrpbjt4F1+Z0pU5Q=;
 b=XQRQcraOQprtvG2VALJAkgW5igSp7f1TV6JcLhjFnx/AOH1pOBbh/ByAE/gIprujdOx/VW
 s5pU97cm2o4gVskXFKi0PaUdmhDwTtbIqsJXHOqYw2VtJvaWDPD9TGnmlwfCK7U/7sKn6B
 +vYzVcd9CQPl8NSnocKJXTVmRrK5EOM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-yF9FDykyPyiAJ7JWF2GKeA-1; Wed, 21 Aug 2024 03:19:05 -0400
X-MC-Unique: yF9FDykyPyiAJ7JWF2GKeA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-45029fafac8so9491451cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 00:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724224745; x=1724829545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ch4IaqQVqf4n7EviAoZPVdER6FOrpbjt4F1+Z0pU5Q=;
 b=AgGDae4DrdMtJSo+f2N6TXhe99wWLzE1+jBXvAHKy1rPEMIaSqfwJ38aXQ1HuiQaNg
 MECM2oMAd9riOKPpuPvRdzk4WDN7jKO8fOoxgmk6jtP2i/T97dnN6WS6jTQxMFdefMRt
 IUwNa9z2+dh2hNE4h5m7zApxQVbZb44QKrXH8WNGejie4YLpM7vfuuHNS3K8GepL1tBr
 vClBS7gRpHul6zGGh+nC1MhpirryQ4vTVFPvmTfsmwhejWq+nw3BdJ4lvOURzvI/Sf/M
 65cOjl5SoOw46rG6taS4SUWtllHrp1oIacnfbEDAh187WKbzzd7lae6BYrKg2NOf7IWX
 zH0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUUqUq4et0d5iULIgMNWOXH7bnnh97GE7/i/XZ2AwvL27vk439fbeECKt14YLfVDxZOAbbYnC0e16Nkw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy4AuL8Nq069g8M5ZgxLak5DMnz+z0FPKrPtJxw3bcMBiItethl
 APfu28cZVty6MTdbrKWQKf//x9onHHZNnPwrmXdGS2xEDs9fQRYNnfXU6q03q3LKww89Tow6UJI
 m7VTIHMMQkG91LGFqecWSitOUWwlqJsikZBYudwiXmVD1069lkTGYyIcEhc2wVPOIg0WRvV28SO
 J8Ng==
X-Received: by 2002:a05:620a:28d2:b0:79e:fec7:d6e9 with SMTP id
 af79cd13be357-7a6753141cfmr220360885a.32.1724224744798; 
 Wed, 21 Aug 2024 00:19:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVEMCIqqzymRUElFBuqPlu9emFwxQQrGNHV6b0BSUinl1kKKpb11Nr3ppWIzVNMM5PBVDB+w==
X-Received: by 2002:a05:620a:28d2:b0:79e:fec7:d6e9 with SMTP id
 af79cd13be357-7a6753141cfmr220355985a.32.1724224744387; 
 Wed, 21 Aug 2024 00:19:04 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff013ef2sm596207885a.11.2024.08.21.00.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 00:19:04 -0700 (PDT)
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
 Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>
Date: Wed, 21 Aug 2024 09:18:34 +0200
Message-ID: <20240821071842.8591-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821071842.8591-2-pstanner@redhat.com>
References: <20240821071842.8591-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/9] PCI: Make pcim_iounmap_region() a
	public function
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

The function pcim_iounmap_regions() is problematic because it uses a
bitmask mechanism to release / iounmap multiple BARs at once. It, thus,
prevents getting rid of the problematic iomap table mechanism which was
deprecated in commit e354bb84a4c1 ("PCI: Deprecate pcim_iomap_table(),
pcim_iomap_regions_request_all()").

Make pcim_iounmap_region() public as the successor of
pcim_iounmap_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/pci/devres.c | 3 ++-
 include/linux/pci.h  | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index b97589e99fad..4dbba385e6b4 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -771,7 +771,7 @@ EXPORT_SYMBOL(pcim_iomap_region);
  * Unmap a BAR and release its region manually. Only pass BARs that were
  * previously mapped by pcim_iomap_region().
  */
-static void pcim_iounmap_region(struct pci_dev *pdev, int bar)
+void pcim_iounmap_region(struct pci_dev *pdev, int bar)
 {
 	struct pcim_addr_devres res_searched;
 
@@ -782,6 +782,7 @@ static void pcim_iounmap_region(struct pci_dev *pdev, int bar)
 	devres_release(&pdev->dev, pcim_addr_resource_release,
 			pcim_addr_resources_match, &res_searched);
 }
+EXPORT_SYMBOL(pcim_iounmap_region);
 
 /**
  * pcim_iomap_regions - Request and iomap PCI BARs (DEPRECATED)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 01b9f1a351be..9625d8a7b655 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2297,6 +2297,7 @@ void __iomem * const *pcim_iomap_table(struct pci_dev *pdev);
 int pcim_request_region(struct pci_dev *pdev, int bar, const char *name);
 void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
 				       const char *name);
+void pcim_iounmap_region(struct pci_dev *pdev, int bar);
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
