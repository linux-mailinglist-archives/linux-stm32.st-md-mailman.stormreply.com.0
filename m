Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60087133C3D
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2020 08:26:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF49FC36B0B;
	Wed,  8 Jan 2020 07:26:27 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCC9CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 07:26:24 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id s64so1117168pgb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2020 23:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BGo10uJ7yfot4T+e9WxjVmggP6J1wCJOQgtZDEvps6k=;
 b=DZYTvdIW+43poxmXAWsnbKEMXfMgAYTNSNSjzrKvHcbxYUNT70lgy3dQKoQG768UuR
 y/4QnZ41Z2U3eHE/WyeZxE7goX74Z6fTViI2rtkRlsG1+kLZX9o56Nr8Hf5pbVnmR+Lq
 xO2XIfYh4WJYvL9FM8OKz27dOyW+woGROnWGCj+7ePioeXlCFJbDT3OrkIQzSWTxbwBK
 C7gNn+O/JZlSIUHDuES4e78GNWe0O+MJRMUqv2PTJJQJE3V0644vAgqpYYvGB1Uo8liZ
 etu8LY3BomXKXaUE1mhQnk/KJqmRstxgYvxUOI4+rjn8OSNRK6jpeax5YJoH6y8k6T0b
 PYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BGo10uJ7yfot4T+e9WxjVmggP6J1wCJOQgtZDEvps6k=;
 b=BhmlASrzRylv8IwL4eqp5Cy80JcmAYiFrhqcaVWWK/qnfD8WqoIv3fmAU+MCRRIzJG
 VpW5MXLCr9RxuFws36ZwPC53uUvMrzhXLWH+e6V2TOn1YejXAzyU+qmnJ0w6ceRCHqaM
 QBiLDW4qPhJGFdtpVX1LsFEBxawgN3q9YSUqaInSVDe3eS8L5BAMCJrdN7j1PLla4NNk
 45WRX6ToWi5ljdglot0jZzv2JzMMqYPJ8ZWiEV5btoIV9+NS33L0sHjkuOPtfYD7lD38
 TL2tonRyIyTiz990aYsmZx7XdimBsz3j/292p4+KAnD6QnNHtmXHJ/uimQWIWjTw7xym
 eQgQ==
X-Gm-Message-State: APjAAAXo9LF2nG2PVVYGHvPsZLIzx22KpuQ7cT3EvKAhDWIRDJwfCqkJ
 MosAPVX5FE8TQCU/85E3mus=
X-Google-Smtp-Source: APXvYqxghKJ14QjOwmxrl6htFh2WX6svt01e28xiCtneF71s3aUeytu3/ouF1j764HyGERYD9M/y4g==
X-Received: by 2002:a65:4587:: with SMTP id o7mr3730787pgq.303.1578468383088; 
 Tue, 07 Jan 2020 23:26:23 -0800 (PST)
Received: from localhost (199.168.140.36.16clouds.com. [199.168.140.36])
 by smtp.gmail.com with ESMTPSA id o31sm2231827pgb.56.2020.01.07.23.26.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jan 2020 23:26:22 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com,
 martin.blumenstingl@googlemail.com, treding@nvidia.com, andrew@lunn.ch,
 weifeng.voon@intel.com, tglx@linutronix.de
Date: Wed,  8 Jan 2020 15:25:48 +0800
Message-Id: <20200108072550.28613-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: netdev@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 0/2] net: stmmac: remove useless code of
	phy_mask
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

These patches just for cleanup codes in stmmac driver.

Changes since v1:
	1, add a new commit for remove the useless member phy_mask.
	2, adjust some commit comments for the original commit.

Dejin Zheng (2):
  net: stmmac: pci: remove the duplicate code of set phy_mask
  net: stmmac: remove the useless member phy_mask

 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c  | 5 -----
 include/linux/stmmac.h                            | 1 -
 3 files changed, 7 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
