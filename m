Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 356351EA8C0
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 19:56:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EECB9C36B25;
	Mon,  1 Jun 2020 17:56:10 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C27B7C36B21
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 17:56:08 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y11so237546plt.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2020 10:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89+h/plDTY4mDzCs1rYHBGU3MZW5Lf4AJft/Geveaac=;
 b=UJW1vl1f7dpO7gbFKlkA2zgpME8H2E23tNzkiGS91xT++xLFPjRvKMz/e7Fk6+RiEZ
 SZ/u7rWEuTf5R3lmi0b3QFLZFAPKNAk7QXHlk+frMOiFY3rCKSGekRtMnNnXBlCifqtP
 NDmXSKfTtFPGKM2RnN5jwWvCVdKJHG6QuX2wubSS+lZ1QSDbwpgqa1dlTDoRi7YoU9Eo
 /HJMIhJ+m7oDHSnT9WXZb8NfUvTw8JncNjwxf3jr5Gb4RNaGBAihbRDEFwfQ3/zvtgmM
 wtKgJUJkaxxQk1MX+XnoMHlfFlNc1yadikx5AC9P4nzS9lTncTJpR8CWq3KMEvdz9wmg
 5SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89+h/plDTY4mDzCs1rYHBGU3MZW5Lf4AJft/Geveaac=;
 b=BxxQ5GUO1WLAxXSTE2Nvy57vPfDxg3HPkb9DoFVmMHYe8dZ/RdsjgkWO/D3wTo5iZw
 HrSbw8glE3XAGtNp/6nYJoj4V/CsUt9Ij8aPrauAr+I/uu/tfiBH2kNTtXtqNufI37F2
 1jb9k23WsaiyVKpoSeDcxM4I2MIqxw4xzM8MQC0Rw4w404ovirkIhDU4Pz4W4OXZQ4jC
 O9q9B4oK4ksJD/UiTl5ADFgjEsZeb0AGm8F0r/HjogM5O+rGiJTzUSGvy49oaVgYuio/
 kiBpIX0+qdTOZydKaHP48+k1l3CyrUZOKWrZBEJ8pvgin2wtMpmvQ9u1ohowSZGEKtps
 zcvw==
X-Gm-Message-State: AOAM533GxrbCUpB8l2NHXl9235sh7cqO/UT2MXypfWLC0Qvt3ByJ66Ys
 dizQrZc9lsoZeXcP2VuwtwkZhQ==
X-Google-Smtp-Source: ABdhPJypHYDsLPAIbS0JYVfQMOvatKvrrQns1EzAP3MAD0yNOfhUMy3DV32cG6rH3piOQuj4WeHadw==
X-Received: by 2002:a17:90b:693:: with SMTP id
 m19mr590592pjz.125.1591034167244; 
 Mon, 01 Jun 2020 10:56:07 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 10:56:06 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon,  1 Jun 2020 11:55:51 -0600
Message-Id: <20200601175552.22286-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 10/11] remoteproc: stm32: Introduce new
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
index 7c8789164af7..77a20a638e0c 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -459,6 +459,13 @@ static int stm32_rproc_start(struct rproc *rproc)
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
@@ -524,6 +531,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
 static struct rproc_ops st_rproc_ops = {
 	.start		= stm32_rproc_start,
 	.stop		= stm32_rproc_stop,
+	.attach		= stm32_rproc_attach,
 	.kick		= stm32_rproc_kick,
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= stm32_rproc_parse_fw,
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
