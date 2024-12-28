Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AC99FDCA9
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Dec 2024 00:33:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62098C78033;
	Sat, 28 Dec 2024 23:33:01 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCB3DC78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 23:32:57 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso65612505e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 15:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735428776; x=1736033576;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LKu4EPBvLsopgOFZpl7wz7qwa3Ue5APX8+1kt9ZJzXY=;
 b=We0/fnGnM+6hDX0Mx1MkiG6gvYV4BTt0DX2m/kKQZeh7rJRijUmLRExpmimbOMeVEx
 JkIyfcgkZybkdv/OmgfLQEtKFnQ84XWeyFFfT7rOV9pr1ktI0qrvtlkgjg8cDZ0IjVhl
 9FFrjq+Vpk0rvRh1v6bm2mtBqmQM1lMZ1JKxH89NsJwktOYCpSvvDu91vLxfKVqTz+Tn
 7S0s7BYdQBgKXUsDDmpYe/i6gha/J13p0QWzDcH0YLeGtWq8YSezFywQx1PXYYSXbyfg
 7JUDAq3UqeYNFdNeIk+TxUAIjUBhEg/W0Hk8QUL4mlwthvevKtp1XWi+YzguiRYbbF6X
 gz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735428776; x=1736033576;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKu4EPBvLsopgOFZpl7wz7qwa3Ue5APX8+1kt9ZJzXY=;
 b=FfQZZEBj3kIq42javkg+mywRAh8Py+H7iYZlqOeSyfXP0FEw7TLIx5xM2z/QMuHW0G
 tX9ruowh4I58Hm580yfm7N7/8fnb6nBj7P2f/iB9DKp7HYGes9IESq8rUUQZ5k8ihONB
 Mp+HrfCOBaOZ9S6r7I2M8j2CWKUM+1ZPubC/40oxQT1eUzkMHPAoi41Qw67YvnI1fNuU
 iGCkzrplNmiv+dHnpRmh4BUbUgt95NRMieS6K6P/PQ56pRasJutF0T+LUAoM7vz1tj3y
 QedMcyFcrraSjLVle0KS86BzZzGeaSZ7yDrtztWEh50UCtCKk/LPyw7S2liPr91AAnlc
 m1Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5AMwaz8KnclldecvZ+vZw/sN5vdzfRGHSzjvPwGJ5wmdXVMBDuJYpo/xjz0wZsoRjVdtXdRJBlgHZmg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzZ5hT2iTdHz6u7oU9u4UY16nxCpO47eKN55lbw4I9xyfj1zxkd
 nGz5U6S2xQQN6J9+haSsjreOaenimNZI99DlS16itC0QAy5J29ND
X-Gm-Gg: ASbGncsZjGq5DYsTKEkg0GIm55nDIowIwFF0dQAf3OribxKBxjq9kZnkO0aZ2zV4D9/
 4bLeZF6PMFECVwgkNqA2WrFTUMU0sfpAioQl98dBTULSd1jrIy7jS2xNTEfa/gPonJuTp1BKzC2
 gXpVcUViTtClEeViw394FlrBSec4Qm2lWAUc72pDqgDlgOXMlmfZSUmI2Qc1s4EZM19YPxne1ya
 EnWFNz4/mPdSYJvX9iw8KHryLxJCb7JL6Iw6tf/2Lj2FIoYZvIBU+ufJw==
X-Google-Smtp-Source: AGHT+IEFMVt9avPwZbEkQECNlih0Tj5apwRe3kcAhJ6WkS9XD2NmI7QYDZOlN1PK+TzmG7eJVzqslw==
X-Received: by 2002:a7b:cb14:0:b0:436:90d4:5f3e with SMTP id
 5b1f17b1804b1-43690d46037mr104959305e9.6.1735428776211; 
 Sat, 28 Dec 2024 15:32:56 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661219a08sm312165205e9.25.2024.12.28.15.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 15:32:56 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:41 +0100
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-2-c7d4c4856336@gmail.com>
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
In-Reply-To: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=0LBKnKFkf/CBAf2vV5CqDxilt6OKT0uPTamcOeeAqdk=; 
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqkV+oVyk//zTE8gZslpR+kKKOstF8wTCVuV
 TKvMYBC/MeJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpAAKCRDnIYpo1BLC
 tavPD/4vrOzvBtiiJvKt9sC4OUwOCDInW95G7gdKLGetgoMPL841oWQyr9G/28XQniPi4LdT6m7
 v0phn8UdBtytA77ajXuapY2/8ME5HKafYbBvhAVJsbGqHwDq4uTWZDV38h40Ll7odOwUniCSWHm
 Bt03pyV6HdwF64lkyn0pGoDN579sNaOHWW1uzn07Yo4mE+bV/Aa96/I87xWaMtiglRUNBuDWMeK
 SHLmnTlNcvlBc3MjUhsPmtAeTnd9Hevaw5MHK5Kq2jyg4Ixm5eLx9Afar0rxLpPZiO7U89upIRG
 UZLL89qGSMcgBh4TXwESAAnZ48AiwQ1nCxhXne5Nug+Y+XVvpA1qIZa3qvecraz8aTQ0W6lqPEm
 yZ+U7m770MJmH9PWsNGpGQkbpV/m0m/mpqZwmonu9Lqdr1qz/4pewLG3+ZT1658XgOqwnj+cls8
 ZqtnvNYqKMurs9OupShrezeNUioevn5bHYv8QlHIqU8KvmJhhd6ybeqchpUPz/n/kuMIyh3YHJ8
 mToQrF1qUoCjt8RAZfqivZo5GVNIK0Bw8t677CoM5UhnFNbPZmQ934JFNbbdJCbYtwj0XfrIhBD
 MAzzXA+NSAoqzC4S+u2/GKJYki+n9kBcqr5N2nbH46jPNqxOsf+vz1K+b+BDhfuedcCzn0ES8mQ
 K9j1SwhQL4jmseA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/6] mmc: sdhci-st: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Link: https://lore.kernel.org/all/20240716180010.126987-1-rgallaispou@gmail.com
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/mmc/host/sdhci-st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-st.c b/drivers/mmc/host/sdhci-st.c
index 4973e08a98f87380325566a6b18878dd45e1dc30..901e431976ced68d5b6e374c2dec93c9fa821d38 100644
--- a/drivers/mmc/host/sdhci-st.c
+++ b/drivers/mmc/host/sdhci-st.c
@@ -447,7 +447,6 @@ static void sdhci_st_remove(struct platform_device *pdev)
 	reset_control_assert(rstc);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sdhci_st_suspend(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
@@ -494,9 +493,8 @@ static int sdhci_st_resume(struct device *dev)
 
 	return sdhci_resume_host(host);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(sdhci_st_pmops, sdhci_st_suspend, sdhci_st_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sdhci_st_pmops, sdhci_st_suspend, sdhci_st_resume);
 
 static const struct of_device_id st_sdhci_match[] = {
 	{ .compatible = "st,sdhci" },
@@ -511,7 +509,7 @@ static struct platform_driver sdhci_st_driver = {
 	.driver = {
 		   .name = "sdhci-st",
 		   .probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		   .pm = &sdhci_st_pmops,
+		   .pm = pm_sleep_ptr(&sdhci_st_pmops),
 		   .of_match_table = st_sdhci_match,
 		  },
 };

-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
