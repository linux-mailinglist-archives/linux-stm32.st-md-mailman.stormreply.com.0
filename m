Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F8729E518
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 08:52:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A77D0C424CE;
	Thu, 29 Oct 2020 07:52:06 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27C1DC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 07:47:46 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j18so1672699pfa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 00:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uv2FWQlSBJFmE706ogx6rH+lBxHwtXvvktU8G7mdeHE=;
 b=UkuEIBksTIBEx0rU9xx8YSrprU5SuhUkN7XbFd8Ss4WqdzUiRKgQToHyt959jtOKzE
 descPPhCAOW0XNzIJF1XRtujK2NMKSeIKOais3aepphrSUfUB3jAs7x01P+pOrYsaygI
 tksDMUUbjLTMKxTbn4Cb5pdlHLDgNO0QF4+tJM9jsZ6ThxQ7y5mXMg7ujImMn+wzmyRR
 8i0IxBH/r//xZ1LE6r79PribG82uJ0XwUtm05Dd+IXedix0wIz0c9GdQkKf0oNQ3vD5Y
 elnrMVaYVrgf9Fb4wuKD93ftXMWvP7e9uCX8HlzzQ/4hXezZp/iJaHbuaZ1IQDyaoEUH
 xBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uv2FWQlSBJFmE706ogx6rH+lBxHwtXvvktU8G7mdeHE=;
 b=lnTJ5Y8vBmEiwDsWbBDrg4Llv/a1mA58oXXEL8DEMfPsvX/KFCZ8AO48QTYRN03zNZ
 leQkZ4g3gvCBTdydchXd6uRUi3QUVAGR2XSwfH1/jM8iN+0Drat9Bm6xRaa1IZ+XSF3q
 yH/aCfjhbA8MQyExaYU0sND4fJLEbr8SNXotoOefdeFcbAsDvsQwTb+MCxGsbLj6tqN9
 Gv8BSh1VywvUm48HsTShT12o5n+mUMEX5mQiK55GmtwwvzatdoMMVt3/cJ5aYU6eSaCv
 YVMOUSYa3GUOYfcLChd2c/VWxTSMM5E+o4jyTzWLWhFtJWXSTI+DgZQKLPYdqWs8y+1e
 NUUg==
X-Gm-Message-State: AOAM5322T/muFn0RkaCKeredO2Xu2+hHU+xE+QOF3+pBZZz2jAxefv1e
 HEre/ZmjTYhOmYu5BYSyKoC3hg+iLzE01l9+
X-Google-Smtp-Source: ABdhPJxKwsyEZXm+NRlnPeeDS94chF16rqocvuwXKW/X+8833uLeRKJCpBpQq0NAIMLEiiDLcXXemA==
X-Received: by 2002:a17:90b:17c3:: with SMTP id
 me3mr2716736pjb.56.1603957664762; 
 Thu, 29 Oct 2020 00:47:44 -0700 (PDT)
Received: from localhost ([160.16.113.140])
 by smtp.gmail.com with ESMTPSA id z5sm1834680pfn.20.2020.10.29.00.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:47:44 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-i2c@vger.kernel.org
Date: Thu, 29 Oct 2020 15:46:54 +0800
Message-Id: <20201029074654.227263-5-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074654.227263-1-coiby.xu@gmail.com>
References: <20201029074654.227263-1-coiby.xu@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 07:52:04 +0000
Cc: open list <linux-kernel@vger.kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH 5/5] i2c: stm32: remove unnecessary
	CONFIG_PM_SLEEP
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index f41f51a176a1..95ac9dfdf458 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2262,7 +2262,6 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
 {
 	int ret;
@@ -2356,7 +2355,6 @@ static int stm32f7_i2c_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
 	SET_RUNTIME_PM_OPS(stm32f7_i2c_runtime_suspend,
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
