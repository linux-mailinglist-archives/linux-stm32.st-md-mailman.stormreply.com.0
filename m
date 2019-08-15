Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCB39E364
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2019 10:58:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01A7DC32EA0;
	Tue, 27 Aug 2019 08:58:29 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF0CAC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Aug 2019 05:59:10 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id u17so859305pgi.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2019 22:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wIN/3e7DmCq2KFrr2GT8E+NTKTLGporkmHFbvr6BdEw=;
 b=ltx3L04WJuOQgF1LYju3dlRn4Cyjnm4+zW2PdzjSOCef1GRhhmpg5YB9ot7HJ0qAX2
 v5UPvV4kcgPEkdP2QisSksYt35mUkjT0ap+xbT+++wFbuXd3iLCedKgZLoMhncCYykx8
 qLi8S9OScvOEQw2uQ3ckPj+nZChss+Sa7PSgOfmWibcvWr65mWWd4Khz7J1FnIr6ZWt3
 NMRusJXN/zBwQpXL3hNc55bSpvg3UUN+AzhQ89RiYQGYL5UwixAHZmbz5i/PPgvdwKBU
 xAr6jneyWsGHPHAfQG5GqDTvgjC3Y7NKMahmlEMwdQEJtj6UuCaMZW27wJ7uOiRua90r
 VYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wIN/3e7DmCq2KFrr2GT8E+NTKTLGporkmHFbvr6BdEw=;
 b=M3FGZ5hNCNR9JKNVCyxCq6nQKXh/PaPmBn7aGZ5bWvwA7Tifm9T8WxsMCFIWbJNrlL
 1n0w6BO7ELtuTmqfNiDayiTC3C1zUlzSiss8xdg/HFngsQI5wOnkk0kfh2hA3B+o2NnX
 UsdpQqLREuFEra0Tfufzd45p9XIPmhINFhoiTwvw76HIWqlbDG84G6d9U0SLGdqudy7R
 kRw9ShQVsHhYmYI7natX+RsWaHzaQBQT2lzyXY7yijQ697jhgqJdyMrn8qMnjkO5S0FL
 1hyimjEJ6YKDDl0hEuUGx2i7kItua2qFd629y6xX512EGgh4u9+bvw/ODEh7uqK11TWr
 twbQ==
X-Gm-Message-State: APjAAAX89+Pjuuy2qbqldI7eAkZ3eC8ThJVDODItvnxZlG2EJQ0lmOby
 ooqhHAhpTXBeRwcQjqXlhqw=
X-Google-Smtp-Source: APXvYqwPn7IfU6NrEFx18uQV6dXjBy9Te4NIGALiRj5uKRtJOZxdgllt72zHYP3InxW6dokx9buRiA==
X-Received: by 2002:a63:e48:: with SMTP id 8mr2211940pgo.389.1565848749290;
 Wed, 14 Aug 2019 22:59:09 -0700 (PDT)
Received: from localhost.localdomain ([110.225.3.176])
 by smtp.gmail.com with ESMTPSA id e7sm1760010pfn.72.2019.08.14.22.59.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 22:59:08 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 15 Aug 2019 11:28:57 +0530
Message-Id: <20190815055857.1944-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 27 Aug 2019 08:58:26 +0000
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [Linux-stm32] [PATCH] i2c: stm32f7: Make structure stm32f7_i2c_algo
	constant
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

Static structure stm32f7_i2c_algo, of type i2c_algorithm, is used only
when it is assigned to constant field algo of a variable having type
i2c_adapter. As stm32f7_i2c_algo is therefore never modified, make it
const as well to protect it from unintended modification.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 266d1c269b83..d36cf08461f7 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1809,7 +1809,7 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 		I2C_FUNC_SMBUS_I2C_BLOCK;
 }
 
-static struct i2c_algorithm stm32f7_i2c_algo = {
+static const struct i2c_algorithm stm32f7_i2c_algo = {
 	.master_xfer = stm32f7_i2c_xfer,
 	.smbus_xfer = stm32f7_i2c_smbus_xfer,
 	.functionality = stm32f7_i2c_func,
-- 
2.19.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
