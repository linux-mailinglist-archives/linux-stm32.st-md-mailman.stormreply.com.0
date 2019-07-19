Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D78AC6F9FD
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jul 2019 09:08:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CAC7CC0A67;
	Mon, 22 Jul 2019 07:08:56 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07C5FC35E08
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 18:46:15 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id r7so14552389pfl.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 11:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=LgCwfeb0qUeGvteEDqnpqo5FEOvlxmkPiJSvQEyBpA4=;
 b=LtGE7qyzqvqQis+0QWaAc6EydmIRM2jL00m9b+Go8yQAU7Lt9OzQe2emBMW8bIJ5D6
 YHIGHKqaOCDJ36TRTari/GqdWkzG0KYvhYZ6PntA3qeQ5EIVPqsACyM1fcQPL8TcrUCR
 Y+r7tmV91mI67L1Is2NyEazqRwqS2xr+0GGD8+3PC/OzLtth1DC9mwH4R3oiGKj2k8HP
 4AMyHclQbhR2qTQYqNVAYYBJu+aiOq+rUzmMuGOSESv+55R94I6VbBbZqbkXW4CuaeVR
 b5pIhP6P58n83e/wWatxPwFjXc2PiFBBYFsPBccsetuOybLQETZMdtYJPwOXAoBIYXky
 KxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=LgCwfeb0qUeGvteEDqnpqo5FEOvlxmkPiJSvQEyBpA4=;
 b=bWOB5skgoT4gqX/5PqcTE7/btuVtJ7QC4NB6CjNhtb7TYTOIl1S0Rg6GLqEUvtYEMP
 5s5zcFoEI9IvoE13s6AHDRNW1AiqGGLRonxHG+sVyEmkPVhG1c+VGBn8v9w6Fm+Qaf2n
 eoOofe+1VDYeSTPI3WhxC8eRc5HiJKN9/6HlWZsdgnc+aUzHZSR1dVpqT8NdFMqgdyWU
 S9aiE+cyN+HHh9bcfKt1mt9cFz1Z9uBIsOZld2/jyUeJ2gAtw95qlxFIGfzJ8yoqX4y+
 L4ZW2c6CzL70AFHTV+ianILB8/qQXG2A/4s9h72JyaPTi6w1XZ9t1FKry6FfkW7CWvHR
 ovJg==
X-Gm-Message-State: APjAAAX+19Kyl7QxLBiyBYiut/ZWIi+nXP06S24nGp25RQGrPAB2ZdwA
 nSPZI0QPTY6fMG/ttgdrp7U=
X-Google-Smtp-Source: APXvYqxkdYNpO/9sbTcC3Gwdlyw8Fp+lp6d3baaiN8Qy+GZcZufOZdcjl3SXt9qBB2rqD7nWprPrHQ==
X-Received: by 2002:a63:188:: with SMTP id 130mr54815202pgb.231.1563561973341; 
 Fri, 19 Jul 2019 11:46:13 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id g18sm55976033pgm.9.2019.07.19.11.46.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 11:46:12 -0700 (PDT)
Date: Sat, 20 Jul 2019 00:16:06 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <20190719184606.GA4701@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:08:55 +0000
Subject: [Linux-stm32] [PATCH] rqchip/stm32: Remove unneeded call to kfree
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

Memory allocated by devm_ alloc will be freed upon device detachment. So
we may not require free memory.

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/irqchip/irq-stm32-exti.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index e00f2fa..46ec0af 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -779,8 +779,6 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
 	irq_domain_remove(domain);
 out_unmap:
 	iounmap(host_data->base);
-	kfree(host_data->chips_data);
-	kfree(host_data);
 	return ret;
 }
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
