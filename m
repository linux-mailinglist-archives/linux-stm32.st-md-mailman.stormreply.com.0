Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1233A0913
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D61DCC58D5C;
	Wed,  9 Jun 2021 01:32:12 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AC8DC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:11 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso2745304pjz.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lTRFeIgR82VeMe8p5ZV3YrTNSoJ/Vz3X3Xth8hi5pHc=;
 b=d88eVXQHjZEx5iTzxcmgkdsv5Un4KkQr0n6ujS4RIBMRD5XkCaIXCL3LJRk7odZqBg
 /zrNJNxhsvfAjllevEXrdb1qmfTPgLaUFjr2qr8U3ohs1aWbk+OtfXih+kMbXkoTEvvx
 vnUxJg4xhyQAIDKobIctpCAMwBsSHNJPNtRKvVJZMfp9HgJGYnQvTkFWlOKTrrbnUnoa
 z1SYyKhbgMvRk8jJgg0U8JHN3ekBNc9NiT6RMbZjzRYSbvc2w4K49T0MoOQEVkI1PsIW
 Cg3i6Du2w5pbi79pLVelGkUnXC6NCn4qaT0uBYfmQchZv0sEy11f8JGrxbdkNaa1NZFl
 EkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lTRFeIgR82VeMe8p5ZV3YrTNSoJ/Vz3X3Xth8hi5pHc=;
 b=SeVDQIYqlSVUUxcMLrF/1Tm6yYpYSiQzso/ZMtbxO0A6p2teXR1qUO3VCjiyxjgqrv
 qHEbrY3UCUo5yAvnkuxgaAM+MxxFUawVBxR7Ww3pAHIikWig+fWHaqhrqI++uZKglkcA
 FIY9aUvpXapGabQkTUToldR3AmivqVRH/Sikx6Jl0i4GzUnUjECHlGZDhMyaDTec2F+A
 DzHNorL2QmkZ08ig/fR5GXThfjEIZkdqJv3ritzqKsw3NB18QvfO7beGLCkc2sVcJJkv
 RgyeQA1ZXBvpcICk/kYO++0XtJE9uAD3Kdq+wizOlzomQpl7V+fHDgoOf4H0709EEmt4
 +N6Q==
X-Gm-Message-State: AOAM533R5ngqDLk5BIcBqMA10Vs34Q57lqlVhJ/4Yn5lC6p3te4R6TLE
 NxkIR55qe108/umz8EVf/GM=
X-Google-Smtp-Source: ABdhPJzPu5Gr1EwWZENCd+j8st+EGD4Hf76QJujQeDnYFUm9cK8D0kOhZrmGzApp0MmU3GDly7pDZw==
X-Received: by 2002:a17:90b:8d6:: with SMTP id
 ds22mr29632911pjb.54.1623202329876; 
 Tue, 08 Jun 2021 18:32:09 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:32:09 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:07 +0900
Message-Id: <538122752d61df30dd450276b87df606a17ac4c7.1623201081.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623201081.git.vilhelm.gray@gmail.com>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v11 04/33] counter: 104-quad-8: Return error
	when invalid mode during ceiling_write
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

The 104-QUAD-8 only has two count modes where a ceiling value makes
sense: Range Limit and Modulo-N. Outside of these two modes, setting a
ceiling value is an invalid operation -- so let's report it as such by
returning -EINVAL.

Fixes: fc069262261c ("counter: 104-quad-8: Add lock guards - generic interface")
Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 4bb9abffae48..233a3acc1377 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -714,13 +714,14 @@ static ssize_t quad8_count_ceiling_write(struct counter_device *counter,
 	switch (priv->count_mode[count->id]) {
 	case 1:
 	case 3:
+		mutex_unlock(&priv->lock);
 		quad8_preset_register_set(priv, count->id, ceiling);
-		break;
+		return len;
 	}
 
 	mutex_unlock(&priv->lock);
 
-	return len;
+	return -EINVAL;
 }
 
 static ssize_t quad8_count_preset_enable_read(struct counter_device *counter,
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
