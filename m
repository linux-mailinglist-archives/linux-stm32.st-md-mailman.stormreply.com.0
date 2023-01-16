Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3DC6714F2
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 08:18:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17BDBC6904C;
	Wed, 18 Jan 2023 07:18:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C94E0C6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673897958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J03AEUyMs2O4Zc0M/YmOn8FNZhulZOm8FyrWoJOTpuA=;
 b=WLAGbyJj7nTPy6e6RxwlRGRjR0AgkI0jDGy5i9YRK+xIUycxmYUUGimzlKFdQTBevIBdjn
 uZIt0Cbk+Wgkd1wuxOI2xP1IO0GAWibiNz4Ie0ixfgQWill/1NJ5BmDUTvBgGYAcVxxLGK
 uh/AuO4Eg1ex/re0dVei5wSR5tP4hW4=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-SlZp0THaPD6jLkl7Y_lN_Q-1; Mon, 16 Jan 2023 14:39:17 -0500
X-MC-Unique: SlZp0THaPD6jLkl7Y_lN_Q-1
Received: by mail-oo1-f69.google.com with SMTP id
 x9-20020a4a6209000000b004f51f60512eso855736ooc.23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 11:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J03AEUyMs2O4Zc0M/YmOn8FNZhulZOm8FyrWoJOTpuA=;
 b=Tze+mneCuOpe60ixRQW1tbOwUlGq5xb5KbraKRcFQCayP5UoYZiOIfvoMGZhkEb5Ll
 cCMXyiHRngINfkM9mFgsuCPFxse2cjUDtPZdk9ZBl6doruosTgyy9DYVlr6UvaDbuut+
 /jQr+vyXOoPgATpi6lOtsOBToL9+fHfA9QY/mj3QXR1S6xMIDXyv3sBhs8b/AhDy0gpt
 xa0klTS3sTRaeiXVPIg2GQnByPlwn2Y+jUj61hr9mM8I/mpkhN383O8EryvitQNEIBmY
 AlSoyEOEg1FvzLAujMSAFoigAyoGW1mZD1Azf5x9wROAtk5yrPks2UZqlwqzfsqZ/lo8
 fUog==
X-Gm-Message-State: AFqh2kruRSp75GLVp7QtK2DMpy0sqmOxy+U1mWHcL/BqQDvRKR+KLbe2
 UE+gs7s7dwBBXGsFGQajeMSuz6Qpih0wVm2jMir96fqwdHeYqENFZ8mxrvKCFMxFsWCUjYCyPJ3
 wN/p9MIvw+iLwtO41xNB9N1E3jPJC9CkCVztQBZSa
X-Received: by 2002:a05:6830:26d2:b0:684:caea:9c31 with SMTP id
 m18-20020a05683026d200b00684caea9c31mr118632otu.10.1673897955374; 
 Mon, 16 Jan 2023 11:39:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsX2N0Apwx3DHeky1VV10IuJQ27Ivl7LmWlww76FSqkIMW9xCKbWrhuMqI/2iSweJvWyX3YtQ==
X-Received: by 2002:a05:6830:26d2:b0:684:caea:9c31 with SMTP id
 m18-20020a05683026d200b00684caea9c31mr118619otu.10.1673897955126; 
 Mon, 16 Jan 2023 11:39:15 -0800 (PST)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a9d764f000000b0066b9a6bf3bcsm15234392otl.12.2023.01.16.11.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 11:39:14 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
To: davem@davemloft.net
Date: Mon, 16 Jan 2023 13:37:23 -0600
Message-Id: <20230116193722.50360-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Wed, 18 Jan 2023 07:18:27 +0000
Cc: Ning Cai <ncai@quicinc.com>, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net] net: stmmac: enable all safety features
	by default
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

In the original implementation of dwmac5
commit 8bf993a5877e ("net: stmmac: Add support for DWMAC5 and implement Safety Features")
all safety features were enabled by default.

Later it seems some implementations didn't have support for all the
features, so in
commit 5ac712dcdfef ("net: stmmac: enable platform specific safety features")
the safety_feat_cfg structure was added to the callback and defined for
some platforms to selectively enable these safety features.

The problem is that only certain platforms were given that software
support. If the automotive safety package bit is set in the hardware
features register the safety feature callback is called for the platform,
and for platforms that didn't get a safety_feat_cfg defined this results
in the following NULL pointer dereference:

[    7.933303] Call trace:
[    7.935812]  dwmac5_safety_feat_config+0x20/0x170 [stmmac]
[    7.941455]  __stmmac_open+0x16c/0x474 [stmmac]
[    7.946117]  stmmac_open+0x38/0x70 [stmmac]
[    7.950414]  __dev_open+0x100/0x1dc
[    7.954006]  __dev_change_flags+0x18c/0x204
[    7.958297]  dev_change_flags+0x24/0x6c
[    7.962237]  do_setlink+0x2b8/0xfa4
[    7.965827]  __rtnl_newlink+0x4ec/0x840
[    7.969766]  rtnl_newlink+0x50/0x80
[    7.973353]  rtnetlink_rcv_msg+0x12c/0x374
[    7.977557]  netlink_rcv_skb+0x5c/0x130
[    7.981500]  rtnetlink_rcv+0x18/0x2c
[    7.985172]  netlink_unicast+0x2e8/0x340
[    7.989197]  netlink_sendmsg+0x1a8/0x420
[    7.993222]  ____sys_sendmsg+0x218/0x280
[    7.997249]  ___sys_sendmsg+0xac/0x100
[    8.001103]  __sys_sendmsg+0x84/0xe0
[    8.004776]  __arm64_sys_sendmsg+0x24/0x30
[    8.008983]  invoke_syscall+0x48/0x114
[    8.012840]  el0_svc_common.constprop.0+0xcc/0xec
[    8.017665]  do_el0_svc+0x38/0xb0
[    8.021071]  el0_svc+0x2c/0x84
[    8.024212]  el0t_64_sync_handler+0xf4/0x120
[    8.028598]  el0t_64_sync+0x190/0x194

Go back to the original behavior, if the automotive safety package
is found to be supported in hardware enable all the features unless
safety_feat_cfg is passed in saying this particular platform only
supports a subset of the features.

Fixes: 5ac712dcdfef ("net: stmmac: enable platform specific safety features")
Reported-by: Ning Cai <ncai@quicinc.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

I've been working on a newer Qualcomm platform (sa8540p-ride) which has
a variant of dwmac5 in it. This patch is something Ning stumbled on when
adding some support for it downstream, and has been in my queue as I try
and get some support ready for review on list upstream.

Since it isn't really related to the particular hardware I decided to
pop it on list now. Please let me know if instead of enabling by default
(which the original implementation did and is why I went that route) a
message like "Safety features detected but not enabled in software" is
preferred and platforms are skipped unless they opt-in for enablement.

Thanks,
Andrew

 drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 9c2d40f853ed..413f66017219 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -186,11 +186,25 @@ static void dwmac5_handle_dma_err(struct net_device *ndev,
 int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 			      struct stmmac_safety_feature_cfg *safety_feat_cfg)
 {
+	struct stmmac_safety_feature_cfg all_safety_feats = {
+		.tsoee = 1,
+		.mrxpee = 1,
+		.mestee = 1,
+		.mrxee = 1,
+		.mtxee = 1,
+		.epsi = 1,
+		.edpp = 1,
+		.prtyen = 1,
+		.tmouten = 1,
+	};
 	u32 value;
 
 	if (!asp)
 		return -EINVAL;
 
+	if (!safety_feat_cfg)
+		safety_feat_cfg = &all_safety_feats;
+
 	/* 1. Enable Safety Features */
 	value = readl(ioaddr + MTL_ECC_CONTROL);
 	value |= MEEAO; /* MTL ECC Error Addr Status Override */
-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
