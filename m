Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8CA430F76
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 07:05:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD54DC5C84B;
	Mon, 18 Oct 2021 05:05:02 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E69CC5C849
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 05:05:01 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 lk8-20020a17090b33c800b001a0a284fcc2so13638772pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 22:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FZJWgTaiYSeEhu6bWJxmdjYEwT8OyFJXiJJPkL6CAvQ=;
 b=Hzh9yxSM/8JRs8DbfaAHizsy0zNY0xCSHItjV+qD+oWsjE7xKBhkmbl+PTr/UcEjq0
 mv3TiNO0gTQ55D0awmApYVKLSa00oxduGnVF0aEOiS+WeQbzCriRTHS9LSU0u0mGZPP3
 ynDrHqOi0qpKlJS+1n3UUFjAZvgV5FEe8A5Aij8re+F+MDxPylu8O8JHsUK6GzlkKxW4
 8qytYkXFwNmx6r0jD/ksr6d1BNFZP8MkhXWEUaQ28MuugYOJOlYM8nOFfEXPv/T+5ISl
 r3x67UY/hZqfG3ZazqUelKXBoeUvAd5SLaiKwCapDIMiEmUIkzxlKg9eu+kIcVq2eRZo
 3tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FZJWgTaiYSeEhu6bWJxmdjYEwT8OyFJXiJJPkL6CAvQ=;
 b=hyu0vZfGJ0sOpXacBNqCTp9noxtu2SKkz1REcf1cGhWyd47SP9T5UfkZ/q6kh6Ev0G
 bQw4hDMFa/HLLO05Eyw0ocrZo7BFkQ+EnXJhPdnhjetHnJ3PloRzIHDYIf08y1keJ9+3
 ShcHOgwzGuKJwtAleCRwEErFrkVceVBuPKCMvqLfnA78n44HlijB7n0wHJ5h1SHu5KJX
 y+IxPaGkDkP4evV/+6KXFyQIFqgCAMLAYWT6+SqrG2divUIZ3TQ4M6jCZAt9UuTRUdAe
 z50X1FK4rwLoGSH4LfYvYvC5WX0X8MT3RWqwCvxXD4u3iigcg5EUc67qPKg4CX6PC+w3
 lQHA==
X-Gm-Message-State: AOAM531d6S8cqyn7Cw18YN7TORl2GTYYpcwXm9oD+AictjxxpmckVs3V
 fhWY7x8NKJYXF9Xd1KzSXyE=
X-Google-Smtp-Source: ABdhPJzfwIgsSqmiAdK/VfZ3thOZREi/eDqLRLRoHi6PgXtczSqv9xG7jSV/LdsdHMQcX11E89ZMWA==
X-Received: by 2002:a17:90a:b901:: with SMTP id
 p1mr45151841pjr.111.1634533500019; 
 Sun, 17 Oct 2021 22:05:00 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.04.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 Oct 2021 22:04:59 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Mon, 18 Oct 2021 13:04:39 +0800
Message-Id: <1634533488-25334-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 01/10] media: admin-guide: add stm32-dma2d
	description
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

From: Dillon Min <dillon.minfei@gmail.com>

add stm32-dma2d description for dma2d driver

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v5: no change.

 Documentation/admin-guide/media/platform-cardlist.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/media/platform-cardlist.rst b/Documentation/admin-guide/media/platform-cardlist.rst
index 261e7772eb3e..ac73c4166d1e 100644
--- a/Documentation/admin-guide/media/platform-cardlist.rst
+++ b/Documentation/admin-guide/media/platform-cardlist.rst
@@ -60,6 +60,7 @@ s5p-mfc            Samsung S5P MFC Video Codec
 sh_veu             SuperH VEU mem2mem video processing
 sh_vou             SuperH VOU video output
 stm32-dcmi         STM32 Digital Camera Memory Interface (DCMI)
+stm32-dma2d        STM32 Chrom-Art Accelerator Unit
 sun4i-csi          Allwinner A10 CMOS Sensor Interface Support
 sun6i-csi          Allwinner V3s Camera Sensor Interface
 sun8i-di           Allwinner Deinterlace
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
