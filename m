Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBA29595A7
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 09:19:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37601C6DD9D;
	Wed, 21 Aug 2024 07:19:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ACCAC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 07:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724224779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqXkRiyUxqSbliwQmHVEASu4D/RYGtBd8mGoyCxVF1o=;
 b=S2iV7tQpdQ/kn88sx1goxDRsivALqU30KDjo9/8eJhGciJ5iHQvqutWim4UWYmTxRyoUwe
 No2L9bCo32iFI5MLgW4Ft7xQT612qvYRv5VudDbjv7XQk9XFHt88m6nVaY3+F/xdwx68Uf
 rDfdcsayJ0Zjqm7H3eKfM7a3+EU6+5E=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-zUD7T_WEOeq-HFFjOmx_Dw-1; Wed, 21 Aug 2024 03:19:37 -0400
X-MC-Unique: zUD7T_WEOeq-HFFjOmx_Dw-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7a1ddb0cf87so666423285a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 00:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724224777; x=1724829577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kqXkRiyUxqSbliwQmHVEASu4D/RYGtBd8mGoyCxVF1o=;
 b=k0t7XnCkvcpQcFxxBVSVvyCLFQt/DmMdEITGPGHdKVHuBUhM1hFkGBNXAJDGdm3gb+
 Jmdsbo+dqApXBV+7KK4eMLI+dEih5ORaZZPUw5TJeENRfAwj+ShW8945XayPkrmy3OrC
 M6VvkKucTJ142hQnHiqREzOyUcfCd4c5QyiDGBNX0w0FieEb54yHCyJLpNubwG2tG36o
 TA/umI9SYkv5e0OLmyrZ86VyoaV6qLrrZaad7BE42pKvnhxnl/PPpuTJl60i0UP1ycHq
 y/9gdNqPXESV7epykXgbp17U7lLcMf4VgIXHCJFW5XryHXrs8khkf/r3QHSy5ZDiINOw
 eqKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJcGJS0DDDi7pOjxWCKm9gzI7T3nfbkXPm9mZ3jvKIPqRMJdTRhDMWBv7PuvvdWZPRDBLlLeT2/3Un8Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwcaegH7HZ9ITcX7yrwj8CuDBsPdk6WuGjSnqn8P9xTUazjKcRL
 yE44qBrtnZSlftnBuLcCRLxbGJNHLRn335vodu34PzfDvayJXHh6m/yK3d0uGBysfsQ/pAZqvGj
 zM9LodL9zrc+/u3rf8hDNzuPzXlzpxruhAZ6+nXw0U/5MQ/G1sGYbzLWb3seQvz6hfT/1swNv2C
 RLGA==
X-Received: by 2002:a05:620a:4723:b0:795:5672:9298 with SMTP id
 af79cd13be357-7a674057cddmr157584985a.41.1724224776884; 
 Wed, 21 Aug 2024 00:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzvsJUVRLWmc58Q7QaiuvVDQhxagsdXHOmahNlcC4bwy6acZdi9NrIfC29BkE+CkLUyoCrrg==
X-Received: by 2002:a05:620a:4723:b0:795:5672:9298 with SMTP id
 af79cd13be357-7a674057cddmr157580485a.41.1724224776363; 
 Wed, 21 Aug 2024 00:19:36 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff013ef2sm596207885a.11.2024.08.21.00.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 00:19:36 -0700 (PDT)
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
Date: Wed, 21 Aug 2024 09:18:40 +0200
Message-ID: <20240821071842.8591-9-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821071842.8591-2-pstanner@redhat.com>
References: <20240821071842.8591-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/9] vdpa: solidrun: Fix potential UB bug
	with devres
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

In psnet_open_pf_bar() a string later passed to pcim_iomap_regions() is
placed on the stack. Neither pcim_iomap_regions() nor the functions it
calls copy that string.

Should the string later ever be used, this, consequently, causes
undefined behavior since the stack frame will by then have disappeared.

Fix the bug by allocating the string on the heap through
devm_kasprintf().

Cc: stable@vger.kernel.org	# v6.3
Fixes: 51a8f9d7f587 ("virtio: vdpa: new SolidNET DPU driver.")
Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Closes: https://lore.kernel.org/all/74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanadoo.fr/
Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/vdpa/solidrun/snet_main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/solidrun/snet_main.c b/drivers/vdpa/solidrun/snet_main.c
index 99428a04068d..4d42a05d70fc 100644
--- a/drivers/vdpa/solidrun/snet_main.c
+++ b/drivers/vdpa/solidrun/snet_main.c
@@ -555,7 +555,7 @@ static const struct vdpa_config_ops snet_config_ops = {
 
 static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet *psnet)
 {
-	char name[50];
+	char *name;
 	int ret, i, mask = 0;
 	/* We don't know which BAR will be used to communicate..
 	 * We will map every bar with len > 0.
@@ -573,7 +573,10 @@ static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet *psnet)
 		return -ENODEV;
 	}
 
-	snprintf(name, sizeof(name), "psnet[%s]-bars", pci_name(pdev));
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "psnet[%s]-bars", pci_name(pdev));
+	if (!name)
+		return -ENOMEM;
+
 	ret = pcim_iomap_regions(pdev, mask, name);
 	if (ret) {
 		SNET_ERR(pdev, "Failed to request and map PCI BARs\n");
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
