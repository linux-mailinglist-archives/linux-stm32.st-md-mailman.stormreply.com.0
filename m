Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C64991C83BA
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 09:46:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71DD0C3089D;
	Thu,  7 May 2020 07:46:54 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1B5CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 07:46:52 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id js4so244534pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 00:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=g//hkau5l+bLowjOvo7e0hcIp3RjLdYp2Jyffr/gTyw=;
 b=OEWXKfPeaEZYnERDF88WoSa12XsXSpfjkMHzHwiqtrFuCfl4U71VXHPuzQu4d86KBu
 Tev9ydj1y1n+vZL8NVMuFY8Pv64h6eX7sLVc2YVna2rkvGqO+tHpiyUuhY4tX+Dxb/9m
 tPewUr0l9J95NwnCOl8L/F75XwxR+rN2nlBTskOjDGTRzv41bEw1qC722oLsIj7ffhXI
 WGA6hRYv7zHc/zHo5Gms+EqfFbSZkvumtpv8qgSKaofbtRTDRhHEVexq+jUaeNEhXa+6
 hkcr9dtzgPvUwUQfF2lgrSYdbSvDP8hS6mwaiW548kzi6PsEEFSPlFUxixGhhnU/66MQ
 ib1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g//hkau5l+bLowjOvo7e0hcIp3RjLdYp2Jyffr/gTyw=;
 b=XzBuqZuKS9Fy3gk0QVKb7pNJUg/r7dqlw78S7XiV8mDsRasqOqSwOHbvhLD0dWl+12
 xLjhOMyCknUoOE32uguLTF+Sn/ZDg8aMAEjz2pHkESb6ILepiB/Vl/LRJ3cS1JCLYP7W
 ieS6NhTIgcfGWKOND+6Yc7QrHdxYbwOoAhYoQws2RzWgsNlYJ47q6/iDR+Z5nw/JHP3/
 t2TwdbOKww1PNsibFDaXp/VecsjqFWsMtrq8TyEhIBPpTZ2EKUUyxGilKl5m6xv14nF4
 SfHRAv9JL+xRe4U1CGYZ/vPkUBqePul4vtiNhb0tRL4k3RLGT+z0h1jXlMBQ++VQU3k7
 yLDQ==
X-Gm-Message-State: AGi0PuZ5VKqX+KrXeS3+ogUiQ5zDh+FQrp3PAOwuzUF1P36DnpUpqRRc
 xX6nZltYlfJm5nEiNlu0fik=
X-Google-Smtp-Source: APiQypJvEVCt/Jd3X2vWX+7Q6sS368OiB9k8npMHbxsQtpKwLew6tu2l8fY2D9YMeRRXMdz5VolWsA==
X-Received: by 2002:a17:902:c282:: with SMTP id
 i2mr11789866pld.175.1588837611397; 
 Thu, 07 May 2020 00:46:51 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id r26sm4127943pfq.75.2020.05.07.00.46.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 00:46:51 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 15:46:42 +0800
Message-Id: <1588837603-14206-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] (no subject)
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


This patchset enable the stmpe811 touch screen on stm32f429-disco
board, tested with ts_print. as sdram memory shortage on this disco
board, so i didn't test ts_calibrate (kernel crashed at mmap in
open framebuffer)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
