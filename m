Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2559E363
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2019 10:58:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9C16C35E18;
	Tue, 27 Aug 2019 08:58:29 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA2D7C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Aug 2019 07:55:10 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n4so1892307pgv.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Aug 2019 00:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AenDtBrpVG4930TDhGN2DV+HTpyLOWcIzVhLu9zuE4w=;
 b=sd8ghvqFngt6Wd7gYlTDBvi+xzGc5m8Gcv+Q1s68B8x6rx+kNgEaCyXniwyuD/BTlD
 464oe3yobiTKksTwqQnuNIMzWq2o8Os1uztTYyMvMBNpthEq1dJznYaU3GNcclhQAonO
 i6z+pA3yMIh9GXZK/W2ubhcTJQtvaCQ7TXhOwwpxixhU0WiXaPRCYQDtptxZ/FTeongT
 bS655Lmu2EroNzrH7I3qQP+pubvA6mxUAixK6f1tmiF6qd+b3RXhlvB5nMNmh0ju9qMS
 kbuYAqUnx851oU4+T0iQcx3uE+tBC0Qy2q0iup9NZuNmJ1xphwZiUxLVPiY4ABvR1Tkp
 YdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AenDtBrpVG4930TDhGN2DV+HTpyLOWcIzVhLu9zuE4w=;
 b=iKOxEezC95Ayls6KxztITDAN3Tmf+TCKVXDJevKrGUAnjD4W/3JNfPgN5b13iU+gB7
 5dLnOeL/GlgmS1jukwcveuvNmqaR59AclI/bY1dmb8w+5xA6qin8C25+Qhe9+EM1QM+9
 uzOR1nOT062auR9wEdKY97AvlH//ZV5wvql+QYhy5r1sxAnL2J1r7EVImTb0XciDtNMT
 TBFx5b5Khh6IYdki3ZG164djSuoQJr8Xa/RaotU8jcnZ7xKA1Bpgp8CFyLESuAf1LZnh
 JPZYvrVgR4ucIq6Ov9IAbt8dWSvsjlB//gA4KtI/0/sN3W6Y6KT/0O2p4H5kp1X0HcBP
 dZ9w==
X-Gm-Message-State: APjAAAXGhcp+VqJ0JHc0WXVNzmAMJczp0TQebnx1oLikdnsKlt6tq2T4
 PbnlXt6+myUk9DmkeeKqlrk=
X-Google-Smtp-Source: APXvYqwwX8sR5i5r5i+v6lD32wo6zEVFVFqLJblNiw7wl0jbxCwGEUiMOVlzTRqeOr0TI/WrD2DBCA==
X-Received: by 2002:a62:e315:: with SMTP id g21mr14409156pfh.225.1565250909269; 
 Thu, 08 Aug 2019 00:55:09 -0700 (PDT)
Received: from localhost.localdomain ([122.163.44.6])
 by smtp.gmail.com with ESMTPSA id v14sm9370402pgi.79.2019.08.08.00.55.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 00:55:08 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu,  8 Aug 2019 13:24:56 +0530
Message-Id: <20190808075457.16109-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 27 Aug 2019 08:58:26 +0000
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [Linux-stm32] [PATCH] pinctrl: stm32: stm32: Add of_node_put()
	before return
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

Each iteration of for_each_child_of_node and
for_each_available_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return in
two places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index b453aed1bbeb..2d5e0435af0a 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -615,6 +615,7 @@ static int stm32_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				&reserved_maps, num_maps);
 		if (ret < 0) {
 			pinctrl_utils_free_map(pctldev, *map, *num_maps);
+			of_node_put(np);
 			return ret;
 		}
 	}
@@ -1468,8 +1469,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	for_each_available_child_of_node(np, child) {
 		if (of_property_read_bool(child, "gpio-controller")) {
 			ret = stm32_gpiolib_register_bank(pctl, child);
-			if (ret)
+			if (ret) {
+				of_node_put(child);
 				return ret;
+			}
 
 			pctl->nbanks++;
 		}
-- 
2.19.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
