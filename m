Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCDC382BC9
	for <lists+linux-stm32@lfdr.de>; Mon, 17 May 2021 14:08:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FF6EC57B7D;
	Mon, 17 May 2021 12:08:31 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CD71C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 18:40:17 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id t4so183521ejo.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 11:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lxrxc/3Z3jVIsCsgfSFIGV92bNeYHWS7yDIGi9KJTvU=;
 b=TqSApxgMrcdYcJIjrWT8p+ArUsPyJwMilGYJNDi2C6u5q31KR2y8kriLIV5m+53rqt
 ySGA6dC0GWKvpjNrqPVIwet9CaZI4Keb1Q/QFLl1kh/WegBhhoAbpbBv7C2qciV5q5/O
 jya/So4oogvlVNxttCXZOdfeM7TQ8+UmeKhAtUQOh2+ckckWpdZrpn3TUQXGughRdrGJ
 4fF1efmU81Z5XYHUjL2pcOD+WuF6GD6mksD20p+vsiuhYf0X/dPqU72Ygzup1FABnwO7
 W7E3gVHiOC37xgbwB9xuV2nExU9LKUE3gcZPYi2+odc5tbgcUnitMOZG3qpp7v6u3ln6
 Wxfg==
X-Gm-Message-State: AOAM532Bfdi/HNZVtamZA83sHJGVYu6K92IRK6GT1clyIc3sF0a9QIFW
 ihTX6Ac2hjIGPfHJciSZMmw=
X-Google-Smtp-Source: ABdhPJxBodBBYmBXuen9Ejp5wfOYCaCjxZ1MET6PdnzFoJwHDXVXjsBYdM8lj2LlwI6HA+CHmlPOAQ==
X-Received: by 2002:a17:906:c0c3:: with SMTP id
 bn3mr50194763ejb.498.1621017616765; 
 Fri, 14 May 2021 11:40:16 -0700 (PDT)
Received: from turbo.teknoraver.net (net-5-94-253-60.cust.vodafonedsl.it.
 [5.94.253.60])
 by smtp.gmail.com with ESMTPSA id dj17sm5081505edb.7.2021.05.14.11.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 11:40:16 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
Date: Fri, 14 May 2021 20:39:51 +0200
Message-Id: <20210514183954.7129-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 May 2021 12:08:29 +0000
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 0/3] net: use XDP helpers
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

From: Matteo Croce <mcroce@microsoft.com>

The commit 43b5169d8355 ("net, xdp: Introduce xdp_init_buff utility
routine") and commit be9df4aff65f ("net, xdp: Introduce xdp_prepare_buff
utility routine") introduces two useful helpers to populate xdp_buff.
Use it in drivers which still open codes that routines.

Matteo Croce (3):
  stmmac: use XDP helpers
  igc: use XDP helpers
  vhost_net: use XDP helpers

 drivers/net/ethernet/intel/igc/igc_main.c         | 9 +++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++------
 drivers/vhost/net.c                               | 6 ++----
 3 files changed, 8 insertions(+), 16 deletions(-)

-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
