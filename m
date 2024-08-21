Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D7F95959F
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 09:19:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19CC5C6DD9A;
	Wed, 21 Aug 2024 07:19:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BF6DC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 07:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724224768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJtm3uYD4inmsDECmrMxkvS6gTo4VXXtBuq4LxNQ/Aw=;
 b=Snw0ebG3N+d4H+PyWRPe74rIB6Nm7roNWIhVjY+bbk5gLeDGwiWiIT5NLHIawkqj3Smbly
 BtFMYdCjF9bAyav2onUjj1j6vldG8mn3EKFcli6xs9fobZPF648KYLzdCrxlvaEWZUy/sp
 Qa/GqbyfqzhifVq7arY+C5X3eYewwwQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-Tor5YZiWNU-prOBX0EcpVQ-1; Wed, 21 Aug 2024 03:19:26 -0400
X-MC-Unique: Tor5YZiWNU-prOBX0EcpVQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7a1e9a3825aso705154285a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 00:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724224766; x=1724829566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJtm3uYD4inmsDECmrMxkvS6gTo4VXXtBuq4LxNQ/Aw=;
 b=X1aTM6K3/4Gv9JZKg7Nqppjk+RvcYdNLnNg/BDl0XtP54J66NIeYoU9EDhsf4b3ahS
 rTEpZQtEpPtt3A+qw5uawU0zYzJZ0XgcFqJryvhlsjKDP3vEVKKdVaU8AW4Xs7ujp5Hl
 u71SOw2gkWcq4swXb4VEXie6cOj9qKeFYo3tlKsoVOsEDn+sKbZ3I5pF2FMckrRdFKSQ
 KoNJlzUVN3D/O1ScfZ1OwecMZykNNbql1lLrv06xg/ka3ldZHHcGD/91Tjm01cIhpyyy
 BZDwwV0CvNzKL5U77Plr91cG7SvxWOx6J9UQrpkWBubDCzX9vK/V64fr5CHjoSF7TC+K
 d2Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWViteTNeXFwjeerD3zPPnmdOpEVyijGqsn2aNaZke6wtqZ+nFdo5BqBtQNZYfg6YlJD/tUr9TZKDXDyg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwvSMJANkkU8GTOQNlQoPcsKLkNTSZP8Qq9wi7DivqDeru4mhCm
 7w4+WIo8qbk4MD9ErxPn9qc4ExJCinuBBfW09M7nMno57vdf10lToEtCaQsmyd6A7LbOAI+h3f+
 gCVzi5uNvjLavD3aU/wPge5zSMRp907+VLdMmCvro7RiMbeP+No0Qe9l9s2tpCh8pZR2JjmdlHd
 C+1w==
X-Received: by 2002:a05:620a:4447:b0:7a6:6b98:8e36 with SMTP id
 af79cd13be357-7a6748f3e18mr161731585a.16.1724224766175; 
 Wed, 21 Aug 2024 00:19:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmBWfs7G37gw0gXLs+jJ1ak3VoPRzhFXnnqGnvalRJy1Z9qU/iCGfIEx/5sYtw8Qbb8DqgNA==
X-Received: by 2002:a05:620a:4447:b0:7a6:6b98:8e36 with SMTP id
 af79cd13be357-7a6748f3e18mr161728685a.16.1724224765719; 
 Wed, 21 Aug 2024 00:19:25 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff013ef2sm596207885a.11.2024.08.21.00.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 00:19:25 -0700 (PDT)
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
Date: Wed, 21 Aug 2024 09:18:38 +0200
Message-ID: <20240821071842.8591-7-pstanner@redhat.com>
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
Subject: [Linux-stm32] [PATCH v2 5/9] ethernet: cavium: Replace deprecated
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

pcim_iomap_regions() and pcim_iomap_table() have been deprecated by
the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Replace these functions with the function pcim_iomap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/net/ethernet/cavium/common/cavium_ptp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/cavium/common/cavium_ptp.c b/drivers/net/ethernet/cavium/common/cavium_ptp.c
index 9fd717b9cf69..1849c62cde1d 100644
--- a/drivers/net/ethernet/cavium/common/cavium_ptp.c
+++ b/drivers/net/ethernet/cavium/common/cavium_ptp.c
@@ -239,11 +239,11 @@ static int cavium_ptp_probe(struct pci_dev *pdev,
 	if (err)
 		goto error_free;
 
-	err = pcim_iomap_regions(pdev, 1 << PCI_PTP_BAR_NO, pci_name(pdev));
-	if (err)
+	clock->reg_base = pcim_iomap_region(pdev, PCI_PTP_BAR_NO, pci_name(pdev));
+	if (IS_ERR(clock->reg_base)) {
+		err = PTR_ERR(clock->reg_base);
 		goto error_free;
-
-	clock->reg_base = pcim_iomap_table(pdev)[PCI_PTP_BAR_NO];
+	}
 
 	spin_lock_init(&clock->spin_lock);
 
@@ -292,7 +292,7 @@ static int cavium_ptp_probe(struct pci_dev *pdev,
 	clock_cfg = readq(clock->reg_base + PTP_CLOCK_CFG);
 	clock_cfg &= ~PTP_CLOCK_CFG_PTP_EN;
 	writeq(clock_cfg, clock->reg_base + PTP_CLOCK_CFG);
-	pcim_iounmap_regions(pdev, 1 << PCI_PTP_BAR_NO);
+	pcim_iounmap_region(pdev, PCI_PTP_BAR_NO);
 
 error_free:
 	devm_kfree(dev, clock);
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
