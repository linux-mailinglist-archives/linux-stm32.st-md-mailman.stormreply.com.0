Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C7959598
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 09:19:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED492C6DD9D;
	Wed, 21 Aug 2024 07:19:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94AB0C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 07:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724224751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tC041gyCjeykzm80lE0q63CM17fX2IeQcUJmRWOoBEs=;
 b=W8jYD0lKJR/f4I7sxhSrjenfkGYMwckdC8agzfpvrh8wUhaURM+iwnBJKaKuYa6qxkTQZq
 PDuBqSitBIuEcGbFCbx/UMAHvJ8Y1c1hMVKLllh0k+KZLmDueUpeUajq080Y5xAw71aXhb
 qIu9QMSD19mIkfwdSk0FcEkXt9JEnoE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-UKWRyIrjPQ-WjHLxFq_upg-1; Wed, 21 Aug 2024 03:19:10 -0400
X-MC-Unique: UKWRyIrjPQ-WjHLxFq_upg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7a1dab8a2eeso775373885a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 00:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724224750; x=1724829550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tC041gyCjeykzm80lE0q63CM17fX2IeQcUJmRWOoBEs=;
 b=n91a21qX8G0Uyz64ltXnhlxlsjpr0qVhvnfk8ofS6fqRTQH0YMI0faHAWoMdSLX9jE
 Qvi5mljtgCaxU8EL+TytEN11FD+WwDC65mtGw2MZNySujMd8ffe+Y0xE84dwssivBei8
 YYxQH6HbHZGS/mJwDvSoGCOR21BU9qRKB4ylV+RzIfEGfEYS1N7gd+4c9p9XZBSJTfBF
 i6VrqzMie10MzT4Ew9ujTREPgQIdUCcOQw2vZWYpGEsnEdNR/qlCJGX5z62c+6LvdJhH
 FnjcjEkc4oKZThpfnlrA7GFUUNaUJmiUa4+FrP1GR4jfMyB/XJsJoMGAkHOr54uR5qWp
 NmUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgytr+PSxRWlW2FPxtdGjFSyD5kyQ//O69nt5eCTm18PTmTkoJa+jVzezS70WGKZv1NzcnBNe6GgLPug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxvWT+rx5oaImqqSaPxIbrXtk/xgUn+aAejvE+bguxi2hxmSTQI
 YHpoNfXTzt0gbOUfcSwTgoNgyXtvYBWzh0iC3XqM3OKcqcJ2pgNLo9IFkOEo9iN7qjBpwmH5Sfo
 vNAm+0Dk/WjCadmv66T/72FXQCuZT2BmjQDOGjRxTsKd4+2HP0Y2fD6VcykaNjNSRTu4ksiTVEu
 07Kg==
X-Received: by 2002:a05:620a:3726:b0:7a1:e9a3:7ed5 with SMTP id
 af79cd13be357-7a674028608mr225747185a.21.1724224749854; 
 Wed, 21 Aug 2024 00:19:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDcpjkeN2s+Pkah8lNRsAeGJCiY8h2x/UjZoGAkEUi08MzdlRaM+ySap03gvKQjNGS0t9n+w==
X-Received: by 2002:a05:620a:3726:b0:7a1:e9a3:7ed5 with SMTP id
 af79cd13be357-7a674028608mr225743585a.21.1724224749534; 
 Wed, 21 Aug 2024 00:19:09 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff013ef2sm596207885a.11.2024.08.21.00.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 00:19:09 -0700 (PDT)
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
Date: Wed, 21 Aug 2024 09:18:35 +0200
Message-ID: <20240821071842.8591-4-pstanner@redhat.com>
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
Subject: [Linux-stm32] [PATCH v2 2/9] fpga/dfl-pci.c: Replace deprecated PCI
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

pcim_iomap_regions() and pcim_iomap_table() have been deprecated by the
PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Port dfl-pci.c to the successor, pcim_iomap_region().

Consistently, replace pcim_iounmap_regions() with pcim_iounmap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/fpga/dfl-pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
index 80cac3a5f976..2099c497feec 100644
--- a/drivers/fpga/dfl-pci.c
+++ b/drivers/fpga/dfl-pci.c
@@ -41,10 +41,13 @@ struct cci_drvdata {
 
 static void __iomem *cci_pci_ioremap_bar0(struct pci_dev *pcidev)
 {
-	if (pcim_iomap_regions(pcidev, BIT(0), DRV_NAME))
+	void __iomem *bar0;
+
+	bar0 = pcim_iomap_region(pcidev, 0, DRV_NAME);
+	if (IS_ERR(bar0))
 		return NULL;
 
-	return pcim_iomap_table(pcidev)[0];
+	return bar0;
 }
 
 static int cci_pci_alloc_irq(struct pci_dev *pcidev)
@@ -296,7 +299,7 @@ static int find_dfls_by_default(struct pci_dev *pcidev,
 	}
 
 	/* release I/O mappings for next step enumeration */
-	pcim_iounmap_regions(pcidev, BIT(0));
+	pcim_iounmap_region(pcidev, 0);
 
 	return ret;
 }
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
