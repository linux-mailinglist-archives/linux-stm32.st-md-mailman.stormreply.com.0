Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEB2957E79
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 08:41:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35316C71289;
	Tue, 20 Aug 2024 06:41:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8E1CC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724086358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwxbMRfa8A0AMonhiodSZXz8snc1ppjCUOJ6oxZMysE=;
 b=OrHjSB0wyGLxVAHbxF8kqFP29uGBxLDDRv7Ops7LOliZLNGX9M0rGTP3NwnEpfNOKAtGht
 /njkpjuCj+n6xAQBtfxvjYCpji0V5yxnoQrlET4hPobqADDE1z2hGyakcW+gIDR0m0JvWo
 oLpRH3xmjkrqgVvzgJO9qiNgXv9FPeo=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-enLPF5o4OXmZzvL-5Hc6rQ-1; Mon, 19 Aug 2024 12:52:36 -0400
X-MC-Unique: enLPF5o4OXmZzvL-5Hc6rQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-842f18812d7so82840241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 09:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724086355; x=1724691155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NwxbMRfa8A0AMonhiodSZXz8snc1ppjCUOJ6oxZMysE=;
 b=NSJeFPEzRSMk8vMzesc0ABFMqcApAaIOebTUY3UIcOtNY1Rg7uGNJpQP3FhTjNsaY6
 MiGZWqDOLv2/zm1kR9Ax9PgoD7qG7AEfi3C0A1hIM/e8mWtoCOVCeocW/AcpEicAZ+nC
 IAXHRNNHiMGPIAXO03rSCx4XdOx8cdMXH63c7WDHaIMpXpxbeVItlZEM1buEy1US5QTV
 QhpcAOrEyL59da+HNGD8huGDxaA6Ignohb88TGb64totavrcKv5BwMJo2btbcjKyoOxJ
 QuqOrpiavEvqRvyG/wbpY6wIR3q07Pe9QyLCSTajJay08b7qrUeUEIjuE7Yjy10k8slE
 LMqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwvY9zSG/De1BXi10axLNlsg+SeTs+i2YjtSuAk5W76p1hVn149tMYtpLIOon46Wih0UlJRWDcCTag1JBMsGIpUIXdbo5VaRyiU7wC3qRJ8uji4HX/jlKV
X-Gm-Message-State: AOJu0YxjYbAaz98mkibNh6DvrhbTZR2AZVwChIbFhX+xvCyiVQDT4163
 /YBD83RLUEW6y3SXU4/EY/s0fzPcdIF5NifJewmezNiWpr2ekrV3p/HurP0NawFTc5LgnG4o5xa
 r6xTw1WPTutO8gGnMyYJ2TywP2K91vlAfrFd74HZCXJ8yE1wK05rOuUeLueSksDHycsqxaEzxil
 clfA==
X-Received: by 2002:a05:6102:5494:b0:495:c40b:f7ca with SMTP id
 ada2fe7eead31-4977bf0d2d4mr5497595137.3.1724086355212; 
 Mon, 19 Aug 2024 09:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHysbKKqXtZq0nkk+KqqjyQL404GAu1sdBPta+GD7btYSYi5SLJQ3pijiCStxEYNXypkns3Gw==
X-Received: by 2002:a05:6102:5494:b0:495:c40b:f7ca with SMTP id
 ada2fe7eead31-4977bf0d2d4mr5497574137.3.1724086354811; 
 Mon, 19 Aug 2024 09:52:34 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff01e293sm446579885a.26.2024.08.19.09.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:52:34 -0700 (PDT)
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
Date: Mon, 19 Aug 2024 18:51:41 +0200
Message-ID: <20240819165148.58201-3-pstanner@redhat.com>
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
Subject: [Linux-stm32] [PATCH 1/9] PCI: Make pcim_release_region() a public
	function
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

pcim_release_region() is the managed counterpart of
pci_release_region(). It can be useful in some cases where drivers want
to manually release a requested region before the driver's remove()
callback is invoked.

Make pcim_release_region() a public function.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 1 +
 drivers/pci/pci.h    | 1 -
 include/linux/pci.h  | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index b97589e99fad..608f13ef2a4b 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -906,6 +906,7 @@ void pcim_release_region(struct pci_dev *pdev, int bar)
 	devres_release(&pdev->dev, pcim_addr_resource_release,
 			pcim_addr_resources_match, &res_searched);
 }
+EXPORT_SYMBOL(pcim_release_region);
 
 
 /**
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 2fe6055a334d..01b55ed2867c 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -889,7 +889,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
 int pcim_intx(struct pci_dev *dev, int enable);
 int pcim_request_region_exclusive(struct pci_dev *pdev, int bar,
 				  const char *name);
-void pcim_release_region(struct pci_dev *pdev, int bar);
 
 /*
  * Config Address for PCI Configuration Mechanism #1
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 01b9f1a351be..dfa9af3a9c22 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2295,6 +2295,7 @@ void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen);
 void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr);
 void __iomem * const *pcim_iomap_table(struct pci_dev *pdev);
 int pcim_request_region(struct pci_dev *pdev, int bar, const char *name);
+void pcim_release_region(struct pci_dev *pdev, int bar);
 void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
 				       const char *name);
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
