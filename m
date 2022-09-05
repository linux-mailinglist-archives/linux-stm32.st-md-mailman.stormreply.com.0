Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF9D5ACAAE
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 08:31:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D190C6410C;
	Mon,  5 Sep 2022 06:31:28 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B969C640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 06:31:27 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id h188so7266480pgc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Sep 2022 23:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ynLt5at1fPNx8OKjwAxE9TZqe0qSgR0LfMKd2/ukQyE=;
 b=o0c6aYKNJPicMxZzE1PkKtIkQSLJsOwJFh3bcl+LYHEmHr5TaY61x79o0SD+ivoxZk
 DPf8vEmv/G+sAfYEywkQmzYS8TqIgrCK6wSXSLFwKEAK7Cbw08AkpqBT96rMRzPEVa0T
 aMMtmW+0f9glO6/cQ8keV15iEPs13h8fVonila+4g/ocL46xIqfFx7rDdBBE/MrAjqtO
 5sl8bIgqi3+F/6v0vHcDrNJ1k/oQaqO7VkvMD/DoMztr6Me8/am6pi66ZHOCMZneRwid
 Zb3n7NhsZprL3d7KX03DatOFU7DvGf4H7pflgVDpxL0aWedJ+FcdT7hgq54vmCH9Sgv5
 7z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ynLt5at1fPNx8OKjwAxE9TZqe0qSgR0LfMKd2/ukQyE=;
 b=3+4ly53gTo0Bioasmg+i3szsoLU/Iw+ptoxTMT7Pzz3Uu4v0Eswki1DsKccytabID7
 XadrFqu1cX+UZzL8Fz9drJtLTlJeiUy3n/xbo85DeILGa7dPqxNulReLgP6CShKn+zMt
 eaQEEhcsxHLJotQdfoK4mwerc5vwoCiD+fXWBpxE6FBCDiceEb9oOEfpVwB4gcWZFD/I
 GkC1/SyMNJ3QhBXFHrYYtganSTrhIQIQzHi5W+iSZg3SUouaE3cyqiuP8ScMy9ieiC5v
 ag2PLi33c+MnJNve7wZldtDPkn/9ffIvfzUrTiSiJqjvDOQGEcgVwRm87QpK40W4/EVl
 QDMg==
X-Gm-Message-State: ACgBeo0rpkiH9Ks+gkcZq8ua77pby9TJpF0ZZkHN83cbgbDrytWjsU8t
 OSqH5qSWgWhjCkfVXHIovDA=
X-Google-Smtp-Source: AA6agR6nqqurcOlRTW5MwumdR49aUTj5edmtMHpG5pntto/Ic3d6LDisTkJ/i3KAH13zMjWGur9aVA==
X-Received: by 2002:a63:62c3:0:b0:434:2b09:6f62 with SMTP id
 w186-20020a6362c3000000b004342b096f62mr6851828pgb.374.1662359486505; 
 Sun, 04 Sep 2022 23:31:26 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:26 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Airlie <airlied@linux.ie>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Date: Sun,  4 Sep 2022 23:30:59 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-7-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
Cc: linux-watchdog@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 07/11] PCI: apple: switch to using
	fwnode_gpiod_get_index()
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

I would like to stop exporting OF-specific gpiod_get_from_of_node()
so that gpiolib can be cleaned a bit, so let's switch to the generic
fwnode property API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index a2c3c207a04b..d83817d3ff86 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -516,8 +516,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
 	u32 stat, idx;
 	int ret, i;
 
-	reset = gpiod_get_from_of_node(np, "reset-gpios", 0,
-				       GPIOD_OUT_LOW, "PERST#");
+	reset = fwnode_gpiod_get_index(of_fwnode_handle(np),
+				       "reset", 0, GPIOD_OUT_LOW, "PERST#");
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
 

-- 
b4 0.10.0-dev-fc921
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
