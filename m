Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 820D21F147C
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jun 2020 10:30:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26958C36B22;
	Mon,  8 Jun 2020 08:30:47 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D00BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2020 08:30:44 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id i4so1659572pjd.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jun 2020 01:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=G7NT+IIMlEpev8mMIld6zg2khxnR9LKx4QWnMSa761g=;
 b=YmELALbkitxP2ggbooUEURujMSINXmryqerQhxXRvVK6hlFggjqe6vjydN5E/hscIs
 ew1S4hSJF0H5QNibJbvP5ZZQVzfbxfT6ZWE2VGHUwUZ/5r2MjtsMn4Wi9gD0v5zWBYjX
 /BRG23DsNHZGYdn4ji4uba2IFP66yOE+UuP5whqQn3I5qHMBV5AUdtWXtQsXfBUl+DYw
 myfg/t3rN2flP3HLisi5oI0ljM/WBOisQVl5L7VqbL8HJIEnnwrRlll0TC4R+avIrDOL
 cP7JQa3ERxtbpid31OYGSdlRGxXXvm6sjzsquzBA1ywHqLWwcE4V8rPbMKBPITJ1gVN3
 o6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=G7NT+IIMlEpev8mMIld6zg2khxnR9LKx4QWnMSa761g=;
 b=UWXUwc5u/rk/7aSmD2JTuACDxcno5vPY5R5JUvaqtHUcKiOV9OuIOf/gIvFw84hFR8
 V3WnSJwSjrSdFQQ/2ZCMBJ67CwweTzGhslwfjUBAEQawGHOwVhfIau1Wu4QIKSJsGxt2
 y37/f6lrOsnGfwvrbh9KH50WWN7oOaOOfUx9JBoX7jp2zWomtrgcmHtNZD6gAZm6GYDo
 /JKtaVn56wc9TuANoF6dCZO4y2zR3+RqMHA6Y9+WWYbYuPNsOOpluDg+sUD8YfPcUSos
 GRuZuXBYVpM7cfFCVgRp0/OQcqTEtUPZMCzVNDIE0rp5AJVsd+ctOs4IkBunwimi16Iq
 yzOw==
X-Gm-Message-State: AOAM531NhsyWkfB0U650VrbbjW7A5BYsJnz3tm+czDw8dJZ7o39v8HIk
 E0wpH2JpO08fRl/O+ibLjag=
X-Google-Smtp-Source: ABdhPJxObPDhvUNU2fgGSyXqPnus/jX1jjU6Fcb/mjYz/7uwefMtlM+VUAjOyTj6a7++QyGKeDXCqQ==
X-Received: by 2002:a17:90a:886:: with SMTP id
 v6mr15165288pjc.161.1591605043466; 
 Mon, 08 Jun 2020 01:30:43 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
 by smtp.gmail.com with ESMTPSA id 27sm1210829pjg.19.2020.06.08.01.30.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 01:30:43 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 linux@armlinux.org.uk, vladimir.murzin@arm.com,
 kstewart@linuxfoundation.org, allison@lohutok.net, info@metux.net,
 tglx@linutronix.de
Date: Mon,  8 Jun 2020 16:30:36 +0800
Message-Id: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: devicetree@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] Use 'arm_nommu_dma_ops' to handle dma
	memroy if device offer consistent dma memory region
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

From: dillon min <dillon.minfei@gmail.com>

when do mmap on /dev/fb0, we will get -6 error on cortex-m3/m4 or armv7m
platform without cache support, this is caused by following reason:

on armv7m platform, if no cache support, we will use dma direct mapping,
but, this is not support on !MMU hardware, just return '-ENXIO' error

so, add use_reserved_mem() for these armv7m hardware but no-cache support.
eg, stm32f429/stm32f469.

verified on stm32f469-disco board, mmap frambuffer to userspace.

dillon min (2):
  ARM: dts: stm32: Setup 4M bytes reserved memory for mmap
  arm-nommu: Add use_reserved_mem() to check if device support reserved
    memory

 arch/arm/boot/dts/stm32f469-disco.dts | 14 ++++++++++++++
 arch/arm/mm/dma-mapping-nommu.c       | 28 +++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
