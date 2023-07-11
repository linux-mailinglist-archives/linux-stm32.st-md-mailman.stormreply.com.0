Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6559C74F969
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 22:58:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F87DC6B457;
	Tue, 11 Jul 2023 20:58:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E82CC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 20:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689109084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f+hIo3oC9fPc83S0WFvpQBdDffxEHtx3wU0gPObo34Y=;
 b=Ddwi4WcbvYdl9J5pRzVzBAMxiEqynnbuzK26TEgjpER/U6zs/+Ct+8gTljUhRqa/AkMj/0
 iqrnqvKJAp8PwQs9+tyJX7J9vKkEHQXt3GztgGXxr6MVLgklXfJZ0Ek6X6aofjeFi8JjM0
 AJf/a/5tZLKUTSyfm06hnYQ1od4lijA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-iXuAue7hPEKEbUqZiyUDuw-1; Tue, 11 Jul 2023 16:58:03 -0400
X-MC-Unique: iXuAue7hPEKEbUqZiyUDuw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-5618857518dso50202567b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 13:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689109082; x=1691701082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f+hIo3oC9fPc83S0WFvpQBdDffxEHtx3wU0gPObo34Y=;
 b=kZaYIX3TqIaV5VskFOZ6NfKrldkDzRUEbMFpRBS3EWmcFbne14LURkg7JnoxmoT7hC
 Tw5/HbkYsXluH9b5Ee1QEVY+5IwK5bXO5HPwHgjdhwcRCsIlfEOiNkSkv2G/zPrsZc2Q
 2sr25liPL3zVAIi42rW9XwUS5Uo/vHI9p4WA2MuOVbv1F6fupMqvWH+LG8QtlQXNCn4d
 9h9O4QJ/TbKYDNyMeWQTW8TlpyBibu36uJbivFwfEAeVGiMe99BnRLKkm8kYhZTHUCYW
 B+VmJ2E0NzAV5tzkzQJ+AkuUCFyi7eBzM1Bs0PAAkWWRDLpj7dv6VSUBdiHmVdiywhBL
 xa2Q==
X-Gm-Message-State: ABy/qLZTReHEVU2dirYQO/BNws8+6Mi0rtTvV3i4SPom0ODlil2pvfbk
 QMMQfIAUNueh7/PpEHq9adK0xpd+dE1f+EyPC2ka4UwlFpNszPG0rPcGuL+Hu8TFCJl59OWAc4g
 ANT//dUlI0WdGmdtDZ+1vEUMgYeubKCJ7qPYv6Lr7
X-Received: by 2002:a0d:e284:0:b0:570:28a9:fe40 with SMTP id
 l126-20020a0de284000000b0057028a9fe40mr16227303ywe.5.1689109082642; 
 Tue, 11 Jul 2023 13:58:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGA6n45gkHkTv6XI6HgkyWTiJIRi19JmwhiTyxapecnmiZP7znNfnQP5MUvwPurdzpN+R7zUA==
X-Received: by 2002:a0d:e284:0:b0:570:28a9:fe40 with SMTP id
 l126-20020a0de284000000b0057028a9fe40mr16227284ywe.5.1689109082375; 
 Tue, 11 Jul 2023 13:58:02 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 j136-20020a81928e000000b00545a08184cesm785353ywg.94.2023.07.11.13.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 13:58:02 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 11 Jul 2023 15:35:29 -0500
Message-ID: <20230711205732.364954-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, jsuraj@qti.qualcomm.com, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH RFC/RFT net-next 0/3] net: stmmac: Increase
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

DO NOT MERGE, patch 2 and 3 are duplications at differing levels
(platform vs driver wide). They work fine together but it makes no sense
to take both.

Disclosure: I don't know much about PTP beyond what you can google in an
afternoon, don't have access to documentation about the stmmac IP,
and have only tested that (based on code comments and git commit
history) the programming of the subsecond register (and the clock rate)
makes more sense with these changes.

I'm hoping to start some discussion and get some insight about this.
Recently I found myself discussing PTP and some possible changes from
downstream that might need to be upstreamed. In doing so, I noticed that
the PTP reference clock (clk_ptp_ref) was running at a much lower value
than was being discussed. Digging in a bit, nobody is calling
clk_set_rate() of any value on clk_ptp_ref, so you get whatever the
default rate is when enabled. On Qualcomm platforms I have access to
this results in a 19.2 MHz clock instead of a possible 230.4 MHz clock.

This series proposes setting the clock rate. Patch 2 is the "safe"
approach where a platform must handle it, patch 3 is the big hammer
where we max out the clock for all users. I think patch 2 is using
a proper callback (I want to document those a bit in the future to make
it easier for future folks using them). My guess is that doing this
driver wide might be undesirable for some reasons I'm not
aware of (right now I blindly request the max frequency but the IP
could have an upper limit here, platform maintainers maybe upset if
their careful validation at prior frequencies changes, etc).

I've only tested that the Qualcomm boards I have access to in a remote
lab still work (i.e. throughput testing, etc) and that the PTP
programming is now what I expected it to be theoretically.

I'd really appreciate someone with the ability (and know how!) to test
PTP tried this on at least the Qualcomm platforms. Bonus points if
someone explains how one would even test PTP networks like this.

Thanks,
Andrew

Andrew Halaney (3):
  net: stmmac: Make ptp_clk_freq_config variable type explicit
  net: stmmac: dwmac-qcom-ethqos: Use max frequency for clk_ptp_ref
  net: stmmac: Use the max frequency possible for clk_ptp_ref

 .../net/ethernet/stmicro/stmmac/dwmac-intel.c  |  3 +--
 .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c  |  5 +++++
 include/linux/stmmac.h                         |  4 +++-
 4 files changed, 27 insertions(+), 3 deletions(-)

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
