Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B9721FE12
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2020 22:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D21ACC36B2C;
	Tue, 14 Jul 2020 20:05:06 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B5B3C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 20:05:02 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id m16so6275845pls.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 13:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJEcAvXCkMubZ5CvQAwW4/233WmH+zu/CCD6+/Cfr60=;
 b=BIyPWwdnQqdLgzRx9cNGys4K4Pu3bhZEesGNSVDGZxDEXs2zbZQQZyhbbHp2epIS96
 J+nEoi/pULu61ZtxPYE3Bfjbka5SW/KZjZIoaA3Y+A/U57Rncged53Djhc3g2bXY6z3H
 +85B5dHbMWroWGxKepDR5lOKxzqOL6RdhTUTPoDSf+nDjkp+uiaB+nd1Iog/bnQsOaqd
 9n5JtYVde8Q6jaFb6CEwdHPRFaHg9v1l06V5Qhs9nPHo4Y1PjxI1jl0iVf8K6pgr/eOM
 FM5kIjQkmEbSCe2XJ5lfaGZhvPlk+0xUNhgTmz4ny67/zx5JSFx8+5ml4S+o9Eq6DRc+
 LOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJEcAvXCkMubZ5CvQAwW4/233WmH+zu/CCD6+/Cfr60=;
 b=brFcEyo/ZjHlhs1HTp6x9nrjCwV+sQNx9PpRcnYx/gaCXOZQ5FuYWvyJCjDkiE8IRx
 g8EOsM2T0eLrl0yFj9vi0hFfbApQwiTN78EqukbxYFIoET9AKi4P+Ew7XGOzO+B/DTfe
 t8k55/jWpcIC+7py8Nn/V5kQJEO/kICpU4P5nzuJogvtSpkNVOeC/Kala9wNhk36Rhru
 4zYyyMvTm8SxH/hpgAyhBlxpjEY1RE3Q7e3oKYH4fiJ985cR2e5IJq+9PQZaFrUTas8P
 X0AnOsklmZ4vGTHVlhDmg39sC6PuuHiGW/6AExrBwKe5LVZshR6z06lkq/yddo7k0tfR
 RfyA==
X-Gm-Message-State: AOAM532Jzf4Z4nOJvvSj1Xmt7wf6yqbc1+oo4nP1xdZrzXx2+gUizBBJ
 MuBXKaTYTtzf6DFfpqI6twgYkA==
X-Google-Smtp-Source: ABdhPJwaKsSwOg/f51cv/yU6D2+O0bNi34srVgzYHBWsLtjgqOy83hgxLW3gTKAwMRf8Q/DDyFSVvQ==
X-Received: by 2002:a17:90a:3684:: with SMTP id
 t4mr6142014pjb.91.1594757100594; 
 Tue, 14 Jul 2020 13:05:00 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 13:05:00 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue, 14 Jul 2020 14:04:44 -0600
Message-Id: <20200714200445.1427257-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 10/11] remoteproc: stm32: Introduce new
	attach() operation
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

Introduce new attach function to be used when attaching to a
remote processor.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 882229f3b1c9..7145cd49616e 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -460,6 +460,13 @@ static int stm32_rproc_start(struct rproc *rproc)
 	return stm32_rproc_set_hold_boot(rproc, true);
 }
 
+static int stm32_rproc_attach(struct rproc *rproc)
+{
+	stm32_rproc_add_coredump_trace(rproc);
+
+	return stm32_rproc_set_hold_boot(rproc, true);
+}
+
 static int stm32_rproc_stop(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
@@ -525,6 +532,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
 static struct rproc_ops st_rproc_ops = {
 	.start		= stm32_rproc_start,
 	.stop		= stm32_rproc_stop,
+	.attach		= stm32_rproc_attach,
 	.kick		= stm32_rproc_kick,
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= stm32_rproc_parse_fw,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
