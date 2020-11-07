Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAC02AA866
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Nov 2020 00:36:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6FE2C3FAD4;
	Sat,  7 Nov 2020 23:36:38 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64A5BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Nov 2020 23:36:37 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m16so5604245ljo.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Nov 2020 15:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BAsmVBERLtIkPKSJ/BkTRWhkFllTaoPPg4wptJs5664=;
 b=poX5pAv3AOQHHZmM+Gav0NU4a+LwsQfDRy0vVeqVkcgYU0LOj8Jy5tEM6jWyB7Ol3Q
 s0AV8D6db2DKMZ+L9Wex3RJgUcs7Qtt++/7/nOh1NtcOpK0spqD9kCfFJgbOOohTOO/L
 VtSMx6f/QI8q8IWON+suc6oMDzKIpY74xo7ps0D1+YfQji8jFI3K3lVK9CZATnAvkiUh
 jAYM7mDR7wqa58MQRy5h2sXqWZaiD59Z+WY/juDjqsBO7H9uxxQpW/JFqlPYzJK/Motk
 58tZKjHMmR9ry2ip4XY6pLJZGN3eP9/H1baA6VZCodqcTY/WHCiLRcN6YoRF3j6RZNiI
 VCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BAsmVBERLtIkPKSJ/BkTRWhkFllTaoPPg4wptJs5664=;
 b=uGjuDcUPeGD7OW9KKhMotCVHCevQHqrt0SSTb0gOmbTt73eM/p94Az2Js4dAm9hEKv
 ux34zzN0WbIrWhR58h9LJorOw48oncbY0W1fwWm/0opUeMnBtrPwVUo+Sypv4uMV0PTq
 MFHqDyuXUvYaxIdUUDcMBc6ftDsjLgYgCtuUf1lgsjDlBBTajfcPLQDNyQCDwCuBmmlB
 ymr/uvqSrZj7v4yvyF6Hg2JjBYSRjgQjH1eOFKc4EHoD0j7jcnpQRTL/CICPnywChk7Y
 jp67b9fDiXVq3+obaQDpdyJoNWC8vXUO4FOzTXCaM2eG0c3efuVbTBg7KEo0/+Du6WMq
 ZinA==
X-Gm-Message-State: AOAM532kWb5S6FNhhptql2hYXnuuK8RwQYZHkHGio1YrM5aPPE1idNsx
 S0vyD4xFDkGdt9kz7we6bkE=
X-Google-Smtp-Source: ABdhPJxSOMHDT1FfYuwhl+GENcESSIMAcfVtTuE8fwfTk0I7FTy+FSLRnnTDASsRo8ReOLKPlxJf9w==
X-Received: by 2002:a2e:9449:: with SMTP id o9mr3023985ljh.457.1604792196622; 
 Sat, 07 Nov 2020 15:36:36 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-112.NA.cust.bahnhof.se.
 [155.4.221.112])
 by smtp.gmail.com with ESMTPSA id j23sm782772lfm.16.2020.11.07.15.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 15:36:35 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Sun,  8 Nov 2020 00:36:28 +0100
Message-Id: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] remoteproc: Constify static struct
	rproc_ops
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

Constify two static struct rproc_ops which are never modified. These two
changes makes all static instances of rproc_ops in the kernel const.

Rikard Falkeborn (2):
  remoteproc: ingenic: Constify ingenic_rproc_ops
  remoteproc: stm32: Constify st_rproc_ops

 drivers/remoteproc/ingenic_rproc.c | 2 +-
 drivers/remoteproc/stm32_rproc.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
