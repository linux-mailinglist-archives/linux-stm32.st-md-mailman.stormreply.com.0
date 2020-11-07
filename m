Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6172AA86B
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Nov 2020 00:36:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10A84C3FAFE;
	Sat,  7 Nov 2020 23:36:41 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CB1EC3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Nov 2020 23:36:39 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id f11so832078lfs.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Nov 2020 15:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZPk64J/LdH72s7qNPb60/1YSvZ1La3jkk8O0W53U28U=;
 b=g8SbYwJCs9zn6d+LbKtveqnsZblPzD0Z2Ra5QJ2I6RRLbp8OQcilcL0IkxQhkFct79
 OErVaGcpwFzpRMpjj4e8Cp44O0M4PVQERfF7/uNhDAYsShGTRVOP2R1yNP/hNYriLkPN
 G7gE5BTlvBPrgoUyTpZyiDxnIBKTlUF8l7wgIiGRCOTYp3JAlVVPJbwFDAUJBdTRF6ml
 FrYZt94/Lrf5qK2CKx0Sfmhe7c6Bz3Cfb+ShrY21cTtxSdms2KI0sa8R/BfCr0T+lwcy
 UdoJkMlW5Q3xJtP2tO6n310qhGJysUqXhBkWjJTLGGZ4TQfRyyLgIOuLmV2scQtGO7BL
 Aw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZPk64J/LdH72s7qNPb60/1YSvZ1La3jkk8O0W53U28U=;
 b=IqfD3O7s9JNNG96/0SImkcb8g7vlPKVW9xz1u2C7LPyKtwxbuMZu/3JZbNZnEZkmuk
 vbvDBMnmV4R8USq2TUwtwmZWA/SmE2YkPZPunBqx/gJqGsf91AN/A9qN/AMRQoDS2R4H
 +EUP4Wx1bdapEQzUK1dHFssUbshuz6IsFgQLP6KcAyHFzSrN1QQPacppe5DBKPwHH21j
 mfPqQo9w7g6cRPHMncaG5T8t0gNS+yOwYOkO3rqXbpWznFkQERQmvcqsSPm/lsSAdDp9
 +IH7IGNQyKA5aWRz1hCUHuWdEULQda4o4eja/V8rhJMmampo58OOA6YHOIczC8IEsC2s
 3Vnw==
X-Gm-Message-State: AOAM531a98GPgkthCyXOFt/9e1cNdce+cBFXEBYef4QKJW5RXs6TlkXB
 MPne+cF7+sLL/qQxXGBg5EQ=
X-Google-Smtp-Source: ABdhPJz+syd0FX/vzuZMTG1A+beDoADnelVvLuxQWYXbKBfLUhJGhgVxDvaFgNZgMpfS9QQDZKcfBA==
X-Received: by 2002:ac2:4422:: with SMTP id w2mr2964750lfl.219.1604792198857; 
 Sat, 07 Nov 2020 15:36:38 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-112.NA.cust.bahnhof.se.
 [155.4.221.112])
 by smtp.gmail.com with ESMTPSA id j23sm782772lfm.16.2020.11.07.15.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 15:36:38 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Sun,  8 Nov 2020 00:36:30 +0100
Message-Id: <20201107233630.9728-3-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
References: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] remoteproc: stm32: Constify st_rproc_ops
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

The only usage of st_rproc_ops is to pass its address to rproc_alloc()
which accepts a const pointer. Make it const to allow the compiler to
put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index d2414cc1d90d..a180aeae9675 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -541,7 +541,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
 	}
 }
 
-static struct rproc_ops st_rproc_ops = {
+static const struct rproc_ops st_rproc_ops = {
 	.start		= stm32_rproc_start,
 	.stop		= stm32_rproc_stop,
 	.attach		= stm32_rproc_attach,
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
