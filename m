Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9A2185DB4
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2020 16:03:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9641EC36B0B;
	Sun, 15 Mar 2020 15:03:11 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E818C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 15:03:07 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id m5so8108126pgg.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 08:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kc0ThdNzpJn+Kfcg/RI1G+X6IBpfBw1q8Ln/bdPz3gg=;
 b=gun4vQCyYWP1bqzzwNKXuuKF29zaiHKnVk83U9ZMhT/rCB7hAm6a8Cdj6qI1V3e4IV
 /Rc7jjUJVxlSRNl/AwxR+g2q3fzUzLVCP2EOb8tHLoG3V8WBY8fg2EGbLABKxuLHV2q1
 PiOUTheCzjMuRt2W6lhsPgXp6r7UDlhK2w73y5XXMnBK86ZlVt2aa933ie9R5UyvC7ty
 p8wqaaMYQc7ACTMv2TzR/043Gd8/OfEcmi+dvCTZR5zobaN2Kb9/xvv4umxfhiiUfXhx
 ADRo2NteR1DfuarrFYR/q/mXLAKF3UA0UMXwsQKBlb85Axs7z7mJYll4R2ierDo8TfzS
 3Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kc0ThdNzpJn+Kfcg/RI1G+X6IBpfBw1q8Ln/bdPz3gg=;
 b=dk9mDo7jwFM56bLl3D8r1tPeNJuySZKmhTf7DAGGGq9rSIy2lOLKyEIxCiIfpca/jT
 o6R3D2PoUwKKIw8jvETcx9CapTodBB7NIomm/1zZpZvvyNacK6DPM8USt8yMF+DUI7m9
 I6noRklz2OCHbx9sc2PMTjwg25pi0shcSqVV7v6k7pxN3/kLUG0cb0MlLPA5htugPH1Z
 0bbWgzl3iWgvnV31byS6J8L5m0X6ZVv+hDM/TVMjNCZblrf/JZC5S8nee9H3WYne1ubm
 wYP1iBBwH5PCBUdowMRDrHiOxkTdx+pzVK/7OfbJzU1TqWnrNyoCdLMx6ECRxO6o+EJy
 h6eQ==
X-Gm-Message-State: ANhLgQ1ghyKp/OlY+fLDGY8VxjKfhxykAX0S0BKrmaxYOzG5GG+jPnjj
 rAF10w6txTAX9rlKitiEOQ8=
X-Google-Smtp-Source: ADFU+vtgzU9quN1fDPCbfmM0oAkAxz6+u3OVdKrZFBtlqzFobCSi93pYCDNldrZGFZPFHgHvfmczRA==
X-Received: by 2002:a63:cb4a:: with SMTP id m10mr22706434pgi.259.1584284586339; 
 Sun, 15 Mar 2020 08:03:06 -0700 (PDT)
Received: from localhost (216.24.188.11.16clouds.com. [216.24.188.11])
 by smtp.gmail.com with ESMTPSA id y9sm17201060pjj.17.2020.03.15.08.03.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Mar 2020 08:03:05 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 15 Mar 2020 23:02:59 +0800
Message-Id: <20200315150301.32129-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/2] net: stmmac: Use
	readl_poll_timeout() to simplify the code
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

This patch sets just for replace the open-coded loop to the
readl_poll_timeout() helper macro for simplify the code in
stmmac driver.

v1 -> v2:
	- no changed. I am a newbie and sent this patch a month
	  ago (February 6th). So far, I have not received any comments or
	  suggestion. I think it may be lost somewhere in the world, so
	  resend it.

Dejin Zheng (2):
  net: stmmac: use readl_poll_timeout() function in init_systime()
  net: stmmac: use readl_poll_timeout() function in dwmac4_dma_reset()

 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   | 14 ++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  | 14 ++++++--------
 2 files changed, 12 insertions(+), 16 deletions(-)

-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
