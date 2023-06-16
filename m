Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C39DE7329CA
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 10:30:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81850C6B45A;
	Fri, 16 Jun 2023 08:30:39 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08044C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 08:30:39 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-4f7b641f54cso488041e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 01:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686904238; x=1689496238;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eDWfJmNzbQmAA05jmoYd7JfIZxnwDGKXAdDTLkWtQe8=;
 b=rnRES/KizDc5sZNv1sxzWYXABFokGf5WfqZ4Z5QCzoPAkNGS0PZiGzBnvfszK0qSDz
 pKiLL6uDm8yoxCHV90drVHHsVJvv1m+P8hVYxgSH86akSYG6YEuut2qeGuzi64gXpznu
 gsBv8sOMLCbx90Wp4ymOh+dR1CkdLpQiauu1YYljK56vJxymqT05vMpvaOGG8S3GpfIt
 lwWtiwevyOQiwKvcOpNFMNBobd3H5sCOaN+IdnYkvgj3GRviThDF8/dEIrEdr25uYRvR
 I0dpQzO9QzYKTm3eWAguadGptMGdWDetd6RzDCKw+iufED5MozIv8yTiA5fwM9QPRRrw
 scFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686904238; x=1689496238;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eDWfJmNzbQmAA05jmoYd7JfIZxnwDGKXAdDTLkWtQe8=;
 b=W4Dd/XVLa0QS+U3f7kA4kN3S1XDpk8bafzf1FwgBcd0LyjJP9apC9H52MuKuEdeLGY
 BwS/19poQcoiBKX1iKZQVm6VPlIQr5fv1DR8IVmpJewz6/jV45P5b+5L85ia2sarotdA
 e01Lltov67I6HAZyeTHlVjO4qny1hNg7oJTs0B/reZ/KoT6rFhfN5pOijyvH6nX42eBw
 QU+lIzGoHa+fhwGKZDcODXrkKpWsGvP6584ecwge97oZ+FbzfeJN9G383H8k8Z+YtkwO
 uBPl1RlDPdYQBbCFtAb9QLb6vNDQe1lf+j226G+X9ijeUMX0FlrR8Cd+ipx7JwYMuOX3
 7cmA==
X-Gm-Message-State: AC+VfDyO7DGGjq8WCZEBlch17O6ojVYgtZqMzV3lltqG//FqCeBYvpmg
 wQtk5ggHT13u4Pv6fH9gh8dZ1w==
X-Google-Smtp-Source: ACHHUZ43n6Onh9gPaHpBFHKAz+4wBfXNSaEw9klHW3mmZGfZx9mivm/Sm/i5wD68dFDsVnhL8xibtw==
X-Received: by 2002:a19:ca50:0:b0:4f8:578f:ace1 with SMTP id
 h16-20020a19ca50000000b004f8578face1mr367985lfj.21.1686904238280; 
 Fri, 16 Jun 2023 01:30:38 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 j8-20020ac25508000000b004eb44c2ab6bsm2918106lfk.294.2023.06.16.01.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 01:30:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 10:30:35 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v6-3-b850ec8019f3@linaro.org>
References: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 3/9] mmc: mmci: Stash status while waiting
	for busy
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

Some interesting flags can arrive while we are waiting for
the first busy detect IRQ so OR then onto the stashed
flags so they are not missed.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v4->v6:
- No changes.
ChangeLog v3->v4:
- No changes.
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index eee449f90915..47b306e45f78 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -703,6 +703,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 */
 	if (host->busy_status &&
 	    (status & host->variant->busy_detect_flag)) {
+		host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 		return false;
 	}

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
