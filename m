Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8702AA86A
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Nov 2020 00:36:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3879C3FAD9;
	Sat,  7 Nov 2020 23:36:40 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37D47C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Nov 2020 23:36:38 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v144so7054604lfa.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Nov 2020 15:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Km/iLKNq6GfA8OVAobsaReSVv5m0TkV1fWK6/2swUyA=;
 b=uhEhwp3gUa//+ITtT6SmNHrpssFmZeLzebu6HH0fkCI8B3wS25i9RYtF3gVKAZsRxE
 RfQq8GdLOa+akBfNWYTB+llDvtmktyrQ/44bNejKIx9hIjY72W2GFuyjbKkpkZ6SaPwx
 lBC1e0HA8rqQErBXTi5u6nEvi5yGBbXmH2U8s/NoJFK+ybI54R3fSKrKDmyTx67qzfCn
 4RbUGriEp73g+4ttVPFd7ecFojylv5hNfS6lmob+sElDtqsR8cKBLTqovTWMD2kKUBUH
 2+yds+aLOMlLxoyup7o5OMw0+NFG7veufQU43zlovIitXzUlN/zQxFwZCNcnTlvE3c4w
 uBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Km/iLKNq6GfA8OVAobsaReSVv5m0TkV1fWK6/2swUyA=;
 b=cVG+JsaPxq63GGq4xQKo5OHukHTjFfAX/fQqWJAJu3od6qP9cP+i8deIrID32PMqNj
 zLHs0hP2HoYkU/r6U+eaMw9SvRSW+dMrvqQnmmE0/VYgFm3cg7RnOScez9G3crEOgZcC
 JSrso47GyfRZyXhkWvONeg4nxQ3Kigc/RqWb8aDIawyzy+P5W+Fw/tjJjWqTKaiEjoRD
 4Iom3ZLH2xFOegEErEteOZGTynpxQMcWSnfzDpvs46r4IbgcHWqjXwLvb9MGoTMwLr0E
 8yR3ttLlO1sHaC8ck76b7snpOFy+Qw/tYnzuourFhMaBPsXQyZjzJfNPF16VRddbMsS2
 7A4g==
X-Gm-Message-State: AOAM532kVU597yb1MZIxP+Uj4/Y2VGTRtgw/1wzSo2xaDfqVlVE30OO6
 hzzfaP1Wi9GvvQzUVTBmYns=
X-Google-Smtp-Source: ABdhPJxcClE9aESERDjjGC0k+h8RTuUSmTxDHg6SFBwd0PG+QcwfCbe/FMBRxWrDiovawbmYjEBDvg==
X-Received: by 2002:a19:e57:: with SMTP id 84mr1208005lfo.349.1604792197680;
 Sat, 07 Nov 2020 15:36:37 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-112.NA.cust.bahnhof.se.
 [155.4.221.112])
 by smtp.gmail.com with ESMTPSA id j23sm782772lfm.16.2020.11.07.15.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 15:36:37 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Sun,  8 Nov 2020 00:36:29 +0100
Message-Id: <20201107233630.9728-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
References: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] remoteproc: ingenic: Constify
	ingenic_rproc_ops
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

The only usage of ingenic_rproc_ops is to pass its address to
devm_rproc_alloc(), which accepts a const pointer. Make it const to
allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/remoteproc/ingenic_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
index 1c2b21a5d178..26e19e6143b7 100644
--- a/drivers/remoteproc/ingenic_rproc.c
+++ b/drivers/remoteproc/ingenic_rproc.c
@@ -135,7 +135,7 @@ static void *ingenic_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
 	return (__force void *)va;
 }
 
-static struct rproc_ops ingenic_rproc_ops = {
+static const struct rproc_ops ingenic_rproc_ops = {
 	.prepare = ingenic_rproc_prepare,
 	.unprepare = ingenic_rproc_unprepare,
 	.start = ingenic_rproc_start,
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
