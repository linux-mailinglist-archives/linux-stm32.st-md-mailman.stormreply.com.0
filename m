Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F4676246C
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 23:30:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC1FBC6A61A;
	Tue, 25 Jul 2023 21:30:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0718BC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 21:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690320601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eI0IPJDYPNrVyX0XGlXeCaRs7mSlaEbPza1/eXegfXE=;
 b=Xeo9ZcVdEbLXg2NxdwmowkzkyqcItWX22ZIEHRTD4rZPyV9rO+VbrhZhzo11shGu6tXaoM
 nfDGQ1PVX7xuCm78Pc8B8hICVFu1ebzfz9JUgXZs6WMRDUKaIQSvaEImE1Kul1w1O0PRKb
 XtaGQLRi0gxBHdDVMPlDTY7p042d6Tc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-sc32afdyOaihya5DIm156Q-1; Tue, 25 Jul 2023 17:30:00 -0400
X-MC-Unique: sc32afdyOaihya5DIm156Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7659924cf20so657800485a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 14:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690320600; x=1690925400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eI0IPJDYPNrVyX0XGlXeCaRs7mSlaEbPza1/eXegfXE=;
 b=Sz650GslDolbGqxJjxP1BjKUwWE109hFrUo4AMgPYMsI0XktA0TocNtw1gDYEAln2W
 8NpGlTfjrRbn4y4UN/YH9Cp8fK4afTYtT9XprIUGr6QHNHpLpd6vqomNEncuGG/P3/Ei
 djMQJHAUXAnjs+UZDVGh+ChRv9OZXz1FcHrcFmXqZKxF0o2/xh8jN7NmMElK8rhvWz/V
 Njhhb8p1UvMBaqIn4/zPHs07HVmdIkeeKVzfN5Qrk+kDKI6ll5tddSy1UJKRVCldkhjI
 1QNiNgUeILv2orm4EJxW3Jw7Viq3nUAiOMbh5w70gwFI28NoLxO7StLDlmVijEN5kSez
 WrNg==
X-Gm-Message-State: ABy/qLbZMV8ye1nZAQQ9uPtXHQ/ojLZ2OztJ9bDggaynu5n+a0fPSwzu
 E7YsKcWJv0oD6TXPti/zzJRGQxEkgROqCzCJZpZHFB8xZ9kG/pFgttSuHr8axS/zkYoMG0eRy3q
 bb/1n+8QDGG22D7C6tkALMeayAcQ0z7QcVPJCfvRJ
X-Received: by 2002:a05:620a:f05:b0:767:1241:54b5 with SMTP id
 v5-20020a05620a0f0500b00767124154b5mr181003qkl.1.1690320600063; 
 Tue, 25 Jul 2023 14:30:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF24tMAjJjYlaklb00gjuYXYzEgTXG7QQEk+fVvTcFB3Y0hqtiYP0Qq5YM3YPRmvMFNY0tH+g==
X-Received: by 2002:a05:620a:f05:b0:767:1241:54b5 with SMTP id
 v5-20020a05620a0f0500b00767124154b5mr180977qkl.1.1690320599711; 
 Tue, 25 Jul 2023 14:29:59 -0700 (PDT)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::17])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a37c243000000b00767d7307490sm3943067qkm.34.2023.07.25.14.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 14:29:59 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 25 Jul 2023 16:04:24 -0500
Message-ID: <20230725211853.895832-2-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, jsuraj@qti.qualcomm.com, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 ahalaney@redhat.com
Subject: [Linux-stm32] [PATCH net-next v2 0/2] net: stmmac: Increase
	clk_ptp_ref rate
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

This series aims to increase the clk_ptp_ref rate to get the best
possible PTP timestamping resolution possible. Some modified disclosure
about my development/testing process from the RFC/RFT v1 follows.

Disclosure: I don't know much about PTP beyond what you can google in an
afternoon, don't have access to documentation about the stmmac IP,
and have only tested that (based on code comments and git commit
history) the programming of the subsecond register (and the clock rate)
makes more sense with these changes. Qualcomm has tested a similar
change offlist, verifying PTP more formally as I understand it.

The last version was an RFC/RFT, but I didn't get a lot of confirmation
that doing patch 3 in that series (essentially setting clk_ptp_ref to
whatever its max value is) for the whole stmmac ecosystem was a safe
idea. So I am erring on the side of caution and doing this for the
Qualcomm platform only. See v1 for an approach that would apply to
all stmmac platform drivers with clk_ptp_ref.

v1: https://lore.kernel.org/netdev/20230711205732.364954-1-ahalaney@redhat.com/
Changes since v1:
    - Collected Reviewed-by tags (Simon)
    - Dropped RFC/RFT, dropped patch 3 that implemented this rate
      change at a stmmac platform level

Andrew Halaney (2):
  net: stmmac: Make ptp_clk_freq_config variable type explicit
  net: stmmac: dwmac-qcom-ethqos: Use max frequency for clk_ptp_ref

 .../net/ethernet/stmicro/stmmac/dwmac-intel.c  |  3 +--
 .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 ++++++++++++++++++
 include/linux/stmmac.h                         |  4 +++-
 3 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
