Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E8A96F6B3
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 16:30:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC6DFC78013;
	Fri,  6 Sep 2024 14:30:47 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FBADC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 14:30:39 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20536dcc6e9so14908695ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725633038; x=1726237838;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MmOkWe3bWYqlIPHasXuyjR6OTIRVg7CwkvkDyagLUMA=;
 b=lb/75DVg0Mkz3MfkmC9ORs5Q41bqN7zunTXj3bqKmbiPyi4xlBGSr+ERY/C3+zIBEo
 O8Upnmt/tNWyiW63+UQ8BPYQfQZ5AlUd4OtFTjwnG8AkXXkv+PWjcV6ntD3teorYlYa0
 bOBXWyM80Dk3V+YKpkl90Y7IITPTo15tHVpBZZ11vtwlSUbRo4rvOW+u3zbMwc6haqQS
 liL3j/EmgdN0ZKIVcblInWyD1evOvx/d49i+z8IqUn6Yl1TVWK93FNefKbVperbQWFw/
 LqXei2eEzJI+AJhX5bKp2GycY9weJfzeWdVC08zFzheWOOSS30UNYTYYaSaebb6j5mpm
 2GTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725633038; x=1726237838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MmOkWe3bWYqlIPHasXuyjR6OTIRVg7CwkvkDyagLUMA=;
 b=ZRaaxmA+ND/j0GzCE6Wsxagyk30I06ipYcV4XVpf9IKrC32aiPJg4f5BA4tjILM0Pp
 hy8cbBMHNRqj698SFvnslYKYpHEY2rjKrkmejGH+iLU4fNyg3NXe9IDpvy+9wL3DnQwn
 yWqdv7jMuEmrS7fAKSsmOFnJUH2HjBVD7Q3H8zmSNX1INQAsNadxWFnRbJvBNebHdPeL
 9qPfgw/Rl+nkPGdwuBogGUG47Zx/WRq8sPu26XzZxX/4Fe+KllsrWs1bq4mC2WSn1WSC
 Ue6xA4GWSEyY2/tNd0SX662ZcUZZ+pE2IHWFy0q1oAH0TZidf7SIbPoeR36G+drzrz0c
 pyoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkyBQ1ZxCaVE69jquBcFMxq9nbw9+uOH2HlIhp7LS4lBytVUnixdfzgKYoJLAlYt0xs8LqcZ0qollVug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy03Af5fx+Ymbif+IvZQaWUVlCiv/MFH7vt29sGywH88/fcqfGs
 DwSF4YCqNp19F5ZMEtkDTT5pAkrMneMJm2afB5wYdjPMueBXQq/x
X-Google-Smtp-Source: AGHT+IH6os/wJqKxaUijZ7r4QxSPQPk3BXwla9T3Qa9yn+zWQ8nBWAVCPpLlT6hUmihDvM4+R20QHQ==
X-Received: by 2002:a17:902:f682:b0:206:a935:2f8 with SMTP id
 d9443c01a7336-20706f02a27mr681585ad.2.1725633037708; 
 Fri, 06 Sep 2024 07:30:37 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-206ae94dcf3sm43951975ad.80.2024.09.06.07.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 07:30:37 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri,  6 Sep 2024 22:30:05 +0800
Message-Id: <cover.1725631883.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v10 0/7] net: stmmac: FPE via ethtool
	+ tc
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

Move the Frame Preemption(FPE) over to the new standard API which uses
ethtool-mm/tc-mqprio/tc-taprio.

Changes in v10:
  1. fixed a stacktrace caused by timer_shutdown_sync()
  on an uninitialized timer
  2. ignore FPE_EVENT_RRSP events if we are not in the
  ETHTOOL_MM_VERIFY_STATUS_VERIFYING state

Changes in v9:
  1. drop redundant netif_device_present() since ethnl_ops_begin()
  has its own netif_device_present() call
  2. open-code some variables of struct ethtool_mm_state directly
  in struct stmmac_fpe_cfg
  3. convert timer_delete_sync() to timer_shutdown_sync(), thus the
  timer will not be rearmed again
  4. fixed variable declarations in the middle of the scope

Changes in v8:
  1. use timer_delete_sync() instead of deprecated del_timer_sync()
  2. check netif_running() to guarantee synchronization rules between
  mod_timer() and timer_delete_sync()
  3. split up stmmac_tc_ops of dwmac4, dwmac4+ and dwxgmac to give user
  more descriptive error message
  4. fix wrong indentation about switch-case
  5. delete more unbalanced logs

Changes in v7:
  1. code style fixes and clean up warnings reported by
  patchwork netdev checks, no functional change intended

Changes in v6:
  1. new FPE verification process based on Vladimir Oltean's proposal
  2. embed ethtool_mm_state into stmmac_fpe_cfg
  3. convert some bit ops to u32_replace_bits
  4. register name and function name update to be more descriptive
  5. split up stmmac_tc_ops of dwmac4+ and dwxgmac, they have different
  implementations about mqprio
  6. some code style fixes

Changes in v5:
  1. fix typo in commit message
  2. drop FPE capability check in tc-mqprio/tc-taprio

Changes in v4:
  1. reorder FPE-related declarations and definitions into clean groups
  2. move mm_lock to stmmac_fpe_cfg.lock
  3. protect user configurations across NIC up/down
  4. block stmmac_set_mm() when fpe_task is in progress to finish
  5. convert to ethtool_dev_mm_supported() to check FPE capability in
  tc-mqprio/tc-taprio
  6. silence FPE workqueue start/stop logs

Changes in v3:
  1. avoid races among ISR, workqueue, link update and
  register configuration.
  2. update FPE verification retry logic, so it retries
  and fails as expected.

Changes in v2:
  1. refactor FPE verification process
  2. suspend/resume and kselftest-ethtool_mm, all test cases passed
  3. handle TC:TXQ remapping for DWMAC CORE4+

Furong Xu (7):
  net: stmmac: move stmmac_fpe_cfg to stmmac_priv data
  net: stmmac: drop stmmac_fpe_handshake
  net: stmmac: refactor FPE verification process
  net: stmmac: configure FPE via ethtool-mm
  net: stmmac: support fp parameter of tc-mqprio
  net: stmmac: support fp parameter of tc-taprio
  net: stmmac: silence FPE kernel logs

 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  |  96 +++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  12 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   9 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   6 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  22 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  35 ++-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  96 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 273 ++++++++----------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 153 +++++++---
 include/linux/stmmac.h                        |  28 --
 11 files changed, 497 insertions(+), 243 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
