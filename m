Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4712B12BE56
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 19:36:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F4D6C36B0F;
	Sat, 28 Dec 2019 18:36:02 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEB51C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 18:35:59 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id n9so8453388pff.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 10:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ujHJl1LlnUC8f51mXZ4Fb27CXnf51H+Hx/+mqG2aecM=;
 b=rNui478T/QEp9Tbc1cDUJs2i7U62DXb62rj94vzLSxPg9zViOhL1kw7a/GoZhfAAtW
 dEuAXR5m/IwJqTU8Ho4SxCK9DyMNaCW01BJEE4rLcg1UCjPg+iDfTE6SqPYxpu6rBI0u
 1gwxpMJFjMnhzEqsV0MIamVbpMQhGEK4jTv2xqY8UOESHGsH3kgKAQE+v3N0U9zi8zaK
 2mu7sqU8Usn4iGQNUrelWq4J+Pmwem+39Aok8/1WXkG6FtgGZT1WBARoaDrk1tVFr16x
 iKe4VKOyDBy2gS2GIId4qItvRtUgYZalhpev6bHNybwlqoCjOm2JJp7ygbyQ+hyUNa8l
 cmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ujHJl1LlnUC8f51mXZ4Fb27CXnf51H+Hx/+mqG2aecM=;
 b=Vmmyjd4spIb/Br4kN7/aDi/d3IQeOpNjFcO4NrVAGIe1UO+GI/FmIgKgd0aFBNatAD
 eZr2O++d6Ezth2WWIGVfD8llz9F+STjGUl3IF5dSiE8dKIH+YWGWp7/bPcg86R6U4XH0
 2nDa/BJ1VMyrJWUikf5ZHsAlVOA71rfChH04qj1bGHcl90f37p2+gMGnI8MmNWlcS2Ei
 +B/KN+x7wXBVi4+qM723xvgdjfo1C+cbEoWznpEoxEY3k9V9es+xHOViTbd/f0sH0PhC
 PN6kWyi/miu4GiaD0BDlD0B8DzbEXABsdSQmubzvOwp1Qr8FP8ddmXAZt+E79LYi/5VT
 K8Kg==
X-Gm-Message-State: APjAAAWk9acSGlXDXQFDjonUVRmtvYx6Q+OU9AFwWv9XV96buIcS50tC
 Ps6HZhlE4w7eVK3ZD/UpGSmRnAwn5iY=
X-Google-Smtp-Source: APXvYqxIq2P3GfalCrglm2NNlOSSOLuNN16ePEwVBKXxH+eUtkSCN2+TsAdPG2+LZgKy1zvL62S6+w==
X-Received: by 2002:a62:197:: with SMTP id 145mr60624660pfb.188.1577558158509; 
 Sat, 28 Dec 2019 10:35:58 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id w11sm44601709pfn.4.2019.12.28.10.35.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:58 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: jassisinghbrar@gmail.com, nsaenzjulienne@suse.de, f.fainelli@gmail.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, lftan@altera.com,
 matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nios2-dev@lists.rocketboards.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Date: Sat, 28 Dec 2019 18:35:37 +0000
Message-Id: <20191228183538.26189-12-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH 12/13] mailbox: omap: do some cleanup
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Use devm_platform_ioremap_resource() to simplify code.
'i' and 'ret' are variables of the same type and there is no
need to use two lines.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/omap-mailbox.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
index 5978a35aac6d..9b9994be5602 100644
--- a/drivers/mailbox/omap-mailbox.c
+++ b/drivers/mailbox/omap-mailbox.c
@@ -695,8 +695,7 @@ static struct mbox_chan *omap_mbox_of_xlate(struct mbox_controller *controller,
 
 static int omap_mbox_probe(struct platform_device *pdev)
 {
-	struct resource *mem;
-	int ret;
+	int ret, i;
 	struct mbox_chan *chnls;
 	struct omap_mbox **list, *mbox, *mboxblk;
 	struct omap_mbox_fifo_info *finfo, *finfoblk;
@@ -709,7 +708,6 @@ static int omap_mbox_probe(struct platform_device *pdev)
 	u32 num_users, num_fifos;
 	u32 tmp[3];
 	u32 l;
-	int i;
 
 	if (!node) {
 		pr_err("%s: only DT-based devices are supported\n", __func__);
@@ -772,8 +770,7 @@ static int omap_mbox_probe(struct platform_device *pdev)
 	if (!mdev)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mdev->mbox_base = devm_ioremap_resource(&pdev->dev, mem);
+	mdev->mbox_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mdev->mbox_base))
 		return PTR_ERR(mdev->mbox_base);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
