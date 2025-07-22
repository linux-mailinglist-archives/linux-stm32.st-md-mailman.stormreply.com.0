Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B7B0DB96
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 15:51:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AAD7C3F93F;
	Tue, 22 Jul 2025 13:51:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D17AC3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 13:51:11 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-74801bc6dc5so5276345b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753192270; x=1753797070;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2fY9g9SUYOdjTN++Th4P+LF8gvoDANBHyDfHKNyK83k=;
 b=OdT7IpDOG4aFDrl4ZNryzr9T5KPEXCl6uHYFP5GVSaTFTAhwgrkyQhw+4HJIOlUUHi
 TNldYllG1+0+zJpI9ddbp3sX8gxjJE4c5iMrWruOKmeOZPbyaQRNp0ho3YfPYJSbNOAR
 KWh+IdsscJcmlM8WNumXdGdgzK0PDXQWthZP41hemX/21hz/X3sVjF0uCICkCz9mMRrz
 KflS8Xw3+riTi/L5nU884jdLZXWYVxYjyWGaarp8FdWx+iWVZ/kxg8F5u/s8BZrJVnY9
 6sPF5cHd+BbRASNAG5o9Nck05CZsmY30uD/Fo0mNU/jQqRsv2IjYFk3UVVbPSI6L+Qn+
 pSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192270; x=1753797070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2fY9g9SUYOdjTN++Th4P+LF8gvoDANBHyDfHKNyK83k=;
 b=mlUR1eSNaEssLDwTHzAaeK1QtiBx3raTKmq3/hHuNyr1rjOWcrksRpUmhqaL9wV566
 inSI8xlTDozfbpeLYv4atuO093R6QS69vU3SQJmdAAXCwuRUYFlB4Q/PKwz8QPLFVouD
 ojC8DM06DN5EdgxtyBx7JfVcWELqAbmhNsHmLnvpv18VKVnkjrfQaipgTrkV2MSoXFcy
 nmvJUnCAi2tHOq3k8RVX2yMWmoAUybILhz/Lie4FWH+69y5xZoF/TfuC4ukLR6euc9l3
 OmcWQFivHLsxbHQIc5IbY73dUOPN/iy/bJdYj+p00BX2C2NvgKZm9pvPePQ1h4Lhvw2I
 mo7g==
X-Gm-Message-State: AOJu0YyFbmWtA7JNpBhDD+srn4HOKxLg9o9UbMZG5XEgssEf/WBmOf9K
 pWCWf+RITCFjAZicvQgi3Gf1yP/6MKEbc3VlFDEwhlRVhgZwM92wUDiB
X-Gm-Gg: ASbGnctM3CsWWf1Jo9kdUG6BpfOJQZNrse+N+FkjmsaLlk2Hh8nUlp9AU95hw7rnmJn
 8KMwl11R2FVzB73aWhBdFQLr4yZpTxck2HrLi02pxW9oDZbelPMavoI7bbYgcVI61V2w/Wlxeym
 74eXUMdzAjf4mFtMeBEF2zNaBotKY0TGLrmJlN1/DhyPuF0NvRVpngjKaJc0uHjgqjGxmOmpGBv
 c+sJ1bLAsafq/TI3CsOFqnFaYEmPRpyk4zAqiPtgdEukYcqVWKCQ1xuMHMg0uhpGjYXL5w8BAlH
 l0dRZ2vhxFvrAndJUOIsEEFl24xsgzxqO5NoAihkwLT56UzvniBOw3HZLKdg9okH9fSfg0kiG/H
 tH6AdH7EhhP0PQoM6v9ofjAFCR7H2hTKgZbcJ6WrtaFCilSoDJ4Zqs252910=
X-Google-Smtp-Source: AGHT+IEC7MH2AMxJZ5WkicvhVYJVAhylhlNJ6cko9YL2g8e/+t2DT7nDz5Xt6lw7DtJ3bGk2tVlpSw==
X-Received: by 2002:a05:6a00:1817:b0:736:5969:2b6f with SMTP id
 d2e1a72fcca58-75ed156d03bmr4420911b3a.6.1753192269548; 
 Tue, 22 Jul 2025 06:51:09 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([111.201.24.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d3190sm7612924b3a.39.2025.07.22.06.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:51:09 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bjorn@kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Tue, 22 Jul 2025 21:50:55 +0800
Message-Id: <20250722135057.85386-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net v2 0/2] xsk: fix underflow issues in
	zerocopy xmit
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

From: Jason Xing <kernelxing@tencent.com>

Fix two underflow issues around {stmmac_xdp|igb}_xmit_zc().

Jason Xing (2):
  stmmac: xsk: fix underflow of budget in zerocopy mode
  igb: xsk: solve underflow of nb_pkts in zerocopy mode

 drivers/net/ethernet/intel/igb/igb_xsk.c          | 3 +--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.41.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
