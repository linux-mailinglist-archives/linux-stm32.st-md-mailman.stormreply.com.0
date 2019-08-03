Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A41812FF
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 09:19:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACDD6C35E0D;
	Mon,  5 Aug 2019 07:19:54 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C68DC35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Aug 2019 14:13:44 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x15so27134676pgg.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 03 Aug 2019 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=2nW1qdYT+ls+yP7SZf0Ct0WsFONxeOJJreCKu5Wq5r0=;
 b=vXpncURIJuxiU45nZgakz+fsbMIciPseDLVeOBtMQSwBKOUqkNji0zExHlbGcox+7h
 A859cGbT9tgfN5TITg97JCDm/WkhwbPqNYG8W+NPEnyo/wjmUZuXfWtw24misjeNEMCx
 OgRHGXee0G00IV3e+5zsE5aWdsq4/aPF6T138e0RccQnvNSrGib0gZ8PGPER20BwqlRr
 V4jrBzx6G4P53o4AYpS3zSSROdjtgY4z+IuprdhBPVooHkZTR1+6zLnnvPaZ192JWVjA
 nk24/4i2yFXERL0+k6GwMn8JJAnwjLV3Jp/DX2zzzWZoqLYaupjolTKbhcvaImgEuGRJ
 PG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=2nW1qdYT+ls+yP7SZf0Ct0WsFONxeOJJreCKu5Wq5r0=;
 b=HvJ+MaidkpGu79vWX2EfsS9CCzEqMJP/9KuBt2/Xfir0lY3U5jdOpsBKWj2GMuaMc+
 IkFZWhdEuzKTsSz+NYOz5ZyS2rVbk2r4MnSuQZ9mFZ6oWQ2Oqpvg5kdtwXG3WtjEebJx
 IxPEP9fT9oq39D8zFq+zbLXPxbshJ9oWUASr5mOtb63WhKCToSdtRdrVkSLRGbPl+6pM
 cRmW8oTr6aK5TgF5A2Lm0rd3FXFwr42PxNmR00wG/NA6iLWj8BsPHkg5LFkW9eIs29W1
 TZuUqhXpZibyGkaC7BMvfXYwpmmlZcLez9eXkgxdTLuuvIBr+kHrIt1ftK1nNCl1TQMo
 Mk3w==
X-Gm-Message-State: APjAAAVMQWARIFexhfV46zTpo7S0S/9zniJKf9hK7rBh6pvSG8TlhzVg
 6WoB8xSg2AyTm6kMk93813Q=
X-Google-Smtp-Source: APXvYqyPilma59RFUQoDatZkRE5fdaK3QZsnXT7UVrQoypYHakMO16WqAbGIumdAE1KTzZGTg+UHxw==
X-Received: by 2002:a63:61cd:: with SMTP id v196mr2130652pgb.263.1564841622833; 
 Sat, 03 Aug 2019 07:13:42 -0700 (PDT)
Received: from nishad (p3261240-ipngn21201hodogaya.kanagawa.ocn.ne.jp.
 [153.202.122.240])
 by smtp.gmail.com with ESMTPSA id a12sm12704967pje.3.2019.08.03.07.13.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 03 Aug 2019 07:13:42 -0700 (PDT)
Date: Sat, 3 Aug 2019 19:43:35 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20190803141331.GA3588@nishad>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:19:53 +0000
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Joe Perches <joe@perches.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] i2c: stm32: Use the correct style for SPDX
	License Identifier
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

This patch corrects the SPDX License Identifier style
in header file related to STM32 Driver for I2C hardware
bus support.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used)

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/i2c/busses/i2c-stm32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32.h b/drivers/i2c/busses/i2c-stm32.h
index 868755f82f88..2c21893905a3 100644
--- a/drivers/i2c/busses/i2c-stm32.h
+++ b/drivers/i2c/busses/i2c-stm32.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * i2c-stm32.h
  *
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
