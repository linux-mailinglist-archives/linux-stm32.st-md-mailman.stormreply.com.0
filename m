Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E13CB206FE
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 13:12:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FDE0C349C7;
	Mon, 11 Aug 2025 11:12:53 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59D59C349C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 11:12:51 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b783ea502eso2923299f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 04:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754910771; x=1755515571;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZpFd1p985Zt2FE0ikX1FewH4hrglpUtZfkFtt2DZdFk=;
 b=OyrPvvlcV8KM/AMa11SXRCuGpXPh8qzrOsMMyoSCC68y7HEGqxIrzE5Hi7wVe0+dYy
 aGbsM3z945iQYdi8sIR/d3n+/VDGt97VlWrWufQYt5kFqZQJ7tp8kGy9ovdFAr43CLV8
 TRZZb9XH54sCpA4AnWf+qGvnP+Awd6UagXMFuL1E9rcvj6vsu+kqx9qFXsL/0djjP8uh
 62pHX+Qkc55XxTa/syta7B4D78C/wIxBx0ltYmGwS6GlXqX0qY+cs9Cxx04y7zu+R2Q1
 1E9Q49aa4bA0U4nkoWcnClHpNa8aIy55CeogjEtWFtZpb9Bws6g02G/FXRm98fh5rhY+
 Xs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754910771; x=1755515571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZpFd1p985Zt2FE0ikX1FewH4hrglpUtZfkFtt2DZdFk=;
 b=Nt8MTAjy33TY41iVSgxfcqrML65XO/7LGC78CT6Re1NKSXdF+2YR590/KcY0vpZBCV
 VpUbzF7KBmcc3Ceh9hveWj0zQOYc4exepnG2w7M6CPT3u6+np0buyYfhJ3a1bSBJzpFf
 dzZ8EsyY9hkdUJSkUQhc1GX19R6VRI/Wg9LAiFB2xTVdB4i7MGlhKy8+gyaCCJ3DOSua
 MZmQ3TKG7K5k3UnZ+kw8LeNlNbVxh279quqj9gCKfuxK20pZFprgbV8oA/ef5nE12a5d
 khoSpBYlxagrR4Lj3f1DNMt3+QV7Gt4t6O8OGnQ4xAmQ8eo3kUgluQNDTg0LOxoq3Y+b
 3dCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhytkvCEygtErWdMn2qogtW1MHhXmbW5KJ1NfF9BIT4DJmuk6uB8ybnehXaHU7Byt6KruZ5l6Ys2UFkg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxVux0/9UxTWnRjYXmkOB0H+EG5MvylWkEYwC2YeI5UFMLi9dOL
 tCcRffcbSmvxgA+fhT05sdsN+qvJOqJIHMNdh83kYje1rripByoJB2W9
X-Gm-Gg: ASbGncsWmTljgua7h3krCdzYVMDVLuYA3BnDBQI6/I7KvHBahoHGtydltOCZ0uss9hu
 c5qO6Dtp9iIwucE2MCkHjtoRSVfZ8e0JHQJO+PmVy4s//BlIOgzn9aqzGMnCC4Be1DtBba511Vk
 Q5IoOjFsXDg7bpOCEj7gkzdlYVGYqc8hZ9Hhrmb7aRYJEYypeFUPa1L4T6UeXjVOg6lbWDKT7jg
 brS+McstKiUSRzd4TAsfmSaOItmizrcPBfsnKK0rqZOsMd/8BSvzcaH2IerZxKl9AN+gIAGHKRP
 U+xQeVFY4ucQkFzaRnd7XlH/7A48tYGunq9QxH0pBSqL9PhxH2cuyqEqcOOTnwE4+w/w6NKVRPh
 DrdubmARLWTmjy9Q+OalO
X-Google-Smtp-Source: AGHT+IEgnc5QqrRg0lz9+OdndWHdvt/rKwyilSbik0M4f9+GbjXlUx7jAfvxAzW/AxvkKUcd3R5bIw==
X-Received: by 2002:a05:6000:4308:b0:3b7:915c:5fa3 with SMTP id
 ffacd0b85a97d-3b900fe7e69mr12080048f8f.24.1754910770430; 
 Mon, 11 Aug 2025 04:12:50 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3abed3sm40116248f8f.10.2025.08.11.04.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 04:12:49 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 11 Aug 2025 12:12:11 +0100
Message-ID: <20250811111211.1646600-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: make variable data a u32
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

Make data a u32 instead of an unsigned long, this way it is
explicitly the same width as the operations performed on it
and the same width as a writel store, and it cleans up sign
extention warnings when 64 bit static analysis is performed
on the code.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index 4846bf49c576..467f1a05747e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -251,7 +251,7 @@ void dwmac_dma_flush_tx_fifo(void __iomem *ioaddr)
 void stmmac_set_mac_addr(void __iomem *ioaddr, const u8 addr[6],
 			 unsigned int high, unsigned int low)
 {
-	unsigned long data;
+	u32 data;
 
 	data = (addr[5] << 8) | addr[4];
 	/* For MAC Addr registers we have to set the Address Enable (AE)
-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
