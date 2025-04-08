Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F454A83AB5
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:19:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 230C7C78F68;
	Thu, 10 Apr 2025 07:19:30 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com
 [207.54.90.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86920C78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 04:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1744085820; x=1775621820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O/Tn1U4L5YYmQ1KHlDb+KfX9uYMb4KE782y8YRNBRxc=;
 b=uBDYwr6TDHTv2H/2Eqx8+a/yImKKXDYo4uVQMCsUsqlo4foAKWLXtRAH
 lSUD91cGjRQylZFDkoYNYyEyFuXJzkAwMp3u0W2zTkm29/yNN9UP0nq/9
 Oqer5toiln5v/J/dafmNx178eO5td0Wa208WcMCb+u32paZwa4nQ34tM7
 9YGfYoN/sOaHOWru07mT+8lx6hiU0tx5Ckt175jHpnEPvvC6eBZMo9YEp
 GafYQtJrFI4NUrlEYJsa7BFxmmeYDYXB5KHBrWz/ymRbIlLmjSvZN6emX
 MpgeaTRD+TwR9d4fhIPQnVbXaiDYeHf2FUCZblxYXbQYxHXj59REU09XM g==;
X-CSE-ConnectionGUID: fQrvPboBTZmqqZr5VieNKg==
X-CSE-MsgGUID: B160jKCXTK+9IdbIWigsnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="195755514"
X-IronPort-AV: E=Sophos;i="6.15,197,1739804400"; d="scan'208";a="195755514"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
 by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 13:16:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 214B3D4809
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 13:16:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D8EBCBF4B6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 13:16:55 +0900 (JST)
Received: from iaas-rpma.. (unknown [10.167.135.44])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F7731A0078;
 Tue,  8 Apr 2025 12:16:54 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net,
 linux-crypto@vger.kernel.org
Date: Tue,  8 Apr 2025 12:16:47 +0800
Message-Id: <20250408041647.88489-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Apr 2025 07:19:28 +0000
Cc: Erhard Furtner <erhard_f@mailbox.org>, linux-kernel@vger.kernel.org,
 Li Zhijian <lizhijian@fujitsu.com>, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] crypto/testmgr: Fix acomp_req leak
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

The kmemleak reported that
...
unreferenced object 0xffff888108d6c300 (size 256):
  comm "cryptomgr_test", pid 183, jiffies 4294700957
  hex dump (first 32 bytes):
    00 c1 d6 08 81 88 ff ff 00 cb d6 08 81 88 ff ff  ................
    50 cd a7 81 ff ff ff ff b8 fb 93 02 00 c9 ff ff  P...............
  backtrace (crc 29cca632):
    __kmalloc_noprof+0x2fa/0x430
    test_acomp+0x174/0x960
    alg_test_comp+0x6f/0x90
    alg_test.part.26+0x105/0x410
    cryptomgr_test+0x20/0x40
    kthread+0x10c/0x250
    ret_from_fork+0x30/0x40
    ret_from_fork_asm+0x1a/0x30
unreferenced object 0xffff888108d6c100 (size 256):
  comm "cryptomgr_test", pid 183, jiffies 4294700972
  hex dump (first 32 bytes):
    00 1d da 08 81 88 ff ff 00 c3 d6 08 81 88 ff ff  ................
    50 cd a7 81 ff ff ff ff b8 fb 93 02 00 c9 ff ff  P...............
  backtrace (crc 3047d62b):
    __kmalloc_noprof+0x2fa/0x430
    test_acomp+0x174/0x960
    alg_test_comp+0x6f/0x90
    alg_test.part.26+0x105/0x410
    cryptomgr_test+0x20/0x40
    kthread+0x10c/0x250
    ret_from_fork+0x30/0x40
    ret_from_fork_asm+0x1a/0x30

acomp_request will be chained to req[0], however,
acomp_request_free(), it will not free the whole chain.

Fix it by freeing them one by one.

Fixes: 99585c2192cb ("crypto: testmgr - Add multibuffer acomp testing")
Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Closes: https://lore.kernel.org/linux-crypto/20250408002741.089f1e9a@outsider.home/
Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
 crypto/testmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index abd609d4c8ef..7f02feee9fb6 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -3498,10 +3498,10 @@ static int test_acomp(struct crypto_acomp *tfm,
 	ret = 0;
 
 out:
-	acomp_request_free(reqs[0]);
 	for (i = 0; i < MAX_MB_MSGS; i++) {
 		kfree(output[i]);
 		kfree(decomp_out[i]);
+		acomp_request_free(reqs[i]);
 	}
 	kfree(dst);
 	kfree(src);
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
