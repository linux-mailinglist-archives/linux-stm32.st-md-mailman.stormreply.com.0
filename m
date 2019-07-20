Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFC36F9FE
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jul 2019 09:08:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C334CC0A6A;
	Mon, 22 Jul 2019 07:08:56 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9599C16344
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Jul 2019 04:06:32 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id g2so14998934pfq.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 21:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=neC3zaA6/SjW//JOmms70Lu5HwOzIZBuLfb866mHmIU=;
 b=ZSc86vaxfnhWiLJ1Hf8++d35zLhCzVjggsH3Oq/7mh3pJvRMu+bDvh79QMHfwaUzaH
 rScA1Au0eU759BXhYzcQfH91XYYCXVChYga5OzkxjC9bHApuaBTaPTahU0RjmI66VhjD
 BTpOHgFbYfR0E/pNPdG0MQBwtRTIGdAQi+OWgLMBtLV1ToqJnVhOLY17O0eqtizEbZyO
 Sp6sNZfNuBdzIp+JZJ1M3znKjBjdq+2oKMYB7oOaXwpTuMlPvUOByej2EZtW61b7qqKO
 IqDFtKBSFk7wVOZm4SgiONPbUQqpE5my2syp96Cos3tP8h6r8+MXdachKdkEL8UGnR3E
 nE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=neC3zaA6/SjW//JOmms70Lu5HwOzIZBuLfb866mHmIU=;
 b=otrH9eJGXHeu4y5SPiP1YxVwoCEjiaQudI0zUDQwX+k9cS7HGqJEdgQmpKdzqeFZb0
 cqNTavtHw3jaG1N8v8BImj80iZYL2xG4pYdUQIMFUoUS1liKhMCDjiaZPIa3KUIMr+WL
 CZm7bVz3MWvz0H9D3ghEW+2izzaeqoW+y7YELQmgI5OzSLc7MzYr0P1NfUM5wBnbiN/B
 Xz+lSeJYrI2dfw5wjS5t6skIEAsYqpmD67mQ0UXIcKjBH658c5ZzKvuyiMtws0Z2VPfZ
 2xmon4Lmitetwrui0y2ZxL85uCq/B46QccmV/NKUpH11oSB5TKIiA0k+9YkX8imTrYuj
 45DQ==
X-Gm-Message-State: APjAAAViwpVsFnQ1PAcVlBk77d9PRxkGyxPjtjFGNqcRfjMPPDjdWlHE
 6fTrQlqnZ4c465nMRMSCFgE=
X-Google-Smtp-Source: APXvYqwUYFOL/TcGld7Rp1jjIRi5rUNxYovcaYjqYcnocQC0PeWaqupmaQT1SLQvnrRdS04EKuADCg==
X-Received: by 2002:a63:d23:: with SMTP id c35mr57533273pgl.376.1563595591261; 
 Fri, 19 Jul 2019 21:06:31 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id z20sm53985638pfk.72.2019.07.19.21.06.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 21:06:30 -0700 (PDT)
Date: Sat, 20 Jul 2019 09:36:24 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <20190720040624.GA10625@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:08:55 +0000
Subject: [Linux-stm32] [Patch v2] irqchip/stm32: Remove unneeded call to
	kfree
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
v2: correct the subject line

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
