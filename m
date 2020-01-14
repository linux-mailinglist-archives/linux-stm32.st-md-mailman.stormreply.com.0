Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E43C013AB97
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 14:59:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB712C36B13;
	Tue, 14 Jan 2020 13:59:54 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 802B7C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 13:59:53 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q6so12220243wro.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 05:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vXhhnXKXoxYSpa1+LXBS7VNs2uspXwnX5jIhIQmwFrM=;
 b=vf0d1GFbo08+NG6G7zxZJeTZMiLIJ81itsHNzneSbCkxlMw9PSK/5EefhFcFVz9UQt
 opn2DFmB99e8fxSV8zDeioxOunCEPA1JwLFUV1JZ7tohx4yS9VeIx8szZELtTSaUVi8e
 MpWVfqUzXzlqC8OzVcKJK0ejjOuekOA7kfio69OKQHzwuuBCoSSJilnH5swyZxmwDZJF
 tN3p1UTmeFTOKAHtBkIz5KeyE9Q4FZuzTOg9R23HG9C9cgjdnkGH0O/sF2p6DB0IkmgJ
 U5ZD/0/mbzXaXbqd6FkEoMNCPZqXCdUeNLQe5nz7k+II0heYxnrX1j0mMKgnkq6aGLYT
 cx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vXhhnXKXoxYSpa1+LXBS7VNs2uspXwnX5jIhIQmwFrM=;
 b=FlznODW6wPEF5Ye1gv1kZ/spsOJjnCPFJaLpAVrsHjZ/sfP7NFJllUICDotvfNQjEZ
 O1vDGsr5pqgpBa7OBFcb6OxekzfKymVTF5fsWoBT5Pi9GlNLlPaYYQH9Tt/vuytHYGQj
 AiWb4md9KE/98qjx/NHuOLZsLcEgM/Nq+yxsv18LXJsxKxJrndNs6YYJ7NSE036o6taf
 M69OYy0CBKWQQMkc984ncUStkZJWPnRtNQz1izbbtwwUoQUdyM9bTlcYo/Ut/6F81Bw+
 tggAPhvYMGYlkIMJh6tngXCclrNe/EASDqKuSyJvlbYoF/FpFhSCHNZFD/baNNRx5u4I
 Oesg==
X-Gm-Message-State: APjAAAVxH23N2TYwqG+DHHgdIac8FnS5Pp4il29UoKFlu/N8psL82HqK
 lL5evBCMDIHuUs3Cly7uq8w=
X-Google-Smtp-Source: APXvYqzIL5QDAbPSLYL8aOpzAthE16eu5faMIOdeePz7IfOOcLviaBT2dTkTsFRl6NklQxS0c9Fjhw==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr26238015wru.235.1579010392992; 
 Tue, 14 Jan 2020 05:59:52 -0800 (PST)
Received: from Red.localdomain ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 4sm17854448wmg.22.2020.01.14.05.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 05:59:52 -0800 (PST)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: alexandre.torgue@st.com, davem@davemloft.net, herbert@gondor.apana.org.au,
 mcoquelin.stm32@gmail.com, mripard@kernel.org, wens@csie.org,
 iuliana.prodan@nxp.com, horia.geanta@nxp.com, aymen.sghaier@nxp.com
Date: Tue, 14 Jan 2020 14:59:28 +0100
Message-Id: <20200114135936.32422-3-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
References: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 02/10] crypto: sun8i-ce: increase task
	list size
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

The CE can handle more than 1 task at once, so this patch increase the size of
the task list up to 8.
For the moment I did not see more gain beyong this value.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 4 ++--
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index f72346a44e69..e8bf7bf31061 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -321,7 +321,7 @@ static void sun8i_ce_free_chanlist(struct sun8i_ce_dev *ce, int i)
 	while (i >= 0) {
 		crypto_engine_exit(ce->chanlist[i].engine);
 		if (ce->chanlist[i].tl)
-			dma_free_coherent(ce->dev, sizeof(struct ce_task),
+			dma_free_coherent(ce->dev, sizeof(struct ce_task) * MAXTASK,
 					  ce->chanlist[i].tl,
 					  ce->chanlist[i].t_phy);
 		i--;
@@ -356,7 +356,7 @@ static int sun8i_ce_allocate_chanlist(struct sun8i_ce_dev *ce)
 			goto error_engine;
 		}
 		ce->chanlist[i].tl = dma_alloc_coherent(ce->dev,
-							sizeof(struct ce_task),
+							sizeof(struct ce_task) * MAXTASK,
 							&ce->chanlist[i].t_phy,
 							GFP_KERNEL);
 		if (!ce->chanlist[i].tl) {
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 49507ef2ec63..049b3175d755 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -73,6 +73,7 @@
 #define CE_MAX_CLOCKS 3
 
 #define MAXFLOW 4
+#define MAXTASK 8
 
 /*
  * struct ce_clock - Describe clocks used by sun8i-ce
-- 
2.24.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
