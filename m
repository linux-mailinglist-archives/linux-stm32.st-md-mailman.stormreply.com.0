Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F393F957E7C
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 08:41:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67F38C78019;
	Tue, 20 Aug 2024 06:41:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02347C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724086368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tC041gyCjeykzm80lE0q63CM17fX2IeQcUJmRWOoBEs=;
 b=L2Aydgd/9yNEcoKPFHoWaU0ii5fG3jzRZ8/pzPvCIpHRZ+VITsF32CROL2x2R5UTJDIa1L
 fLl8MSjJQlPzFAaHaCl/pW3rSSnD+g5h+6+CnDZI0lpkWPKRmNtrqh+lRXpN3c533GH+z6
 Im5lU4ypHjLv4Ff3npCI0Gh8o9IfDG4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-s05BPR0NMAyHqeKlNmuvEg-1; Mon, 19 Aug 2024 12:52:47 -0400
X-MC-Unique: s05BPR0NMAyHqeKlNmuvEg-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6bf6ec41d7cso8661176d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 09:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724086366; x=1724691166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tC041gyCjeykzm80lE0q63CM17fX2IeQcUJmRWOoBEs=;
 b=uLIyBbnODFHhtNRkPz4vc1COY9JbCsacgfRhgswrK7+SZlHipMiHB7iozyMtxpyTLE
 Q7hr8lc+ixHSGHuKkt5tl5L7xIYXyB2CpUAk0nxXNUMkhJ63U1r/eSToP058RrWXmsYW
 pGehJkFvPykDGAovV4OUYnM2UaVvCNhgLl5jhwimWcF7ZTFk2qzdVTgmtqS7WGLTvI6K
 Yis0n+hRO0GyKKhe9F+k1tWdObbg7/PFVkvzXMJkqzwxuyZhGrJgiLSpFlX5d5QpGRFw
 FdZOM/5qcowa7SfDQtfNTZyXvQ5zZpdXviXD7R/jjL+JUH0S+4sut81Rkm5hxO9vDvDl
 byvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhNjPVpk4SvQG96QKTDjhlZnTvdvrE9vmQJK6ZE4PhG/DxUn0M/e6jl3xwU8jqzVuE+TYczenPQ8vgMA/oOcDQUbOFXKzDqHADXrgXOrwUGZBKI3lizLcG
X-Gm-Message-State: AOJu0YxsnDPTmXuL5jXyQK3RfVCTkeepaVhbHQmFvnYRqGndmb49wCvi
 G6W1Hz0DI36MrMtbaa/6HiEFaNjbKJ0OLoFKC+uiJiVJSlGVeZOL/A+FRY/1MxJiZVMqRiLeIBW
 rsZvCg5jxj2M6VLubJYUyuvpBhbhzBdMfklq1YeFxCixAeoAH1w/pL1m44d0uW/yT0MRa0EQLHi
 xx6g==
X-Received: by 2002:a05:620a:370c:b0:79b:eca2:b807 with SMTP id
 af79cd13be357-7a506b5a38amr835423485a.3.1724086366030; 
 Mon, 19 Aug 2024 09:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtuH1Vc6yAH1kELWuk66Dch7OPcqy61XGhK4KsxZEzCDqaZHzSUCLXnDGGtW4mk4ZWqmvkng==
X-Received: by 2002:a05:620a:370c:b0:79b:eca2:b807 with SMTP id
 af79cd13be357-7a506b5a38amr835421185a.3.1724086365518; 
 Mon, 19 Aug 2024 09:52:45 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff01e293sm446579885a.26.2024.08.19.09.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:52:45 -0700 (PDT)
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
Date: Mon, 19 Aug 2024 18:51:43 +0200
Message-ID: <20240819165148.58201-5-pstanner@redhat.com>
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
Subject: [Linux-stm32] [PATCH 3/9] fpga/dfl-pci.c: Replace deprecated PCI
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
